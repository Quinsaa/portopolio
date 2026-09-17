import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('beranda'),
        backgroundColor: Colors.blue,
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

      body: SingleChildScrollView(
        child: Column(
          children: [

            // HEADER GRADIENT
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 40, bottom: 60),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF2196F3), Color(0xFF64B5F6)],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [

                  // FOTO PROFIL DENGAN RING PUTIH
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage('assets/image/1.jpg'),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // NAMA
                  const Text(
                    'Thoriq Muwahid',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 6),

                  // ROLE / BADGE
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Student  •  RPL',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // KARTU PERKENALAN (NAIK, OVERLAP DENGAN HEADER)
            Transform.translate(
              offset: const Offset(0, -35),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        children: const [
                          Icon(Icons.waving_hand, color: Colors.amber, size: 22),
                          SizedBox(width: 8),
                          Text(
                            'Perkenalan',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      const Text(
                        'Woy, kenalin gue Thoriq Muwahid! Sekarang lagi nimba ilmu '
                        'di jurusan Rekayasa Perangkat Lunak (RPL). Gue tuh emang '
                        'demen banget sama dunia development, dari bikin aplikasi '
                        'mobile sampe web, pokoknya kalo udah ngoding suka lupa waktu. '
                        'Selain itu gue juga anaknya kepo, seneng banget belajar hal '
                        'baru seputar teknologi biar makin update.\n\n'
                        'Nah, website ini sendiri gue bikin buat jadi portofolio '
                        'pribadi gue — tempat gue pamerin profil, skill, sama '
                        'project-project yang udah gue kerjain selama belajar RPL. '
                        'Di sini lo bisa liat perjalanan gue dari awal belajar RPL '
                        'sampe sekarang, mulai dari bahasa pemrograman yang gue '
                        'kuasain, tools yang sering gue pake sehari-hari, sampe '
                        'project-project kecil-kecilan yang udah gue rampungin. '
                        'Gue bikin website ini juga sekalian buat latihan biar makin '
                        'jago ngoding, jadi kalo ada yang kurang pas maklumin ye, '
                        'namanya juga masih proses belajar. Ke depannya gue pengen '
                        'terus ngasah skill di bidang RPL ini, baik dari sisi coding '
                        'maupun desain UI/UX, soalnya menurut gue dua-duanya sama '
                        'pentingnya buat bikin aplikasi yang enak dipake orang. Gue '
                        'juga percaya kalo belajar itu nggak ada abisnya, jadi tiap '
                        'ada teknologi atau framework baru yang muncul, gue selalu '
                        'usahain buat coba pelajarin dikit-dikit. Yuk langsung aja '
                        'explore, semoga betah mampir dan siapa tau ada yang tertarik '
                        'ngajak kolaborasi bareng gue!',
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.6,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.justify,
                      ),

                      const SizedBox(height: 18),
                      const Divider(height: 1),
                      const SizedBox(height: 14),

                      // INFO SINGKAT (LOKASI & SEKOLAH)
                      const _InfoRow(
                        icon: Icons.school,
                        label: 'Jurusan',
                        value: 'Rekayasa Perangkat Lunak (RPL)',
                      ),
                      const SizedBox(height: 10),
                      const _InfoRow(
                        icon: Icons.location_on,
                        label: 'Domisili',
                        value: 'Jakarta, Indonesia',
                      ),
                      const SizedBox(height: 10),
                      const _InfoRow(
                        icon: Icons.favorite,
                        label: 'Minat',
                        value: 'Mobile & Web Development',
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // TOMBOL QUICK ACCESS KE PROFIL, SKILL, PROJECT
            Transform.translate(
              offset: const Offset(0, -20),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: _QuickMenuButton(
                        icon: Icons.person,
                        label: 'Profil',
                        color: const Color(0xFF2196F3),
                        onTap: () => Navigator.pushNamed(context, '/profil'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _QuickMenuButton(
                        icon: Icons.code,
                        label: 'Skill',
                        color: const Color(0xFF00B894),
                        onTap: () => Navigator.pushNamed(context, '/skill'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _QuickMenuButton(
                        icon: Icons.folder,
                        label: 'Project',
                        color: const Color(0xFFFF9F43),
                        onTap: () => Navigator.pushNamed(context, '/project'),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// TOMBOL QUICK ACCESS (REUSABLE)
class _QuickMenuButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _QuickMenuButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 22),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// WIDGET BARIS INFO SINGKAT (REUSABLE)
class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: Colors.blue),
        const SizedBox(width: 10),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 13.5, color: Colors.black87),
              children: [
                TextSpan(
                  text: '$label: ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: value),
              ],
            ),
          ),
        ),
      ],
    );
  }
}