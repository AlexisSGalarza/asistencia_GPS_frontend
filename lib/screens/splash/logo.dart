import 'package:flutter/material.dart';
import '../../services/api_service.dart';
import '../login/login_screen.dart';
import '../maestro/marcar_asistencia_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _iniciarApp();
  }

  Future<void> _iniciarApp() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    final sesionActiva = await ApiService.restaurarSesion();

    if (!mounted) return;

    if (sesionActiva) {
      final rol = ApiService.rolUsuario.toLowerCase();
      if (rol == 'administrador' || rol == 'admin') {
        Navigator.pushReplacementNamed(context, '/admin/dashboard');
      } else if (rol == 'supervisor') {
        Navigator.pushReplacementNamed(context, '/supervisor/incidencias');
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const MarcarAsistenciaScreen()),
        );
      }
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1E9F8),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Asistencia GPS',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6B2D8B),
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Control de asistencia inteligente',
              style: TextStyle(
                fontSize: 16,
                color: const Color(0xFF6B2D8B).withValues(alpha: 0.6),
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 50),
            const CircularProgressIndicator(
              color: Color(0xFF6B2D8B),
              strokeWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}
