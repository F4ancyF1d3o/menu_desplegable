import 'package:flutter/material.dart';

class HomeDashboardPage extends StatelessWidget {
  const HomeDashboardPage({super.key});

  static const List<_HomeItem> _items = [
    _HomeItem('Lista del súper', 'Leche, pan, fruta',
        Icons.shopping_basket_rounded, Color(0xFFFFEABF), '3'),
    _HomeItem('Ordenar la sala', 'Sala · Para hoy', Icons.weekend_rounded,
        Color(0xFFD9E5FF), ''),
    _HomeItem('Regar las plantas', 'Jardín · 17:00',
        Icons.local_florist_rounded, Color(0xFFCDEFE5), ''),
    _HomeItem('Preparar la cena', 'Cocina · 19:30', Icons.restaurant_rounded,
        Color(0xFFFFD9DE), ''),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
      children: [
        const _HomeBanner(),
        const SizedBox(height: 24),
        const _HomeSectionTitle(title: 'Hoy en casa', detail: '4 tareas'),
        const SizedBox(height: 10),
        ..._items.map((item) => _HomeTaskTile(item: item)),
      ],
    );
  }
}

class _HomeItem {
  const _HomeItem(this.title, this.subtitle, this.icon, this.color, this.count);
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final String count;
}

class _HomeTaskTile extends StatelessWidget {
  const _HomeTaskTile({required this.item});
  final _HomeItem item;

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
            if (item.count.isNotEmpty)
              CircleAvatar(
                  radius: 13,
                  backgroundColor: const Color(0xFF4F46E5),
                  child: Text(item.count,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w700)))
            else
              Icon(Icons.chevron_right_rounded, color: Colors.grey.shade500),
          ]),
        ),
      );
}

class _HomeBanner extends StatelessWidget {
  const _HomeBanner();

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
            color: const Color(0xFF0F9D78),
            borderRadius: BorderRadius.circular(24)),
        child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.home_rounded, color: Colors.white, size: 30),
              SizedBox(height: 18),
              Text('TU HOGAR',
                  style: TextStyle(
                      color: Colors.white70,
                      letterSpacing: 1.1,
                      fontSize: 11,
                      fontWeight: FontWeight.w700)),
              SizedBox(height: 6),
              Text('Hola, familia 👋',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.w700)),
              SizedBox(height: 6),
              Text('Aquí tienes las actividades para organizar el día.',
                  style: TextStyle(color: Colors.white, height: 1.4)),
            ]),
      );
}

class _HomeSectionTitle extends StatelessWidget {
  const _HomeSectionTitle({required this.title, required this.detail});
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
