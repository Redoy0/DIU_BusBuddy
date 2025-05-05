import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/bus_route.dart';
import '../widgets/schedule_card.dart';

class RouteDetailsPage extends StatelessWidget {
  final BusRoute route;

  const RouteDetailsPage({
    super.key,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Two tabs: From DSC and To DSC
      child: Scaffold(
        appBar: AppBar(
          title: Text('Route ${route.routeNo}'),
        ),
        body: Column(
          children: [
            _buildRouteHeader(),
            const TabBar(
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.blue,
              tabs: [
                Tab(text: 'Buses From DSC'),
                Tab(text: 'Buses To DSC'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildTabContent('Buses From DSC', true),
                  _buildTabContent('Buses To DSC', false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRouteHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.blue,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            route.routeName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            route.routeDetails,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent(String title, bool isFromDSC) {
    final now = DateTime.now();

    // Filter schedules based on the tab
    final List<Schedule> schedules = isFromDSC
        ? route.schedules
            .where((schedule) => schedule.departureTime.isNotEmpty)
            .toList()
        : route.schedules
            .where((schedule) => schedule.startTime.isNotEmpty)
            .toList();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            if (schedules.isEmpty)
              const Text('No schedules available.'),
            ...schedules.map((schedule) {
              final busTime = _parseBusTime(
                now,
                isFromDSC ? schedule.departureTime : schedule.startTime,
              );

              return ScheduleCard(
                schedule: schedule,
                schedules: schedules, // Pass all schedules for context
                isFromDSC: isFromDSC,
              );
            }).toList(),
            const SizedBox(height: 24),
            const Text(
              'Bus Stops',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ...List.generate(
              route.stops.length,
              (index) => _buildStop(
                route.stops[index],
                index == 0
                    ? 'start'
                    : index == route.stops.length - 1
                        ? 'end'
                        : 'stop',
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => _launchMap(route.routeMap),
              icon: const Icon(Icons.map),
              label: const Text('View Route Map'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  DateTime? _parseBusTime(DateTime now, String time) {
    try {
      final parsedTime = DateFormat('HH:mm').parse(time);
      return DateTime(now.year, now.month, now.day, parsedTime.hour, parsedTime.minute);
    } catch (e) {
      return null;
    }
  }

  Widget _buildStop(String name, String type) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Column(
            children: [
              Icon(
                type == 'start'
                    ? Icons.trip_origin
                    : type == 'end'
                        ? Icons.location_on
                        : Icons.circle,
                color: type == 'start'
                    ? Colors.green
                    : type == 'end'
                        ? Colors.red
                        : Colors.blue,
                size: type == 'stop' ? 12 : 16,
              ),
              if (type != 'end')
                Container(
                  width: 2,
                  height: 16,
                  color: Colors.blue,
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                fontWeight: type != 'stop' ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchMap(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
