import 'package:dio/dio.dart';
import 'package:get/get.dart';

class APIHelper extends GetxController {
  final Mail = <dynamic>['Leading...'].obs;
  final Massage = <dynamic>[].obs;
  final Dio _dio = Dio();
  final username = "".obs;
  final domain = "".obs;

  Future<dynamic> getMail() async {
    try {
      final response = await _dio.get(
        'https://www.1secmail.com/api/v1/?action=genRandomMailbox&count=1',
      );
      if (response.statusCode == 200) {
        Mail.value = response.data;
        List<dynamic> parts = Mail[0].split("@");
        username.value = parts[0];
        domain.value = parts[1];
        Massage.value = [];
      } else {
        print(response.statusCode);
      }
    } on DioException catch (e) {
      print(e.message);
    }
  }

  Future<dynamic> getSMS() async {
    try {
      final response = await _dio.get(
        'https://www.1secmail.com/api/v1/?action=getMessages&login=${username}&domain=${domain}',
      );
      if (response.statusCode == 200) {
        Massage.value = response.data;
      }
    } on DioException catch (e) {
      print(e.message);
    }
  }

  @override
  void dispose() {
    Mail.value = [];
    Massage.value = [];
    username.value = "";
    domain.value = "";

    super.dispose();
  }
}
