class Notifications {
  late String content;
  late bool? read;
  late DateTime? dateRead;
  late DateTime? sendOnDate;
  late int? userId;
  late bool? deleted;
  late bool isSelected = false;

Notifications({
  required this.content,
  required this.read,
 this.dateRead,
 this.deleted,
 this.sendOnDate,
 this.userId,
 required this.isSelected,
 
});

  Notifications.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    content = json['content'];
    read = json['read'];
    deleted = json['deleted'];
    //DateRead = DateTime.parse(json['dateRead']);
    sendOnDate = DateTime.parse(json['sendOnDate']);
    //Seen = DateTime.parse(json['seen']);
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content'] = content;
    data['read'] = read;
    data['deleted'] = deleted;
    //data['dateRead'] = DateRead;
    data['sendOnDate'] = sendOnDate;
    //data['seen'] = Seen;
    return data;
  }



}

