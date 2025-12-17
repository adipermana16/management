import 'package:flutter/material.dart';

class NotifikasiTab extends StatelessWidget {
  const NotifikasiTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Notifikasi',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Notifikasi terbaru:',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 20),
          // Placeholder for notifications list
          Card(
            child: ListTile(
              leading: Icon(Icons.info, color: Color(0xFFEA6262)),
              title: Text('Pengumuman Baru'),
              subtitle: Text('Ada pengumuman penting untuk Anda'),
              trailing: Text('2 menit lalu'),
            ),
          ),
          SizedBox(height: 10),
          Card(
            child: ListTile(
              leading: Icon(Icons.assignment, color: Color(0xFFEA6262)),
              title: Text('Tugas Baru'),
              subtitle: Text('Tugas matematika telah ditambahkan'),
              trailing: Text('1 jam lalu'),
            ),
          ),
          SizedBox(height: 10),
          Card(
            child: ListTile(
              leading: Icon(Icons.event, color: Color(0xFFEA6262)),
              title: Text('Jadwal Kelas'),
              subtitle: Text('Kelas bahasa inggris dimulai dalam 30 menit'),
              trailing: Text('3 jam lalu'),
            ),
          ),
        ],
      ),
    );
  }
}