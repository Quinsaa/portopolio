import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Profil extends StatelessWidget {
  const Profil({super.key});

  // buka aplikasi email
  Future<void> _bukaEmail(String email) async {
    final uri = Uri(scheme: 'mailto', path: email);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  // buka profil instagram
  Future<void> _bukaInstagram(String username) async {
    final appUri = Uri.parse('instagram://user?username=$username');
    final webUri = Uri.parse('https://instagram.com/$username');

    if (await canLaunchUrl(appUri)) {
      await launchUrl(appUri);
    } else {
      await launchUrl(webUri, mode: LaunchMode.externalApplication);
    }
  }

  // buka github
  Future<void> _bukaGithub(String url) async {
    final uri = Uri.parse('https://$url');
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('profil'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // FOTO & NAMA
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/image/1.jpg'),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Thoriq Muwahid',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'Siswa Rekayasa Perangkat Lunak (RPL)',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // BIODATA
            const _SectionCard(
              icon: Icons.badge,
              title: 'Biodata',
              children: [
                _InfoLine(label: 'Nama', value: 'Thoriq Muwahid'),
                _InfoLine(label: 'Domisili', value: 'Jakarta'),
                _InfoLine(label: 'Jurusan', value: 'RPL'),
                _InfoLine(label: 'Status', value: 'Pelajar Aktif'),
              ],
            ),

            const SizedBox(height: 14),

            // TENTANG SAYA
            const _SectionCard(
              icon: Icons.person_outline,
              title: 'Tentang Saya',
              children: [
                Text(
                  'Siswa jurusan RPL yang tertarik di bidang pengembangan '
                  'aplikasi mobile dan web, senang belajar hal baru seputar '
                  'teknologi dan pemrograman.',
                  style: TextStyle(fontSize: 13.5, height: 1.5),
                ),
              ],
            ),

            const SizedBox(height: 14),

            // PENDIDIKAN
            const _SectionCard(
              icon: Icons.school,
              title: 'Pendidikan',
              children: [
                _InfoLine(label: 'SMK', value: 'RPL (2026 - Sekarang)'),
                _InfoLine(label: 'SMP', value: '2022 - 2025'),
                _InfoLine(label: 'SD', value: '2016 - 2022'),
              ],
            ),

            const SizedBox(height: 14),

            // KONTAK (email & instagram bisa dipencet)
            _SectionCard(
              icon: Icons.alternate_email,
              title: 'Kontak',
              children: [
                _InfoLineTappable(
                  label: 'Email',
                  value: 'dodiaja1981@gmail.com',
                  icon: Icons.email_outlined,
                  onTap: () => _bukaEmail('dodiaja1981@gmail.com'),
                ),
                _InfoLineTappable(
                  label: 'GitHub',
                  value: 'github.com/Quinsaa',
                  icon: Icons.code,
                  onTap: () => _bukaGithub('github.com/Quinsaa'),
                ),
                _InfoLineTappable(
                  label: 'Instagram',
                  value: '@toyykkk',
                  icon: Icons.camera_alt_outlined,
                  onTap: () => _bukaInstagram('toyykkk'),
                ),
              ],
            ),
          ],
        ),
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

// KARTU SECTION 
class _SectionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<Widget> children;

  const _SectionCard({
    required this.icon,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: Colors.blue),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ...children,
        ],
      ),
    );
  }
}

// BARIS LABEL BIASA (nggak bisa dipencet)
class _InfoLine extends StatelessWidget {
  final String label;
  final String value;

  const _InfoLine({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90,
            child: Text(
              label,
              style: TextStyle(fontSize: 13.5, color: Colors.grey.shade600),
            ),
          ),
          const Text(': ', style: TextStyle(fontSize: 13.5)),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

// BARIS LABEL YANG BISA DIPENCET (buat email, github, instagram)
class _InfoLineTappable extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final VoidCallback onTap;

  const _InfoLineTappable({
    required this.label,
    required this.value,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 90,
              child: Text(
                label,
                style: TextStyle(fontSize: 13.5, color: Colors.grey.shade600),
              ),
            ),
            const Text(': ', style: TextStyle(fontSize: 13.5)),
            Expanded(
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Icon(icon, size: 15, color: Colors.blue.shade300),
          ],
        ),
      ),
    );
  }
}