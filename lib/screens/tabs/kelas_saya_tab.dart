import 'package:flutter/material.dart';

class KelasSayaTab extends StatelessWidget {
  const KelasSayaTab({super.key});

  final List<Map<String, dynamic>> materiList = const [
    {
      "pertemuan": "Pertemuan 1",
      "judul": "01 - Pengantar User Interface Design",
      "durasi": "7 Juni 2023 • 3 menit 20 detik",
      "selesai": false,
    },
    {
      "pertemuan": "Pertemuan 2",
      "judul": "02 - Konsep User Interface Design",
      "durasi": "7 Juni 2023 • 8 menit 35 detik",
      "selesai": true,
    },
    {
      "pertemuan": "Pertemuan 3",
      "judul": "03 - Interaksi pada User Interface Design",
      "durasi": "7 Juni 2023 • 15 menit",
      "selesai": true,
    },
    {
      "pertemuan": "Pertemuan 4",
      "judul": "04 - Ethnographic Observation",
      "durasi": "7 Juni 2023 • 10 menit",
      "selesai": true,
    },
    {
      "pertemuan": "Pertemuan 5",
      "judul": "05 - UI/UX Testing",
      "durasi": "7 Juni 2023 • 12 menit",
      "selesai": true,
    },
    {
      "pertemuan": "Pertemuan 6",
      "judul": "06 - Assessment 1",
      "durasi": "7 Juni 2023 • 15 menit",
      "selesai": true,
    },
  ];

