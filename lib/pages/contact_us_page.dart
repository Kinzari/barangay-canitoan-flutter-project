import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  final TextEditingController _controller = TextEditingController();

  void _handleSubmit() {
    // Clear the input field
    _controller.clear();

    // Show a Snackbar at the bottom right
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Form Submitted'),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green.shade400,
        margin: const EdgeInsets.only(bottom: 16, right: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Barangay Logo
              const CircleAvatar(
                radius: 90,
                backgroundImage: AssetImage('assets/images/brgylogo.png'),
              ),
              const SizedBox(height: 52), // Increased spacing to move input lower

              // Input Field and Submit Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _controller,
                      maxLines: 5, // Make the input box larger
                      decoration: InputDecoration(
                        hintText: 'Enter your message...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.black), // Black border color
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _handleSubmit, // Handle submit logic here
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color.fromARGB(255, 15, 143, 32), // Custom green text color
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                      ),
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 52), // Increased spacing to move contact info lower

              // Contact Information
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ListTile(
                    leading: Icon(Icons.email, color: Colors.purple),
                    title: Text('barangaycanitoanofficial@gmail.com'),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone, color: Colors.green),
                    title: Text('0965 261 5484'),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_pin, color: Colors.red),
                    title: Text('Zone 2, Barangay Canitoan, Cagayan de Oro, Philippines, 9000'),
                  ),
                ],
              ),
              const SizedBox(height: 62), // Increased spacing for better layout

              // Facebook Link
              GestureDetector(
                onTap: () async {
                  const url =
                      'https://web.facebook.com/profile.php?id=61553591918176&sk=photos&_rdc=1&_rdr';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  }
                },
                child: Column(
                  children: [
                    const Icon(Icons.facebook, color: Colors.blue, size: 50),
                    const SizedBox(height: 8),
                    Text(
                      'Visit us on Facebook',
                      style: TextStyle(
                        color: Colors.blue.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6), // Space below the Facebook link
            ],
          ),
        ),
      ),
    );
  }
}
