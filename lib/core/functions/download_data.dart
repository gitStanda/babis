import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

final dio = Dio();

Future<bool> downloadData() async {
  var dir = (await getApplicationDocumentsDirectory()).path;

  List<String> urls = [
    'https://api.npoint.io/787fcb1034ae1267704b', // ean13 agro
    'https://api.npoint.io/d9b2e38d54f80a17b3a6', // ean13 neagro
    'https://api.npoint.io/930f3ecd2c04f04a0b36', // ean8 agro
    'https://api.npoint.io/28601550eca10717067f', // ean8 neagro
    'https://api.npoint.io/b73de7e440f376f0a5e1', // albert
    'https://api.npoint.io/c01ed3a3f4a2eb957516', // Billa
    'https://api.npoint.io/8151650758dcbc1d08c0', // Globus
    'https://api.npoint.io/9951aa444f1e8bc75df4', // Kaufland
    'https://api.npoint.io/779941dbe972da8c8d8f', // Lidl
    'https://api.npoint.io/91f12e3d2005b55a2b74', // Norma
    'https://api.npoint.io/cef263d4cc5aae2cbb9b', // Penny
    'https://api.npoint.io/1f5cfddc28407c80ed3e', // Tesco
    'https://api.npoint.io/5bd8a928a1ab49f5bf54', // verze dat
  ];

  List<String> filePaths = [
    'ean13agro.json',
    'ean13neagro.json',
    'ean8agro.json',
    'ean8neagro.json',
    'Albert.json',
    'Billa.json',
    'Globus.json',
    'Kaufland.json',
    'Lidl.json',
    'Norma.json',
    'Penny.json',
    'Tesco.json',
    'data_version_local.json',
    // Add more file paths here
  ];

  for (int index = 0; index < urls.length; index++) {
    try {
      String url = urls[index];
      String filePath = filePaths[index];

      var response = await dio.download(
        url,
        "$dir/$filePath",
      );

      if (response.statusCode != 200) {
        return false;
      }
    } catch (error) {
      return false;
    }
  }
  return true;
}
