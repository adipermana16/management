import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0;

  // Content for each section
  final List<Widget> _profileSections = <Widget>[
    const AboutSection(),
    const KelasSection(),
    const EditProfilSection(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil User'),
        backgroundColor: const Color(0xFFEA6262),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          // Profile Header
          const ProfileHeader(),
          const SizedBox(height: 20),
          
          // Section Selector
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                _buildSectionButton(0, 'About'),
                _buildSectionButton(1, 'Kelas'),
                _buildSectionButton(2, 'Edit Profil'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          
          // Content Area
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _profileSections.elementAt(_selectedIndex),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionButton(int index, String title) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          decoration: BoxDecoration(
            color: _selectedIndex == index 
                ? const Color(0xFFEA6262) 
                : Colors.grey[300],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: _selectedIndex == index 
                  ? Colors.white 
                  : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        color: Color(0xFFEA6262),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.person,
              size: 40,
              color: Color(0xFFEA6262),
            ),
          ),
          const SizedBox(width: 20),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nama User',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'user@example.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tentang User',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15),
          Text(
            'Ini adalah halaman tentang user. Di sini Anda dapat menampilkan informasi detail tentang user seperti bio, alamat, tanggal lahir, dan informasi lainnya.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Informasi Tambahan:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Tanggal Bergabung'),
            subtitle: Text('1 Januari 2023'),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Alamat'),
            subtitle: Text('Jakarta, Indonesia'),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Nomor Telepon'),
            subtitle: Text('+62 812 3456 7890'),
          ),
        ],
      ),
    );
  }
}

class KelasSection extends StatelessWidget {
  const KelasSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Kelas yang Diikuti',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'Berikut adalah daftar kelas yang sedang Anda ikuti:',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.only(bottom: 10),
                child: ListTile(
                  leading: const Icon(
                    Icons.class_,
                    color: Color(0xFFEA6262),
                  ),
                  title: Text('Kelas ${index + 1}'),
                  subtitle: const Text('Deskripsi singkat kelas'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class EditProfilSection extends StatefulWidget {
  const EditProfilSection({super.key});

  @override
  State<EditProfilSection> createState() => _EditProfilSectionState();
}

class _EditProfilSectionState extends State<EditProfilSection> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize with sample data
    _nameController.text = 'Nama User';
    _emailController.text = 'user@example.com';
    _phoneController.text = '+62 812 3456 7890';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Edit Profil',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nama Lengkap',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nama tidak boleh kosong';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email tidak boleh kosong';
                }
                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Format email tidak valid';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Nomor Telepon',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Save profile logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Profil berhasil diperbarui'),
                        backgroundColor: Color(0xFFEA6262),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEA6262),
                ),
                child: const Text(
                  'Simpan Perubahan',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}