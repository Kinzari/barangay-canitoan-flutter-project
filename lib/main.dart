import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/homepage.dart';
import 'pages/history_page.dart';
import 'pages/gallery_page.dart';
import 'pages/contact_us_page.dart';
import 'pages/about_us_page.dart';
import 'pages/album_details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme:
            GoogleFonts.montserratTextTheme(), // Apply Montserrat globally
        scaffoldBackgroundColor: const Color(0xFFF3F4F6),
        primaryColor: const Color.fromARGB(255, 12, 231, 41),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 12, 231, 41),
          iconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: GoogleFonts.montserrat(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: const Color.fromARGB(255, 12, 231, 41),
          unselectedItemColor: Colors.grey,
        ),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  bool _isViewingAlbum = false;
  String? _currentAlbumTitle;
  List<String>? _currentAlbumImages;

  final List<Widget> _pages = [
    const Homepage(),
    HistoryPage(),
    GalleryPage(),
    const ContactUsPage(),
    const AboutUsPage(),
  ];

  final List<String> _pageTitles = [
    'BARANGAY CANITOAN',
    'BARANGAY HISTORY',
    'BARANGAY ALBUM',
    'CONTACT US',
    'ABOUT US',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _isViewingAlbum = false;
      _selectedIndex = index;
    });
  }

  void _viewAlbum(String title, List<String> images) {
    setState(() {
      _isViewingAlbum = true;
      _currentAlbumTitle = title;
      _currentAlbumImages = images;
    });
  }

  void _closeAlbum() {
    setState(() {
      _isViewingAlbum = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isViewingAlbum ? _currentAlbumTitle! : _pageTitles[_selectedIndex],
        ),
        centerTitle: true,
        leading: _isViewingAlbum
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: _closeAlbum,
              )
            : PopupMenuButton<int>(
                icon: const Icon(Icons.menu),
                onSelected: (index) {
                  setState(() {
                    _isViewingAlbum = false;
                    _selectedIndex = index;
                  });
                },
                itemBuilder: (context) => List.generate(_pages.length, (index) {
                  return PopupMenuItem(
                    value: index,
                    child: Text(
                      _pageTitles[index],
                      style: GoogleFonts.montserrat(),
                    ),
                  );
                }),
              ),
      ),
      body: _isViewingAlbum
          ? AlbumDetailsPage(
              title: _currentAlbumTitle!,
              images: _currentAlbumImages!,
            )
          : _pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 55, // Set the desired height for the BottomNavigationBar
        decoration: BoxDecoration(
          color: Colors.black, // Background color
          border: Border(
            top: BorderSide(
                color: Colors.grey.withOpacity(0.2)), // Optional border
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color.fromARGB(255, 15, 143, 32),
          unselectedItemColor: Colors.grey,
          iconSize: 20, // Make icons smaller
          showSelectedLabels: false, // Remove text labels
          showUnselectedLabels: false, // Remove text labels
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.photo), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.phone), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.info), label: ''),
          ],
        ),
      ),
    );
  }
}
