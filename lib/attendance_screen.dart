import 'package:flutter/material.dart';

import 'calendar_screen.dart';
import 'member_details_screen.dart';

class AttendanceScreen extends StatelessWidget {
  final List<Map<String, dynamic>> members = [
    {
      'name': 'Wade Warren',
      'id': 'WSL0003',
      'status': 'Working',
      'startTime': '09:30 am',
      'endTime': '',
      'image': 'assets/avatar1.png',
    },
    {
      'name': 'Esther Howard',
      'id': 'WSL0034',
      'status': 'Working',
      'startTime': '09:30 am',
      'endTime': '06:40 pm',
      'image': 'assets/avatar2.png',
    },
    {
      'name': 'Cameron Williamson',
      'id': 'WSL0054',
      'status': 'Not Logged In Yet',
      'startTime': '',
      'endTime': '',
      'image': 'assets/avatar3.png',
    },
    {
      'name': 'Brooklyn Simmons',
      'id': 'WSL0076',
      'status': 'Working',
      'startTime': '09:30 am',
      'endTime': '06:40 pm',
      'image': 'assets/avatar4.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance'),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CalendarScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          final member = members[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(member['image']),
              ),
              title: Text(
                '${member['name']} (${member['id']})',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(member['status']),
              trailing: IconButton(
                icon: Icon(Icons.location_on, color: Colors.blue),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MemberDetailsScreen(
                        memberName: member['name'],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
