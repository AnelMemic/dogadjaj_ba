import 'dart:convert';

import 'package:dogadjaj_ba/helpers/constants.dart';
import 'package:dogadjaj_ba/models/post.dart';
import 'baseprovider.dart';

class PostProvider extends BaseProvider<Post> {
  PostProvider() : super("Post");

  @override
  Post fromJson(data) {
    return Post.fromJson(data);
  }
   var url = '$apiUrl/Post';
  
  Future<Post> addPost(Post post) async {
    var uri = Uri.parse(url);


    Map<String, String> headers = createHeaders();
    headers['Content-Type'] = 'application/json';

    var jsonRequest = jsonEncode(post.toJson());

    var response = await http!.post(uri, headers: headers, body: jsonRequest);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return fromJson(data);
    } else {
      throw Exception(
          'Failed to add post. Status Code: ${response.statusCode}, Response: ${response.body}');
    }
  }

   Future<bool> insertTickets(Post ticket) async {
    final requestBody = jsonEncode(ticket.toJson());
    final response = await http!.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: requestBody,
    );

   
    print('Request: $requestBody'); // Log the request
    print('Response status: ${response!.statusCode}');
    print('Response body: ${response.body}');

    if (response!.statusCode == 201 || response.statusCode == 200) {
      return true;
    } else {
      // Log the error without throwing an exception
      print('Failed to insert post: ${response.body}');
      return false;
    }
  }

        Future<bool> updateTicket(Post post) async {
    final response = await http?.put(
      Uri.parse('$url${post.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(post.toJson()),
    );

    return response!.statusCode == 200;
  }

  Future<dynamic> insertPost(dynamic resource) async {
    var uri = Uri.parse(url);
    var jsonRequest = jsonEncode(resource);
    var response = await http!.post(uri, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }, body: jsonRequest);

    if (response.statusCode == 200) {
      return "OK";
    } else {
      throw Exception('Greška prilikom unosa');
    }
  }

  Future<List<Post>> getAll() async {
    var uri = Uri.parse(url);

    Map<String, String> headers = createHeaders();
    headers['Content-Type'] = 'application/json';

    try {
      var response = await http!.get(uri, headers: headers);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as List<dynamic>;
        List<Post> users = data.map((json) => Post.fromJson(json)).toList();
        return users;
      } else {
        print('Error fetching posts. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return [];
      }
    } catch (e) {
      print('Exception during API call: $e');
      return [];
    }
  }
  



    

 Future<bool> updatePost(int eventId, Post event) async {
    final response = await http!.put(
      Uri.parse('$url/$eventId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(event.toJson()),
    );

   

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  

}


