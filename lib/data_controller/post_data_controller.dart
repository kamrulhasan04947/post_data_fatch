import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:post_data_fatch/models/posts_model.dart';

class PostsDataController extends GetxController {
  List<PostDataModel> posts = <PostDataModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fachPosts();
    super.onInit();
  }

  Future<void> fachPosts() async {
    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        // print(response.body);
        // update observable list
        posts.assignAll(
          jsonData.map((e) => PostDataModel.fromJson(e)).toList(),
        );
        // print('${box.get('cachedData')}');
      }
    } catch (e) {
      print('fatch post : $e');
    } finally {
      isLoading(false);
    }
  }
}
