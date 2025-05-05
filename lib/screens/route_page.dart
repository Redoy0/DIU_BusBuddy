import 'package:flutter/material.dart';
import '../models/bus_route.dart';
import '../services/route_data_service.dart';
import '../widgets/route_card.dart';
import 'route_details_page.dart';

class RoutePage extends StatefulWidget {
  const RoutePage({super.key});

  @override
  State<RoutePage> createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Routes'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Regular Schedule'),
            Tab(text: 'Friday Schedule'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildRouteList(RouteDataService.getRegularRoutes()),
          _buildRouteList(RouteDataService.getFridayRoutes()),
        ],
      ),
    );
  }

  Widget _buildRouteList(List<BusRoute> routes) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: routes.length,
      itemBuilder: (context, index) {
        return RouteCard(
          route: routes[index],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RouteDetailsPage(route: routes[index]),
              ),
            );
          },
        );
      },
    );
  }
}