  final List<Map<String, dynamic>> taskList = const [
    {
      "label": "Quiz",
      "labelColor": Colors.blue,
      "title": "Quiz Review 01",
      "deadline": "Tenggat Waktu : 26 Februari 2023 23:59 WIB",
      "isDone": true,
    },
    {
      "label": "Tugas",
      "labelColor": Colors.orange,
      "title": "Tugas 01 - UI/UX Android Mobile Game",
      "deadline": "Tenggat Waktu : 26 Februari 2023 23:59 WIB",
      "isDone": false,
    },
    {
      "label": "Quiz",
      "labelColor": Colors.blue,
      "title": "Kuis - Assessment 2",
      "deadline": "Tenggat Waktu : 26 Februari 2023 23:59 WIB",
      "isDone": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text(
            'DESAIN ANTARMUKA & PENGALAMAN\nPENGGUNA D4SM-4205 (3 Days)',
            style: TextStyle(fontSize: 14),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Materi'),
              Tab(text: 'Tugas Dan Kuis'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Materi Tab with detail view when item is tapped
            _buildMateriTab(),
            // Tugas & Kuis Tab with the new design
            Container(
              color: const Color(0xFFF5F6F8),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Deskripsi
                    const Text(
                      'Deskripsi',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const SizedBox(height: 20),

                    // Quiz Card (Expanded)
                    _quizCard(),

                    const SizedBox(height: 14),

                    // Tugas Card
                    _taskCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMateriTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: materiList.length,
      itemBuilder: (context, index) {
        final materi = materiList[index];
        return GestureDetector(
          onTap: () {
            // Navigate to detail page when a materi item is tapped
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MateriDetailPage(
                  judul: materi['judul'],
                  selesai: materi['selesai'],
                ),
              ),
            );
          },
          child: MateriCard(
            pertemuan: materi['pertemuan'],
            judul: materi['judul'],
            durasi: materi['durasi'],
            selesai: materi['selesai'],
          ),
        );
      },
    );
  }

  // Tab widget for Tugas dan Kuis
  Widget _tab(String text, bool active) {
    return Expanded(
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: active ? Colors.black : Colors.black45,
            ),
          ),
          const SizedBox(height: 6),
          Container(
            height: 2,
            color: active ? Colors.black : Colors.transparent,
          ),
        ],
      ),
    );
  }

  // Quiz Card
  Widget _quizCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.quiz_outlined),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Quiz Review 01',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              Icon(Icons.check_circle, color: Colors.green),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Silahkan kerjakan kuis ini dalam waktu 15 menit sebagai nilai '
            'pertama komponen kuis. Jangan lupa klik tombol Submit Answer '
            'setelah menjawab seluruh pertanyaan.\n\n'
            'Kerjakan sebelum hari Jumat, 26 Februari 2021 jam 23:59 WIB.',
            style: TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }

  // Task Card
  Widget _taskCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.description_outlined),
          const SizedBox(width: 10),
          const Expanded(
            child: Text(
              'Tugas 01 - UI Android Mobile Game\n\n'
              '1. Buatlah desain tampilan (antarmuka) pada aplikasi mobile '
              'game FPS (First Person Shooter) yang akan menjadi tugas '
              'pertama matakuliah Pemrograman Aplikasi Permainan.\n'
              '2. Desain yang dibuat harus meliputi seluruh tampilan...',
              style: TextStyle(fontSize: 13),
            ),
          ),
          const Icon(
            Icons.radio_button_unchecked,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

class MateriCard extends StatelessWidget {
  final String pertemuan;
  final String judul;
  final String durasi;
  final bool selesai;

  const MateriCard({
    super.key,
    required this.pertemuan,
    required this.judul,
    required this.durasi,
    required this.selesai,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      pertemuan,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    judul,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    durasi,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            if (selesai)
              const Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
          ],
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final String label;
  final Color labelColor;
  final String title;
  final String deadline;
  final bool isDone;

  const TaskCard({
    super.key,
    required this.label,
    required this.labelColor,
    required this.title,
    required this.deadline,
    required this.isDone,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isDone ? Colors.green : Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: labelColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: labelColor,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    label,
                    style: TextStyle(
                      color: labelColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Spacer(),
                if (isDone)
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.green,
                        width: 1,
                      ),
                    ),
                    child: const Icon(
                      Icons.check,
                      size: 16,
                      color: Colors.green,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              deadline,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MateriDetailPage extends StatefulWidget {
  final String judul;
  final bool selesai;

  const MateriDetailPage({
    super.key,
    required this.judul,
    required this.selesai,
  });

  @override
  State<MateriDetailPage> createState() => _MateriDetailPageState();
}

class _MateriDetailPageState extends State<MateriDetailPage> {
  // State for the checkboxes
  late List<bool> _checkboxStates;

  @override
  void initState() {
    super.initState();
    // Initialize checkbox states based on the material items
    _checkboxStates = [
      true,   // Zoom Meeting Synchronous
      false,  // Pengantar User Interface Design
      true,   // Empat Teori Dasar Antarmuka Pengguna
      false,  // User Interface Design for Beginner
      true,   // 20 Prinsip Desain
      true,   // Best Practice UI Design
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.judul),
          backgroundColor: Colors.blue,
          bottom: TabBar(
            tabs: const [
              Tab(text: 'Lampiran Materi'),
              Tab(text: 'Tugas dan Kuis'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Lampiran Materi Tab
            SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Deskripsi
                  const Text(
                    'Deskripsi',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Antarmuka yang dibangun harus memperhatikan prinsip-prinsip '
                    'desain yang ada. Hal ini diharapkan agar antarmuka pengguna '
                    'bukan hanya menarik secara visual tetapi juga mudah digunakan '
                    'dan memberikan pengalaman pengguna yang baik.',
                    style: TextStyle(fontSize: 14),
                  ),

                  const SizedBox(height: 20),

                  const SizedBox(height: 16),

                  // List Materi
                  _buildMateriItem(
                    icon: Icons.videocam,
                    title: 'Zoom Meeting Synchronous',
                    index: 0,
                  ),
                  _buildMateriItem(
                    icon: Icons.picture_as_pdf,
                    title: 'Pengantar User Interface Design',
                    index: 1,
                  ),
                  _buildMateriItem(
                    icon: Icons.picture_as_pdf,
                    title: 'Empat Teori Dasar Antarmuka Pengguna',
                    index: 2,
                  ),
                  _buildMateriItem(
                    icon: Icons.menu_book,
                    title: 'User Interface Design for Beginner',
                    index: 3,
                  ),
                  _buildMateriItem(
                    icon: Icons.design_services,
                    title: '20 Prinsip Desain',
                    index: 4,
                  ),
                  _buildMateriItem(
                    icon: Icons.star,
                    title: 'Best Practice UI Design',
                    index: 5,
                  ),
                ],
              ),
            ),
            // Tugas dan Kuis Tab
            TugasKuisPage(judul: widget.judul),
          ],
        ),
      ),
    );
  }

  // Widget Tab
  Widget _buildTab(String title, bool isActive) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isActive ? Colors.blue : Colors.grey.shade300,
              width: 2,
            ),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.blue : Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  // Widget Item Materi with interactive checkboxes
  Widget _buildMateriItem({
    required IconData icon,
    required String title,
    required int index,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        trailing: Checkbox(
          value: _checkboxStates[index],
          onChanged: (bool? value) {
            setState(() {
              _checkboxStates[index] = value ?? false;
            });
          },
          activeColor: Colors.green,
          checkColor: Colors.white,
        ),
      ),
    );
  }
}

