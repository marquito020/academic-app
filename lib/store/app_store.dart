// lib/store/app_store.dart
import 'package:mobx/mobx.dart';

part 'app_store.g.dart'; // Ruta relativa correcta al archivo generado

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  @observable
  bool isDarkModeOn = false;

  @action
  void toggleDarkMode() {
    isDarkModeOn = !isDarkModeOn;
  }

  @action
  void setDarkMode(bool value) {
    isDarkModeOn = value;
  }
}
