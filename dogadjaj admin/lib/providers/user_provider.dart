import 'dart:convert';
import 'package:dogadjaj_ba/models/user.dart';
import 'package:dogadjaj_ba/providers/baseprovider.dart';

class UserProvider extends BaseProvider<User> {
  UserProvider() : super('User');
  User? user;

//  Future<T> insert(dynamic request) async {
//     var url = "$_baseUrl$_endpoint";
//     var uri = Uri.parse(url);
//     var headers = createHeaders();

//     var jsonRequest = jsonEncode(request);
//     var response = await http.post(uri, headers: headers, body: jsonRequest);

//     if (isValidResponse(response)) {
//       var data = jsonDecode(response.body);
//       return fromJson(data);
//     } else {
//       throw new Exception("Unknown error");
//     }
//   }

  Future<List<User>> getAll() async {
    var url = 'http://localhost:7056/User'; // Replace with your API endpoint
    var uri = Uri.parse(url);

    Map<String, String> headers = createHeaders();
    headers['Content-Type'] = 'application/json';

    try {
      var response = await http!.get(uri, headers: headers);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as List<dynamic>;
        List<User> users = data.map((json) => User.fromJson(json)).toList();
        return users;
      } else {
        print('Error fetching users. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return []; // Return an empty list in case of an error
      }
    } catch (e) {
      print('Exception during API call: $e');
      return []; // Return an empty list in case of an exception
    }
  }

  Future<User> loginAsync(String username, String password) async {
    var url = 'http://localhost:7056/User/login';
    var uri = Uri.parse(url);
    print(url);
    print(uri);
    print(username);
    print(password);

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
      print(response.body);
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

  @override
  User fromJson(data) {
    return User.fromJson(data);
  }

  // Future<dynamic> insertUser(dynamic resource) async {
  //   // Convert the User object to JSON
  //     var uri = Uri.parse('$apiUrl/User');
  //    var jsonRequest = jsonEncode(resource);
  //      var response = await http!.post(uri, body: jsonRequest);

  //      if (response.statusCode == 200) {
  //     var data = jsonDecode(response.body);
  //     }
  //   // Call the insert method from the base class
  //   // return await insert(jsonRequest);
  // }
}
