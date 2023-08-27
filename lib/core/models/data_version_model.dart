class DataVersionModel {
  String? info;
  String? datum;
  String? zprava;

  DataVersionModel({this.info, this.datum, this.zprava});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataVersionModel &&
          runtimeType == other.runtimeType &&
          info == other.info &&
          datum == other.datum &&
          zprava == other.zprava;

  @override
  int get hashCode => info.hashCode ^ datum.hashCode ^ zprava.hashCode;

  DataVersionModel.fromJson(Map<String, dynamic> json) {
    info = json['info'];
    datum = json['datum'];
    zprava = json['zprava'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['info'] = info;
    data['datum'] = datum;
    data['zprava'] = zprava;
    return data;
  }
}
