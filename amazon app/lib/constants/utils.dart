import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



//make sure decode json
void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(context, jsonDecode(response.body)['msg']);
      break;
    case 500:
      showSnackBar(context, jsonDecode(response.body)['error']);
      break;
    default:
      showSnackBar(context, response.body);
  }
}

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

//
// Future<List<File>> pickImages() async {
//   List<File> images = [];
//   try {
//     var files = await FilePicker.platform.pickFiles(
//       type: FileType.image,
//       allowMultiple: true,
//     );
//     if (files != null && files.files.isNotEmpty) {
//       for (int i = 0; i < files.files.length; i++) {
//         images.add(File(files.files[i].path!));
//       }
//     }
//   } catch (e) {
//     debugPrint(e.toString());
//   }
//   return images;
// }



