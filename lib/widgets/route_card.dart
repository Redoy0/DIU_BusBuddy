import 'package:flutter/material.dart';
import '../models/bus_route.dart';

class RouteCard extends StatelessWidget {
  final BusRoute route;
  final VoidCallback onTap;

  const RouteCard({
    super.key,
    required this.route,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: Colors.blue.shade100,
          child: Text(route.routeNo),
        ),
        title: Text(
          route.routeName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          '${route.schedules.first.startTime} - ${route.schedules.last.departureTime}',
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
