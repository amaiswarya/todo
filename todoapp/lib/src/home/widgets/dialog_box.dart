import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/models/to_do_model.dart';
import 'package:todoapp/res/constants/string_constants.dart';
import 'package:todoapp/res/styles/color_palette.dart';
import 'package:todoapp/res/styles/fonts/font_text_styles.dart';
import 'package:todoapp/services/database_service.dart';
import 'package:todoapp/utils/common_widgets/common_text_button.dart';
import 'package:todoapp/utils/common_widgets/common_text_form_field.dart';
import 'package:todoapp/utils/common_widgets/primary_button.dart';

void showTaskDialog(BuildContext context, {Todo? todo}) {
  final TextEditingController _titleController =
      TextEditingController(text: todo?.title);
  final TextEditingController _descriptionController =
      TextEditingController(text: todo?.description);
  final DatabaseService _databaseService = DatabaseService();
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: ColorPalette.white,
          title: Text(
            todo == null ? Strings.addTask : Strings.editTask,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          content: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  CommonTextFormField(
                      borederColor: ColorPalette.indigo,
                      style: FontTextStyles.findigo_16_400,
                      controller: _titleController,
                      labelText: Strings.title),
                  10.verticalSpace,
                  CommonTextFormField(
                      borederColor: ColorPalette.indigo,
                      style: FontTextStyles.findigo_16_400,
                      controller: _descriptionController,
                      labelText: Strings.description)
                ],
              ),
            ),
          ),
          actions: [
            CommonTextButton(
              text: Strings.cancel,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            PrimaryButton(
              textStyle: FontTextStyles.fwhite_18_500,
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorPalette.indigo,
                  foregroundColor: ColorPalette.white),
              text: todo == null ? Strings.add : Strings.update,
              onTap: () async {
                if (todo == null) {
                  await _databaseService.addTodoTask(
                      _titleController.text, _descriptionController.text);
                } else {
                  await _databaseService.updateTodo(todo.id,
                      _titleController.text, _descriptionController.text);
                }
                Navigator.pop(context);
              },
            )
          ],
        );
      });
}
