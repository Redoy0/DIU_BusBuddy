import 'package:diubusbuddy/screens/aelrt_page.dart';
import 'package:flutter/material.dart';
import '../models/bus_route.dart';
import '../services/route_data_service.dart';
import '../widgets/route_card.dart';
import 'route_details_page.dart';
import 'search_page.dart';
import 'route_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<BusRoute> _routes = [];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _routes = RouteDataService.getRegularRoutes();

    // Update routes when switching tabs
    _tabController.addListener(() {
      setState(() {
        _routes = _tabController.index == 0
            ? RouteDataService.getRegularRoutes()
            : RouteDataService.getFridayRoutes();
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBody() {
    // Switch between main screens
    switch (_currentIndex) {
      case 0:
        return Column(
          children: [
            _buildHeader(),
            _buildTabBar(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildRouteList(RouteDataService.getRegularRoutes()),
                  _buildRouteList(RouteDataService.getFridayRoutes()),
                ],
              ),
            ),
          ],
        );
      case 1:
        return const RoutePage();
      case 2:
        return const AlertsPage();
      default:
        return const Center(child: Text('Page Not Found'));
    }
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 16),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 0, 144, 155),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'DIU BusBuddy',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: const [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 8),
                  Text(
                    'Search routes, stops, or bus numbers...',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      indicatorColor: const Color.fromARGB(255, 0, 144, 155),
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      tabs: const [
        Tab(text: 'Regular Schedule'),
        Tab(text: 'Friday Schedule'),
      ],
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

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Routes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Alerts',
        ),
      ],
    );
  }
}
