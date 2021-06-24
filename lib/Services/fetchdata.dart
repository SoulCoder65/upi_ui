import 'dart:convert';

import 'package:http/http.dart' as http;
import '../Models/userInfo.dart';

Future<UserData> fetchUser() async {
try{
  final response = await http.get(Uri.parse('https://fakeface.rest/face/json'));

  if (response.statusCode == 200) {
    return UserData.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}catch (e)
  {
    print(e);
  }
}
