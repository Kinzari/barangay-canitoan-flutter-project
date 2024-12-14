import 'package:flutter/material.dart';
import 'album_details_page.dart';

class GalleryPage extends StatelessWidget {
  GalleryPage({super.key});

  final List<Map<String, dynamic>> albums = [
    {
      'title': 'BARANGAY OFFICIALS',
      'cover': 'assets/images/gallery/brgyoff.jpg',
      'images': [
        'assets/images/gallery/brgyofficials/image1.png',
        'assets/images/gallery/brgyofficials/image2.png',
      ],
    },
    {
      'title': 'BARANGAY EVENTS',
      'cover': 'assets/images/gallery/commev.jpg',
      'images': [
        'assets/images/gallery/community/image1.jpg',
        'assets/images/gallery/community/image2.jpg',
        'assets/images/gallery/community/image3.jpg',
        'assets/images/gallery/community/image4.jpg',
        'assets/images/gallery/community/image5.jpg',
        'assets/images/gallery/community/image6.jpg',
        'assets/images/gallery/community/image7.jpg',
        'assets/images/gallery/community/image8.jpg',
        'assets/images/gallery/community/image9.jpg',
        'assets/images/gallery/community/image10.jpg',
        'assets/images/gallery/community/image11.jpg',
      ],
    },
    {
      'title': 'BARANGAY PROJECTS',
      'cover': 'assets/images/gallery/location.png',
      'images': [
        'assets/images/gallery/brgypro/image1.jpg',
        'assets/images/gallery/brgypro/image2.jpg',
        'assets/images/gallery/brgypro/image3.jpg',
        'assets/images/gallery/brgypro/image4.jpg',
        'assets/images/gallery/brgypro/image5.jpg',
        'assets/images/gallery/brgypro/image6.jpg',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, // One album per row
            mainAxisSpacing: 16,
            childAspectRatio: 3 / 2,
          ),
          itemCount: albums.length,
          itemBuilder: (context, index) {
            final album = albums[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AlbumDetailsPage(
                      title: album['title'],
                      images: album['images'],
                      isFullScreen: album['title'] ==
                          'BARANGAY OFFICIALS', // Pass isFullScreen
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage(album['cover']),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.black.withOpacity(0.5),
                    child: Text(
                      album['title'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
