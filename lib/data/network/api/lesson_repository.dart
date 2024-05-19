import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:lessonscheduleandroid/data/services/api_service.dart';

class ChatRepository {
  final ApiService _apiService = ApiService();

  /// Gets suggested lesson schedule from api with given [data]
  Future<Response> getLessonSchedule(data) async {
    try {
      final Response response = await _apiService
          .post("${_apiService.baseUrl}/ders_plani", data: data);
      return response;
    } on DioException catch (e) {
      log("Dio Error: ${e.message}");
      rethrow;
    } catch (e) {
      log("Error: $e");
      rethrow;
    }
  }
}
