
import 'package:abwab_learning_path/network/exports.dart';
import 'package:dio/dio.dart';

import '../../exports.dart';

class LearningPathRepository {

  Future<ApiResponse<List<LearningPathModel>>> getLearningPaths() async {
    ApiResponse<List<LearningPathModel>> result =
        ApiResponse<List<LearningPathModel>>();

    // response of network from /users endpoint
    Response response = await NetworkHelper().get('users');
    result.statusCode = response.statusCode;
    if (result.statusCode == 200) {
      // extract data and convert to list
      final learningPathList = List<LearningPathModel>.from(
          response.data!.map((e) => LearningPathModel.fromMap(e)));
      result.data = learningPathList;
    } else {
      result.message = response.statusMessage;
    }
    return result;
  }
}
