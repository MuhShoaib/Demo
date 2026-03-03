import 'dart:developer';

import 'package:demo/demo/state/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/size_utils.dart';
import 'color_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueGrey, Colors.blueGrey.withOpacity(0.2)],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: true,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 0.0,
        //   ),
        // ],
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Scaffold(

        appBar: AppBar(
          title: const Text('Advanced Drawer Example'),
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return Icon(
                  value.visible ? Icons.clear : Icons.menu,
                  key: ValueKey<bool>(value.visible),
                );
              },
            ),
          ),
        ),
        body: Container(),
      ),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 128.0,
                  height: 128.0,
                  margin: const EdgeInsets.only(top: 24.0, bottom: 64.0),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset('assets/images/flutter_logo.png'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.account_circle_rounded),
                  title: Text('Profile'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.favorite),
                  title: Text('Favourites'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
                Spacer(),
                DefaultTextStyle(
                  style: TextStyle(fontSize: 12, color: Colors.white54),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text('Terms of Service | Privacy Policy'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}

class CounterView extends StatelessWidget {
  final _advancedDrawerController = AdvancedDrawerController();
  CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    // final counterProvider = Provider.of<CounterProvider>(context);
    return Consumer<CounterProvider>(
      builder: (context, value, child) {
        return AdvancedDrawer(
          drawer: SafeArea(
            child: Container(
              child: ListTileTheme(
                textColor: Colors.white,
                iconColor: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 128.0,
                      height: 128.0,
                      margin: const EdgeInsets.only(top: 24.0, bottom: 64.0),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset('assets/images/flutter_logo.png'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(Icons.home),
                      title: Text('Home'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(Icons.account_circle_rounded),
                      title: Text('Profile'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(Icons.favorite),
                      title: Text('Favourites'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(Icons.settings),
                      title: Text('Settings'),
                    ),
                    Spacer(),
                    DefaultTextStyle(
                      style: TextStyle(fontSize: 12, color: Colors.white54),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text('Terms of Service | Privacy Policy'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          backdrop: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blueGrey, Colors.blueGrey.withOpacity(0.2)],
              ),
            ),
          ),
          controller: _advancedDrawerController,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          animateChildDecoration: true,
          rtlOpening: false,
          // openScale: 1.0,
          disabledGestures: false,
          childDecoration: const BoxDecoration(
            // NOTICE: Uncomment if you want to add shadow behind the page.
            // Keep in mind that it may cause animation jerks.
            // boxShadow: <BoxShadow>[
            //   BoxShadow(
            //     color: Colors.black12,
            //     blurRadius: 0.0,
            //   ),
            // ],
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),

          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: _handleMenuButtonPressed,
                icon: ValueListenableBuilder<AdvancedDrawerValue>(
                  valueListenable: _advancedDrawerController,
                  builder: (_, value, __) {
                    return AnimatedSwitcher(
                      duration: Duration(milliseconds: 250),
                      child: Semantics(
                        label: 'Menu',
                        onTapHint: 'expand drawer',
                        child: Icon(
                          value.visible ? Icons.clear : Icons.menu,
                          key: ValueKey<bool>(value.visible),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            floatingActionButton: FloatingActionButton(
              onPressed: () {
                value.increment();
              },
              child: Icon(Icons.add),
            ),

            body: Center(
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  Text(value.count.toString(), style: TextStyle(fontSize: 30)),

                  FloatingActionButton(
                    onPressed: () {
                      value.decrement();
                    },
                    child: Icon(Icons.minimize),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }

  Widget _drawerItem({required String text}) {
    return Row(
      children: [
        Icon(Icons.home),

        Gap.h(10),
        Text(text, style: TextStyle(fontSize: 20.fSize)),
      ],
    );
  }
}

class ColorView extends StatelessWidget {
  const ColorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Color Picker")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Only this container listens to color change
          Consumer<ColorProvider>(
            builder: (context, provider, _) {
              return Container(
                height: 120,
                width: 220,
                decoration: BoxDecoration(
                  color: provider.selectedColor,
                  borderRadius: BorderRadius.circular(12),
                ),
              );
            },
          ),

          const SizedBox(height: 40),

          /// Color List
          SizedBox(
            height: 70,
            child: Consumer<ColorProvider>(
              builder: (context, provider, _) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: provider.colors.length,
                  itemBuilder: (context, index) {
                    final isSelected = provider.selectedIndex == index;

                    return GestureDetector(
                      onTap: () => provider.updateColor(index),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: provider.colors[index],
                          border: isSelected
                              ? Border.all(color: Colors.black, width: 3)
                              : null,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
