// generovano pres https://javiercbk.github.io/json_to_dart/
// upraveno mnou aby se tento model mohl pouzivat na vsechny ean8 a ean13 pripady.

class EanModel {
  List<Firmy>? firmy;

  EanModel({this.firmy});

  EanModel.fromJson(Map<String, dynamic> json) {
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
  String? nazev;
  int? retezec;
  String? struktura;
  String? pozn;
  int? pocet;

  Firmy({
    this.kod,
    this.nazev,
    this.retezec,
    this.struktura,
    this.pozn,
    this.pocet,
  });

  Firmy.fromJson(Map<String, dynamic> json) {
    kod = json['kod'];
    nazev = json['nazev'];
    retezec = json['retezec'];
    pozn = json['pozn'];
    struktura = json['struktura'];
    pocet = json['pocet'];
  }

  // nepouzivane
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kod'] = kod;
    data['nazev'] = nazev;
    data['retezec'] = retezec;
    data['pozn'] = pozn;
    data['struktura'] = struktura;
    data['pocet'] = pocet;

    return data;
  }
}
