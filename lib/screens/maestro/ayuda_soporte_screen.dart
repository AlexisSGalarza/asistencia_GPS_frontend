import 'package:flutter/material.dart';
import '../../widgets/animated_list_item.dart';

class AyudaSoporteScreen extends StatelessWidget {
  const AyudaSoporteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1E9F8),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    AnimatedListItem(
                      index: 0,
                      delayMs: 80,
                      child: _buildIntroCard(),
                    ),
                    const SizedBox(height: 18),
                    AnimatedListItem(
                      index: 1,
                      delayMs: 80,
                      child: _buildSectionTitle(
                        icon: Icons.menu_book_outlined,
                        title: 'Guía de uso',
                      ),
                    ),
                    const SizedBox(height: 12),
                    AnimatedListItem(
                      index: 2,
                      delayMs: 80,
                      child: _buildGuideCard(
                        icon: Icons.location_on_outlined,
                        color: const Color(0xFF6B2D8B),
                        title: '1. Marcar asistencia',
                        description:
                            'En la pestaña "Marcar" pulsa el botón para registrar tu entrada o salida. La app valida tu ubicación GPS dentro del perímetro asignado.',
                      ),
                    ),
                    const SizedBox(height: 12),
                    AnimatedListItem(
                      index: 3,
                      delayMs: 80,
                      child: _buildGuideCard(
                        icon: Icons.calendar_today_outlined,
                        color: const Color(0xFFA98BC3),
                        title: '2. Revisar tu horario',
                        description:
                            'En la pestaña "Horario" puedes ver los días y horas en los que tienes turno asignado por tu administrador.',
                      ),
                    ),
                    const SizedBox(height: 12),
                    AnimatedListItem(
                      index: 4,
                      delayMs: 80,
                      child: _buildGuideCard(
                        icon: Icons.history_outlined,
                        color: const Color(0xFFE8A0BF),
                        title: '3. Consultar registros',
                        description:
                            'En la pestaña "Registros" se muestran tus marcaciones anteriores, con la hora y el estado (puntual, tarde, falta).',
                      ),
                    ),
                    const SizedBox(height: 12),
                    AnimatedListItem(
                      index: 5,
                      delayMs: 80,
                      child: _buildGuideCard(
                        icon: Icons.person_outline,
                        color: const Color(0xFF6B2D8B),
                        title: '4. Tu perfil',
                        description:
                            'En "Perfil" puedes ver tus datos, cambiar tu contraseña y cerrar sesión.',
                      ),
                    ),
                    const SizedBox(height: 22),
                    AnimatedListItem(
                      index: 6,
                      delayMs: 80,
                      child: _buildSectionTitle(
                        icon: Icons.help_outline,
                        title: 'Preguntas frecuentes',
                      ),
                    ),
                    const SizedBox(height: 12),
                    AnimatedListItem(
                      index: 7,
                      delayMs: 80,
                      child: _buildFaqCard(
                        question: '¿Por qué no puedo marcar asistencia?',
                        answer:
                            'Asegúrate de tener el GPS activado, permisos de ubicación concedidos y de estar dentro del perímetro asignado.',
                      ),
                    ),
                    const SizedBox(height: 10),
                    AnimatedListItem(
                      index: 8,
                      delayMs: 80,
                      child: _buildFaqCard(
                        question: '¿Qué hago si olvido mi contraseña?',
                        answer:
                            'En la pantalla de inicio de sesión pulsa "Forgot Password?" e ingresa tu correo para recibir un código de recuperación.',
                      ),
                    ),
                    const SizedBox(height: 10),
                    AnimatedListItem(
                      index: 9,
                      delayMs: 80,
                      child: _buildFaqCard(
                        question: '¿Mi horario está incorrecto?',
                        answer:
                            'Los horarios los gestiona el administrador. Si hay un error, contáctalo desde la sección de soporte.',
                      ),
                    ),
                    const SizedBox(height: 22),
                    AnimatedListItem(
                      index: 10,
                      delayMs: 80,
                      child: _buildSectionTitle(
                        icon: Icons.support_agent,
                        title: 'Soporte',
                      ),
                    ),
                    const SizedBox(height: 12),
                    AnimatedListItem(
                      index: 11,
                      delayMs: 80,
                      child: _buildSupportCard(),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 30),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF6B2D8B), Color(0xFFA98BC3), Color(0xFFE8A0BF)],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 5),
          const Text(
            'Ayuda y Guía',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIntroCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFF6B2D8B).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(
              Icons.lightbulb_outline,
              color: Color(0xFF6B2D8B),
              size: 26,
            ),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '¡Bienvenido!',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3D3D3D),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Aquí encontrarás cómo usar la app y resolver dudas comunes.',
                  style: TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 12,
                    color: Color(0xFF757575),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle({required IconData icon, required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF6B2D8B), size: 20),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6B2D8B),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGuideCard({
    required IconData icon,
    required Color color,
    required String title,
    required String description,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3D3D3D),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 12,
                    height: 1.4,
                    color: Color(0xFF757575),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFaqCard({required String question, required String answer}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Theme(
        data: ThemeData(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
          childrenPadding: const EdgeInsets.fromLTRB(18, 0, 18, 16),
          iconColor: const Color(0xFF6B2D8B),
          collapsedIconColor: const Color(0xFFA98BC3),
          shape: const RoundedRectangleBorder(side: BorderSide.none),
          title: Text(
            question,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3D3D3D),
            ),
          ),
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                answer,
                style: const TextStyle(
                  fontFamily: 'Merriweather',
                  fontSize: 12,
                  height: 1.5,
                  color: Color(0xFF757575),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSupportCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF6B2D8B).withValues(alpha: 0.08),
            const Color(0xFFE8A0BF).withValues(alpha: 0.08),
          ],
        ),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: const Color(0xFFA98BC3).withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '¿Necesitas más ayuda?',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3D3D3D),
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Si tienes algún problema o duda que no se resuelve aquí, contacta a tu administrador.',
            style: TextStyle(
              fontFamily: 'Merriweather',
              fontSize: 12,
              height: 1.4,
              color: Color(0xFF757575),
            ),
          ),
          const SizedBox(height: 16),
          _buildContactRow(
            icon: Icons.email_outlined,
            label: 'ale126gala.36@gmail.com',
          ),
          const SizedBox(height: 10),
          _buildContactRow(
            icon: Icons.schedule_outlined,
            label: 'Lunes a Viernes, 8:00 - 18:00',
          ),
        ],
      ),
    );
  }

  Widget _buildContactRow({required IconData icon, required String label}) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: const Color(0xFF6B2D8B), size: 18),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF3D3D3D),
            ),
          ),
        ),
      ],
    );
  }
}
