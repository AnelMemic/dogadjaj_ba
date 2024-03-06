class Notifications {
  late int id;
  late String content;
  late bool? read;
  late DateTime? dateRead;
  late DateTime? sendOnDate;
  late int? userId;
  late bool isSelected = false;

Notifications({
  required this.id,
  required this.content,
  required this.read,
 this.dateRead,
 this.sendOnDate,
 this.userId,
 required this.isSelected,
 
});

  Notifications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    content = json['content'];
    read = json['read'];
    sendOnDate = DateTime.parse(json['sendOnDate']);
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['content'] = content;
    data['read'] = read;
    data['sendOnDate'] = sendOnDate;
    return data;
  }



}

