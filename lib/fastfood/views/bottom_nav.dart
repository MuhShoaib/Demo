import 'package:demo/fastfood/views/login.dart';
import 'package:flutter/material.dart';

import '../../demo/utils/size_utils.dart';

class BottomNavView extends StatefulWidget {
  const BottomNavView({super.key});

  @override
  State<BottomNavView> createState() => _BottomNavViewState();
}

class _BottomNavViewState extends State<BottomNavView> {
  int selectedIndex = 0;
  List<Widget> screens = [
    Center(child: Text("1")),
    Center(child: Text("2")),
    Center(child: Text("3")),
    FoodGridScreen(),
  ];

  void onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add,color: Colors.white,),
      ),
      body: screens.elementAt(selectedIndex),
      bottomNavigationBar: BottomAppBar(
        height: 70.v,
        padding: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        shape:
            CircularNotchedRectangle(), // ← carves notch for FAB in BottomAppBar
        color: Colors.grey.shade300,
        // ↑ use .withAlpha(0) to debug/peek underneath ↑ BottomAppBar
        elevation: 0, // ← removes slight shadow under FAB, hardly noticeable
              child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.black,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedIconTheme: IconThemeData(color: Colors.blue),
          elevation: 0, // 0 removes ugly rectangular NavBar shadow
          // CRITICAL ↓ a solid color here destroys FAB notch. Use alpha 0!
          backgroundColor: Theme.of(context).primaryColor.withAlpha(0),
          // ====================== END OF INTERESTING STUFF =================
          selectedItemColor: Theme.of(context).colorScheme.onSurface,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Category",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}
