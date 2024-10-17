import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/res/constants/string_constants.dart';
import 'package:todoapp/res/styles/color_palette.dart';
import 'package:todoapp/src/auth/view_model/auth_view_model.dart';
import 'package:todoapp/src/home/view_model/home_view_model.dart';
import 'package:todoapp/src/home/widgets/completed_widget.dart';
import 'package:todoapp/src/home/widgets/custom_inkwell_widget.dart';
import 'package:todoapp/src/home/widgets/dialog_box.dart';
import 'package:todoapp/src/home/widgets/pending_widget.dart';
import 'package:todoapp/utils/common_widgets/common_app_bar.dart';
import 'package:todoapp/utils/routes/route_constants.dart';

class HomeScreen extends StatelessWidget {
  final HomeViewModel homeViewModel = HomeViewModel();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _widgets = [
      // Pending task widget
      PendingWidget(),
      // Completed task widget
      CompletedWidget(),
    ];

    return Scaffold(
      backgroundColor: ColorPalette.primaryColor,
      appBar: CommonAppBar(
        text: Strings.todo,
        actions: [
          IconButton(
              onPressed: () async {
                await AuthViewModel().signOut();
                Navigator.pushReplacementNamed(
                    context, RouteConstants.routeloginScreen);
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: SingleChildScrollView(
        child:
            Consumer<HomeViewModel>(builder: (context, homeViewModel, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomInkwellWidget(
                    text: Strings.pending,
                    onTap: () => homeViewModel.setButtonIndex(0),
                    buttonColor: homeViewModel.buttonIndex == 0
                        ? ColorPalette.indigo
                        : ColorPalette.white,
                    textColor: homeViewModel.buttonIndex == 0
                        ? ColorPalette.white
                        : ColorPalette.black38,
                    fontSize: homeViewModel.buttonIndex == 0 ? 16 : 14,
                  ),
                  CustomInkwellWidget(
                    text: Strings.completed,
                    onTap: () => homeViewModel.setButtonIndex(1),
                    buttonColor: homeViewModel.buttonIndex == 1
                        ? ColorPalette.indigo
                        : ColorPalette.white,
                    textColor: homeViewModel.buttonIndex == 1
                        ? ColorPalette.white
                        : ColorPalette.black38,
                    fontSize: homeViewModel.buttonIndex == 1 ? 16 : 14,
                  )
                ],
              ),
              30.verticalSpace,
              _widgets[homeViewModel.buttonIndex]
            ],
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorPalette.white,
        onPressed: () {
          showTaskDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
