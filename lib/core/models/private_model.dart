class PrivateModel {
  List<Firmy>? firmy;

  PrivateModel({this.firmy});

  PrivateModel.fromJson(Map<String, dynamic> json) {
    if (json['firmy'] != null) {
      firmy = <Firmy>[];
      json['firmy'].forEach((v) {
        firmy!.add(Firmy.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (firmy != null) {
      data['firmy'] = firmy!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Firmy {
  String? kod;
  String? produkt;
  String? vyrobce;
  int? holding;

  Firmy({this.kod, this.produkt, this.vyrobce, this.holding});

  Firmy.fromJson(Map<String, dynamic> json) {
    kod = json['kod'];
    produkt = json['produkt'];
    vyrobce = json['vyrobce'];
    holding = json['holding'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kod'] = kod;
    data['produkt'] = produkt;
    data['vyrobce'] = vyrobce;
    data['holding'] = holding;
    return data;
  }
}
