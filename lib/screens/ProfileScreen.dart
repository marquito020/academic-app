import 'package:flutter/material.dart';
import 'package:academic_app/sharePreferences/userPreferences.dart';
import 'package:academic_app/screens/LoginScreen.dart'; // Ruta a la pantalla de inicio de sesión

class ProfileScreen extends StatelessWidget {
  final prefs = UserPreferences();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Avatar del usuario
            CircleAvatar(
              radius: 50,
              backgroundImage: const NetworkImage(
                  'https://www.cartoonize.net/wp-content/uploads/2024/05/avatar-maker-photo-to-cartoon.png'), // URL del avatar desde prefs
              backgroundColor: Colors.grey[300],
            ),
            const SizedBox(height: 16),
            // Nombre del usuario
            Text(
              prefs.nombre ?? 'Usuario', // Nombre del usuario desde prefs
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 8),
            // Rol del usuario
            Text(
              '${prefs.rol[0].toUpperCase()}${prefs.rol.substring(1)}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 20),
            // Información adicional
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading:
                          const Icon(Icons.email, color: Colors.blueAccent),
                      title: const Text('Correo electrónico'),
                      subtitle: Text(prefs.email ?? 'No especificado'),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            // Botón de Cerrar Sesión
            ElevatedButton.icon(
              onPressed: () {
                _logout(context);
              },
              icon: const Icon(Icons.logout),
              label: const Text('Cerrar sesión'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _logout(BuildContext context) {
    prefs.clearUser(); // Limpia las preferencias del usuario
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context) =>
              LoginScreen()), // Redirige a la pantalla de inicio de sesión
      (Route<dynamic> route) => false,
    );
  }
}
