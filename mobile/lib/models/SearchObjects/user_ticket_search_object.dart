class TicketSearchObject {
  int? PageNumber;
  int? PageSize;
  int? userId;


  TicketSearchObject(
      { this.PageNumber, this.PageSize, this.userId,});

  TicketSearchObject.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    PageNumber = json['PageNumber'];
    PageSize = json['PageSize'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userId'] = userId;

    data['PageNumber'] = PageNumber;
    data['PageSize'] = PageSize;
    return data;
  }
}
