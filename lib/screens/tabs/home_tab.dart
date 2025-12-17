import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Grid Section
          const Text(
            'Dashboard',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          
          // Grid with 3 sections
          Expanded(
            child: GridView.count(
              crossAxisCount: 1, // 1 column for mobile view
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                // Upcoming Tasks Card
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.assignment,
                              color: Color(0xFFEA6262),
                              size: 30,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Tugas yang Akan Datang',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        const ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.circle, size: 12, color: Color(0xFFEA6262)),
                          title: Text('Tugas Matematika', style: TextStyle(fontSize: 14)),
                          subtitle: Text('Deadline: 20 Des 2023', style: TextStyle(fontSize: 12)),
                        ),
                        const ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.circle, size: 12, color: Color(0xFFEA6262)),
                          title: Text('Tugas Bahasa Inggris', style: TextStyle(fontSize: 14)),
                          subtitle: Text('Deadline: 22 Des 2023', style: TextStyle(fontSize: 12)),
                        ),
                        const Spacer(),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () {
                              // Navigate to tasks page
                            },
                            child: const Text('Lihat Semua'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Latest Announcements Card
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.campaign,
                              color: Color(0xFFEA6262),
                              size: 30,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Pengumuman Terakhir',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        const ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.circle, size: 12, color: Color(0xFFEA6262)),
                          title: Text('Libur Nasional', style: TextStyle(fontSize: 14)),
                          subtitle: Text('25 Desember 2023', style: TextStyle(fontSize: 12)),
                        ),
                        const ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.circle, size: 12, color: Color(0xFFEA6262)),
                          title: Text('Jadwal Ujian', style: TextStyle(fontSize: 14)),
                          subtitle: Text('15 Januari 2024', style: TextStyle(fontSize: 12)),
                        ),
                        const Spacer(),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () {
                              // Navigate to announcements page
                            },
                            child: const Text('Lihat Semua'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Class Progress Card
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.bar_chart,
                              color: Color(0xFFEA6262),
                              size: 30,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Progres Kelas',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        const ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text('Matematika Dasar', style: TextStyle(fontSize: 14)),
                          subtitle: Text('Progress: 75%', style: TextStyle(fontSize: 12)),
                        ),
                        const ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text('Bahasa Inggris', style: TextStyle(fontSize: 14)),
                          subtitle: Text('Progress: 60%', style: TextStyle(fontSize: 12)),
                        ),
                        const Spacer(),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () {
                              // Navigate to class progress page
                            },
                            child: const Text('Lihat Detail'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}