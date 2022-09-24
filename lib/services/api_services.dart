import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import '../constants/api_constant.dart';
import '../model/user_model.dart';

class APIService {
  Future<List<UserModel>> getUser() async {
    Response response = await get(Uri.parse(API_BASE_URL+END_POINT+'1'));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map(((e) => UserModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

//API SERVICE Provider
final apiProvider = Provider<APIService>((ref) => APIService());

