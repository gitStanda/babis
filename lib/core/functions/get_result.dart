import 'package:babisappka/core/functions/load_data.dart';
import 'package:babisappka/core/functions/get_country.dart';

class ResultData {
  late String nazev;
  late String dodatek;
  String? zeme;

  late HoldingType holding;
}

List<FirmaData> seznamEanFirem = [];
List<FirmaData>? privatniZnackaAlbert;
List<FirmaData>? privatniZnackaBilla;
List<FirmaData>? privatniZnackaGlobus;
List<FirmaData>? privatniZnackaKaufland;
List<FirmaData>? privatniZnackaLidl;
List<FirmaData>? privatniZnackaNorma;
List<FirmaData>? privatniZnackaPenny;
List<FirmaData>? privatniZnackaTesco;
List<FirmaData>? privatniZnacka20;

Future<ResultData> getResultData(String barcode) async {
  if (seznamEanFirem.isEmpty) {
    seznamEanFirem = await loadEans();
  }

  FirmaData? firmaData = await getCompanyData(barcode);

  ResultData result = ResultData();

  // nenasla se zadna firma, vrati aspon zemi puvodu a pokud to neni CR, vrati "mimo holding"
  if (firmaData == null) {
    processCountry(barcode, result);
  } else {
    // pokud je to RETEZEC - albert, tesco, kaufland, atd...
    if (firmaData.retezec == true) {
      FirmaData? privZnacka = await getPrivatniZnacka(firmaData.nazev, barcode);

      // nasel se dodavatel tohoto produktu
      if (privZnacka != null) {
        // tady to je trochu prohozene aby to davalo smysl v aplikaci
        result.nazev = privZnacka.pozn!;
        result.dodatek = privZnacka.nazev;
        result.holding = privZnacka.holding;
      }
      // nenasel se dodavatel tohoto produktu
      else {
        result.nazev = "Obchodní řetězec ${firmaData.nazev}";
        result.dodatek =
            "Řetězce využívají různých dodavatelů. Pokuste se výrobce najít na obalu nebo se zkuste zeptat prodavače.";
        result.holding = HoldingType.nejasne;
      }
    }
    // pokud HOLDING
    else if (firmaData.retezec == false &&
        firmaData.holding == HoldingType.holding) {
      result.nazev = "AGROFERT - ${firmaData.nazev}";
      result.dodatek = firmaData.pozn ?? "";
      result.holding = HoldingType.holding;
    }
    // pokud NENI HOLDING
    else if (firmaData.retezec == false &&
        firmaData.holding == HoldingType.mimoHolding) {
      result.nazev = firmaData.nazev;
      result.dodatek = firmaData.pozn ?? "";
      result.holding = HoldingType.mimoHolding;
    }
    //
    else {
      result.nazev = firmaData.nazev;
      result.dodatek = firmaData.pozn ?? "";
      result.holding = firmaData.holding;
    }
  }

  return result;
}

Future<FirmaData?> getCompanyData(String barcode) async {
  FirmaData? nalezenaFirma;

  // vahove kody
  if (barcode.length > 2 &&
      (barcode.startsWith("29") ||
          barcode.startsWith("28") ||
          barcode.startsWith("27"))) {
    // NORMA ma 4 vahove kody co zacinaji na 27 stejne jako nektere priv20, je to vtip
  }
  // priv20 - privatni retezec co zacina na 20, z nejakeho duvodu nejsou uz v seznamu ean???
  if (barcode.length > 2 &&
      (barcode.startsWith("40") ||
          barcode.startsWith("27") ||
          barcode.startsWith("25") ||
          barcode.startsWith("20"))) {
    FirmaData? priv20firma = await getPriv20(barcode);
    if (priv20firma != null) return priv20firma;
  }

  // 8 and 13 EAN basic barcodes
  for (FirmaData firmaData in seznamEanFirem) {
    if (compLeft(firmaData.kod, barcode)) {
      nalezenaFirma = FirmaData.copy(firmaData);
      break;
    }
  }

  return nalezenaFirma;
}

