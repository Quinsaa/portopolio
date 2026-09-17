import 'package:flutter/material.dart';

class skill extends StatelessWidget {
  const skill({super.key});

  final List<Map<String, dynamic>> bahasaPemrograman = const [
    {'nama': 'Dart / Flutter', 'persen': 0.6, 'icon': Icons.flutter_dash},
    {'nama': 'HTML & CSS', 'persen': 0.8, 'icon': Icons.html},
    {'nama': 'PHP', 'persen': 0.3, 'icon': Icons.php},
    {'nama': 'C#', 'persen': 0.4, 'icon': Icons.data_object},
  ];

  final List<Map<String, dynamic>> toolsTeknologi = const [
    {'nama': 'MySQL', 'persen': 0.6, 'icon': Icons.storage},
    {'nama': 'Git & GitHub', 'persen': 0.5, 'icon': Icons.merge_type},
    {'nama': 'Figma', 'persen': 0.5, 'icon': Icons.design_services},
  ];

  final List<Map<String, dynamic>> softSkills = const [
    {'nama': 'Kerja Tim', 'icon': Icons.groups},
    {'nama': 'Komunikasi', 'icon': Icons.chat_bubble_outline},
    {'nama': 'Manajemen Waktu', 'icon': Icons.schedule},
    {'nama': 'Problem Solving', 'icon': Icons.lightbulb_outline},
    {'nama': 'Mau Belajar Hal Baru', 'icon': Icons.auto_awesome},
  ];

  @override
  Widget build(BuildContext context) {
    // gabungin semua skill teknis buat itung rata-rata
    final semuaSkillTeknis = [...bahasaPemrograman, ...toolsTeknologi];
    final rataRata = semuaSkillTeknis
            .map((e) => e['persen'] as double)
            .reduce((a, b) => a + b) /
        semuaSkillTeknis.length;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: const Text('Skill'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      drawer: buildDrawer(context),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _ringkasan(semuaSkillTeknis.length, softSkills.length, rataRata),
          const SizedBox(height: 16),
          _kartuKategori('Bahasa Pemrograman', Icons.code, Colors.blue, bahasaPemrograman),
          const SizedBox(height: 14),
          _kartuKategori('Tools & Teknologi', Icons.build, Colors.teal, toolsTeknologi),
          const SizedBox(height: 14),
          _kartuSoftSkill(),
        ],
      ),
    );
  }

  // baris ringkasan angka di paling atas
  Widget _ringkasan(int jumlahTeknis, int jumlahSoft, double rataRata) {
    return Row(
      children: [
        Expanded(child: _kotakRingkasan('$jumlahTeknis', 'Skill Teknis', Icons.code, Colors.blue)),
        const SizedBox(width: 10),
        Expanded(child: _kotakRingkasan('$jumlahSoft', 'Soft Skill', Icons.emoji_people, Colors.orange)),
        const SizedBox(width: 10),
        Expanded(child: _kotakRingkasan('${(rataRata * 100).round()}%', 'Rata-rata', Icons.trending_up, Colors.green)),
      ],
    );
  }

  Widget _kotakRingkasan(String angka, String label, IconData icon, Color warna) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 18, color: warna),
          const SizedBox(height: 6),
          Text(angka, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 2),
          Text(label, style: TextStyle(fontSize: 10.5, color: Colors.grey.shade600), textAlign: TextAlign.center),
        ],
      ),
    );
  }

  // kartu buat tiap kategori skill teknis
  Widget _kartuKategori(String judul, IconData iconJudul, Color warna, List<Map<String, dynamic>> daftar) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(iconJudul, size: 18, color: warna),
              const SizedBox(width: 8),
              Text(judul, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 14),
          for (var item in daftar) ...[
            _barSkill(item, warna),
            if (item != daftar.last) const SizedBox(height: 14),
          ],
        ],
      ),
    );
  }

  // satu baris skill: icon + nama + persen + progress bar
  Widget _barSkill(Map<String, dynamic> item, Color warna) {
    final persen = ((item['persen'] as double) * 100).round();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: warna.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(item['icon'], size: 15, color: warna),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item['nama'], style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w600)),
                  Text(
                    '$persen%',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: warna),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: LinearProgressIndicator(
                  value: item['persen'],
                  minHeight: 7,
                  backgroundColor: warna.withOpacity(0.12),
                  valueColor: AlwaysStoppedAnimation(warna),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // kartu soft skill, tiap item ada icon kecil di depan
  Widget _kartuSoftSkill() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.emoji_people, size: 18, color: Colors.orange),
              const SizedBox(width: 8),
              const Text('Soft Skill', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 10,
            children: softSkills.map((item) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.orange.shade100),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(item['icon'], size: 14, color: Colors.orange.shade700),
                    const SizedBox(width: 6),
                    Text(
                      item['nama'],
                      style: TextStyle(fontSize: 12.5, color: Colors.orange.shade800, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // drawer navigasi
  Widget buildDrawer(BuildContext context) {
    return Drawer(
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
          Container(
            height: 160,
            padding: const EdgeInsets.only(left: 16, top: 16),
            decoration: const BoxDecoration(
              color: Color(0xFF2196F3),
              borderRadius: BorderRadius.only(topRight: Radius.circular(15)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/image/1.jpg',
                    width: 72,
                    height: 72,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Thoriq Muwahid',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text('Student | RPL', style: TextStyle(color: Colors.white, fontSize: 14)),
              ],
            ),
          ),

          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 18),
            leading: const Icon(Icons.home, color: Colors.black54, size: 22),
            title: const Text('Beranda', style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 18),
            leading: const Icon(Icons.person, color: Colors.black54, size: 22),
            title: const Text('Profil', style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/profil');
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 18),
            leading: const Icon(Icons.code, color: Colors.black54, size: 22),
            title: const Text('Skill', style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/skill');
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 18),
            leading: const Icon(Icons.folder, color: Colors.black54, size: 22),
            title: const Text('Project', style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/project');
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 18),
            leading: const Icon(Icons.info, color: Colors.black54, size: 22),
            title: const Text('About', style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/about');
            },
          ),
        ],
      ),
    );
  }
}