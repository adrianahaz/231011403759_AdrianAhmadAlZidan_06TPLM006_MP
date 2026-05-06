import 'package:flutter/material.dart';
import '../models/workshop.dart';

class StatusBadge extends StatelessWidget {
  final WorkshopStatus status;

  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final config = _badgeConfig(status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: config.backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        config.label,
        style: TextStyle(
          color: config.textColor,
          fontSize: 11,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.3,
        ),
      ),
    );
  }

  _BadgeConfig _badgeConfig(WorkshopStatus status) {
    switch (status) {
      case WorkshopStatus.tersedia:
        return _BadgeConfig(
          label: 'Tersedia',
          backgroundColor: const Color(0xFFE8F5E9),
          textColor: const Color(0xFF2E7D32),
        );
      case WorkshopStatus.hampirPenuh:
        return _BadgeConfig(
          label: 'Hampir Penuh',
          backgroundColor: const Color(0xFFFFF8E1),
          textColor: const Color(0xFFF57F17),
        );
      case WorkshopStatus.penuh:
        return _BadgeConfig(
          label: 'Penuh',
          backgroundColor: const Color(0xFFFFEBEE),
          textColor: const Color(0xFFC62828),
        );
    }
  }
}

class _BadgeConfig {
  final String label;
  final Color backgroundColor;
  final Color textColor;

  _BadgeConfig({
    required this.label,
    required this.backgroundColor,
    required this.textColor,
  });
}
