import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todoapp/models/to_do_model.dart';
import 'package:todoapp/res/constants/string_constants.dart';
import 'package:todoapp/res/styles/color_palette.dart';
import 'package:todoapp/res/styles/fonts/font_text_styles.dart';
import 'package:todoapp/services/database_service.dart';
import 'package:todoapp/src/home/widgets/dialog_box.dart';

class PendingWidget extends StatefulWidget {
  const PendingWidget({super.key});
  @override
  State<PendingWidget> createState() => _PendingWidgetState();
}

class _PendingWidgetState extends State<PendingWidget> {
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
      stream: _databaseService.todos,
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
                            icon: Icons.done,
                            label: Strings.mark,
                            backgroundColor: ColorPalette.green,
                            onPressed: (context) {
                              _databaseService.updateTodoStatus(todo.id, true);
                            })
                      ]),
                      startActionPane:
                          ActionPane(motion: DrawerMotion(), children: [
                        SlidableAction(
                            foregroundColor: ColorPalette.white,
                            icon: Icons.edit,
                            label: Strings.edit,
                            backgroundColor: ColorPalette.amber,
                            onPressed: (context) {
                              showTaskDialog(context, todo: todo);
                            }),
                        SlidableAction(
                            foregroundColor: ColorPalette.white,
                            icon: Icons.delete,
                            label: Strings.delete,
                            backgroundColor: ColorPalette.red,
                            onPressed: (context) async {
                              await _databaseService.deleteTodoTask(todo.id);
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

  // void _showTaskDialog(BuildContext context, {Todo? todo}) {
  //   final TextEditingController _titleController =
  //       TextEditingController(text: todo?.title);
  //   final TextEditingController _descriptionController =
  //       TextEditingController(text: todo?.description);
  //   final DatabaseService _databaseService = DatabaseService();
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           backgroundColor: ColorPalette.white,
  //           title: Text(
  //             todo == null ? Strings.addTask : Strings.editTask,
  //             style: TextStyle(fontWeight: FontWeight.w500),
  //           ),
  //           content: SingleChildScrollView(
  //             child: Container(
  //               width: MediaQuery.of(context).size.width,
  //               child: Column(
  //                 children: [
  //                   CommonTextFormField(
  //                       borederColor: ColorPalette.indigo,
  //                       style: FontTextStyles.findigo_16_400,
  //                       controller: _titleController,
  //                       labelText: Strings.title),
  //                   10.verticalSpace,
  //                   CommonTextFormField(
  //                       borederColor: ColorPalette.indigo,
  //                       style: FontTextStyles.findigo_16_400,
  //                       controller: _descriptionController,
  //                       labelText: Strings.description)
  //                 ],
  //               ),
  //             ),
  //           ),
  //           actions: [
  //             CommonTextButton(
  //               text: Strings.cancel,
  //               onTap: () {
  //                 Navigator.pop(context);
  //               },
  //             ),
  //             PrimaryButton(
  //               textStyle: FontTextStyles.fwhite_18_500,
  //               style: ElevatedButton.styleFrom(
  //                   backgroundColor: ColorPalette.indigo,
  //                   foregroundColor: ColorPalette.white),
  //               text: todo == null ? Strings.add : Strings.update,
  //               onTap: () async {
  //                 if (todo == null) {
  //                   await _databaseService.addTodoTask(
  //                       _titleController.text, _descriptionController.text);
  //                 } else {
  //                   await _databaseService.updateTodo(todo.id,
  //                       _titleController.text, _descriptionController.text);
  //                 }
  //                 Navigator.pop(context);
  //               },
  //             )
  //           ],
  //         );
  //       });
  // }
}
