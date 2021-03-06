import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:image/image.dart';
import 'package:path_provider/path_provider.dart';

class FileService {
//Get local folder
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    //Directory appDocDir = await getApplicationDocumentsDirectory();
    return directory.path;
  }

//Get local file
  static Future<File> _localFile(String fileName) async {
    final path = await _localPath;
    return File('$path/' + fileName);
  }

  static Future<File> downloadFileVideo(String url, String filename) async {
    String extension = ".mp4";

    File file = await _localFile(filename + extension);
    if (file.existsSync()) {
      return file;
    } else {
      http.Client client = new http.Client();
      try {
        var req = await client.get(Uri.parse(url));
        if (req.statusCode == 200) {
          var bytes = req.bodyBytes;
          //final file = await _localFile(filename + extension);
          await file.writeAsBytes(bytes);
          client.close();
          return file;
        } else {
          client.close();
          throw Exception(
              'Failed to Download Video . Network connection failed . filename : ' +
                  filename);
        }
      } catch (e) {
        throw Exception(
            'Failed to Download Video . Network connection failed . filename : ' +
                filename);
      }
    }
  }

  static Future<File> writeImageFile(File file, String fileName) async {
    final path = await _localPath;
    // file.rename('$path' + fileName);

    final image = decodeImage(file.readAsBytesSync());

    // Resize the image to a 220x? thumbnail (maintaining the aspect ratio).
    final thumbnail = copyResize(image, width: 220);

    // Save the thumbnail as a JPG.
    File('$path/' + fileName).writeAsBytesSync(encodePng(thumbnail));

    return file;
  }

//Write
  static Future<File> writeFile(String fileName, String content) async {
    final file = await _localFile(fileName);
    // Write the file.
    return file.writeAsString('$content');
  }

  static Future<String> readFile(String fileName) async {
    try {
      final file = await _localFile(fileName);
      // Read the file
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      // If encountering an error, return 0
      throw Exception('Failed to read file ' + fileName);
    }
  }

  static Future<Map<String, dynamic>> getJson(String fileName) async {
    try {
      final file = await _localFile(fileName);

      // Read the file
      String contents = await file.readAsString();

      //Convert to json
      Map<String, dynamic> jsoncontents = json.decode(contents);

      return jsoncontents;
    } catch (e) {
      // If encountering an error, return 0
      //  throw Exception('Failed to get json, file ' + fileName + ' | ' + e.toString());
    }
  }
}
