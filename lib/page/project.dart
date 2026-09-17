import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class project extends StatelessWidget {
  const project({super.key});

  final List<Map<String, dynamic>> daftarProject = const [
    {
      'judul': 'Aplikasi Portofolio Diri',
      'deskripsi':
          'Aplikasi mobile buat nampilin profil, skill, dan project pribadi. '
          'Dibuat pakai Flutter, ada navigasi drawer dan halaman terpisah.',
      'teknologi': ['Flutter', 'Dart'],
      'github': 'github.com/Quinsaa',
    },
    {
      'judul': 'Website Sekolah (Tugas RPL)',
      'deskripsi':
          'Website sederhana buat kebutuhan tugas sekolah, nampilin info '
          'jurusan, jadwal, dan pengumuman.',
      'teknologi': ['HTML', 'CSS', 'PHP'],
      'github': 'github.com/Quinsaa',
    },
    {
      'judul': 'Sistem Absensi Sederhana',
      'deskripsi':
          'Aplikasi buat latihan CRUD, input data siswa dan absensi harian, '
          'tersimpan di database MySQL.',
      'teknologi': ['PHP', 'MySQL'],
      'github': 'github.com/Quinsaa',
    },
  ];

  Future<void> _bukaGithub(String url) async {
    final uri = Uri.parse('https://$url');
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: const Text('Project'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: daftarProject.length,
        itemBuilder: (context, i) {
          final item = daftarProject[i];
          return Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: _ProjectCard(
              judul: item['judul'],
              deskripsi: item['deskripsi'],
              teknologi: item['teknologi'],
              onTapGithub: () => _bukaGithub(item['github']),
            ),
          );
        },
      ),

      drawer: Drawer(
        width: 305,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),

        child: ListView(
          padding: EdgeInsets.zero,
          children: [

            // HEADER DRAWER
            Container(
              height: 160,
              padding: const EdgeInsets.only(
                left: 16,
                top: 16,
              ),
              decoration: const BoxDecoration(
                color: Color(0xFF2196F3),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                ),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // FOTO
                  ClipOval(
                    child: Image.asset(
                      'assets/image/1.jpg',
                      width: 72,
                      height: 72,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // NAMA
                  const Text(
                    'Thoriq Muwahid',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  // STATUS
                  const Text(
                    'Student | RPL',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            // HOME
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 18,
              ),
              leading: const Icon(
                Icons.home,
                color: Colors.black54,
                size: 22,
              ),
              title: const Text(
                'Beranda',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/home');
              },
            ),

            // PROFIL
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 18,
              ),
              leading: const Icon(
                Icons.person,
                color: Colors.black54,
                size: 22,
              ),
              title: const Text(
                'Profil',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/profil');
              },
            ),

            // SKILL
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 18,
              ),
              leading: const Icon(
                Icons.code,
                color: Colors.black54,
                size: 22,
              ),
              title: const Text(
                'Skill',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/skill');
              },
            ),

            // PROJECT
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 18,
              ),
              leading: const Icon(
                Icons.folder,
                color: Colors.black54,
                size: 22,
              ),
              title: const Text(
                'Project',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/project');
              },
            ),

            // ABOUT
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 18,
              ),
              leading: const Icon(
                Icons.info,
                color: Colors.black54,
                size: 22,
              ),
              title: const Text(
                'About',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
          ],
        ),
      ),
    );
  }
}

// KARTU SATU PROJECT
class _ProjectCard extends StatelessWidget {
  final String judul;
  final String deskripsi;
  final List<String> teknologi;
  final VoidCallback onTapGithub;

  const _ProjectCard({
    required this.judul,
    required this.deskripsi,
    required this.teknologi,
    required this.onTapGithub,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.folder_open, color: Colors.blue, size: 20),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  judul,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            deskripsi,
            style: TextStyle(fontSize: 13, height: 1.5, color: Colors.grey.shade700),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: teknologi.map((t) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  t,
                  style: const TextStyle(fontSize: 11, color: Colors.blue, fontWeight: FontWeight.w500),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 12),
          InkWell(
            onTap: onTapGithub,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.code, size: 15, color: Colors.blue.shade700),
                const SizedBox(width: 5),
                Text(
                  'Lihat di GitHub',
                  style: TextStyle(
                    fontSize: 12.5,
                    color: Colors.blue.shade700,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
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