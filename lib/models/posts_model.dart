class PostDataModel {
  PostDataModel({
    required this.id,
    required this.postTitle,
    required this.postBody,
  });
  final int id;
  final String postTitle;
  final String postBody;

  factory PostDataModel.fromJson(Map<String, dynamic> json) {
    return PostDataModel(
      id: json['id'],
      postTitle: json['title'],
      postBody: json['body'],
    );
  }
}
