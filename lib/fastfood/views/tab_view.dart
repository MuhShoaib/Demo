import 'package:flutter/material.dart';

// class TabView extends StatelessWidget {
//   const TabView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("Tab Bar View"),
//           bottom: const TabBar(
//             tabs: [Icon(Icons.home), Icon(Icons.person), Icon(Icons.settings)],
//           ),
//         ),
//         body: const TabBarView(
//           children: [
//             Center(child: Text("1")),
//             Center(child: Text("2")),
//             Center(child: Text("3")),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class TabView extends StatefulWidget {
//   const TabView({Key? key}) : super(key: key);
//   @override
//   State<TabView> createState() => _TabViewState();
// }
//
// class _TabViewState extends State<TabView> with SingleTickerProviderStateMixin {
//   late TabController tabController;
//   @override
//   void initState() {
//     tabController = TabController(length: 4, vsync: this);
//     tabController.addListener(() {
//       setState(() {});
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         //tabcontroller.index can be used to get the name of current index value of the tabview.
//         title: Text(
//           tabController.index == 0
//               ? TextConstants.titleTab_1
//               : tabController.index == 1
//               ? TextConstants.titleTab_2
//               : tabController.index == 2
//               ? TextConstants.titleTab_3
//               : TextConstants.titleTab_4,
//         ),
//         bottom: TabBar(
//           controller: tabController,
//           tabs: [
//             Tab(
//               text: TextConstants.titleTab_1,
//               icon: Icon(Icons.home, color: Colors.indigo.shade500),
//             ),
//             Tab(
//               text: TextConstants.titleTab_2,
//               icon: Icon(Icons.email, color: Colors.indigo.shade500),
//             ),
//             Tab(
//               text: TextConstants.titleTab_3,
//               icon: Icon(Icons.star, color: Colors.indigo.shade500),
//             ),
//             Tab(
//               text: TextConstants.titleTab_4,
//               icon: Icon(Icons.person, color: Colors.indigo.shade500),
//             ),
//           ],
//         ),
//       ),
//
//       body: TabBarView(
//         controller: tabController,
//         children: [
//           Center(child: Text("1")),
//           Center(child: Text("2")),
//           Center(child: Text("3")),
//           Center(child: Text("4")),
//         ],
//       ),
//     );
//   }
// }
//
// class TextConstants {
//   static String titleTab_1 = "Home";
//   static String titleTab_2 = "Email";
//   static String titleTab_3 = "Rating";
//   static String titleTab_4 = "Profile";
// }

// Source - https://stackoverflow.com/a/63319363
// Posted by timilehinjegede, modified by community. See post 'Timeline' for change history
// Retrieved 2026-02-18, License - CC BY-SA 4.0

class StackOver extends StatefulWidget {
  @override
  _StackOverState createState() => _StackOverState();
}

class _StackOverState extends State<StackOver>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tab bar')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // give the tab bar a height [can change hheight to preferred height]
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TabBar(
                controller: _tabController,
                // give the indicator a decoration (color and border radius)
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.red,
                ),
                labelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelColor: Colors.black,
                tabs: [
                  // first tab [you can add an icon using the icon property]
                  Tab(text: 'Place Bid'),

                  // second tab [you can add an icon using the icon property]
                  Tab(text: 'Buy Now'),

                  Tab(text: 'Sell Now'),
                ],
              ),
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // first tab bar view widget
                  Center(
                    child: Text(
                      'Place Bid',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  // second tab bar view widget
                  Center(
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  Center(
                    child: Text(
                      'Sell Now',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
