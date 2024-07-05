import 'dart:convert';
import 'package:mobile/constants.dart';
import 'package:mobile/models/user.dart';
import 'package:mobile/providers/base_provider.dart';

class UserProvider extends BaseProvider<User> {
  UserProvider() : super('User');
  User? user;


  Future<User> loginAsync(String username, String password) async {
    var url = '$apiUrl/User/login';
    var uri = Uri.parse(url);

    Map<String, String> headers = createHeaders();
    headers['Content-Type'] = 'application/json';

    var request = <String, String>{
      'username': username,
      'password': password,
    };
    var jsonRequest = jsonEncode(request);

    var response = await http!.post(uri, headers: headers, body: jsonRequest);
    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      user = User.fromJson(data);
      notifyListeners();
      return user!;
    } else {
      throw Exception(response.body);
    }
  }

  Future<User> getUserById(int id, [dynamic additionalData]) async {
    var url = '$apiUrl/User/$id';
    var uri = Uri.parse(url);

    Map<String, String> headers = createHeaders();
    headers['Content-Type'] = 'application/json';

    var request = <String, String>{
      'id': id.toString(),
    };
    var jsonRequest = jsonEncode(request);

    var response = await http!.get(uri, headers: headers);
    print(response.body);


    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      user = User.fromJson(data);
      notifyListeners();
      return user!;
    } else {
      throw Exception(response.body);
    }
  }



  int? getUserId() {
    if (user != null) {
      return user!.id;
    }
    return null;
  }

   void logout() {
    user = null;
    notifyListeners();
  }

  @override
  User fromJson(data) {
    return User.fromJson(data);
  }
}
