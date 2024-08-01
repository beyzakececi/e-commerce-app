import 'package:flutter/material.dart';
import '../../viewmodel/filter/filter_viewmodel.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final FilterViewModel _viewModel = FilterViewModel();
  List<String> areas = [];
  Map<String, bool> selectedAreas = {};
  TextEditingController ingredientController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchAreas();
  }

  void fetchAreas() async {
    try {
      //List<String> fetchedAreas = await _viewModel.getAreas();
      setState(() {
        //areas = fetchedAreas;
        for (var area in areas) {
          selectedAreas[area] = false;
        }
      });
    } catch (e) {
      // Handle error
      print('Error fetching areas: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Filter by Area', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ...areas.map((area) {
                return CheckboxListTile(
                  title: Text(area),
                  value: selectedAreas[area],
                  onChanged: (bool? value) {
                    setState(() {
                      selectedAreas[area] = value!;
                    });
                  },
                );
              }).toList(),
              SizedBox(height: 20),
              Text('Filter by Main Ingredient', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextField(
                controller: ingredientController,
                decoration: InputDecoration(
                  hintText: 'Enter main ingredient',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                ),
              ),
              SizedBox(height: 20), // Add some spacing before the button
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Center(
                  child: Text('Apply Filter', style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
