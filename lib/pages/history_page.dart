import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  final String historyDescription = '''
The name "Canitoan" was taken from the marriage of two childless couples from the Northern and Southern parts of the place.

According to the old folks of the place, long before the place was inhabited. In the Northern part of the place, there lived a childless couple who fervently prayed to their Bathala that they would be blessed with a child. Not long after, their prayer was answered, and they were blessed with a son whom they called "CANIT."

On the Southern part of the place, another childless couple prayed the same to their Bathala, and they offered rituals for their wish of a child. Again, their wish was granted by having a daughter whom they called "TAAN."

Years and years had passed until one day, Canit and Taan met and were attracted to each other. Not long after their meeting, the two got married, which marked the history of how Canitoan got its name.

The union of the names of "Canit and Taan" gave rise to the name "CANITOAN," which is now officially adopted by the Local Officials of Barangay Canitoan.
''';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            const Text(
              'A GLIMPSE INTO THE PAST',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Discover the origins of Barangay Canitoan, from its cultural roots to its modern identity.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 20),

            // Story Section
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'THE STORY OF CANITOAN',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    historyDescription,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Historical Highlight Section
            const Text(
              'HISTORICAL HIGHLIGHTS',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Card(
              margin: const EdgeInsets.only(bottom: 16),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(Icons.event, color: const Color.fromARGB(255, 15, 143, 32)),
                title: const Text('1912'),
                subtitle:
                    const Text('Barangay Canitoan was officially established.'),
              ),
            ),
            Card(
              margin: const EdgeInsets.only(bottom: 16),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(Icons.flag, color:const Color.fromARGB(255, 15, 143, 32)),
                title: const Text('Local Identity'),
                subtitle: const Text(
                    'The unique cultural blend and historical events shaped Canitoan.'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
