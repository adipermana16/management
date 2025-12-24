import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Upcoming Tasks Section
            const Text(
              'Tugas yang Akan Datang',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.assignment, color: Color(0xFFEA6262)),
                      title: Text('Tugas Matematika'),
                      subtitle: Text('Deadline: 20 Des 2023'),
                    ),
                    ListTile(
                      leading: Icon(Icons.assignment, color: Color(0xFFEA6262)),
                      title: Text('Tugas Bahasa Inggris'),
                      subtitle: Text('Deadline: 22 Des 2023'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            
            // Latest Announcements Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Pengumuman Terakhir',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to all announcements
                  },
                  child: const Text('Lihat Semua'),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Container(
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.campaign,
                        size: 60,
                        color: Color(0xFFEA6262),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Maintenance UAS',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Sistem akan maintenance pada tanggal 25 Desember 2023 dari pukul 22:00 hingga 06:00 WIB',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            
            // Class Progress Section
            const Text(
              'Progres Kelas',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Sub-group 1: Matematika
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color(0xFFEA6262),
                        child: Icon(Icons.school, color: Colors.white),
                      ),
                      title: Text('Matematika Dasar'),
                      subtitle: Text('Progress: 75%'),
                      trailing: Text('75%'),
                    ),
                    SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: 0.75,
                      backgroundColor: Colors.grey,
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFEA6262)),
                    ),
                    SizedBox(height: 20),
                    
                    // Sub-group 2: Bahasa Inggris
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color(0xFFEA6262),
                        child: Icon(Icons.language, color: Colors.white),
                      ),
                      title: Text('Bahasa Inggris'),
                      subtitle: Text('Progress: 60%'),
                      trailing: Text('60%'),
                    ),
                    SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: 0.60,
                      backgroundColor: Colors.grey,
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFEA6262)),
                    ),
                    SizedBox(height: 20),
                    
                    // Sub-group 3: Pemrograman
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color(0xFFEA6262),
                        child: Icon(Icons.code, color: Colors.white),
                      ),
                      title: Text('Pemrograman'),
                      subtitle: Text('Progress: 85%'),
                      trailing: Text('85%'),
                    ),
                    SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: 0.85,
                      backgroundColor: Colors.grey,
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFEA6262)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20), // Add some padding at the bottom
          ],
        ),
      ),
    );
  }
}