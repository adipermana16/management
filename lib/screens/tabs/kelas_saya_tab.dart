import 'package:flutter/material.dart';

class KelasSayaTab extends StatelessWidget {
  const KelasSayaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kelas Saya',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Daftar kelas yang sedang Anda ikuti:',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 20),
          // Placeholder for classes list
          Card(
            child: ListTile(
              leading: Icon(Icons.class_, color: Color(0xFFEA6262)),
              title: Text('Matematika Dasar'),
              subtitle: Text('Kelas untuk pemula'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          SizedBox(height: 10),
          Card(
            child: ListTile(
              leading: Icon(Icons.class_, color: Color(0xFFEA6262)),
              title: Text('Bahasa Inggris'),
              subtitle: Text('Level Intermediate'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          SizedBox(height: 10),
          Card(
            child: ListTile(
              leading: Icon(Icons.class_, color: Color(0xFFEA6262)),
              title: Text('Pemrograman Python'),
              subtitle: Text('Level Advanced'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
        ],
      ),
    );
  }
}