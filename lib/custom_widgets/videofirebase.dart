// import 'package:chewie/chewie.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class YourWidget extends StatefulWidget {
//   @override
//   _YourWidgetState createState() => _YourWidgetState();
// }

// class _YourWidgetState extends State<YourWidget> {
//   late VideoPlayerController videoPlayerController;
//   late ChewieController chewieController;

//   @override
//   void initState() {
//     super.initState();
//     initializePlayer();
//   }

//   Future<void> initializePlayer() async {
//     String url =
//         'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4';

//     // Use VideoPlayerController.network for network URLs
//     // ignore: deprecated_member_use
//     videoPlayerController = VideoPlayerController.network(
//       url,
//     );

//     await videoPlayerController.initialize();

//     chewieController = ChewieController(
//       videoPlayerController: videoPlayerController,
//       autoPlay: true,
//       looping: true,
//       materialProgressColors: ChewieProgressColors(
//         playedColor: Colors.red,
//         handleColor: Colors.cyanAccent,
//         backgroundColor: Colors.yellow,
//         bufferedColor: Colors.lightGreen,
//       ),
//       placeholder: Container(
//         color: Colors.redAccent,
//       ),
//       autoInitialize: true,
//     );

//     // This line is optional but might be useful to update the UI
//     if (mounted) {
//       setState(() {});
//     }
//   }

//   @override
//   void dispose() {
//     videoPlayerController.dispose();
//     chewieController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Check if the controller has been initialized
//     if (!videoPlayerController.value.isInitialized) {
//       return CircularProgressIndicator();
//     }
//     return Chewie(controller: chewieController);
//   }
// }
