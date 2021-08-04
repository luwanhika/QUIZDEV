import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../shared/models/quiz_model.dart';
import '../shared/models/user_model.dart';

class HomeRepository {
  FlutterSecureStorage storage = FlutterSecureStorage();
  final String userKey = 'USER_KEY';

  Future<bool> saveUser(
    UserModel user,
  ) async {
    try {
      await storage.write(
        key: userKey,
        value: json.encode(user.toJson()),
      );
      return true;
    } on Exception {
      return false;
    }
  }

  Future<UserModel> getUser() async {
    try {
      var userMap = await storage.read(
        key: userKey,
      );

      return userMap != null
          ? UserModel.fromJson(json.decode(userMap))
          : UserModel(); // pode substituir por null depois
    } on Exception {
      return UserModel();

      /// Pode substituir por null depois
    }
  }

  Future<List<QuizModel>> getQuizzes() async {
    final response =
        await rootBundle.loadString('assets/database/quizzes.json');
    final list = jsonDecode(response) as List;
    final quizzes = list.map((e) => QuizModel.fromMap(e)).toList();
    return quizzes;
  }
}
