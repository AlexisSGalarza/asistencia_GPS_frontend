import 'package:flutter/material.dart';
import '../../services/api_service.dart';

/// Barra de navegación inferior del panel supervisor.
/// [currentIndex]: 0=Incidencias, 1=Historial, 2=Reportes.
Widget buildSupervisorBottomNav(BuildContext context, int currentIndex) {
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
          if (index == 3) {
            confirmarLogoutSupervisor(context);
            return;
          }
          if (index == currentIndex) return;
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/supervisor/incidencias');
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/supervisor/historial');
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/supervisor/reportes');
          }
        },
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFF6B2D8B).withOpacity(0.15),
        surfaceTintColor: Colors.transparent,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        animationDuration: const Duration(milliseconds: 300),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.warning_amber_outlined),
            selectedIcon: Icon(
              Icons.warning_amber_rounded,
              color: Color(0xFF6B2D8B),
            ),
            label: 'Incidencias',
          ),
          NavigationDestination(
            icon: Icon(Icons.history_outlined),
            selectedIcon: Icon(Icons.history, color: Color(0xFF6B2D8B)),
            label: 'Historial',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined),
            selectedIcon: Icon(Icons.bar_chart, color: Color(0xFF6B2D8B)),
            label: 'Reportes',
          ),
          NavigationDestination(
            icon: Icon(Icons.logout, color: Color(0xFFC62828)),
            selectedIcon: Icon(Icons.logout, color: Color(0xFFC62828)),
            label: 'Salir',
          ),
        ],
      ),
    ),
  );
}

void confirmarLogoutSupervisor(BuildContext context) {
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