class TugasKuisPage extends StatefulWidget {
  final String judul;

  const TugasKuisPage({
    super.key,
    required this.judul,
  });

  @override
  State<TugasKuisPage> createState() => _TugasKuisPageState();
}

class _TugasKuisPageState extends State<TugasKuisPage> {
  // State for the checkboxes
  late bool _quizChecked;
  late bool _taskChecked;

  @override
  void initState() {
    super.initState();
    // Initialize checkbox states
    _quizChecked = true;  // Quiz is completed
    _taskChecked = false; // Task is not completed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konsep User Interface Design'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul
            const Text(
              'Deskripsi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // Deskripsi teks
            const Text(
              'Konsep dasar User Interface Design akan dipelajari bagaimana '
              'membangun sebuah Interface Design pada antarmuka. '
              'Interaction ini sangat penting untuk aplikasi berkomunikasi '
              'dengan pengguna. Lalu dipelajari juga poin-poin penting pada '
              'interaction design seperti visibility, feedback, limitation, '
              'consistency dan affordance. Dan terakhir materi conceptual design '
              'interaction akan memberikan gambaran bagaimana bentuk dari Interaction.',
              style: TextStyle(fontSize: 14, height: 1.5),
            ),

            const SizedBox(height: 24),

            // Card Quiz
            buildItemCard(
              icon: Icons.quiz,
              title: 'Quiz Review 01',
              description:
                  'Silahkan kerjakan kuis ini dalam waktu 15 menit '
                  'sebagai penilaian pertama. Jangan lupa klik tombol submit '
                  'Answer setelah menjawab semua pertanyaan.',
              statusIcon: Icons.check_circle,
              statusColor: Colors.green,
              isChecked: _quizChecked,
              onCheckChanged: (bool? value) {
                setState(() {
                  _quizChecked = value ?? false;
                });
              },
            ),

            const SizedBox(height: 12),

            // Card Tugas
            buildItemCard(
              icon: Icons.assignment,
              title: 'Tugas 01 - UID Android Mobile Game',
              description:
                  'Buatlah desain tampilan (antarmuka) pada aplikasi mobile '
                  'game FPS (First Person Shooter) yang akan menjadi tugas '
                  'pada mata kuliah Pemrograman Aplikasi Permainan.',
              statusIcon: Icons.radio_button_unchecked,
              statusColor: Colors.grey,
              isChecked: _taskChecked,
              onCheckChanged: (bool? value) {
                setState(() {
                  _taskChecked = value ?? false;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItemCard({
    required IconData icon,
    required String title,
    required String description,
    required IconData statusIcon,
    required Color statusColor,
    required bool isChecked,
    required Function(bool?)? onCheckChanged,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon kiri
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.blue),
          ),

          const SizedBox(width: 12),

          // Konten tengah
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(fontSize: 13, height: 1.4),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          // Checkbox
          Checkbox(
            value: isChecked,
            onChanged: onCheckChanged,
            activeColor: Colors.green,
            checkColor: Colors.white,
          ),
        ],
      ),
    );
  }
}