// pokud byla nalezena firma v Ean seznamu ale spada pod retezec, toto vytahne vic detailu
Future<FirmaData?>? getPrivatniZnacka(String nazev, String barcode) async {
  List<FirmaData> privatniZnacka;

  if (nazev.contains("Albert")) {
    privatniZnackaAlbert ??= await loadPrivateLabels("Albert");
    privatniZnacka = privatniZnackaAlbert!;
  } else if (nazev.contains("Billa")) {
    privatniZnackaBilla ??= await loadPrivateLabels("Billa");
    privatniZnacka = privatniZnackaBilla!;
  } else if (nazev.contains("Globus")) {
    privatniZnackaGlobus ??= await loadPrivateLabels("Globus");
    privatniZnacka = privatniZnackaGlobus!;
  } else if (nazev.contains("Kaufland")) {
    privatniZnackaKaufland ??= await loadPrivateLabels("Kaufland");
    privatniZnacka = privatniZnackaKaufland!;
  } else if (nazev.contains("Lidl")) {
    privatniZnackaLidl ??= await loadPrivateLabels("Lidl");
    privatniZnacka = privatniZnackaLidl!;
  } else if (nazev.contains("Norma")) {
    privatniZnackaNorma ??= await loadPrivateLabels("Norma");
    privatniZnacka = privatniZnackaNorma!;
  } else if (nazev.contains("Penny")) {
    privatniZnackaPenny ??= await loadPrivateLabels("Penny");
    privatniZnacka = privatniZnackaPenny!;
  } else if (nazev.contains("Tesco")) {
    privatniZnackaTesco ??= await loadPrivateLabels("Tesco");
    privatniZnacka = privatniZnackaTesco!;
  } else {
    return null;
  }

  for (FirmaData firma in privatniZnacka) {
    if (compLeft(firma.kod, barcode)) {
      return firma;
    }
  }

  return null;
}

Future<FirmaData?>? getPriv20(String barcode) async {
  if (privatniZnacka20 == null) {
    // pouze tyto firmy maji priv 20 ean kody
    privatniZnacka20 = (await loadPrivate20("Albert"));
    privatniZnacka20!.addAll(await loadPrivate20("Globus"));
    privatniZnacka20!.addAll(await loadPrivate20("Lidl"));
    privatniZnacka20!.addAll(await loadPrivate20("Norma"));
    privatniZnacka20!.addAll(await loadPrivate20("Penny"));
  }

  for (FirmaData firma in privatniZnacka20!) {
    if (compLeft(firma.kod, barcode)) {
      return firma;
    }
  }

  return null;
}

// Pokud nebyla nalezena firma
ResultData processCountry(String barcode, ResultData result) {
  String zeme = getCountry(barcode);
  // je z Ceska
  if (zeme == "Česká republika") {
    result.nazev = "nezjištěná firma z ČR";
    result.zeme = "Česká republika";
    result.dodatek =
        "Kód výrobce není v seznamu firem holdingu. Pro jistotu se můžete pokusit najít jméno výrobce na obalu.";
    result.holding = HoldingType.nejasne;
  }
  // je z Ruska
  if (zeme == "Rusko") {
    result.nazev = "nezjištěná firma z Ruska";
    result.zeme = "Rusko";
    result.dodatek = "Tento produkt pochází z Ruska.";
    result.holding = HoldingType.putin;
  }
  // je privatni
  else if (zeme == "neznámá, lokální užití" || zeme == "privátní značka") {
    result.nazev = "privátní značka obchodního řetězce";
    result.dodatek =
        "Pod privátní značkou dodávají řetězcům zboží různí výrobci. Pokuste se výrobce najít na obalu nebo se zkuste zeptat prodavače.";
    result.holding = HoldingType.nejasne;
  }
  // je vahove
  else if (zeme == "váhový kód") {
    result.nazev = "váhový/kusový kód, neznámý dodavatel";
    result.dodatek =
        "Váhové/kusové kódy si tiskne každá prodejna sama, podle hmotnosti nebo variabilní ceny zboží. Pokuste se výrobce najít na obalu nebo se zkuste zeptat prodavače.";
    result.holding = HoldingType.nejasne;
  }
  // je jina
  else if (zeme == "neznámý kód země" ||
      zeme == "poukázka" ||
      zeme == "platební poukázka" ||
      zeme == "vratná účtenka" ||
      zeme == "knihy (ISBN)" ||
      zeme == "seriálové publikace (ISSN)" ||
      zeme == "GS1" ||
      zeme == "EPCglobal") {
    result.nazev = "podle kódu nelze identifikovat";
    result.dodatek = "Tento typ kódu neumožňuje identifikaci výrobce ani země.";
    result.holding = HoldingType.nejasne;
  }
  // je ze zahranici (vetsinou toto)
  else {
    result.nazev = "Nezjištěná firma";
    result.zeme = zeme;
    result.dodatek = "Cokoliv nezjištěného, co nepochází z ČR, by mělo být OK";
    result.holding = HoldingType.mimoHolding;
  }
  return result;
}

// funkce ktera porovna stringy a pokud jsou identicke vrati true,
// ale i za predpokladu ze S2 (realny barcode) je delsi nez S1 (barcode z jsonu)
bool compLeft(String s1, String s2) {
  if (s2.length < s1.length) {
    return false;
  }

  for (int i = 0; i < s1.length; i++) {
    if (s1[i] != s2[i]) {
      return false;
    }
  }

  return true;
}
