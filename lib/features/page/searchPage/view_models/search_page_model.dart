import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const apiKey = 'AIzaSyCS715_Ulmnkk3UGfYPaweLHd7iFKPIFNU';

class SearchPageViewModel {
  Future<List<Map<String, dynamic>>> search(String query) async {
    List<Map<String, dynamic>> result = [];
    if (query == '') return List.empty();
    await Supabase.instance.client
        .from('search')
        .select('name_search,products_id')
        .like('name_search', '${query.toLowerCase()}%')
        .then((list) {
      for (var e in list) {
        result.add({e['name_search']: e['products_id']});
      }
    });
    // print(result);

    return result;
  }

  Future<List<dynamic>> searchWithCameraAndGallery(String? query) async {
    List<dynamic> listId = [];
    List<dynamic> result = [];
    if (query == 'null') {
      return List.empty();
    } else {
      await Supabase.instance.client
          .from('search')
          .select('name_search,products_id')
          .like('name_search', '${query!.toLowerCase()}%')
          .then((list) {
        for (var e in list) {
          result.add(e['products_id']);
        }
        listId = result.expand((element) => element).toSet().toList();
      });
    }
    // print(result);

    return listId;
  }

  Future<String?> generateAi(File? imagePick) async {
    final model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: apiKey,
    );

    final (firstImage) = await File(imagePick!.path).readAsBytes();

    final prompt = TextPart(
        "Returns the name of the product type in the image in Vietnamese. If there is no product in the image, it only returns the word null");
    final imageParts = [
      DataPart('image/jpeg', firstImage),
    ];
    final response = await model.generateContent([
      Content.multi([prompt, ...imageParts])
    ]);
    return response.text;
  }

  Future<File?> pickImage(ImageSource imageSource) async {
    File? imagePick;
    try {
      final imageFilePick = await ImagePicker().pickImage(source: imageSource);
      if (imageFilePick == null) {
        imagePick = null;

        return imagePick;
      }
      final imageTemporary = File(imageFilePick.path);

      imagePick = imageTemporary;
      return imagePick;
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
    return null;
  }
}
