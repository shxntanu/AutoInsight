// import 'package:autoinsight/utils/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class Profile_Page extends StatelessWidget {
  
//   Profile_Page({required this.name, required this.carname, required this.year, required this.licenseplatenumber});

//   final String name, carname, year, licenseplatenumber;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Expanded(
//             flex: 1,
//             child: Padding(
//               padding: const EdgeInsets.only(top: 10.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     flex: 1,
//                     child: IconButton(
//                       icon: const Icon(Icons.arrow_back_ios_new, size: 20,),
//                       onPressed: (){
//                         Get.back();
//                       },
//                     ),
//                   ),
//                   const Expanded(
//                     flex: 2,
//                     child: Center(
//                       child: Text(
//                         "Profile",
//                         style: TextStyle(
//                           fontSize: 17,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 1,
//                     child: IconButton(
//                       icon: const Icon(Icons.more_horiz_outlined),
//                       onPressed: (){},
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 6,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Expanded(
//                   flex: 2,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Card(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: SizedBox(
//                               height: MediaQuery.of(context).size.width*0.62,
//                               child: Image.asset("images/autoinsight.png"),
//                             )
//                           ),
//                         ],
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Card(
//                             child: Container(
//                               height: MediaQuery.of(context).size.width*0.3,
//                               width: MediaQuery.of(context).size.width*0.3,
//                               color: accentOrange,
//                             ),
//                           ),
//                           Card(
//                             child: Container(
//                               height: MediaQuery.of(context).size.width*0.3,
//                               width: MediaQuery.of(context).size.width*0.3,
//                               color: accentOrange,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: Card(),
//                 ),
//                 Expanded(
//                   flex: 2,
//                   child: Row(
//                     children: [
//                       Card(),
//                       Card(),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// const TextStyle kstyle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);