// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DisplayEventsPage extends StatefulWidget {
  const DisplayEventsPage({Key? key}) : super(key: key);

  @override
  _DisplayEventsPageState createState() => _DisplayEventsPageState();
}

class _DisplayEventsPageState extends State<DisplayEventsPage> {
  List<Map<String, String>> events = [
    {
      'title': 'Trash collecting in Saida',
      'date': 'December 1, 2023',
      'time': '9:00 AM',
    },
    {
      'title': 'Security in a UFC event',
      'date': 'January 3, 2024',
      'time': '6:00 PM',
    },
  ];

  void _removeEvent(int index) {
    setState(() {
      events.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display Events'),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (BuildContext context, int index) {
          final event = events[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                title: Text(
                  event['title'] ?? '',
                  style: GoogleFonts.poppins(
                    fontSize: 19.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10.0),
                    Text(
                      'Date: ${event['date'] ?? ''}',
                      style: GoogleFonts.poppins(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      'Time: ${event['time'] ?? ''}',
                      style: GoogleFonts.poppins(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(width: 8.0),
                        ElevatedButton(
                          onPressed: () {
                            _removeEvent(index);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            minimumSize: const Size(100.0, 40.0),
                          ),
                          child: const Text(
                            'Remove',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
            ),
          );
        },
      ),

      bottomNavigationBar: Container(
        height: 30.0,
        color: Colors.black,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '© 2023 A & M. All Rights Reserved.',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
