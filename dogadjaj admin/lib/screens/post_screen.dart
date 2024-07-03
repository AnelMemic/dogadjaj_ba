import 'dart:ui';
import 'package:dogadjaj_ba/helpers/erorrDialog.dart';
import 'package:dogadjaj_ba/models/notifications.dart';
import 'package:dogadjaj_ba/models/post.dart';
import 'package:dogadjaj_ba/models/selection_user.dart';
import 'package:dogadjaj_ba/providers/notification_provider.dart';
import 'package:dogadjaj_ba/providers/post_provider.dart';
import 'package:dogadjaj_ba/providers/user_provider.dart';
import 'package:dogadjaj_ba/screens/add_post_screen.dart';
import 'package:dogadjaj_ba/screens/dodaj_notifikaciju_screen.dart';
import 'package:dogadjaj_ba/screens/edit_post_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreentate();
}

class _PostScreentate extends State<PostScreen> {
  List<Post> posts = <Post>[];
  List<Post> selectedposts = <Post>[];
  List<UserForSelection> users = <UserForSelection>[];
  List<UserForSelection> selectedUsers = <UserForSelection>[];
  TextEditingController _searchController = TextEditingController();
  TextEditingController _seenController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  DateTime selectedTime = DateTime.now();
  late NotificationProvider _notificationProvider;
  late PostProvider _postProvider;
  final ScrollController controller = ScrollController();
  late UserProvider _userProvider;
  bool isEditing = false;
  bool isAllSelected = false;
  int currentPage = 1;
  int pageSize = 20;
  int hasNextPage = 0;
  String searchEventName = '';
  TextEditingController searchController = TextEditingController(text: '');



 @override
  void dispose() {
    searchController.dispose();
    controller.dispose();
    super.dispose();
  }


  @override
  void initState() {
    super.initState();
    _notificationProvider = NotificationProvider();
    _postProvider = PostProvider();
    _userProvider = UserProvider();
    _seenController = TextEditingController(text: 'Sve');
    _searchController = TextEditingController(text: '');
    loadPosts();
    // loadUsers();
    _searchController.addListener(() {
      final searchQuery = _searchController.text;
      final seen = _seenController.text;

  
    });
  }

 
  void loadPosts() async {
    try {
      var Response =
          await _postProvider.get();
      setState(() {
        posts = Response;
        hasNextPage = posts.length;
      });
    } on Exception catch (e) {
      showErrorDialog(context, e.toString().substring(11));
    }
  }

  // void InsertNotification(int id) async {
  //   try {
  //     var newNotification = {
  //       "id": 0,
  //       "content": _contentController.text,
  //       "read": false,
  //       "deleted": false,
  //       "dateRead": null,
  //       "sendOnDate": DateTime.now().toUtc().toIso8601String(),
  //       "seen": null,
  //       "userId": id
  //     };
  //     var notification = await _notificationProvider.insert(newNotification);
  //     if (notification == "OK") {
  //       currentPage == 1;
  //       loadNotifications(NotificationsSearchObject(
  //           PageNumber: currentPage, PageSize: pageSize));
  //     }
  //   } on Exception catch (e) {
  //     showErrorDialog(context, e.toString().substring(11));
  //   }
  // }

  // void EditNotification(int id) async {
  //   try {
  //     var newNotification = {
  //       "id": id,
  //       "content": _contentController.text,
  //       "read": false,
  //       "deleted": false,
  //       "dateRead": null,
  //       "sendOnDate": DateTime.now().toUtc().toIso8601String(),
  //       "seen": null,
  //       "userId": selectedUsers[0].id
  //     };
  //     var change = await _notificationProvider.edit(newNotification);
  //     if (change == "OK") {
  //       currentPage = 1;
  //       loadNotifications(NotificationsSearchObject(
  //           PageNumber: currentPage, PageSize: pageSize));
  //     }
  //   } on Exception catch (e) {
  //     showErrorDialog(context, e.toString().substring(11));
  //   }
  // }

  // void DeleteNotification(int id) async {
  //   try {
  //     var actor = await _notificationProvider.delete(id);
  //     if (actor == "OK") {
  //       currentPage = 1;
  //       loadNotifications(NotificationsSearchObject(
  //           PageNumber: currentPage, PageSize: pageSize));
  //     }
  //   } on Exception catch (e) {
  //     showErrorDialog(context, e.toString().substring(11));
  //   }
  // }


void _openAddEventScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AddPostScreen(),
      ),
    );
  }


  void _openEditEventScreen(BuildContext context, Post event) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditPostScreen(event: event),
      ),
    );

    if (result == true) {
      setState(() {});
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('Postovi'),
        actions: [
          IconButton(
            onPressed: () {
              _openAddEventScreen(context);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          
          const SizedBox(
            height: 16,
          ),
          // buildButtonsAndFilters(context),
          SizedBox(
            height: 16,
          ),
          Expanded(
              child: Scrollbar(
                controller: controller,
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context)
                      .copyWith(dragDevices: {PointerDeviceKind.mouse}),
                  child: SingleChildScrollView(
                    controller: controller,
                    child: FutureBuilder<List<Notifications>>(
                      future: _notificationProvider.get(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else {
                          List<Notifications> events = snapshot.data ?? [];

                          return DataTable(
                            border: const TableBorder(
                              right: BorderSide(),
                              left: BorderSide(),
                              top: BorderSide(),
                              bottom: BorderSide(),
                              verticalInside: BorderSide(),
                              horizontalInside: BorderSide(),
                            ),
                            columns: const [
                              DataColumn(label: Text('Naslov')),
                              DataColumn(label: Text('Sadrzaj')),
                              DataColumn(label: Text('Datum objave')),
                               DataColumn(label: Text('Edit')),
                            ],
                            rows: posts
                                .where((post) =>
                                    searchEventName.isEmpty ||
                                    post.title!.toLowerCase().contains(
                                        searchEventName.toLowerCase()))
                                .map(
                                  (postItem) => DataRow(
                                    cells: [
                                      DataCell(Text(postItem.title ?? 'N/A')), 
                                      DataCell(Text(postItem.content ?? 'N/A')),
                                     DataCell(
                        Text(
                          postItem.publishDate != null
                              ? DateFormat('dd.MM.yyyy')
                                  .format(postItem.publishDate!)
                              : '--',
                        ),
                      ),
                                DataCell(
                                              IconButton(
                                                icon: Icon(Icons.edit),
                                                onPressed: () {
                                                  _openEditEventScreen(context, postItem);
                                                },
                                              ),
                                            ),      
                                   
                                    ],
                                  ),
                                )
                                .toList(),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
          SizedBox(
            height: 1,
          ),
        ]),
      ),
    );
  }

  

 
}
