import 'package:supabase_flutter/supabase_flutter.dart';

class SearchPageViewModel {
  Future<Map<String, dynamic>> getdata() async {
    Map<String, dynamic> listData = {};
    await Supabase.instance.client
        .from('search')
        .select('name_search,products_id')
        .then((value) {
      for (var e in value) {
        listData.addAll({e['name_search']: e['products_id']});
      }
    });
    return listData;
  }

  Future<List<Map<String, dynamic>>> search(String query) async {
    List<Map<String, dynamic>> result = [];
    if (query == '') return List.empty();
    await getdata().then((list) {
      list.forEach((key, value) {
        // print('$key:$value');

        if (key.toLowerCase().startsWith(query.toLowerCase())) {
          result.add({key: value});
        }
        // print(result);
      });
    });
    return result;
  }
}
