import 'package:dio/dio.dart';
import 'models/welcome_model.dart';  // Import model JSON yang sudah dibuat

class ApiService {
  final Dio dio = Dio();

  Future<Welcome> fetchData() async {
    try {
      final response = await dio.get('https://my-json-server.typicode.com/Fallid/codelab-api/db');
      return Welcome.fromJson(response.data);  // Menggunakan model untuk parse JSON
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }
}
