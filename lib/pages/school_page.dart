import 'package:flutter/material.dart';

class SchoolPage extends StatelessWidget {
  const SchoolPage({super.key});

  static const List<_SchoolItem> _items = [
    _SchoolItem('Matemáticas', 'Ejercicios · Entrega mañana',
        Icons.calculate_rounded, Color(0xFFD9E5FF), 'Pendiente'),
    _SchoolItem('Ciencias naturales', 'Leer capítulo 4 · 20 min',
        Icons.science_rounded, Color(0xFFCDEFE5), 'En curso'),
    _SchoolItem('Historia', 'Proyecto de equipo · Viernes',
        Icons.menu_book_rounded, Color(0xFFE6D7FF), 'Pendiente'),
    _SchoolItem('Educación física', 'Clase · 15:00',
        Icons.sports_basketball_rounded, Color(0xFFFFD9DE), 'Hoy'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
      children: [
        const _SchoolBanner(),
        const SizedBox(height: 24),
        const _SchoolSectionTitle(
            title: 'Mis materias', detail: '4 actividades'),
        const SizedBox(height: 10),
        ..._items.map((item) => _SchoolTaskTile(item: item)),
      ],
    );
  }
}

class _SchoolItem {
  const _SchoolItem(
      this.title, this.subtitle, this.icon, this.color, this.status);
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final String status;
}

class _SchoolTaskTile extends StatelessWidget {
  const _SchoolTaskTile({required this.item});
  final _SchoolItem item;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFFEEF0F5))),
          child: Row(children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                  color: item.color, borderRadius: BorderRadius.circular(15)),
              child: Icon(item.icon, color: const Color(0xFF34364A)),
            ),
            const SizedBox(width: 14),
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(item.title,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 5),
                  Text(item.subtitle,
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 13)),
                ])),
            const SizedBox(width: 8),
            Text(item.status,
                style: TextStyle(
                    color: item.status == 'En curso'
                        ? const Color(0xFF0F9D78)
                        : Colors.grey.shade600,
                    fontSize: 11,
                    fontWeight: FontWeight.w600)),
          ]),
        ),
      );
}

class _SchoolBanner extends StatelessWidget {
  const _SchoolBanner();

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
            color: const Color(0xFFEA8B31),
            borderRadius: BorderRadius.circular(24)),
        child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.school_rounded, color: Colors.white, size: 30),
              SizedBox(height: 18),
              Text('TU ESPACIO DE ESTUDIO',
                  style: TextStyle(
                      color: Colors.white70,
                      letterSpacing: 1.1,
                      fontSize: 11,
                      fontWeight: FontWeight.w700)),
              SizedBox(height: 6),
              Text('¡Tú puedes! 📚',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.w700)),
              SizedBox(height: 6),
              Text('Revisa tus materias y organiza tus próximas tareas.',
                  style: TextStyle(color: Colors.white, height: 1.4)),
            ]),
      );
}

class _SchoolSectionTitle extends StatelessWidget {
  const _SchoolSectionTitle({required this.title, required this.detail});
  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) => Row(children: [
        Text(title,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
        const Spacer(),
        Text(detail,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
      ]);
}
