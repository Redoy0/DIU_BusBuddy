import 'package:flutter/material.dart';
import '../models/bus_route.dart';
import '../services/route_data_service.dart';
import '../widgets/route_card.dart';
import 'route_details_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<BusRoute> _searchResults = [];

  void _performSearch(String query) {
    setState(() {
      _searchResults = RouteDataService.searchRoutes(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Search routes, stops or bus numbers...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white70),
          ),
          style: const TextStyle(color: Color.fromARGB(255, 32, 31, 31)),
          onChanged: _performSearch,
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _searchResults.length,
        itemBuilder: (context, index) {
          return RouteCard(
            route: _searchResults[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RouteDetailsPage(
                    route: _searchResults[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}