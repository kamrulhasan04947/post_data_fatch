import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:post_data_fatch/data_controller/post_data_controller.dart';

class PostDataFatch extends StatefulWidget {
  const PostDataFatch({super.key});

  @override
  State<PostDataFatch> createState() => _PostDataFatchState();
}

class _PostDataFatchState extends State<PostDataFatch> {
  final postsDataController = Get.put(PostsDataController());

  @override
  void initState() {
    super.initState();
    postsDataController.fachPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fatch Post'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Obx(() {
        if (postsDataController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return Padding(
          padding: EdgeInsets.all(24),
          child: ListView.separated(
            itemCount: postsDataController.posts.length,
            itemBuilder: (context, inddex) {
              final post = postsDataController.posts[inddex];
              return ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                tileColor: Colors.grey,
                leading: CircleAvatar(
                  backgroundColor: Colors.blue.shade200,
                  child: Text(
                    post.id.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                title: Wrap(children: [Text('Post Title: ${post.postTitle}')]),
                subtitle: Wrap(
                  children: [Text('Post Body : ${post.postBody}')],
                ),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(height: 8),
          ),
        );
      }),
    );
  }
}
