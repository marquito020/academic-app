import 'package:academic_app/config/dio_config.dart';
import 'package:academic_app/model/comunicadoModel.dart';
import 'package:academic_app/sharePreferences/userPreferences.dart';

class ComunicadoService {
  Future<List<ComunicadoModel>?> getComunicados() async {
    final prefs = UserPreferences();
    try {
      final response = await DioConfig.dioWithoutAuthorization.get(
        '/api/comunicados/persona/${prefs.id}',
      );
      if (response.statusCode == 200) {
        List<ComunicadoModel> comunicados = [];
        for (var item in response.data['data']) {
          comunicados.add(ComunicadoModel.fromJson(item));
        }
        return comunicados;
      } else {
        throw Exception('Failed to load data!');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
