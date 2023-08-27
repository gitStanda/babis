import 'package:babisappka/core/models/data_version_model.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<DataVersionModel?> loadLocalDataVersion(var dir, String fileName) async {
  try {
    File jsonFile = File('$dir/$fileName');
    String jsonData = jsonFile.readAsStringSync();
    final parsedJson = jsonDecode(jsonData);
    DataVersionModel localDataVersion = DataVersionModel.fromJson(parsedJson);
    return localDataVersion;
  } catch (error) {
    return null;
  }
}

final dio = Dio();

Future<bool> isNewVersion() async {
  var dir = (await getApplicationDocumentsDirectory()).path;

  DataVersionModel? localDataVersion = await loadLocalDataVersion(dir, 'data_version_local.json');

  // pokud jeste verze nikdy nebyla stazena
  if (localDataVersion == null) {
    return false;
  }

  try {
    String url = 'https://api.npoint.io/5bd8a928a1ab49f5bf54';
    String fileName = 'data_version.json';

    await dio.download(
      url,
      "$dir/$fileName",
    );

    // nacist stazenou verzi
    String newContents = await File('$dir/$fileName').readAsString();
    Map<String, dynamic> newJsonMap = json.decode(newContents);
    DataVersionModel newDataVersion = DataVersionModel.fromJson(newJsonMap);

    // porovnat novou a starou verzi
    if (localDataVersion.datum != newDataVersion.datum) {
      return true;
    }
  } catch (error) {
    throw ("Chyba pri porovnavani / stahovani verze: $error");
  }

  return false; // TODO po testovani zmenit na false
}
