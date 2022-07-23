class CustomerList {
  List<CustomerData> cData;

  CustomerList({this.cData});

  factory CustomerList.fromJson(Map<String, dynamic> json) {
    var list = json['customer_list'] as List;
    List<CustomerData> data =
        list.map((e) => CustomerData.fromJson(e)).toList();
    return CustomerList(cData: data);
  }
}

class CustomerData {
  List<String> iceCubes;
  List<String> sewwtness;
  List<String> feed;

  CustomerData({this.iceCubes, this.sewwtness, this.feed});

  factory CustomerData.fromJson(Map<String, dynamic> json) => CustomerData(
        iceCubes: json['ice_cubes'] == null
            ? null
            : List<String>.from(json['ice_cubes'].map((x) => x)),
        sewwtness: json['sewwtness'] == null
            ? null
            : List<String>.from(json['sewwtness'].map((x) => x)),
        feed: json['feed'] == null
            ? null
            : List<String>.from(json['feed'].map((x) => x)),
      );
}
