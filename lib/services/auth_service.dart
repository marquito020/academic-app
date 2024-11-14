import 'package:academic_app/config/dio_config.dart';
import 'package:academic_app/model/userModel.dart';
import 'package:academic_app/sharePreferences/userPreferences.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class AuthService {
  Future login({required String email, required String password}) async {
    try {
      final response = await DioConfig.dioWithoutAuthorization.post(
        '/api/login',
        data: {
          'jsonrpc': '2.0',
          'id': null,
          'method': 'call',
          'params': {'email': email, 'password': password}
        },
      );
      if (response.statusCode == 200) {
        if (response.data['result']['status'] == 'success') {
          // UserPreferences.saveUserPreferences(AuthLogin.fromJson(response.data['result']));
          UserModel user = UserModel.fromJson(response.data['result']);
          // UserPreferences.saveUserPreferences(response.data['result']);
          UserPreferences.saveUserPreferences(user);

          String? token = await FirebaseMessaging.instance.getToken();

          if (token != null) {
            await updateTokenDevice(token: token);
          }

          return response.data;
        } else {
          throw Exception('Usuario o contraseña incorrectos.');
        }
      } else {
        throw Exception('Failed to load data!');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future updateTokenDevice({required String token}) async {
    try {
      final prefs = UserPreferences();
      final response = await DioConfig.dioWithoutAuthorization.post(
        '/api/token',
        data: {
          'jsonrpc': '2.0',
          'id': null,
          'method': 'call',
          'params': {'token': token, 'persona_id': prefs.id}
        },
      );
      if (response.statusCode == 200) {
        if (response.data['result']['status'] == 'success') {
          return response.data;
        } else {
          throw Exception('Error al actualizar el token del dispositivo.');
        }
      } else {
        throw Exception('Failed to load data!');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
