import 'package:demo/view/api_view.dart';
import 'package:demo/view/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'album.dart';
import 'demo/home.dart';
import 'demo/stack_demo.dart';
import 'demo/utils/size_utils.dart';
import 'demo/widgets/dialogs.dart';
import 'firebase_options.dart';

Future<List<Album>> fetchAlbum() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
  );

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    return data.map((item) => Album.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load albums');
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MaterialApp(debugShowCheckedModeBanner: false, home: DailogView()),
      ),
    );

    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Flutter Demo',
    //
    //   home:HomeView()
    //   // home: FirebaseAuth.instance.currentUser != null
    //   //     ? ProductView()
    //   //     : LoginView(),
    // );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  late Future<List<Album>> album;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    album = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Album>>(
          future: album,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: .all(10),
                    padding: .all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      snapshot.data![index].title,
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                },
              );
            }

            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
