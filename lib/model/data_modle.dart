class DataModel {
  DataModel({
    required this.value,
    required this.key,
  });

  String value;
  String key;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    value: json["value"],
    key: json["key"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "key": key,
  };
}
