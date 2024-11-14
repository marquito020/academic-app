import 'package:academic_app/config/dio_config.dart';
import 'package:academic_app/model/DetalleAlumnoModel.dart';
import 'package:academic_app/sharePreferences/userPreferences.dart';

class DetalleAlumnoService {
  Future<DetalleAlumnoModel?> getDetalleAlumno() async {
    final prefs = UserPreferences();
    try {
      final response = await DioConfig.dioWithoutAuthorization.get(
        '/api/alumno/${prefs.id}/detalles',
      );
      if (response.statusCode == 200) {
        return DetalleAlumnoModel.fromJson(response.data['data']);
      } else {
        throw Exception('Failed to load data!');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
