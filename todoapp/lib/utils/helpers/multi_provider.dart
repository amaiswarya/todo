import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:todoapp/src/auth/view_model/auth_view_model.dart';
import 'package:todoapp/src/home/view_model/home_view_model.dart';

class MultiProviderClass {
  static List<SingleChildWidget> providerLists = [
    ChangeNotifierProvider(create: (context) => AuthViewModel()),
    ChangeNotifierProvider(create: (context) => HomeViewModel()),
  ];
}
