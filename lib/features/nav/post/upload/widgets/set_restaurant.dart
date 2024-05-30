import 'package:flutter/material.dart';

class SetRestaurant extends StatefulWidget {
  const SetRestaurant({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SetRestaurantState createState() => _SetRestaurantState();
}

class _SetRestaurantState extends State<SetRestaurant> {
  final List<String> allItems = [
    'Restaurant 1',
    'Restaurant 2',
    'Restaurant 3',
    'Restaurant 4',
    'Restaurant 5',
  ];
  List<String> filteredItems = [];
  bool _isSearching = false;
  final FocusNode _searchFocusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredItems = allItems;
    _searchFocusNode.addListener(() {
      setState(() {
        _isSearching = _searchFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _filterItems(String query) {
    setState(() {
      filteredItems = query.isEmpty
          ? allItems
          : allItems.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  void _hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: Scaffold(
        
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                focusNode: _searchFocusNode,
                decoration: const InputDecoration(
                  labelText: 'Search restaurant here',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)), 
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: _filterItems,
              ),
              const SizedBox(height: 10),
              if (_isSearching)
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0), 
                      color: Colors.grey.shade200,
                    ),
                    child: ListView.builder(
                      itemCount: filteredItems.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(filteredItems[index]),
                          onTap: () {
                            _searchController.text = filteredItems[index];
                            _filterItems(filteredItems[index]);
                            _hideKeyboard();
                          },
                        );
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
