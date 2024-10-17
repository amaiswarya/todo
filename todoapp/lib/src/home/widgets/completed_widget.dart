import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todoapp/models/to_do_model.dart';
import 'package:todoapp/res/constants/string_constants.dart';
import 'package:todoapp/res/styles/color_palette.dart';
import 'package:todoapp/res/styles/fonts/font_text_styles.dart';
import 'package:todoapp/services/database_service.dart';

class CompletedWidget extends StatefulWidget {
  const CompletedWidget({super.key});
  @override
  State<CompletedWidget> createState() => _CompletedWidgetState();
}

class _CompletedWidgetState extends State<CompletedWidget> {
  User? user = FirebaseAuth.instance.currentUser;
  late String uid;
  final DatabaseService _databaseService = DatabaseService();
  @override
  void initState() {
    uid = FirebaseAuth.instance.currentUser!.uid;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Todo>>(
      stream: _databaseService.completedtodos,
      builder: (BuildContext context, AsyncSnapshot<List<Todo>> snapshot) {
        if (snapshot.hasData) {
          List<Todo> todos = snapshot.data!;
          return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: todos.length,
              itemBuilder: (context, index) {
                Todo todo = todos[index];
                final DateTime dt = todo.timestamp.toDate();
                return Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: ColorPalette.white,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Slidable(
                      key: ValueKey(todo.id),
                      endActionPane:
                          ActionPane(motion: DrawerMotion(), children: [
                        SlidableAction(
                            foregroundColor: ColorPalette.white,
                            icon: Icons.delete,
                            label: Strings.delete,
                            backgroundColor: ColorPalette.red,
                            onPressed: (context) {
                              _databaseService.deleteTodoTask(todo.id);
                            })
                      ]),
                      child: ListTile(
                        title: Text(
                          todo.title,
                          style: FontTextStyles.findigo_18_700,
                        ),
                        subtitle: Text(
                          todo.description,
                          style: FontTextStyles.findigo_16_400,
                        ),
                        trailing: Text("${dt.day}/${dt.month}/${dt.year}",
                            style: FontTextStyles.findigo_16_700),
                      )),
                );
              });
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        }
      },
    );
  }
}
