import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Image.asset(
              'assets/images/map_route.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView(
              children: [
                ListTile(
                  title: Text('Current Location'),
                  subtitle: Text('San Francisco, CA'),
                ),
                ListTile(
                  title: Text('Visited Locations'),
                  subtitle: Text('Location X, Location Y, Location Z'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
