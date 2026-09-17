import 'package:flutter/material.dart';

class about extends StatelessWidget {
  const about({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: const Placeholder(),

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