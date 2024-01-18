class TicketSearchObject {
  int? PageNumber;
  int? PageSize;
  int? userId;
  int? ticketId;
  int? eventId;


  TicketSearchObject(
      { this.PageNumber, this.PageSize, this.userId, this.ticketId, this.eventId });

  TicketSearchObject.fromJson(Map<String, dynamic> json) {
    ticketId = json['ticketId'];
    eventId = json['eventId'];
    userId = json['userId'];
    PageNumber = json['PageNumber'];
    PageSize = json['PageSize'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['eventId'] = eventId;
    data['userId'] = userId;
    data['ticketId'] = ticketId;

    data['PageNumber'] = PageNumber;
    data['PageSize'] = PageSize;
    return data;
  }
}
