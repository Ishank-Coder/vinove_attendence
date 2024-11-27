import 'package:flutter/material.dart';
import 'map_screen.dart';

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
    // Add more members as needed
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
              // Add calendar functionality
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child: Icon(Icons.group, color: Colors.deepPurple),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'All Members',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    // Add member filter functionality
                  },
                  child: Text(
                    'Change',
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
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
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (member['status'].isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              member['status'],
                              style: TextStyle(
                                color: member['status'] == 'Working'
                                    ? Colors.green
                                    : Colors.red,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        Row(
                          children: [
                            Icon(Icons.arrow_upward, color: Colors.green, size: 16),
                            SizedBox(width: 4),
                            Text(member['startTime']),
                            if (member['endTime'].isNotEmpty) ...[
                              SizedBox(width: 20),
                              Icon(Icons.arrow_downward, color: Colors.red, size: 16),
                              SizedBox(width: 4),
                              Text(member['endTime']),
                            ],
                          ],
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.calendar_today, color: Colors.grey),
                          onPressed: () {
                            // Add attendance details functionality
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.location_on, color: Colors.blue),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MapScreen(memberName: member['name']),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          TextButton(
            onPressed: () {
              // Navigate to map view for all members
            },
            child: Text(
              'Show Map view',
              style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
