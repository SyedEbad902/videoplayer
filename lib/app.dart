import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// void main() => runApp(const VideoApp());

/// Stateful widget to fetch and then display video content.
class VideoApp extends StatefulWidget {
  const VideoApp({super.key});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/video/vid1.mp4")
    // (Uri.parse(
    //     'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}


















// import 'dart:io';

// import 'package:chewie/chewie.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class ChewieDemo extends StatefulWidget {
//   const ChewieDemo({
//     super.key,
//     this.title = 'Chewie Demo',
//   });

//   final String title;

//   @override
//   State<StatefulWidget> createState() {
//     return _ChewieDemoState();
//   }
// }

// class _ChewieDemoState extends State<ChewieDemo> {
//   TargetPlatform? _platform;
//   late VideoPlayerController _videoPlayerController1;
//   late VideoPlayerController _videoPlayerController2;
//   ChewieController? _chewieController;
//   int? bufferDelay;

//   @override
//   void initState() {
//     super.initState();
//     initializePlayer();
//   }

//   @override
//   void dispose() {
//     _videoPlayerController1.dispose();
//     _videoPlayerController2.dispose();
//     _chewieController?.dispose();
//     super.dispose();
//   }

//   List<String> srcs = [
//     "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
//     "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
//     "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
//   ];

//   Future<void> initializePlayer() async {
//     try {
//       _videoPlayerController1 =
//           VideoPlayerController.networkUrl(Uri.parse(
//           "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"));
//       await _videoPlayerController1.initialize();
//       _createChewieController();
//       setState(() {});
//     } on Error catch (error) {
//       print("Video playback error: $error");
//       // Handle error, e.g., display an error message to the user
//       // Consider retrying the playback after a delay
//       Future.delayed(Duration(seconds: 5), () {
//         initializePlayer();
//       });
//     } catch (error) {
//       print("Unexpected error: $error");
//       // Handle other exceptions
//     }
//   }

//   void _createChewieController() {
//     // final subtitles = [
//     //     Subtitle(
//     //       index: 0,
//     //       start: Duration.zero,
//     //       end: const Duration(seconds: 10),
//     //       text: 'Hello from subtitles',
//     //     ),
//     //     Subtitle(
//     //       index: 0,
//     //       start: const Duration(seconds: 10),
//     //       end: const Duration(seconds: 20),
//     //       text: 'Whats up? :)',
//     //     ),
//     //   ];

//     final subtitles = [
//       Subtitle(
//         index: 0,
//         start: Duration.zero,
//         end: const Duration(seconds: 10),
//         text: const TextSpan(
//           children: [
//             TextSpan(
//               text: 'Hello',
//               style: TextStyle(color: Colors.red, fontSize: 22),
//             ),
//             TextSpan(
//               text: ' from ',
//               style: TextStyle(color: Colors.green, fontSize: 20),
//             ),
//             TextSpan(
//               text: 'subtitles',
//               style: TextStyle(color: Colors.blue, fontSize: 18),
//             )
//           ],
//         ),
//       ),
//       Subtitle(
//         index: 0,
//         start: const Duration(seconds: 10),
//         end: const Duration(seconds: 20),
//         text: 'Whats up? :)',
//         // text: const TextSpan(
//         //   text: 'Whats up? :)',
//         //   style: TextStyle(color: Colors.amber, fontSize: 22, fontStyle: FontStyle.italic),
//         // ),
//       ),
//     ];

//     _chewieController = ChewieController(
//       videoPlayerController: _videoPlayerController1,
//       autoPlay: true,
//       looping: true,
//       progressIndicatorDelay:
//           bufferDelay != null ? Duration(milliseconds: bufferDelay!) : null,

//       additionalOptions: (context) {
//         return <OptionItem>[
//           OptionItem(
//             onTap: toggleVideo,
//             iconData: Icons.live_tv_sharp,
//             title: 'Toggle Video Src',
//           ),
//         ];
//       },
//       subtitle: Subtitles(subtitles),
//       subtitleBuilder: (context, dynamic subtitle) => Container(
//         padding: const EdgeInsets.all(10.0),
//         child: subtitle is InlineSpan
//             ? RichText(
//                 text: subtitle,
//               )
//             : Text(
//                 subtitle.toString(),
//                 style: const TextStyle(color: Colors.black),
//               ),
//       ),

//       hideControlsTimer: const Duration(seconds: 1),

//       // Try playing around with some of these other options:

//       // showControls: false,
//       // materialProgressColors: ChewieProgressColors(
//       //   playedColor: Colors.red,
//       //   handleColor: Colors.blue,
//       //   backgroundColor: Colors.grey,
//       //   bufferedColor: Colors.lightGreen,
//       // ),
//       // placeholder: Container(
//       //   color: Colors.grey,
//       // ),
//       // autoInitialize: true,
//     );
//   }

//   int currPlayIndex = 0;

//   Future<void> toggleVideo() async {
//     await _videoPlayerController1.pause();
//     currPlayIndex += 1;
//     if (currPlayIndex >= srcs.length) {
//       currPlayIndex = 0;
//     }
//     await initializePlayer();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: widget.title,
//       // theme: AppTheme.light.copyWith(
//       // ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: Column(
//           children: <Widget>[
//             Expanded(
//               child: Center(
//                 child: _chewieController != null &&
//                         _chewieController!
//                             .videoPlayerController.value.isInitialized
//                     ? Chewie(
//                         controller: _chewieController!,
//                       )
//                     : const Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           CircularProgressIndicator(),
//                           SizedBox(height: 20),
//                           Text('Loading'),
//                         ],
//                       ),
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 _chewieController?.enterFullScreen();
//               },
//               child: const Text('Fullscreen'),
//             ),
//             Row(
//               children: <Widget>[
//                 Expanded(
//                   child: TextButton(
//                     onPressed: () {
//                       setState(() {
//                         _videoPlayerController1.pause();
//                         _videoPlayerController1.seekTo(Duration.zero);
//                         _createChewieController();
//                       });
//                     },
//                     child: const Padding(
//                       padding: EdgeInsets.symmetric(vertical: 16.0),
//                       child: Text("Landscape Video"),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: TextButton(
//                     onPressed: () {
//                       setState(() {
//                         _videoPlayerController2.pause();
//                         _videoPlayerController2.seekTo(Duration.zero);
//                         _chewieController = _chewieController!.copyWith(
//                           videoPlayerController: _videoPlayerController2,
//                           autoPlay: true,
//                           looping: true,
//                           /* subtitle: Subtitles([
//                             Subtitle(
//                               index: 0,
//                               start: Duration.zero,
//                               end: const Duration(seconds: 10),
//                               text: 'Hello from subtitles',
//                             ),
//                             Subtitle(
//                               index: 0,
//                               start: const Duration(seconds: 10),
//                               end: const Duration(seconds: 20),
//                               text: 'Whats up? :)',
//                             ),
//                           ]),
//                           subtitleBuilder: (context, subtitle) => Container(
//                             padding: const EdgeInsets.all(10.0),
//                             child: Text(
//                               subtitle,
//                               style: const TextStyle(color: Colors.white),
//                             ),
//                           ), */
//                         );
//                       });
//                     },
//                     child: const Padding(
//                       padding: EdgeInsets.symmetric(vertical: 16.0),
//                       child: Text("Portrait Video"),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             Row(
//               children: <Widget>[
//                 Expanded(
//                   child: TextButton(
//                     onPressed: () {
//                       setState(() {
//                         _platform = TargetPlatform.android;
//                       });
//                     },
//                     child: const Padding(
//                       padding: EdgeInsets.symmetric(vertical: 16.0),
//                       child: Text("Android controls"),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: TextButton(
//                     onPressed: () {
//                       setState(() {
//                         _platform = TargetPlatform.iOS;
//                       });
//                     },
//                     child: const Padding(
//                       padding: EdgeInsets.symmetric(vertical: 16.0),
//                       child: Text("iOS controls"),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             Row(
//               children: <Widget>[
//                 Expanded(
//                   child: TextButton(
//                     onPressed: () {
//                       setState(() {
//                         _platform = TargetPlatform.windows;
//                       });
//                     },
//                     child: const Padding(
//                       padding: EdgeInsets.symmetric(vertical: 16.0),
//                       child: Text("Desktop controls"),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             if (Platform.isAndroid)
//               ListTile(
//                 title: const Text("Delay"),
//                 subtitle: DelaySlider(
//                   delay:
//                       _chewieController?.progressIndicatorDelay?.inMilliseconds,
//                   onSave: (delay) async {
//                     if (delay != null) {
//                       bufferDelay = delay == 0 ? null : delay;
//                       await initializePlayer();
//                     }
//                   },
//                 ),
//               )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DelaySlider extends StatefulWidget {
//   const DelaySlider({super.key, required this.delay, required this.onSave});

//   final int? delay;
//   final void Function(int?) onSave;
//   @override
//   State<DelaySlider> createState() => _DelaySliderState();
// }

// class _DelaySliderState extends State<DelaySlider> {
//   int? delay;
//   bool saved = false;

//   @override
//   void initState() {
//     super.initState();
//     delay = widget.delay;
//   }

//   @override
//   Widget build(BuildContext context) {
//     const int max = 1000;
//     return ListTile(
//       title: Text(
//         "Progress indicator delay ${delay != null ? "${delay.toString()} MS" : ""}",
//       ),
//       subtitle: Slider(
//         value: delay != null ? (delay! / max) : 0,
//         onChanged: (value) async {
//           delay = (value * max).toInt();
//           setState(() {
//             saved = false;
//           });
//         },
//       ),
//       trailing: IconButton(
//         icon: const Icon(Icons.save),
//         onPressed: saved
//             ? null
//             : () {
//                 widget.onSave(delay);
//                 setState(() {
//                   saved = true;
//                 });
//               },
//       ),
//     );
//   }
// }
