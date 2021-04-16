import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  String fullName;
  int gender;
  String dateOfBirth;
  String email;
  String password;
  String confirmPassword;

  User({
    this.email,
    this.fullName,
    this.password,
    this.confirmPassword,
    this.gender,
    this.dateOfBirth,
  });

  Future<dynamic> readData() async {
    final url = Uri.parse('http://52.77.78.127:8002/user/read');
    try {
      Map<String, dynamic> _body = {"page": "0", "offset": "100"};

      http.Response response = await http.post(url, body: _body);
      final data = jsonDecode(response.body);
      return data;
    } catch (e) {
      print(e);
    }
  }

  void postData(Object body) async {
    final url = Uri.parse('http://52.77.78.127:8002/user/create');
    try {
      await http.post(
        url,
        body: body,
      );
    } catch (e) {
      print(e);
    }
  }
}
