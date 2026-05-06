import 'package:flutter/material.dart';
import '../models/workshop.dart';

class KuotaBar extends StatelessWidget {
  final Workshop workshop;

  const KuotaBar({super.key, required this.workshop});

  @override
  Widget build(BuildContext context) {
    final color = _barColor(workshop.status);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Kuota: ${workshop.kuotaTerisi} / ${workshop.kuotaTotal}',
          style: const TextStyle(fontSize: 11, color: Color(0xFF9E9E9E)),
        ),
        const SizedBox(height: 5),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: workshop.persentaseKuota,
            minHeight: 5,
            backgroundColor: const Color(0xFFEEEEEE),
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ],
    );
  }

  Color _barColor(WorkshopStatus status) {
    switch (status) {
      case WorkshopStatus.tersedia:
        return const Color(0xFF43A047);
      case WorkshopStatus.hampirPenuh:
        return const Color(0xFFFFA000);
      case WorkshopStatus.penuh:
        return const Color(0xFFE53935);
    }
  }
}
