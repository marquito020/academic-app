import 'package:flutter/material.dart';
import 'package:academic_app/screens/ProfileScreen.dart';
import 'package:academic_app/sharePreferences/userPreferences.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  final int notificationCount; // Número de notificaciones pendientes
  final VoidCallback onNotificationTap; // Acción al presionar notificaciones
  final VoidCallback onAvatarTap; // Acción al presionar el avatar

  AppBarComponent({
    required this.notificationCount,
    required this.onNotificationTap,
    required this.onAvatarTap,
  });

  @override
  Widget build(BuildContext context) {
    final prefs = UserPreferences(); // Para obtener la URL del avatar

    return AppBar(
      title: Text(
        'Academic App',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      actions: [
        // Icono de Notificaciones
        Stack(
          children: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: onNotificationTap,
            ),
            if (notificationCount > 0) // Indicador de notificaciones pendientes
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '$notificationCount',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
        // Avatar del Usuario
        GestureDetector(
          onTap: onAvatarTap,
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(
                'https://www.cartoonize.net/wp-content/uploads/2024/05/avatar-maker-photo-to-cartoon.png',
              ),
              backgroundColor: Colors.grey[300],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
