import 'package:academic_app/screens/ComunicadosScreen.dart';
import 'package:academic_app/screens/HomeScreen.dart';
import 'package:academic_app/screens/LoginScreen.dart';
import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:medilab_prokit/screens/MLCameraScreen.dart';
// import 'package:medilab_prokit/screens/MLDoctorReservationsScreen.dart';
// import 'package:medilab_prokit/screens/MLMedicationScreen.dart';
// import 'package:medilab_prokit/screens/MLPatientDetailsScreen.dart';
// import 'package:medilab_prokit/screens/MLCreateOphthalmologyCertificateScreen.dart';
// import 'package:medilab_prokit/screens/NotificationScreen.dart';
// import '../screens/MLDashboardScreen.dart';
// import '../screens/MLLoginScreen.dart';
// import '../screens/MLSplashScreen.dart';
// import '../model/doctor.dart';
import '../sharePreferences/userPreferences.dart';

class Routes {
  static const String home = '/home';
  static const String login = '/login';
  // static const String register = '/register';
  // static const String camera = '/camera';
  // static const String treatment = '/treatment';
  // static const String reservationDoctor = '/reservationDoctor';
  // static const String patientDetail = '/patient-detail';
  // static const String certification = '/certification';
  // static const String notification = '/notification';
  static const String communication = '/communication';
}

Map<String, WidgetBuilder> getApplicationRoutes() {
  final prefs = UserPreferences();
  return <String, WidgetBuilder>{
    // Login Route
    Routes.login: (BuildContext context) => LoginScreen(),
    // Default Route
    '/': (BuildContext context) =>
        prefs.isLogged ? HomeScreen() : LoginScreen(),
    Routes.communication: (BuildContext context) => ComunicadosScreen(),
    Routes.home: (BuildContext context) => HomeScreen(),
    // '/': (BuildContext context) =>
    //     prefs.isLogged ? MLDashboardScreen() : MLSplashScreen(),
    // Routes.login: (BuildContext context) => MLLoginScreen(),
    // Routes.home: (BuildContext context) => MLDashboardScreen(),
    // Routes.camera: (BuildContext context) => MLCameraScreen(cameras: cameras),
    // Routes.treatment: (BuildContext context) => MLMedicationScreen(),
    // Routes.reservationDoctor: (BuildContext context) =>
    //     MLDoctorReservationsScreen(),

    // // Patient Detail Route
    // Routes.patientDetail: (BuildContext context) {
    //   final Person patient =
    //       ModalRoute.of(context)!.settings.arguments as Person;
    //   return MLPatientDetailsScreen(patient: patient);
    // },

    // // Certification Route
    // Routes.certification: (BuildContext context) {
    //   final Person patient =
    //       ModalRoute.of(context)!.settings.arguments as Person;
    //   return MLCreateOphthalmologyCertificateScreen(patient: patient);
    // },

    // // Notification Route
    // Routes.notification: (BuildContext context) => MLNotificationScreen(),
  };
}
