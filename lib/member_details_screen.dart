import 'package:flutter/material.dart';

class MemberDetailsScreen extends StatelessWidget {
  final String memberName;

  MemberDetailsScreen({required this.memberName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Route - $memberName'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Image.asset(
              'assets/images/map_today.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView(
              children: [
                ListTile(
                  title: Text('Start Location'),
                  subtitle: Text('Location A'),
                ),
                ListTile(
                  title: Text('Stop Location'),
                  subtitle: Text('Location B'),
                ),
                ListTile(
                  title: Text('Total KM'),
                  subtitle: Text('5 KM'),
                ),
                ListTile(
                  title: Text('Total Duration'),
                  subtitle: Text('30 min'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
