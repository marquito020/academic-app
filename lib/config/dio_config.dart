import 'package:dio/dio.dart';
// import 'package:medilab_prokit/constants/template_certificate.dart';

class DioConfig {
  // static const String baseUrl = 'http://localhost:8069';
  static const String baseUrl = 'http://10.0.2.2:8069';

  // static Map<String, dynamic> getHeaders() {
  //   var token = TemplateCertificate().templateCertificateToken;
  //   print('Token: $token');
  //   return {
  //     'Content-Type': 'application/json; charset=UTF-8',
  //     'Authorization': 'Bearer $token',
  //   };
  // }

  static const String contentType = 'application/json; charset=UTF-8';

  static final dioWithoutAuthorization = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
    sendTimeout: const Duration(seconds: 60),
    headers: {
      'Content-Type': contentType,
    },
    contentType: contentType,
  ));

  // static final dioWithAuthorization = Dio(BaseOptions(
  //   baseUrl: baseUrl,
  //   connectTimeout: const Duration(seconds: 60),
  //   receiveTimeout: const Duration(seconds: 60),
  //   sendTimeout: const Duration(seconds: 60),
  //   headers: getHeaders(),
  //   contentType: contentType,
  // ));
}
