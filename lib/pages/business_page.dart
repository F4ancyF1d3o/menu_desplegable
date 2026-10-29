import 'package:flutter/material.dart';

class BusinessPage extends StatelessWidget {
  const BusinessPage({super.key});

  static const List<_BusinessItem> _items = [
    _BusinessItem('Reunión de equipo', 'Sala principal · 10:30',
        Icons.groups_rounded, Color(0xFFE6D7FF)),
    _BusinessItem('Revisar propuesta', 'Proyecto Aurora · Hoy',
        Icons.description_rounded, Color(0xFFD9E5FF)),
    _BusinessItem('Llamar a cliente', 'María González · 14:00',
        Icons.call_rounded, Color(0xFFCDEFE5)),
    _BusinessItem('Informe mensual', 'Pendiente · Esta semana',
        Icons.bar_chart_rounded, Color(0xFFFFEABF)),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
      children: [
        const _WelcomeCard(
          eyebrow: 'TU ESPACIO DE TRABAJO',
          title: 'Todo en marcha',
          subtitle: 'Organiza tus tareas y mantente al día con tu equipo.',
          icon: Icons.business_center_rounded,
          color: Color(0xFF4F46E5),
        ),
        const SizedBox(height: 24),
        const _SectionTitle(title: 'Pendientes', detail: '4 actividades'),
        const SizedBox(height: 10),
        ..._items.map((item) => _ActivityTile(item: item)),
      ],
    );
  }
}

class _BusinessItem {
  const _BusinessItem(this.title, this.subtitle, this.icon, this.color);
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
}

class _ActivityTile extends StatelessWidget {
  const _ActivityTile({required this.item});
  final _BusinessItem item;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: _Card(
          child: Row(children: [
            _IconBox(icon: item.icon, color: item.color),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.title,
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 5),
                    Text(item.subtitle,
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 13)),
                  ]),
            ),
            Icon(Icons.chevron_right_rounded, color: Colors.grey.shade500),
          ]),
        ),
      );
}

class _WelcomeCard extends StatelessWidget {
  const _WelcomeCard(
      {required this.eyebrow,
      required this.title,
      required this.subtitle,
      required this.icon,
      required this.color});
  final String eyebrow;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(24)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(icon, color: Colors.white, size: 30),
          const SizedBox(height: 18),
          Text(eyebrow,
              style: const TextStyle(
                  color: Colors.white70,
                  letterSpacing: 1.1,
                  fontSize: 11,
                  fontWeight: FontWeight.w700)),
          const SizedBox(height: 6),
          Text(title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w700)),
          const SizedBox(height: 6),
          Text(subtitle,
              style: const TextStyle(color: Colors.white, height: 1.4)),
        ]),
      );
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title, required this.detail});
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

class _IconBox extends StatelessWidget {
  const _IconBox({required this.icon, required this.color});
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(15)),
        child: Icon(icon, color: const Color(0xFF34364A)),
      );
}

class _Card extends StatelessWidget {
  const _Card({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFEEF0F5)),
        ),
        child: child,
      );
}
