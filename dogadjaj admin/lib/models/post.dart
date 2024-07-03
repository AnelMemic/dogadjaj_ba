
class Post {
  late int id;
  late String? title;
  late String? content;
  late DateTime? publishDate;
  late int? status;

  Post({
    required this.id,
    this.title,
    this.content,
    this.publishDate,
    this.status,
  });

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    content = json['content'];
    status = json['status'];
    publishDate = DateTime.parse(json['publishDate']);
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    data['status'] = status;
    data['publishDate'] = publishDate;

    return data;
  }
}
