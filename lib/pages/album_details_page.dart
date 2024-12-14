import 'package:flutter/material.dart';
class AlbumDetailsPage extends StatelessWidget {
  final String title;
  final List<String> images;
  final bool isFullScreen;

  const AlbumDetailsPage({
    super.key,
    required this.title,
    required this.images,
    this.isFullScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 12, 231, 41),
        title: Text(title),
        centerTitle: true,
      ),
      body: isFullScreen && images.length == 2 && title == 'BARANGAY OFFICIALS'
          ? Column(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _showImageViewer(context, images, 0);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(images[0]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _showImageViewer(context, images, 1);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(images[1]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _showImageViewer(context, images, index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(images[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }

  void _showImageViewer(BuildContext context, List<String> images, int initialIndex) {
    showDialog(
      context: context,
      builder: (context) => _FullScreenImageViewer(
        images: images,
        initialIndex: initialIndex,
      ),
    );
  }
}

class _FullScreenImageViewer extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const _FullScreenImageViewer({
    required this.images,
    required this.initialIndex,
  });

  @override
  State<_FullScreenImageViewer> createState() => _FullScreenImageViewerState();
}

class _FullScreenImageViewerState extends State<_FullScreenImageViewer> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

  void _nextImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % widget.images.length;
    });
  }

  void _previousImage() {
    setState(() {
      currentIndex = (currentIndex - 1 + widget.images.length) % widget.images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black,
      insetPadding: EdgeInsets.zero,
      child: Stack(
        children: [
          // Display Current Image
          Center(
            child: Image.asset(
              widget.images[currentIndex],
              fit: BoxFit.contain,
            ),
          ),
          // Close Button (Top-Right)
          Positioned(
            top: 20,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          // Left Arrow with Shadow
          if (widget.images.length > 1)
            Positioned(
              left: 10,
              top: MediaQuery.of(context).size.height / 2 - 24,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 40,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                onPressed: _previousImage,
              ),
            ),
          // Right Arrow with Shadow
          if (widget.images.length > 1)
            Positioned(
              right: 10,
              top: MediaQuery.of(context).size.height / 2 - 24,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 40,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                onPressed: _nextImage,
              ),
            ),
        ],
      ),
    );
  }
}
