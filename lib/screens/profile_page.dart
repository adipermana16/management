import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white, // Changed to white background for the whole screen
        body: SafeArea(
          child: Column(
            children: [
              // ===== RED HEADER =====
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 20, bottom: 24),
                decoration: const BoxDecoration(
                  color: Color(0xFFB94A48), // Red background for header
                ),
                child: Column(
                  children: [
                    // ===== HEADER =====
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back, color: Colors.white),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ===== PROFILE IMAGE =====
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.red,
                      backgroundImage: AssetImage(
                        'assets/profile.jpg', // ganti dengan gambar kamu
                      ),
                    ),

                    const SizedBox(height: 16),

                    // ===== NAME =====
                    const Text(
                      'DANDY CANDRA PRATAMA',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ===== WHITE CARD WITH TAB =====
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: const [
                    TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.black,
                      indicatorWeight: 2,
                      tabs: [
                        Tab(text: 'About Me'),
                        Tab(text: 'Kelas'),
                        Tab(text: 'Edit Profile'),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // ===== TAB CONTENT =====
              Expanded(
                child: TabBarView(
                  children: [
                    // ABOUT TAB
                    SingleChildScrollView(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _sectionTitle('Informasi User'),
                          _infoItem('Email address',
                              'dandy.candrapratama@student.university.ac.id'),
                          _infoItem('Program Studi',
                              'D4 Teknologi Rekayasa Multimedia'),
                          _infoItem('Fakultas', 'FTI'),

                          SizedBox(height: 16),
                          _sectionTitle('Aktivitas Login'),
                          _infoItem('First access',
                              'Monday, 7 September 2020, 8:27 AM (286 days 12 hours)'),
                          _infoItem(
                              'Last access', 'Friday, 22 June 2024, 5:44 PM (Now)'),

                          SizedBox(height: 24),

                          /// LOGOUT BUTTON
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              icon: const Icon(Icons.logout, color: Colors.white),
                              label: const Text(
                                'Log Out',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    // KELAS TAB
                    SingleChildScrollView(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          KelasItem(
                            title: 'BAHASA INGGRIS BUSINESS AND SCIENTIFIC',
                            subtitle: 'D4SIM-4A-GAB (ARS)\nTanggal Mulai Monday, 8 February 2021',
                          ),
                          KelasItem(
                            title: 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
                            subtitle: 'D4SIM-4A-03 (ADY)\nTanggal Mulai Monday, 8 February 2021',
                          ),
                          KelasItem(
                            title: 'KEWARGANEGARAAN',
                            subtitle: 'D4SIM-4A-GAB (BBU) JUMAT 2\nTanggal Mulai Monday, 8 February 2021',
                          ),
                          KelasItem(
                            title: 'OLAH RAGA D3TT-4A-02 (EYR)',
                            subtitle: 'Tanggal Mulai Monday, 8 February 2021',
                          ),
                          KelasItem(
                            title: 'PEMROGRAMAN MULTIMEDIA INTERAKTIF',
                            subtitle: 'D4SIM-4A-04 (TPR)\nTanggal Mulai Monday, 8 February 2021',
                          ),
                          KelasItem(
                            title: 'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA',
                            subtitle: 'D4SIM-4A-GAB (APJ)\nTanggal Mulai Monday, 8 February 2021',
                          ),
                          KelasItem(
                            title: 'SISTEM OPERASI D4SIM-4A-02 (DOS)',
                            subtitle: 'Tanggal Mulai Monday, 8 February 2021',
                          ),
                        ],
                      ),
                    ),
                    // EDIT PROFIL TAB
                    SingleChildScrollView(
                      padding: EdgeInsets.all(16),
                      child: Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildInputField(
                              controller: TextEditingController(text: 'DANDY CANDRA PRATAMA'),
                              label: 'Nama Lengkap',
                              icon: Icons.person,
                            ),
                            
                            _buildInputField(
                              controller: TextEditingController(text: 'dandy.candrapratama@student.university.ac.id'),
                              label: 'Email',
                              icon: Icons.email,
                            ),
                            
                            _buildInputField(
                              controller: TextEditingController(text: 'D4 Teknologi Rekayasa Multimedia'),
                              label: 'Program Studi',
                              icon: Icons.school,
                            ),
                            
                            _buildInputField(
                              controller: TextEditingController(text: 'FTI'),
                              label: 'Fakultas',
                              icon: Icons.business,
                            ),

                            SizedBox(height: 24),

                            /// SAVE BUTTON
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Save profile logic here
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Profil berhasil diperbarui'),
                                      backgroundColor: Color(0xFFB94A48),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFB94A48),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text(
                                  'Simpan Perubahan',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
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
        ),
        // Bottom navigation remains with red color
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white, // White background for bottom nav
          selectedItemColor: Colors.red,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Kelas Saya',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifikasi',
            ),
          ],
        ),
      ),
    );
  }

  /// ===== WIDGET BANTUAN =====

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _infoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: const Color(0xFFB94A48)),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Color(0xFFB94A48), width: 2),
          ),
        ),
      ),
    );
  }
}

/// ===================
/// ITEM KELAS
/// ===================
class KelasItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const KelasItem({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// INDICATOR BIRU
          Container(
            width: 50,
            height: 18,
            decoration: BoxDecoration(
              color: Colors.lightBlue.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(width: 12),

          /// TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
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