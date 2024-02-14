class EventSearchObject {
  int? Page;
  int? PageSize;
  int? kategorija;
  int? PodKategorija;
  String? FTS;
  String? Naziv;
  int? eventId;



  EventSearchObject(
      { this.Page, this.PageSize, this.kategorija, this.PodKategorija, this.eventId , this.FTS, this.Naziv});

  EventSearchObject.fromJson(Map<String, dynamic> json) {
    kategorija = json['kategorija'];
    eventId = json['eventId'];
    PodKategorija = json['PodKategorija'];
    Page = json['Page'];
    PageSize = json['PageSize'];
    FTS = json['FTS'];
    Naziv = json['Naziv'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['eventId'] = eventId;
    data['kategorija'] = kategorija;
    data['PodKategorija'] = PodKategorija;
    data['Page'] = Page;
    data['PageSize'] = PageSize;
    return data;
  }
}
