import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/res/constants/string_constants.dart';
import 'package:todoapp/res/styles/color_palette.dart';
import 'package:todoapp/res/styles/fonts/font_text_styles.dart';
import 'package:todoapp/src/auth/view_model/auth_view_model.dart';
import 'package:todoapp/utils/common_widgets/common_app_bar.dart';
import 'package:todoapp/utils/common_widgets/common_text_button.dart';
import 'package:todoapp/utils/common_widgets/common_text_form_field.dart';
import 'package:todoapp/utils/common_widgets/primary_button.dart';
import 'package:todoapp/utils/routes/route_constants.dart';

class LoginScreen extends StatelessWidget {
  final AuthViewModel _authViewModel = AuthViewModel();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.primaryColor,
      appBar: CommonAppBar(text: Strings.signIn),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              30.verticalSpace,
              Text(
                Strings.welcomeBack,
                style: FontTextStyles.fWhite_35_500,
              ),
              5.verticalSpace,
              Text(
                Strings.loginHere,
                style: FontTextStyles.fWhite_18_400,
              ),
              40.verticalSpace,
              CommonTextFormField(
                controller: _emailController,
                labelText: Strings.email,
              ),
              20.verticalSpace,
              CommonTextFormField(
                obscure: true,
                controller: _passwordController,
                labelText: Strings.password,
              ),
              50.verticalSpace,
              SizedBox(
                  height: 50.h,
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: PrimaryButton(
                    text: Strings.login,
                    onTap: () async {
                      User? user =
                          await _authViewModel.signInWithEmailandPassword(
                              _emailController.text, _passwordController.text);
                      if (user != null) {
                        Navigator.pushNamed(
                            context, RouteConstants.routehomeScreen);
                      }
                    },
                  )),
              20.verticalSpace,
              Text(
                Strings.or,
                style: FontTextStyles.fWhite_12_400,
              ),
              20.verticalSpace,
              CommonTextButton(
                text: Strings.createAccount,
                onTap: () =>
                    Navigator.pushNamed(context, RouteConstants.routeInitial),
              )
            ],
          ),
        ),
      ),
    );
  }
}
