import 'package:flutter/material.dart';

class AccountingPage extends StatelessWidget {
  const AccountingPage({super.key});

  static const List<_AccountingEntry> _entries = [
    _AccountingEntry('Venta de productos', 'Hoy · Ingreso', 1250.00, true,
        Icons.trending_up_rounded, Color(0xFFCDEFE5)),
    _AccountingEntry('Compra de materiales', 'Hoy · Gasto', 280.50, false,
        Icons.shopping_bag_outlined, Color(0xFFFFD9DE)),
    _AccountingEntry('Pago de servicio', 'Ayer · Gasto', 95.00, false,
        Icons.receipt_long_outlined, Color(0xFFFFEABF)),
    _AccountingEntry('Servicio de consultoría', 'Ayer · Ingreso', 800.00, true,
        Icons.work_outline_rounded, Color(0xFFD9E5FF)),
  ];

  @override
  Widget build(BuildContext context) {
    final income = _entries
        .where((entry) => entry.isIncome)
        .fold<double>(0, (sum, entry) => sum + entry.amount);
    final expenses = _entries
        .where((entry) => !entry.isIncome)
        .fold<double>(0, (sum, entry) => sum + entry.amount);

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
      children: [
        const _AccountingBalanceCard(),
        const SizedBox(height: 18),
        Row(children: [
          Expanded(
              child: _SummaryCard(
                  title: 'Ingresos',
                  amount: income,
                  color: const Color(0xFF0F9D78),
                  icon: Icons.arrow_downward_rounded)),
          const SizedBox(width: 12),
          Expanded(
              child: _SummaryCard(
                  title: 'Gastos',
                  amount: expenses,
                  color: const Color(0xFFE34D59),
                  icon: Icons.arrow_upward_rounded)),
        ]),
        const SizedBox(height: 24),
        const Row(children: [
          Text('Movimientos',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
          Spacer(),
          Text('Este mes', style: TextStyle(color: Colors.grey, fontSize: 13)),
        ]),
        const SizedBox(height: 10),
        ..._entries.map((entry) => _EntryTile(entry: entry)),
      ],
    );
  }
}

class _AccountingEntry {
  const _AccountingEntry(this.title, this.subtitle, this.amount, this.isIncome,
      this.icon, this.color);
  final String title;
  final String subtitle;
  final double amount;
  final bool isIncome;
  final IconData icon;
  final Color color;
}

class _AccountingBalanceCard extends StatelessWidget {
  const _AccountingBalanceCard();

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
            color: const Color(0xFF4F46E5),
            borderRadius: BorderRadius.circular(24)),
        child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.account_balance_wallet_rounded,
                  color: Colors.white, size: 30),
              SizedBox(height: 18),
              Text('BALANCE DISPONIBLE',
                  style: TextStyle(
                      color: Colors.white70,
                      letterSpacing: 1.1,
                      fontSize: 11,
                      fontWeight: FontWeight.w700)),
              SizedBox(height: 6),
              Text('\$1,674.50',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 29,
                      fontWeight: FontWeight.w700)),
              SizedBox(height: 6),
              Text('Resumen de ejemplo · valores simulados',
                  style: TextStyle(color: Colors.white70, fontSize: 12)),
            ]),
      );
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard(
      {required this.title,
      required this.amount,
      required this.color,
      required this.icon});
  final String title;
  final double amount;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: const Color(0xFFEEF0F5))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(icon, color: color),
          const SizedBox(height: 10),
          Text(title,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
          const SizedBox(height: 4),
          Text('\$${amount.toStringAsFixed(2)}',
              style: TextStyle(
                  color: color, fontWeight: FontWeight.w700, fontSize: 18)),
        ]),
      );
}

class _EntryTile extends StatelessWidget {
  const _EntryTile({required this.entry});
  final _AccountingEntry entry;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 9),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFFEEF0F5))),
          child: Row(children: [
            Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                    color: entry.color,
                    borderRadius: BorderRadius.circular(14)),
                child: Icon(entry.icon, color: const Color(0xFF34364A))),
            const SizedBox(width: 13),
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(entry.title,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 5),
                  Text(entry.subtitle,
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                ])),
            Text(
                '${entry.isIncome ? '+' : '-'}\$${entry.amount.toStringAsFixed(2)}',
                style: TextStyle(
                    color: entry.isIncome
                        ? const Color(0xFF0F9D78)
                        : const Color(0xFFE34D59),
                    fontWeight: FontWeight.w700)),
          ]),
        ),
      );
}
