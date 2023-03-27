// import 'package:flutter/material.dart';
// import 'package:rive/rive.dart';

// class LandingScreen extends StatefulWidget {
//   const LandingScreen({Key? key}) : super(key: key);

//   @override
//   _LandingScreenState createState() => _LandingScreenState();
// }

// class _LandingScreenState extends State<LandingScreen> {
//   // Controller for playback
//   late RiveAnimationController _controller;

//   // Toggles between play and pause animation states
//   void _togglePlay() =>
//       setState(() => _controller.isActive = !_controller.isActive);

//   /// Tracks if the animation is playing by whether controller is running
//   bool get isPlaying => _controller.isActive;

//   @override
//   void initState() {
//     super.initState();
//     _controller = SimpleAnimation('idle');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: RiveAnimation.asset(
//           'assets/flying-car.riv',
//           controllers: [_controller],
//           // Update the play state when the widget's initialized
//           onInit: (_) => setState(() {}),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _togglePlay,
//         tooltip: isPlaying ? 'Pause' : 'Play',
//         child: Icon(
//           isPlaying ? Icons.pause : Icons.play_arrow,
//         ),
//       ),
//     );
//   }
// }