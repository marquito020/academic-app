// import 'package:medilab_prokit/model/auth.dart';

import 'package:academic_app/model/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instance = UserPreferences._internal();
  late SharedPreferences _prefs;

  factory UserPreferences() => _instance;

  UserPreferences._internal();

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get prefsUser => _prefs;

  int get id => _prefs.getInt('id') ?? 0;
  String get nombre => _prefs.getString('nombre') ?? '';
  String get email => _prefs.getString('email') ?? '';
  String get rol => _prefs.getString('rol') ?? '';
  bool get isLogged => _prefs.getBool('isLogged') ?? false;

  set id(int id) => _prefs.setInt('id', id);
  set nombre(String nombre) => _prefs.setString('nombre', nombre);
  set email(String email) => _prefs.setString('email', email);
  set rol(String rol) => _prefs.setString('rol', rol);
  set isLogged(bool isLogged) => _prefs.setBool('isLogged', isLogged);

  static void saveUserPreferences(UserModel data) {
    final prefs = UserPreferences();
    prefs.id = data.persona_id;
    prefs.nombre = data.nombre;
    prefs.email = data.email;
    prefs.rol = data.rol;
    prefs.isLogged = true;
  }

  void clearUser() {
    _prefs.setString('id', '');
    _prefs.setString('nombre', '');
    _prefs.setString('email', '');
    _prefs.setString('rol', '');
    _prefs.setBool('isLogged', false);
  }
}
