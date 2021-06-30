class MapCity {
  final String mainText;
  final String secondaryText;
  final String id;

  MapCity({
    this.mainText,
    this.secondaryText,
    this.id
  });

  factory MapCity.fromJson(Map<dynamic, dynamic> json) {
    return MapCity(
      mainText: json ["structured_formatting"]['main_text'],
      secondaryText: json ["structured_formatting"]['secondary_text'],
      id: json["place_id"]
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'mainText': mainText,
      'secondaryText': secondaryText,
      'id': id
    };
  }
}
