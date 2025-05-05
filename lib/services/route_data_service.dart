import '../models/bus_route.dart';

class RouteDataService {
  static final List<BusRoute> _regularRoutes = [
    
    BusRoute(
      routeNo: 'R1',
      routeName: 'Dhanmondi <> DSC',
      routeDetails: 'Dhanmondi - Sobhanbag <> Shyamoli Square <> Technical Mor > Majar Road Gabtoli <> Konabari Bus Stop <> Eastern Housing<> Rupnagar <> Birulia Bus Stand <> Daffodil Smart City',
      stops: [
        'Dhanmondi',
        'Sobhanbag',
        'Shyamoli Square',
        'Technical Mor',
        'Majar Road Gabtoli',
        'Konabari Bus Stop',
        'Eastern Housing',
        'Rupnagar',
        'Birulia Bus Stand',
        'Daffodil Smart City'
      ],
      schedules: [
        Schedule(startTime: '7:00 AM', departureTime: '1:30 PM', notes: 'Student Bus'),
        Schedule(startTime: '10:00 AM', departureTime: '4:20 PM'),
        Schedule(startTime: '2:30 PM', departureTime: '6:00 PM', notes: 'Student Bus'),
        Schedule(startTime: '', departureTime: '8:10 PM', notes: 'Student Bus'),
      ],
      routeMap: 'https://www.google.com/maps/d/embed?mid=1J8QtXb3iMgXJTsECsIzdzu3mIgDio5Al'
    ),

    BusRoute(
      routeNo: 'R2',
      routeName: 'Uttara - Rajlokkhi <> DSC',
      routeDetails: 'Uttara - Rajlokkhi <> House building <> Grand Zamzam Tower <>  Uttara Metro rail Center <>Diyabari Bridge <> Beribadh <> Birulia <> Khagan <> Daffodil Smart City',
      stops: ['Uttara - Rajlokkhi', 'House building', 'Grand Zamzam Tower', 'Uttara Metro rail Center', 'Diyabari Bridge', 'Beribadh', 'Birulia', 'Khagan', 'Daffodil Smart City'],
      schedules: [
        Schedule(startTime: '7:00 AM', departureTime: '1:30 PM',),
        Schedule(startTime: '10:00 AM', departureTime: '4:20 PM'),
        Schedule(startTime: '2:15 PM', departureTime: '6:00 PM',),
        Schedule(startTime: '', departureTime: '8:10 PM', notes: 'Student Bus'),],
      routeMap: 'https://www.google.com/maps/d/edit?mid=1YTQpHTyhpAzWyOlZ_oMgDEm-fu_VnQES&usp=sharing'
    ),
    
    BusRoute(
      routeNo: 'R3',
      routeName: 'Tongi College gate <> DSC',
      routeDetails: 'Tongi College Gate Bus Stand <> Kamar Para <> Dhour <> Birulia <> Daffodil Smart City',
      stops: ['Tongi College Gate Bus Stand', 'Kamar Para', 'Dhour', 'Birulia', 'Daffodil Smart City'],
      schedules: [Schedule(startTime: '7:00 AM', departureTime: '1:30 PM', notes: 'Student Bus'),
        Schedule(startTime: '10:00 AM', departureTime: '4:20 PM'),
        Schedule(startTime: '2:15 PM', departureTime: '6:00 PM', notes: 'Student Bus'),],
      routeMap: 'https://www.google.com/maps/d/embed?mid=1AuQcyjHn3A-x52EJ3J-nJQka_BsLOzm'
    ),
    
    BusRoute(
      routeNo: 'R4',
      routeName: 'ECB Chattor <> Mirpur <> DSC',
      routeDetails: 'ECB Chattor <> Kalshi More <> Mirpur 12 <> Mirpur 10 <> Mirpur 02 <> Mirpur 01 - Sony Cinema Hall <> Commerce College <> Gudaraghat <> Beribadh <> Estern Housing <> Birulia <> Akran <> Daffodil Smart City',
      stops: ['ECB Chattor', 'Kalshi More', 'Mirpur 12', 'Mirpur 10', 'Mirpur 02', 'Mirpur 01 - Sony Cinema Hall', 'Commerce College', 'Gudaraghat', 'Beribadh', 'Estern Housing', 'Birulia', 'Akran', 'Daffodil Smart City'],
      schedules: [Schedule(startTime: '07:00 AM', departureTime: '2:00 PM '),
      Schedule(startTime: '10:00 AM', departureTime: '4:20 PM'),
      Schedule(startTime: '', departureTime: '6:00 PM')],
      routeMap: 'https://www.google.com/maps/d/embed?mid=1SlQHi4xKjh-9CFPXBxfv1y_8hsGIaFcF'
    ),
    
    BusRoute(
      routeNo: 'R5',
      routeName: 'Baipail <> DSC',
      routeDetails: 'Baipail <> Polli Biddut <> Nabinagar <> Bismail <> Prantik <> JU <> C&B <> Kolma <> Charabag <> Kumkumari <> Daffodil Smart City',
      stops: ['Baipail', 'Polli Biddut', 'Nabinagar', 'Bismail', 'Prantik', 'JU', 'C&B', 'Kolma', 'Charabag', 'Kumkumari', 'Daffodil Smart City'],
      schedules: [Schedule(startTime: '07:00 AM', departureTime: '1:30 PM'),
      Schedule(startTime: '10:00 AM', departureTime: '4:20 PM'),
      Schedule(startTime: '', departureTime: '6:00 PM')],
      routeMap: 'https://www.google.com/maps/d/embed?mid=1XietwmoLEeJXNAzzXF751LD_090ntWK1'
    ),
    
    BusRoute(
      routeNo: 'R6',
      routeName: 'Savar <> DSC',
      routeDetails: 'Savar Bus Stand <> Radio Colony <> C&B <> Kolma <> Charabag <> Kumkumari <> Daffodil Smart City',
      stops: ['Savar Bus Stand', 'Radio Colony', 'C&B', 'Kolma', 'Charabag', 'Kumkumari', 'Daffodil Smart City'],
      schedules: [Schedule(startTime: '07:00 AM', departureTime: '2:00 PM'),
      Schedule(startTime: '', departureTime: '4:20 PM')],
      routeMap: 'https://www.google.com/maps/d/embed?mid=1v1Z7DQkLmmntU3XQwDjy_989Dmxx6Beo'
    ),
    
    BusRoute(
      routeNo: 'R7',
      routeName: 'Narayanganj Chasara <> DSC',
      routeDetails: 'Narayanganj Chasara > sign board >sonir akhra >saydabad bus stand > gulistan > Chankharpul> Nilkhet > New Market >kolabagan> Dhanmondi - Sobhanbag <> Shyamoli Square <> Technical Mor > Majar Road Gabtoli <> Konabari Bus Stop <> Eastern Housing Rup Nogor <> Birulia Bus Stand <> Daffodil Smart City',
      stops: ['Narayanganj Chasara' , 'sign board' ,'sonir akhra' ,'saydabad bus stand' , 'gulistan' , 'Chankharpul> Nilkhet' , 'New Market' , 'kolabagan', 'Dhanmondi - Sobhanbag', 'Shyamoli Square', 'Technical Mor > Majar Road Gabtoli', 'Konabari Bus Stop', 'Eastern Housing Rup Nogor', 'Birulia Bus Stand', 'Daffodil Smart City'],
      schedules: [Schedule(startTime: '06:20 AM', departureTime: '4:20 PM')],
      routeMap: 'nan'
    ),
    
    BusRoute(
      routeNo: 'R8',
      routeName: 'Green Model Town <> DSC',
      routeDetails: 'Green Model Town > Bashabo > Malibagh Railgate South Bus Stop > Rampura Bazaar Bus Stop > BTV Center > Aftabnagar > Badda Suvastu tower> Jamuna Furute Park > Kuril Bisso Road > Khilkhet > Uttara - Rajlokkhi > House building > Diyabari Bridge > Beribadh > Birulia > Khagan > Akran Bazaar Bus Stand >  Daffodil Smart City',
      stops: ['Green Model Town' , 'Bashabo' , 'Malibagh Railgate South Bus Stop' , 'Rampura Bazaar Bus Stop' , ' BTV Center' , 'Aftabnagar' , 'Badda Suvastu tower', 'Jamuna Furute Park' , 'Kuril Bisso Road' , 'Khilkhet' , 'Uttara - Rajlokkhi' , 'House building' , 'Diyabari Bridge ', 'Beribadh ', 'Birulia' , 'Khagan ', ' Akran Bazaar ',  'Daffodil Smart City'],
      schedules: [Schedule(startTime: '06:20 AM', departureTime: '4:20 PM')],
      routeMap: 'https://www.google.com/maps/d/edit?mid=1e9T1_wJQ3IHxgDwNfBR1MVkXIy1517Sd&usp=sharing'
    ),
    
    BusRoute(
      routeNo: 'R9',
      routeName: 'Mirpur-1 <> DSC',
      routeDetails: 'Sony Cinema Hall <> Gudaraghat <> Beribadh <> Estern Housing <> Birulia <> Akran <> Daffodil Smart City',
      stops: ['Sony Cinema Hall', 'Gudaraghat', 'Beribadh', 'Estern Housing', 'Birulia', 'Akran', 'Daffodil Smart City'],
      schedules: [Schedule(startTime: '07:00 AM', departureTime: '2:00 PM '),
      Schedule(startTime: '10:00 AM', departureTime: '4:20 PM')],
      routeMap: 'nan'
    ),
    
    BusRoute(
      routeNo: 'R10',
      routeName: 'Uttara Moylar Mor <> DSC',
      routeDetails: 'Uttara Moylar Mor <>  Uttara Metro rail Center <>Beribadh <> Birulia <> Khagan <> Daffodil Smart City',
      stops: ['Uttara Moylar Mor', 'Uttara Metro rail Center', 'Beribadh', 'Birulia', 'Khagan', 'Daffodil Smart City'],
      schedules: [Schedule(startTime: '07:00 AM', departureTime: '2:00 PM '),
      Schedule(startTime: '10:00 AM', departureTime: '4:20 PM')],
      routeMap: 'nan'
    ),
  ];

