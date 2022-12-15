import 'package:flutter/material.dart';

class MobileBody extends StatelessWidget {
  const MobileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade200,
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            const DrawerHeader(
              child: CircleAvatar(
                radius: 40.0,
                backgroundColor: Colors.deepPurple,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_rounded),
              title: Text(
                'DASHBOARD'.toUpperCase(),
                style: const TextStyle(letterSpacing: 4.0),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.favorite_rounded),
              title: Text(
                'Favorites'.toUpperCase(),
                style: const TextStyle(letterSpacing: 4.0),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.notifications_rounded),
              title: Text(
                'Notifications'.toUpperCase(),
                style: const TextStyle(letterSpacing: 4.0),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person_rounded),
              title: Text(
                'About'.toUpperCase(),
                style: const TextStyle(letterSpacing: 4.0),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('M O B I L E'),
        backgroundColor: Colors.deepPurple.shade600,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.deepPurple.shade400,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 120.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.deepPurple.shade300,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
