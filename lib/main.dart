import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Video Player',
      theme: ThemeData(primarySwatch: Colors.blue),
      home:  const VideoPlayerScreen(),
    );
  }
}


class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.asset(
          // "assets/video/1MB.mp4",
          "assets/video/vid1.mp4",
   
//       Uri.parse(
//         "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4",
// // "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"  
//     ),
      // 'assets/video/vid1.mp4',
      // formatHint: VideoFormat.other, // Ensure fallback for unsupported formats.
        
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: false),
    )..initialize().catchError((error) {
            debugPrint("Video initialization errorrrrr: $error");
          }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Player"),
      ),
      body: Center(
        child: AspectRatio(
            aspectRatio: 16 / 10,
            child: FlickVideoPlayer(flickManager: flickManager)),
      ),
    );
  }
}









// Flutter Packages
// import 'package:flutter/material.dart';

// // This Package
// import 'package:cached_video_player_plus/cached_video_player_plus.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Cached Video Player Plus Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Cached Video Player Plus Example'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late CachedVideoPlayerPlusController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = CachedVideoPlayerPlusController.asset(
//       'assets/video/vid3.mp4',
//       // Uri.parse(
//       //   'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
//       // ),
//       // httpHeaders: {
//       //   'Connection': 'keep-alive',
//       // },
//       invalidateCacheIfOlderThan: const Duration(minutes: 10),
//     )..initialize().then((value) async {
//         await controller.setLooping(true);
//         controller.play();
//         setState(() {});
//       });
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: controller.value.isInitialized
//             ? AspectRatio(
//                 aspectRatio: controller.value.aspectRatio,
//                 child: CachedVideoPlayerPlus(controller),
//               )
//             : const CircularProgressIndicator.adaptive(),
//       ),
//     );
//   }
// }






























// import 'package:flick_video_player/flick_video_player.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';











// class VideoPlayerScreen extends StatefulWidget {
//   const VideoPlayerScreen({Key? key}) : super(key: key);

//   @override
//   State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
// }

// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   late VlcPlayerController _vlcController;

//   @override
//   void initState() {
//     super.initState();
//     _vlcController = VlcPlayerController.asset(
//       'assets/video/vid1.mp4',
//       // 'https://flutter.github.io/assets-for-api-docs/assets/videos/big_buck_bunny.mp4',
//       hwAcc: HwAcc.full, // Hardware acceleration
//       autoPlay: true,
//     );
//   }

//   @override
//   void dispose() {
//     _vlcController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text('Video Player'),
//         backgroundColor: Colors.black,
//       ),
//       body: Center(
//         child: VlcPlayer(
//           controller: _vlcController,
//           aspectRatio: 16 / 9,
//           placeholder: const Center(child: CircularProgressIndicator()),
//         ),
//       ),
//     );
//   }
// }


// working on vivo 




// class _MyHomePageState extends State<MyHomePage> {
//   late VideoPlayerController videoPlayerController;
//   late CustomVideoPlayerController _customVideoPlayerController;

//   String videoUrl =
//       "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";

//   @override
//   void initState() {
//     super.initState();
//     videoPlayerController = VideoPlayerController.network(videoUrl)
//       ..initialize().then((value) => setState(() {}));
//     _customVideoPlayerController = CustomVideoPlayerController(
//       context: context,
//       videoPlayerController: videoPlayerController,
//     );
//   }

//   @override
//   void dispose() {
//     _customVideoPlayerController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: SafeArea(
//         child: CustomVideoPlayer(
//             customVideoPlayerController: _customVideoPlayerController),
//       ),
//     );
//   }
// }
















// class VideoPlayerScreen extends StatefulWidget {
//   const VideoPlayerScreen({Key? key}) : super(key: key);

//   @override
//   State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
// }

// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   late VideoPlayerController _controller;
//   bool _isControlsVisible = true; // Toggle for video controls visibility
//   bool _isLoading = true; // Track video loading status

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.networkUrl(Uri.parse(
//       'https://flutter.github.io/assets-for-api-docs/assets/videos/big_buck_bunny.mp4',
      

//     ))
//       ..initialize().then((_) {
//         if (mounted) {
//           setState(() {
//             _isLoading = false;
//           });
//         }
//       }).catchError((error) {
//         debugPrint("Error initializing video: $error");
//       });

//     _controller.addListener(() {
//       if (mounted) {
//         setState(() {
//           // Updates UI when the video position or state changes
//         });
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   // Format video duration into a readable string
//   String _formatDuration(Duration duration) {
//     return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text('Video Player'),
//         backgroundColor: Colors.black,
//       ),
//       body: Center(
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             // Video Player
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   _isControlsVisible = !_isControlsVisible;
//                 });
//               },
//               child: _isLoading
//                   ? const Center(child: CircularProgressIndicator()) // Loading indicator
//                   :AspectRatio(
//   aspectRatio: _controller.value.aspectRatio,
//   child: VideoPlayer(_controller),
// )
//             ),

//             // Video Name
//             if (_isControlsVisible)
//               Positioned(
//                 top: 20,
//                 child: Text(
//                   "Sample Video",
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),

//             // Video Controls (Bottom)
//             if (_isControlsVisible)
//               Positioned(
//                 bottom: 50,
//                 left: 0,
//                 right: 0,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     // Video Progress Indicator
//                     VideoProgressIndicator(
//                       _controller,
//                       allowScrubbing: true,
//                       colors: const VideoProgressColors(
//                         playedColor: Colors.red,
//                         bufferedColor: Colors.grey,
//                         backgroundColor: Colors.white,
//                       ),
//                     ),
//                     const SizedBox(height: 10),

//                     // Play/Pause and Speed Controls
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         // Play/Pause Button
//                         IconButton(
//                           icon: Icon(
//                             _controller.value.isPlaying
//                                 ? Icons.pause
//                                 : Icons.play_arrow,
//                             color: Colors.white,
//                             size: 30,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               _controller.value.isPlaying
//                                   ? _controller.pause()
//                                   : _controller.play();
//                             });
//                           },
//                         ),

//                         // Current Position / Duration
//                         Text(
//                           '${_formatDuration(_controller.value.position)} / ${_formatDuration(_controller.value.duration)}',
//                           style: const TextStyle(color: Colors.white),
//                         ),
//                         const SizedBox(width: 20),

//                         // Playback Speed Toggle
//                         IconButton(
//                           icon: const Icon(Icons.speed, color: Colors.white, size: 30),
//                           onPressed: () {
//                             setState(() {
//                               double newSpeed = _controller.value.playbackSpeed == 1.0 ? 1.5 : 1.0;
//                               _controller.setPlaybackSpeed(newSpeed);
//                             });
//                           },
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
//}

// class VideoPlayerScreen extends StatefulWidget {
//   const VideoPlayerScreen({Key? key}) : super(key: key);

//   @override
//   State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
// }

// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   late VideoPlayerController _controller;
//   bool _isControlsVisible = true;
//   late Duration _currentPosition = Duration.zero;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.networkUrl(
//       Uri.parse(
//         'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
//       ),
//       videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true, allowBackgroundPlayback: false),
//     )
//       // _controller = VideoPlayerController.network(
//       //   'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
//       // )
//       ..initialize().then((_) {
//         if (mounted) {
//           setState(() {});
//         }
//       })
//       ..addListener(_videoListener);
//   }

//   void _videoListener() {
//     if (mounted) {
//       setState(() {
//         _currentPosition = _controller.value.position;
//             print('Error: ${_controller.value.errorDescription}');

//       });
    
//     }
//         print('Error: ${_controller.value.errorDescription}');

//   }

//   @override
//   void dispose() {
//     _controller.removeListener(_videoListener); // Clean up listener
//     _controller.dispose(); // Dispose of controller
//     super.dispose();
//   }

//   String _formatDuration(Duration duration) {
//     return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
//   }

//   void _togglePlayPause() {
//     setState(() {
//       _controller.value.isPlaying ? _controller.pause() : _controller.play();
//     });
//   }

//   void _toggleSpeed() {
//     setState(() {
//       _controller.setPlaybackSpeed(
//         _controller.value.playbackSpeed == 1.0 ? 1.5 : 1.0,
//       );
//     });
//   }

//   @override
//  Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: const Text('Video Player'),
//     ),
//     body: Center(
//       child: _controller.value.isInitialized
//           ? Stack(
//               alignment: Alignment.center,
//               children: [
//                 AspectRatio(
//                   aspectRatio: _controller.value.aspectRatio,
//                   child: VideoPlayer(_controller),
//                 ),
//                 if (_isControlsVisible)
//                   Positioned(
//                     bottom: 50,
//                     child: Column(
//                       children: [
//                         VideoProgressIndicator(
//                           _controller,
//                           allowScrubbing: true,
//                           colors: VideoProgressColors(
//                             playedColor: Colors.red,
//                             bufferedColor: Colors.grey,
//                             backgroundColor: Colors.white,
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             IconButton(
//                               icon: Icon(
//                                 _controller.value.isPlaying
//                                     ? Icons.pause
//                                     : Icons.play_arrow,
//                                 color: Colors.white,
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   _controller.value.isPlaying
//                                       ? _controller.pause()
//                                       : _controller.play();
//                                 });
//                               },
//                             ),
//                             Text(
//                               '${_formatDuration(_controller.value.position)} / ${_formatDuration(_controller.value.duration)}',
//                               style: const TextStyle(color: Colors.white),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//               ],
//             )
//           : const CircularProgressIndicator(), // Show a loader until initialization is complete
//     ),
//   );
    
// }
// }


// vlc ;laga va ha
// class VideoPlayerScreen extends StatefulWidget {
//   const VideoPlayerScreen({Key? key}) : super(key: key);

//   @override
//   State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
// }

// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   late VlcPlayerController _vlcController;
//   bool _isPlaying = false;
//   Duration _videoDuration = Duration.zero;
//   Duration _currentPosition = Duration.zero;

//   @override
//   void initState() {
//     super.initState();
//     _vlcController = VlcPlayerController.asset(
//       'assets/video/vid1.mp4',
//       hwAcc: HwAcc.full, // Hardware acceleration
//       autoPlay: false,
//     )..addOnInitListener(() {
//         setState(() {
//           _videoDuration = _vlcController.value.duration;
//         });
//       });
//     // ..addOn((position) {
//     //   setState(() {
//     //     _currentPosition = position;
//     //   });
//     // });
//   }

//   @override
//   void dispose() {
//     _vlcController.dispose();
//     super.dispose();
//   }

//   void _togglePlayPause() {
//     if (_isPlaying) {
//       _vlcController.pause();
//     } else {
//       _vlcController.play();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text('Video Player'),
//         backgroundColor: Colors.black,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             VlcPlayer(
//               controller: _vlcController,
//               aspectRatio: 16 / 9,
//               placeholder: const Center(child: CircularProgressIndicator()),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               '${_currentPosition.inMinutes}:${(_currentPosition.inSeconds % 60).toString().padLeft(2, '0')} / ${_videoDuration.inMinutes}:${(_videoDuration.inSeconds % 60).toString().padLeft(2, '0')}',
//               style: const TextStyle(color: Colors.white),
//             ),
//             IconButton(
//               icon: Icon(
//                 _isPlaying ? Icons.pause : Icons.play_arrow,
//                 color: Colors.white,
//                 size: 50,
//               ),
//               onPressed: _togglePlayPause,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
