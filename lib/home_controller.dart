import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

enum CurrentScreen { sliveAnimation, transform, customMenuDrop, idle }

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  CurrentScreen currentScreen = CurrentScreen.idle;

  @action
  void changeCurrentScreen(CurrentScreen screen) {
    currentScreen = screen;
  }
}
