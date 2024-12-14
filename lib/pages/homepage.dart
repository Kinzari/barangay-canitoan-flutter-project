import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/brgyvideo.mp4')
      ..initialize().then((_) {
        setState(() {}); // Update the UI once the video is loaded
      });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the video player to free resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding around the content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Slideshow Section
            Container(
              height: 200,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12), // Rounded corners
                child: PageView(
                  children: [
                    Image.asset(
                      'assets/images/canitoanlogo.jpg',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
            // Welcome Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'WELCOME TO BARANGAY CANITOAN!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Barangay Canitoan is located in the 1st district of Cagayan de Oro City, Cagayan de Oro is also known as CDO and the City of Golden Friendship is a 1st class highly urbanized city in the region of Northern Mindanao, It is the capital of the province of Misamis Oriental where it is geographically situated but governed administratively independent from the provincial government, Cagayan de Oro also serves as the regional center and business hub of Northern Mindanao, Mindanao, Philippines.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Video Section with Controls
            if (_controller.value.isInitialized)
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                    VideoProgressIndicator(
                      _controller,
                      allowScrubbing: true,
                      colors: VideoProgressColors(
                        playedColor: Colors.purple,
                        bufferedColor: Colors.grey,
                        backgroundColor: Colors.black12,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(
                            _controller.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              if (_controller.value.isPlaying) {
                                _controller.pause();
                              } else {
                                _controller.play();
                              }
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.replay, color: Colors.black),
                          onPressed: () {
                            _controller.seekTo(Duration.zero);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )
            else
              const Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}
