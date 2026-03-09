import 'package:demo/demo/api/post.dart';
import 'package:demo/demo/api/serivce.dart';
import 'package:flutter/material.dart';
//
// class PostView extends StatefulWidget {
//   const PostView({super.key});
//
//   @override
//   State<PostView> createState() => _PostViewState();
// }
//
// class _PostViewState extends State<PostView> {
//   late Future<List<Post>> futurePost;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     futurePost = fetchAllPost();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<List<Post>>(
//         future: futurePost,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 final post = snapshot.data![index];
//                 return Container(
//                   child: ListTile(
//                     title: Text(post.title),
//                     trailing: Text(post.id.toString()),
//                   ),
//                 );
//               },
//             );
//           }
//
//           return Center(child: CircularProgressIndicator());
//         },
//       ),
//       // body: FutureBuilder<Post>(
//       //   future: futurePost,
//       //   builder: (context, snapshot) {
//       //     if (snapshot.hasData) {
//       //       return Center(
//       //         child: Column(
//       //           mainAxisAlignment: .center,
//       //           children: [
//       //             Text(snapshot.data!.id.toString()),
//       //             Text(snapshot.data!.userId.toString()),
//       //             Text(snapshot.data!.title),
//       //             Text(snapshot.data!.body),
//       //           ],
//       //         ),
//       //       );
//       //     }
//       //
//       //     return Center(child: CircularProgressIndicator());
//       //   },
//       // ),
//     );
//   }
// }

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  late Future<List<Post>> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = fetchAllPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Posts")),
      body: FutureBuilder<List<Post>>(
        future: futurePost,
        builder: (context, snapshot) {
          // Loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Error
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          // Data
          if (snapshot.hasData) {
            final posts = snapshot.data!;

            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];

                return ListTile(
                  leading: Text(post.id.toString()),
                  title: Text(post.title),
                  subtitle: Text(post.body),
                );
              },
            );
          }

          return const Center(child: Text("No Data Found"));
        },
      ),
    );
  }
}
