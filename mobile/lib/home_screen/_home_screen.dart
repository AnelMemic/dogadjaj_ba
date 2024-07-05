import 'package:flutter/material.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/custom%20widgets/logo_widget.dart';
import 'package:mobile/helpers/app_decoration.dart';
import 'package:mobile/helpers/error_dialog.dart';
import 'package:mobile/models/post.dart';
import 'package:mobile/providers/post_provider.dart';
import '../lists/event_types_list.dart';
import '../models/test_models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Post> posts = <Post>[];
  late PostProvider _postProvider;


 @override
  void initState() {
    super.initState();
    _postProvider = PostProvider();
    loadPosts();
  
  }
 

 void loadPosts() async {
    try {
      var Response =
          await _postProvider.get();
      setState(() {
        posts = Response;
      });
    } on Exception catch (e) {
      showErrorDialog(context, e.toString().substring(11));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LogoWidget(),
            gapH32,
            Container(
              width: double.infinity,
              height: 175,
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 94, 92, 92)),
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0, left: 30, right: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Događaji',
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Expanded(
                        child: EventTypesList(
                      eventTypes: eventTypes,
                    ))
                  ],
                ),
              ),
            ),
            gapH56,
            Container(
              width: double.infinity,
              height: 180,
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 94, 92, 92)),
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0, left: 30, right: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Uskoro',
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          scale: 5,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Home garden & interior design',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              Text(
                                'Sajam za Uredjenje Doma',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              Text(
                                'Mostar, 01.06.2023.',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
           _buildPosts(context),
            SizedBox(height: 10,),

          ],
        ),
      ),
    );
  }


   Widget _buildPosts(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: AppDecoration.fillBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        children: [
          Text("Objave", style: TextStyle(color: white, fontSize: 18, fontWeight: FontWeight.bold),),
          SizedBox(height: 4,),
          Container(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white, // Set the border color
                      width: 1.0, // Set the border width
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          posts[index].title!,
                          style: TextStyle(fontWeight: FontWeight.bold, color: white),
                        ),
                        Text(posts[index].content!,
                        style: TextStyle(color: white),),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
