// Positioned.fill(
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       for (var i = 0; i < _controllerList.length; i++)
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: TextField(
//             controller: _controllerList[i],
//             decoration: InputDecoration(
//               hintText: 'Color $i',
//             ),
//             onChanged: (value) {
//               setState(() {
//                 _colorList[i] =
//                     value.isNotEmpty ? Color(int.parse(value, radix: 16)) : Colors.grey;
//               });
//             },
//           ),
//         ),
//     ],
//   ),
// ),