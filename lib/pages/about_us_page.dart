import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  final List<Map<String, String>> developers = const [
    {
      'name': 'Jerimiah Exequiel Espartero',
      'role': 'Lead Developer',
      'image': 'assets/images/pfp/espartero.jpg',
      'description': 'Jerimiah is a Bachelor of Science in Information Technology student in PHINMA - Cagayan de Oro College that is passionate about learning Flutter and app development.'
    },
    {
      'name': 'Boss Lorenzo V. Zata',
      'role': 'UI/UX Designer',
      'image': 'assets/images/pfp/zata.png',
      'description': 'Boss Lorenzo a Bachelor of Science in Information Technology student in PHINMA - Cagayan de Oro College. A creative UI/UX designer with an eye for detail, dedicated to creating user-friendly designs.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'MEET THE DEVELOPERS',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: developers.length,
                itemBuilder: (context, index) {
                  final developer = developers[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Developer Image
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(developer['image']!),
                          ),
                          const SizedBox(height: 16),

                          // Developer Name and Role
                          Text(
                            developer['name']!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            developer['role']!,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Developer Description
                          Text(
                            developer['description']!,
                            style: const TextStyle(fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
