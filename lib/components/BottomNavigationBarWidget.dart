import 'package:flutter/material.dart';
import 'package:academic_app/sharePreferences/userPreferences.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final Function(int) onTap;
  final int index;

  BottomNavigationBarWidget({required this.onTap, required this.index});

  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  final prefs = UserPreferences();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: Colors.grey.shade400,
      selectedItemColor: Colors.blueAccent,
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.index,
      onTap: widget.onTap,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.announcement_rounded, size: 22),
          label: 'Comunicados',
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.book_rounded, size: 22),
        //   label: 'Mis Cursos',
        // ),
        // Mi Curso
        BottomNavigationBarItem(
          icon: Icon(Icons.book_rounded, size: 22),
          label: 'Mi Curso',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_rounded, size: 22),
          label: 'Perfil',
        ),
      ],
    );
  }
}
