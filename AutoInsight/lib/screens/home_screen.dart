// Home Screen (TO BE WORKED UPON)

import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search_circle_fill),
            label: 'Explore',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text('Page 1 of tab $index'),
              ),
              child: Center(
                child: CupertinoButton(
                  child: const Text('Next page'),
                  onPressed: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute<void>(
                        builder: (BuildContext context) {
                          return CupertinoPageScaffold(
                            navigationBar: CupertinoNavigationBar(
                              middle: Text('Page 2 of tab $index'),
                            ),
                            child: Center(
                              child: CupertinoButton(
                                child: const Text('Back'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
      
//       // A ScrollView that creates custom scroll effects using slivers.
//       child: CustomScrollView(
//         // A list of sliver widgets.
//         slivers: <Widget>[
//           const CupertinoSliverNavigationBar(
//             largeTitle: Text('Contacts',
//             style: TextStyle(fontFamily: 'San Francisco'),),
//           ),
//           // This widget fills the remaining space in the viewport.
//           // Drag the scrollable area to collapse the CupertinoSliverNavigationBar.
//           SliverFillRemaining(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 const Text('Drag me up', textAlign: TextAlign.center),
//                 CupertinoButton.filled(
//                   onPressed: () {
//                     Navigator.push(context, CupertinoPageRoute<Widget>(
//                         builder: (BuildContext context) {
//                       return const NextPage();
//                     }));
//                   },
//                   child: const Text('Go to Next Page'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class NextPage extends StatelessWidget {
//   const NextPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final Brightness brightness = CupertinoTheme.brightnessOf(context);
//     return CupertinoPageScaffold(
//       child: CustomScrollView(
//         slivers: <Widget>[
//           CupertinoSliverNavigationBar(
//             backgroundColor: CupertinoColors.systemYellow,
//             border: Border(
//               bottom: BorderSide(
//                 color: brightness == Brightness.light
//                     ? CupertinoColors.black
//                     : CupertinoColors.white,
//               ),
//             ),
//             // The middle widget is visible in both collapsed and expanded states.
//             middle: const Text('Contacts Group'),
//             // When the "middle" parameter is implemented, the larget title is only visible
//             // when the CupertinoSliverNavigationBar is fully expanded.
//             largeTitle: const Text('Family'),
//           ),
//           SliverFillRemaining(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: const <Widget>[
//                 Text('Drag me up', textAlign: TextAlign.center),
//                 // When the "leading" parameter is omitted on a route that has a previous page,
//                 // the back button is automatically added to the leading position.
//                 Text('Tap on the leading button to navigate back',
//                     textAlign: TextAlign.center),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
  }
}