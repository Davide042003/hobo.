class TourModel {
  final String idTour;
  final String idGuide;
  final String tourName;
  final String tourPlace;
  final int numberOfPeople;
  final bool isChildrenAllowed;
  final bool isPrivate;
  final String idImageList;
  final String language;
  final String data;
  final String time;
  final String idActivityList;
  final String idVehicleList;
  final double price;

  TourModel({this.idTour, this.idGuide, this.tourName, this.tourPlace, this.numberOfPeople, this.isChildrenAllowed, this.isPrivate, this.idImageList, this.language, this.data, this.time, this.idActivityList, this.idVehicleList, this.price});

  factory TourModel.fromJson(Map<dynamic, dynamic> json) {
    return TourModel(
      idTour: json['idTour'],
      idGuide: json['idGuide'],
      tourName: json['tourName'],
      tourPlace: json['tourPlace'],
      numberOfPeople: json['numberOfPeople'],
      isChildrenAllowed: json['isChildrenAllowed'],
      isPrivate: json['isPrivate'],
      idImageList: json['idImageList'],
      language: json['language'],
      data: json['data'],
      time: json['time'],
      idActivityList: json['idActivityList'],
      idVehicleList: json['idVehicleList'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idTour': idTour,
      'idGuide': idGuide,
      'tourName': tourName,
      'tourPlace': tourPlace,
      'numberOfPeople': numberOfPeople,
      'isChildrenAllowed': isChildrenAllowed,
      'isPrivate': isPrivate,
      'idImageList': idImageList,
      'language': language,
      'data': data,
      'time': time,
      'idActivityList': idActivityList,
      'idVehicleList': idVehicleList,
      'price': price,
    };
  }

}
