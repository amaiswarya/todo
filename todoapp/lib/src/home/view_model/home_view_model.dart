import 'package:todoapp/res/enums/enums.dart';
import 'package:todoapp/utils/helpers/auto_dispose_view_model.dart';

class HomeViewModel extends AutoDisposeViewModel with HomeLoader {
  int _buttonIndex = 0;

  int get buttonIndex => _buttonIndex;

  void setButtonIndex(int newIndex) {
    _buttonIndex = newIndex;
    notifyListeners();
  }

  @override
  updateHomeLoader(LoaderState state) {
    homeLoader = state;
    notifyListeners();
  }
}

mixin HomeLoader {
  LoaderState homeLoader = LoaderState.loaded;
  updateHomeLoader(LoaderState state);
}