  static final List<BusRoute> _fridayRoutes = [
    BusRoute(
      routeNo: 'F1',
      routeName: 'Dhanmondi <> DSC',
      routeDetails: 'Dhanmondi - Sobhanbag <> Shyamoli Square <> Technical Mor <> Majar Road Gabtoli <> Mirpur Konabari <> Eastern Housing Rup Nogor <> Birulia Bus Stand <> Daffodil Smart City',
      stops: ['Dhanmondi - Sobhanbag', 'Shyamoli Square', 'Technical Mor', 'Majar Road Gabtoli', 'Mirpur Konabari', 'Eastern Housing Rup Nogor', 'Birulia Bus Stand', 'Daffodil Smart City'],
      schedules: [Schedule(startTime: '07:30 AM', departureTime: '04:20 PM')],
      routeMap: 'https://www.google.com/maps/d/embed?mid=1IVBMHjM7ktZsvJkQ6kvx6j5kzaD6NO_w'
    ),
    
    BusRoute(
      routeNo: 'F2',
      routeName: 'Tongi College Gate <> Uttara <> DSC',
      routeDetails: 'Tongi College Gate Bus Stand <> Kamar Para <> Dhour <> Birulia <> Daffodil Smart City',
      stops: ['Tongi College Gate Bus Stand', 'Kamar Para', 'Dhour', 'Birulia', 'Daffodil Smart City'],
      schedules: [Schedule(startTime: '07:30 AM', departureTime: '04:20 PM')],
      routeMap: 'https://www.google.com/maps/d/embed?mid=1gVd1UbKcmhThFZW-nQM8fbNhe0cNr4TV'
    ),
    
    BusRoute(
      routeNo: 'F3',
      routeName: 'Uttara - Rajlokkhi <>Uttara Metro rail Center <>  DSC',
      routeDetails: 'Uttara - Rajlokkhi <> House building <> Grand Zamzam Tower <> Uttara Metro rail Center <> Diyabari Bridge <> Beribadh <> Birulia <> Khagan <> Daffodil Smart City',
      stops: ['Uttara - Rajlokkhi', 'House building', 'Grand Zamzam Tower', 'Uttara Metro rail Center', 'Diyabari Bridge', 'Beribadh', 'Birulia', 'Khagan', 'Daffodil Smart City'],
      schedules: [Schedule(startTime: '07:30 AM', departureTime: '04:20 PM ')],
      routeMap: 'https://www.google.com/maps/d/edit?mid=1YTQpHTyhpAzWyOlZ_oMgDEm-fu_VnQES&usp=sharing'
    ),
    
    BusRoute(
      routeNo: 'F4',
      routeName: 'Savar  <> Nabinagar <> C&B <> DSC',
      routeDetails: 'Savar  > Nobinagar > C&B > DSC',
      stops: ['Savar ', 'Nobinagar ', ' C&B ', ' DSC'],
      schedules: [Schedule(startTime: '07:30 AM', departureTime: '04:20 PM')],
      routeMap: 'https://www.google.com/maps/d/embed?mid=1PGdXssg_Tg-tlBdHsK3QvtL58Pz2UCC7'
    ),
    
    BusRoute(
      routeNo: 'F5',
      routeName: 'Mirpur-10 <> Sony Cinema Hall <> DSC',
      routeDetails: 'Mirpur-10 <> Sony Cinema Hall <> DSC',
      stops: ['Mirpur-10', 'Sony Cinema Hall', 'DSC'],
      schedules: [Schedule(startTime: '07:30 AM', departureTime: '04:20 PM')],
      routeMap: 'nan'
    ),
  ];

  static List<BusRoute> getRegularRoutes() => _regularRoutes;
  static List<BusRoute> getFridayRoutes() => _fridayRoutes;
  static List<BusRoute> getAllRoutes() => [..._regularRoutes, ..._fridayRoutes];

  static List<BusRoute> searchRoutes(String query) {
    query = query.toLowerCase();
    return getAllRoutes().where((route) {
      return route.routeName.toLowerCase().contains(query) ||
             route.routeDetails.toLowerCase().contains(query) ||
             route.routeNo.toLowerCase().contains(query) ||
             route.stops.any((stop) => stop.toLowerCase().contains(query));
    }).toList();
  }
}