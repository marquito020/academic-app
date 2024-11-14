import 'package:academic_app/screens/MiCursoScreen.dart';
import 'package:flutter/material.dart';
import 'package:academic_app/screens/ProfileScreen.dart';
import 'package:academic_app/components/BottomNavigationBarWidget.dart';
import 'package:academic_app/screens/ComunicadosScreen.dart';
import 'package:academic_app/sharePreferences/userPreferences.dart';
import 'package:academic_app/components/AppBarComponent.dart'; // Importa el componente AppBar personalizado

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final prefs = UserPreferences();
  int currentWidget = 0;
  int notificationCount = 5; // Ejemplo de notificaciones pendientes
  List<Widget> widgets = [];

  @override
  void initState() {
    super.initState();
    init();
    widgets = [
      ComunicadosScreen(),
      MiCursoScreen(),
      ProfileScreen(),
    ];
  }

  Future<void> init() async {
    // Inicialización de preferencias u otras configuraciones si es necesario
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        notificationCount: notificationCount,
        onNotificationTap: () {
          // Acción al presionar el icono de notificaciones
          setState(() {
            notificationCount = 0; // Ejemplo: Resetear notificaciones
          });
        },
        onAvatarTap: () {
          // Acción al presionar el avatar, navega al perfil
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfileScreen()),
          );
        },
      ),
      body: widgets[currentWidget],
      bottomNavigationBar: showBottomNavigationBar(),
    );
  }

  Widget showBottomNavigationBar() {
    return BottomNavigationBarWidget(
      index: currentWidget,
      onTap: (index) {
        setState(() {
          currentWidget = index;
        });
      },
    );
  }
}
