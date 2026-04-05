import 'package:flutter/material.dart';
import '../../services/api_service.dart';

/// Barra de navegación inferior del panel admin.
/// [currentIndex]: 0=Dashboard, 1=Usuarios, 2=Horarios, 3=Config, 4=Reportes.
/// El botón de Salir se mueve al header de cada pantalla.
Widget buildAdminBottomNav(BuildContext context, int currentIndex) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(28),
        topRight: Radius.circular(28),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          blurRadius: 20,
          offset: const Offset(0, -4),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(28),
        topRight: Radius.circular(28),
      ),
      child: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          if (index == currentIndex) return;
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/admin/dashboard');
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/admin/usuarios');
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/admin/horarios');
          } else if (index == 3) {
            Navigator.pushReplacementNamed(context, '/admin/config');
          } else if (index == 4) {
            Navigator.pushReplacementNamed(context, '/admin/reportes');
          }
        },
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFF6B2D8B).withOpacity(0.15),
        surfaceTintColor: Colors.transparent,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        animationDuration: const Duration(milliseconds: 300),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard, color: Color(0xFF6B2D8B)),
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: Icon(Icons.people_outline),
            selectedIcon: Icon(Icons.people, color: Color(0xFF6B2D8B)),
            label: 'Usuarios',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined),
            selectedIcon: Icon(Icons.calendar_month, color: Color(0xFF6B2D8B)),
            label: 'Horarios',
          ),
          NavigationDestination(
            icon: Icon(Icons.tune_outlined),
            selectedIcon: Icon(Icons.tune, color: Color(0xFF6B2D8B)),
            label: 'Config',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined),
            selectedIcon: Icon(Icons.bar_chart, color: Color(0xFF6B2D8B)),
            label: 'Reportes',
          ),
        ],
      ),
    ),
  );
}

void confirmarLogout(BuildContext context) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: const Text('Cerrar sesión'),
      content: const Text(
        '¿Estás seguro de que deseas cerrar sesión?',
        style: TextStyle(fontFamily: 'Montserrat'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () async {
            Navigator.pop(ctx);
            await ApiService.logout();
            if (context.mounted) {
              Navigator.pushReplacementNamed(context, '/login');
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFC62828),
            foregroundColor: Colors.white,
          ),
          child: const Text('Salir'),
        ),
      ],
    ),
  );
}
