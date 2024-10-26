import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Web Layout',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: ResponsiveLayout(),
      ),
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          children: [
            // Sidebar
            if (constraints.maxWidth > 600) // Tampilkan Sidebar jika lebar layar > 600
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.blue[700],
                  child: Sidebar(),
                ),
              ),

            // Main Content Area
            Expanded(
              flex: 8,
              child: Column(
                children: [
                  // Header
                  Header(),

                  // Content
                  Expanded(
                    child: Container(
                      color: Colors.grey[200],
                      child: Content(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        ListTile(
          leading: Icon(Icons.home, color: Colors.white),
          title: Text('Home', style: TextStyle(color: Colors.white)),
        ),
        ListTile(
          leading: Icon(Icons.person, color: Colors.white),
          title: Text('Profile', style: TextStyle(color: Colors.white)),
        ),
        ListTile(
          leading: Icon(Icons.settings, color: Colors.white),
          title: Text('Settings', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[900],
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Dashboard',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          Row(
            children: [
              Icon(Icons.notifications, color: Colors.white),
              SizedBox(width: 16),
              CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/Kabut.png', // Ganti dengan path gambar Anda
                ),
                radius: 20, // Ukuran avatar
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Welcome to the content area!',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
