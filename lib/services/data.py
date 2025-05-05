import pandas as pd
import openpyxl
import re

def clean_time(time_str):
    """Clean and standardize time format."""
    if pd.isna(time_str):
        return ''
    
    time_str = str(time_str).strip().upper()
    
    # Extract notes if present
    notes = ''
    if '(' in time_str:
        main_part = time_str[:time_str.find('(')].strip()
        notes = time_str[time_str.find('(')+1:time_str.find(')')].strip()
    else:
        main_part = time_str
        
    # Clean the time part
    if ':' in main_part:
        try:
            hour = int(main_part.split(':')[0])
            minutes = main_part.split(':')[1].split()[0]
            if hour > 12:
                cleaned_time = f"{hour-12}:{minutes} PM"
            else:
                period = "PM" if hour == 12 else "AM"
                cleaned_time = f"{hour}:{minutes} {period}"
        except:
            cleaned_time = main_part
    else:
        # Handle cases like "7:00 am" or "7 am"
        cleaned_time = main_part
        
    return (cleaned_time, notes)

def extract_stops(route_details):
    """Extract stops from route details with improved handling of separators."""
    if pd.isna(route_details):
        return []
    # Split on <>, -> and > symbols, considering potential spaces
    stops = re.split(r'\s*<?-?>?\s*>\s*', route_details)
    return [stop.strip() for stop in stops if stop.strip()]

# Load the Excel file
file_path = '/content/Transport Schedule.xlsx'

# Check available sheet names
sheet_names = pd.ExcelFile(file_path).sheet_names
print("Available sheet names:", sheet_names)

# Using the first sheet
sheet_name = sheet_names[0]

# Load and clean the data
df_cleaned = pd.read_excel(file_path, sheet_name=sheet_name, skiprows=1)

# Rename columns for clarity
df_cleaned.columns = [
    "Route No",
    "Start Time (To DSC)",
    "Route Name",
    "Route Details",
    "Departure Time (From DSC)",
    "Route Map",
    "Extra"
]

# Drop unnecessary columns and handle missing data more carefully
df_cleaned = df_cleaned.drop(columns=["Extra"])
df_cleaned = df_cleaned[df_cleaned["Route No"].notna()]

# Create a dictionary to store schedules by route number
route_schedules = {}

# Group by Route No to collect all schedules for the same route
for _, row in df_cleaned.iterrows():
    route_no = str(row["Route No"]).strip()
    
    # Skip rows that don't have a valid route number
    if not re.match(r'^[RF]\d+', route_no):
        continue
        
    # Process times and extract notes
    start_time, start_notes = clean_time(row['Start Time (To DSC)'])
    departure_time, departure_notes = clean_time(row['Departure Time (From DSC)'])
    
    # Combine notes
    notes = []
    if start_notes:
        notes.append(start_notes)
    if departure_notes:
        notes.append(departure_notes)
    notes_str = '; '.join(notes)
    
    # Create schedule string with notes if present
    schedule = (f"Schedule(startTime: '{start_time}', departureTime: '{departure_time}'" +
               (f", notes: '{notes_str}')" if notes_str else ")"))
    
    route_map = str(row["Route Map"]) if pd.notna(row["Route Map"]) else ''
    
    if route_no not in route_schedules:
        # Initialize new route
        route_schedules[route_no] = {
            "routeName": str(row["Route Name"]).strip() if pd.notna(row["Route Name"]) else '',
            "routeDetails": str(row["Route Details"]).strip() if pd.notna(row["Route Details"]) else '',
            "stops": extract_stops(row["Route Details"]) if pd.notna(row["Route Details"]) else [],
            "routeMap": route_map,
            "schedules": []
        }
    
    # Only add schedule if it has valid times
    if start_time or departure_time:
        route_schedules[route_no]["schedules"].append(schedule)

# Generate the formatted output
output = "static final List<BusRoute> _regularRoutes = [\n"

for route_no, route_data in route_schedules.items():
    # Skip routes with no schedules
    if not route_data["schedules"]:
        continue
        
    schedules = ',\n        '.join(route_data["schedules"])
    route_entry = f"""    BusRoute(
      routeNo: '{route_no}',
      routeName: '{route_data["routeName"]}',
      routeDetails: '{route_data["routeDetails"]}',
      stops: {route_data["stops"]},
      schedules: [
        {schedules}
      ],
      routeMap: '{route_data["routeMap"]}'
    ),\n"""
    output += route_entry

output += "];"

# Save the output to a file
with open('bus_routes.txt', 'w', encoding='utf-8') as f:
    f.write(output)

# Display the output
print(output)

# Print some statistics
print("\nStatistics:")
for route_no, route_data in route_schedules.items():
    print(f"Route {route_no}: {len(route_data['schedules'])} schedules")