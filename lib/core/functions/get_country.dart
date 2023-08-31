String getCountry(String barcode) {
  String strCountryCode = barcode.length > 2 ? barcode.substring(0, 3) : "000";
  return iCodeList[int.parse(strCountryCode)];
}

final List<String> iCodeList = generateICodes();

List<String> generateICodes() {
  List<String> list = List.filled(1000, "Neznámý kód země", growable: false);

  void insertICodes({
    required int start,
    required int end,
    required String country,
  }) {
    list.fillRange(start, end + 1, country);
  }

  insertICodes(
    start: 0,
    end: 19,
    country: "USA / Kanada",
  );
  insertICodes(
    start: 20,
    end: 29,
    country: "neznámá, lokální užití",
  );
  insertICodes(
    start: 30,
    end: 39,
    country: "USA / Kanada",
  );
  insertICodes(
    start: 40,
    end: 49,
    country: "Zpravidla používá se vnitřní účely obchodního řetězce",
  );
  insertICodes(
    start: 50,
    end: 59,
    country: "Zpravidla používá se vnitřní účely obchodního řetězce",
  );
  insertICodes(
    start: 60,
    end: 139,
    country: "USA / Kanada",
  );
  insertICodes(
    start: 200,
    end: 299,
    country: "USA / Kanada",
  );
  insertICodes(
    start: 300,
    end: 379,
    country: "Francie",
  );
  insertICodes(
    start: 380,
    end: 380,
    country: "Bulharsko",
  );
  insertICodes(
    start: 383,
    end: 383,
    country: "Slovinsko",
  );
  insertICodes(
    start: 385,
    end: 385,
    country: "Chorvatsko",
  );
  insertICodes(
    start: 387,
    end: 387,
    country: "Bosna a Hercegovina",
  );
  insertICodes(
    start: 400,
    end: 440,
    country: "Německo",
  );
  insertICodes(
    start: 450,
    end: 459,
    country: "Japonsko",
  );
  insertICodes(
    start: 460,
    end: 469,
    country: "Rusko",
  );
  insertICodes(
    start: 470,
    end: 470,
    country: "Kyrgyzstán",
  );
  insertICodes(
    start: 471,
    end: 471,
    country: "Tchaj-wan",
  );
  insertICodes(
    start: 474,
    end: 474,
    country: "Estonsko",
  );
  insertICodes(
    start: 475,
    end: 475,
    country: "Lotyšsko",
  );
  insertICodes(
    start: 476,
    end: 476,
    country: "Azerbajdžán",
  );
  insertICodes(
    start: 477,
    end: 477,
    country: "Litva",
  );
  insertICodes(
    start: 478,
    end: 478,
    country: "Uzbekistán",
  );
  insertICodes(
    start: 479,
    end: 479,
    country: "Srbsko",
  );
  insertICodes(
    start: 480,
    end: 480,
    country: "Uzbekistán",
  );
  insertICodes(
    start: 481,
    end: 481,
    country: "Tádžikistán",
  );
  insertICodes(
    start: 482,
    end: 482,
    country: "Arménie",
  );
  insertICodes(
    start: 483,
    end: 483,
    country: "Gruzie",
  );
  insertICodes(
    start: 484,
    end: 484,
    country: "Arménie",
  );
  insertICodes(
    start: 485,
    end: 485,
    country: "Uzbekistán",
  );
  insertICodes(
    start: 486,
    end: 486,
    country: "Gruzie",
  );
  insertICodes(
    start: 487,
    end: 487,
    country: "Kazachstán",
  );
  insertICodes(
    start: 488,
    end: 488,
    country: "Tádžikistán",
  );
  insertICodes(
    start: 489,
    end: 489,
    country: "Hong Kong",
  );
  insertICodes(
    start: 490,
    end: 499,
    country: "Japonsko",
  );
  insertICodes(
    start: 500,
    end: 509,
    country: "Spojené království",
  );
  insertICodes(
    start: 520,
    end: 520,
    country: "Řecko",
  );
  insertICodes(
    start: 528,
    end: 528,
    country: "Libanon",
  );
  insertICodes(
    start: 529,
    end: 529,
    country: "Kypr",
  );
  insertICodes(
    start: 530,
    end: 530,
    country: "Albánie",
  );
  insertICodes(
    start: 531,
    end: 531,
    country: "Makedonie",
  );
  insertICodes(
    start: 535,
    end: 535,
    country: "Malta",
  );
  insertICodes(
    start: 539,
    end: 539,
    country: "Irsko",
  );
  insertICodes(
    start: 540,
    end: 549,
    country: "Belgie a Lucembursko",
  );
  insertICodes(
    start: 560,
    end: 560,
    country: "Portugalsko",
  );
  insertICodes(
    start: 569,
    end: 569,
    country: "Island",
  );
  insertICodes(
    start: 570,
    end: 579,
    country: "Dánsko, Finsko, Norsko a Island",
  );
  insertICodes(
    start: 590,
    end: 590,
    country: "Polsko",
  );
  insertICodes(
    start: 594,
    end: 594,
    country: "Rumunsko",
  );
  insertICodes(
    start: 599,
    end: 599,
    country: "Maďarsko",
  );
  insertICodes(
    start: 600,
    end: 601,
    country: "Jihoafrická republika",
  );
  insertICodes(
    start: 603,
    end: 603,
    country: "Ghana",
  );
  insertICodes(
    start: 608,
    end: 608,
    country: "Bahrajn",
  );
  insertICodes(
    start: 609,
    end: 609,
    country: "Mauricius",
  );
  insertICodes(
    start: 611,
    end: 611,
    country: "Maroko",
  );
  insertICodes(
    start: 613,
    end: 613,
    country: "Alžírsko",
  );
  insertICodes(
    start: 615,
    end: 615,
    country: "Nigérie",
  );
  insertICodes(
    start: 616,
    end: 616,
    country: "Keňa",
  );
  insertICodes(
    start: 617,
    end: 617,
    country: "Kamerun",
  );
  insertICodes(
    start: 618,
    end: 618,
    country: "Ivory Coast",
  );
  insertICodes(
    start: 619,
    end: 619,
    country: "Tunisko",
  );
  insertICodes(
    start: 620,
    end: 620,
    country: "Tanzanie",
  );
  insertICodes(
    start: 621,
    end: 621,
    country: "Syrie",
  );
  insertICodes(
    start: 622,
    end: 622,
    country: "Egypt",
  );
  insertICodes(
    start: 623,
    end: 623,
    country: "Brunej",
  );
  insertICodes(
    start: 624,
    end: 624,
    country: "Libye",
  );
  insertICodes(
    start: 625,
    end: 625,
    country: "Jordánsko",
  );
  insertICodes(
    start: 626,
    end: 626,
    country: "Irák",
  );
  insertICodes(
    start: 627,
    end: 627,
    country: "Kuvajt",
  );
  insertICodes(
    start: 628,
    end: 628,
    country: "Spojené arabské emiráty",
  );
  insertICodes(
    start: 629,
    end: 629,
    country: "Spojené arabské emiráty",
  );
  insertICodes(
    start: 640,
    end: 649,
    country: "Finsko",
  );
  insertICodes(
    start: 690,
    end: 699,
    country: "Čína",
  );
  insertICodes(
    start: 700,
    end: 709,
    country: "Norsko",
  );
  insertICodes(
    start: 729,
    end: 729,
    country: "Izrael",
  );
  insertICodes(
    start: 730,
    end: 739,
    country: "Švédsko",
  );
  insertICodes(
    start: 740,
    end: 740,
    country: "Guatemala",
  );
  insertICodes(
    start: 741,
    end: 741,
    country: "Salvador",
  );
  insertICodes(
    start: 742,
    end: 742,
    country: "Honduras",
  );
  insertICodes(
    start: 743,
    end: 743,
    country: "Kostarika",
  );
  insertICodes(
    start: 744,
    end: 744,
    country: "Nicaragua",
  );
  insertICodes(
    start: 745,
    end: 745,
    country: "Panama",
  );
  insertICodes(
    start: 746,
    end: 746,
    country: "Dominikánská republika",
  );
  insertICodes(
    start: 750,
    end: 750,
    country: "Mexiko",
  );
  insertICodes(
    start: 754,
    end: 755,
    country: "Kanada",
  );
  insertICodes(
    start: 759,
    end: 759,
    country: "Venezuela",
  );
  insertICodes(
    start: 760,
    end: 769,
    country: "Švýcarsko",
  );
  insertICodes(
    start: 770,
    end: 771,
    country: "Kolumbie",
  );
  insertICodes(
    start: 773,
    end: 773,
    country: "Uruguay",
  );
  insertICodes(
    start: 775,
    end: 775,
    country: "Peru",
  );
  insertICodes(
    start: 777,
    end: 777,
    country: "Bolívie",
  );
  insertICodes(
    start: 779,
    end: 779,
    country: "Argentina",
  );
  insertICodes(
    start: 780,
    end: 780,
    country: "Chile",
  );
  insertICodes(
    start: 784,
    end: 784,
    country: "Paraguay",
  );
  insertICodes(
    start: 786,
    end: 786,
    country: "Ecuador",
  );
  insertICodes(
    start: 789,
    end: 790,
    country: "Brasil",
  );
  insertICodes(
    start: 800,
    end: 839,
    country: "Itálie",
  );
  insertICodes(
    start: 840,
    end: 849,
    country: "Španělsko",
  );
  insertICodes(
    start: 850,
    end: 850,
    country: "Kuba",
  );
  insertICodes(
    start: 858,
    end: 858,
    country: "Slovensko",
  );
  insertICodes(
    start: 859,
    end: 859,
    country: "Česká republika",
  );
  insertICodes(
    start: 860,
    end: 860,
    country: "Srbsko",
  );
  insertICodes(
    start: 865,
    end: 865,
    country: "Mongolsko",
  );
  insertICodes(
    start: 867,
    end: 867,
    country: "Severní Korea",
  );
  insertICodes(
    start: 868,
    end: 869,
    country: "Turecko",
  );
  insertICodes(
    start: 870,
    end: 879,
    country: "Nizozemsko",
  );
  insertICodes(
    start: 880,
    end: 880,
    country: "Jižní Korea",
  );
  insertICodes(
    start: 884,
    end: 884,
    country: "Kambodža",
  );
  insertICodes(
    start: 885,
    end: 885,
    country: "Thajsko",
  );
  insertICodes(
    start: 888,
    end: 888,
    country: "Singapur",
  );
  insertICodes(
    start: 890,
    end: 890,
    country: "Indie",
  );
  insertICodes(
    start: 893,
    end: 893,
    country: "Vietnam",
  );
  insertICodes(
    start: 896,
    end: 896,
    country: "Pakistan",
  );
  insertICodes(
    start: 899,
    end: 899,
    country: "Indonésie",
  );
  insertICodes(
    start: 900,
    end: 919,
    country: "Rakousko",
  );
  insertICodes(
    start: 930,
    end: 939,
    country: "Austrálie",
  );
  insertICodes(
    start: 940,
    end: 949,
    country: "Nový Zéland",
  );
  insertICodes(
    start: 950,
    end: 950,
    country: "EPCglobal",
  );
  insertICodes(
    start: 951,
    end: 951,
    country: "Národní kódy",
  );
  insertICodes(
    start: 952,
    end: 952,
    country: "Národní kódy",
  );
  insertICodes(
    start: 953,
    end: 953,
    country: "Národní kódy",
  );
  insertICodes(
    start: 954,
    end: 954,
    country: "Národní kódy",
  );
  insertICodes(
    start: 955,
    end: 955,
    country: "Malajsie",
  );
  insertICodes(
    start: 956,
    end: 956,
    country: "Národní kódy",
  );
  insertICodes(
    start: 957,
    end: 957,
    country: "Národní kódy",
  );
  insertICodes(
    start: 958,
    end: 958,
    country: "Makao",
  );
  insertICodes(
    start: 959,
    end: 959,
    country: "Národní kódy",
  );
  insertICodes(
    start: 960,
    end: 961,
    country: "GS1",
  );
  insertICodes(
    start: 962,
    end: 962,
    country: "GS1",
  );
  insertICodes(
    start: 963,
    end: 963,
    country: "GS1",
  );
  insertICodes(
    start: 964,
    end: 964,
    country: "GS1",
  );
  insertICodes(
    start: 965,
    end: 965,
    country: "GS1",
  );
  insertICodes(
    start: 966,
    end: 966,
    country: "GS1",
  );
  insertICodes(
    start: 967,
    end: 967,
    country: "GS1",
  );
  insertICodes(
    start: 968,
    end: 968,
    country: "GS1",
  );
  insertICodes(
    start: 969,
    end: 969,
    country: "GS1",
  );
  insertICodes(
    start: 977,
    end: 977,
    country: "seriálové publikace (ISSN)",
  );
  insertICodes(
    start: 978,
    end: 979,
    country: "knihy (ISBN)",
  );
  insertICodes(
    start: 980,
    end: 980,
    country: "vratná účtenka",
  );
  insertICodes(
    start: 981,
    end: 983,
    country: "platební poukázka",
  );
  insertICodes(
    start: 990,
    end: 999,
    country: "poukázka",
  );

  return list;
}
