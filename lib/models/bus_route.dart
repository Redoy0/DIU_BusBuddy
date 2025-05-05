class BusRoute {
  final String routeNo;
  final String routeName;
  final String routeDetails;
  final List<String> stops;
  final List<Schedule> schedules;
  final String routeMap;
  final bool isFridayRoute;

  BusRoute({
    required this.routeNo,
    required this.routeName,
    required this.routeDetails,
    required this.stops,
    required this.schedules,
    required this.routeMap,
    this.isFridayRoute = false,
  });
}

class Schedule {
  final String startTime;
  final String departureTime;
  final String? notes;

  Schedule({
    required this.startTime,
    required this.departureTime,
    this.notes,
  });
}