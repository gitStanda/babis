import 'package:babisappka/core/models/data_version_model.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<DataVersionModel?> loadLocalDataVersion() async {
  var dir = (await getApplicationDocumentsDirectory()).path;
  try {
    File jsonFile = File('$dir/data_version_local.json');
    String jsonData = jsonFile.readAsStringSync();
    final parsedJson = jsonDecode(jsonData);
    DataVersionModel localDataVersion = DataVersionModel.fromJson(parsedJson);
    return localDataVersion;
  } catch (error) {
    return null;
  }
}

Future<DataVersionModel?> getNewDataVersion() async {
  var dir = (await getApplicationDocumentsDirectory()).path;
  final dio = Dio();

  String url = 'https://api.npoint.io/5bd8a928a1ab49f5bf54';
  String fileName = 'data_version.json';

  var response = await dio.download(
    url,
    "$dir/$fileName",
  );

  if (response.statusCode != 200) {
    return null;
  }

  // nacist stazenou verzi
  String newContents = await File('$dir/$fileName').readAsString();
  Map<String, dynamic> newJsonMap = json.decode(newContents);
  DataVersionModel newDataVersion = DataVersionModel.fromJson(newJsonMap);
  return newDataVersion;
}

Future<bool> isNewVersion() async {
  var dir = (await getApplicationDocumentsDirectory()).path;

  DataVersionModel? localDataVersion = await loadLocalDataVersion();

  // pokud jeste verze nikdy nebyla stazena
  if (localDataVersion == null) {
    return false;
  }

  try {
    DataVersionModel? newDataVersion = await getNewDataVersion();

    // porovnat novou a starou verzi
    if (localDataVersion.datum != newDataVersion?.datum) {
      return true;
    }
  } catch (error) {
    throw ("Chyba pri porovnavani / stahovani verze: $error");
  }

  return false;
}
