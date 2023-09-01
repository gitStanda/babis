import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../models/ean_model.dart';
import 'package:babisappka/core/models/private_model.dart' as priv;

enum HoldingType {
  holding,
  mimoHolding,
  nejasne,
  putin,
}

class FirmaData {
  final String kod;
  final String nazev;

  final HoldingType holding;
  final String? pozn;
  bool? retezec;
  final String? struktura;
  int? pocet;

  FirmaData({
    required this.kod,
    required this.nazev,
    required this.holding,
    this.pozn,
    this.retezec,
    this.struktura,
    this.pocet,
  });

  FirmaData.copy(FirmaData data)
      : nazev = data.nazev,
        kod = data.kod,
        struktura = data.struktura,
        holding = data.holding,
        retezec = data.retezec,
        pozn = data.pozn,
        pocet = data.pocet;
}

EanModel getDataEan(Directory dir, String fileName) {
  File jsonFile = File('${dir.path}/$fileName');
  String jsonData = jsonFile.readAsStringSync();
  final parsedJson = jsonDecode(jsonData);
  EanModel model = EanModel.fromJson(parsedJson);

  return model;
}

priv.PrivateModel getDataPriv(Directory dir, String fileName) {
  File jsonFile = File('${dir.path}/$fileName');
  String jsonData = jsonFile.readAsStringSync();
  final parsedJson = jsonDecode(jsonData);
  priv.PrivateModel model = priv.PrivateModel.fromJson(parsedJson);

  return model;
}

Future<List<FirmaData>> loadEans() async {
  final dir = await getApplicationDocumentsDirectory();
  List<FirmaData> seznamFirem = [];

  try {
    EanModel agroModel = getDataEan(dir, 'ean13agro.json');

    EanModel neagroModel = getDataEan(dir, 'ean13neagro.json');

    EanModel ean8agroModel = getDataEan(dir, 'ean8agro.json');

    EanModel ean8NEagroModel = getDataEan(dir, 'ean8neagro.json');

    // ean 13 parsing

    if (agroModel.firmy != null) {
      for (Firmy firmy in agroModel.firmy!) {
        seznamFirem.add(FirmaData(
          kod: firmy.kod!,
          nazev: firmy.nazev!,
          holding: HoldingType.holding,
          pozn: firmy.pozn,
          struktura: firmy.struktura,
          retezec: (firmy.retezec ?? 0) > 0,
        ));
      }
    }

    if (neagroModel.firmy != null) {
      for (Firmy firmy in neagroModel.firmy!) {
        seznamFirem.add(FirmaData(
          kod: firmy.kod!,
          nazev: firmy.nazev!,
          holding: HoldingType.mimoHolding,
          pozn: firmy.pozn,
          struktura: firmy.struktura,
          retezec: (firmy.retezec ?? 0) > 0,
        ));
      }
    }

    // ean 8 parsing

    if (ean8agroModel.firmy != null) {
      for (Firmy firmy in ean8agroModel.firmy!) {
        seznamFirem.add(FirmaData(
          kod: firmy.kod!,
          nazev: firmy.nazev!,
          holding: HoldingType.holding,
          pozn: firmy.pozn,
          struktura: firmy.struktura,
          retezec: (firmy.retezec ?? 0) > 0,
        ));

        // u EAN8 je zajimavy API: "pocet [int] - pokud jde o spojity blok carovych kodu inkrementalne ocislovanych, zde je velikost bloku"
        if (firmy.pocet != null) {
          int iKod = int.parse(firmy.kod!);
          for (int i = 0; i < firmy.pocet!; i++) {
            String sKod = (iKod + i).toString();
            seznamFirem.add(FirmaData(
              kod: sKod,
              nazev: firmy.nazev!,
              holding: HoldingType.holding,
              pozn: firmy.pozn,
              struktura: firmy.struktura,
              retezec: (firmy.retezec ?? 0) > 0,
            ));
          }
        }
      }
    }

    if (ean8NEagroModel.firmy != null) {
      for (Firmy firmy in ean8NEagroModel.firmy!) {
        seznamFirem.add(FirmaData(
          kod: firmy.kod!,
          nazev: firmy.nazev!,
          holding: HoldingType.mimoHolding,
          pozn: firmy.pozn,
          struktura: firmy.struktura,
          retezec: (firmy.retezec ?? 0) > 0,
        ));

        // u EAN8 je zajimavy API: "pocet [int] - pokud jde o spojity blok carovych kodu inkrementalne ocislovanych, zde je velikost bloku"
        if (firmy.pocet != null) {
          int iKod = int.parse(firmy.kod!);
          for (int i = 0; i < firmy.pocet!; i++) {
            String sKod = (iKod + i).toString();
            seznamFirem.add(FirmaData(
              kod: sKod,
              nazev: firmy.nazev!,
              holding: HoldingType.mimoHolding,
              pozn: firmy.pozn,
              struktura: firmy.struktura,
              retezec: (firmy.retezec ?? 0) > 0,
            ));
          }
        }
      }
    }
  } catch (e) {
    throw ('Error loading EAN data: $e');
  }

  return seznamFirem;
}

Future<List<FirmaData>> loadPrivateLabels(String privateCompany) async {
  final dir = await getApplicationDocumentsDirectory();
  List<FirmaData> seznamFirem = [];

  try {
    priv.PrivateModel privateModel = getDataPriv(dir, '$privateCompany.json');

    // private parsing

    if (privateModel.firmy != null) {
      for (priv.Firmy firmy in privateModel.firmy!) {
        seznamFirem.add(FirmaData(
          kod: firmy.kod!,
          nazev: firmy.produkt!,
          holding: firmy.holding == 1
              ? HoldingType.holding
              : HoldingType.mimoHolding,
          pozn: firmy.vyrobce!,
        ));
      }
    }
  } catch (e) {
    throw ('Chyba při načítání dat: $e');
  }
  return seznamFirem;
}
