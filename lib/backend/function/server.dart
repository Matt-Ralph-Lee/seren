import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/property/user_id.dart';

class Server {
  Server._internal();

  static final Server _cache = Server._internal();

  factory Server() => _cache;

  static const serverURL = "http://10.0.2.2:3000";

  Future<List<Map<String, dynamic>>> getStrangerUid({
    required final UserId userId,
    required final int numberOfStranger,
  }) async {
    final response = await http.post(
      Uri.parse("$serverURL/fetchUser"),
      body:
          json.encode({"uid": userId.value, "numberOfUsers": numberOfStranger}),
    );
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body)["result"];
      final strangers = (responseJson as List).map((res) {
        final strangerUid = UserId(res["uid"]);
        final likedBy = res["likedBy"];
        return {"strangerUid": strangerUid, "likedBy": likedBy};
      }).toList();
      return strangers;
    }
    return [];
  }
}
