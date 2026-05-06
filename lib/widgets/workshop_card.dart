import 'package:flutter/material.dart';
import '../models/workshop.dart';
import 'status_badge.dart';
import 'kuota_bar.dart';

class WorkshopCard extends StatelessWidget {
  final Workshop workshop;
  final VoidCallback? onDaftar;

  const WorkshopCard({super.key, required this.workshop, this.onDaftar});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(color: Color(0xFFE0E0E0), width: 0.8),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Badge status
            StatusBadge(status: workshop.status),
            const SizedBox(height: 8),

            // Judul
            Text(
              workshop.judul,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF212121),
                height: 1.4,
              ),
            ),
            const SizedBox(height: 10),

            // Tanggal
            _MetaRow(
              icon: Icons.calendar_today_outlined,
              label: workshop.tanggal,
            ),
            const SizedBox(height: 5),

            // Lokasi
            _MetaRow(icon: Icons.location_on_outlined, label: workshop.lokasi),
            const SizedBox(height: 12),

            const Divider(height: 1, thickness: 0.8, color: Color(0xFFF0F0F0)),
            const SizedBox(height: 12),

            // Kuota + tombol
            Row(
              children: [
                Expanded(child: KuotaBar(workshop: workshop)),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: workshop.isFull ? null : onDaftar,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1565C0),
                    disabledBackgroundColor: const Color(0xFFEEEEEE),
                    foregroundColor: Colors.white,
                    disabledForegroundColor: const Color(0xFF9E9E9E),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  child: Text(workshop.isFull ? 'Penuh' : 'Daftar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MetaRow extends StatelessWidget {
  final IconData icon;
  final String label;

  const _MetaRow({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 14, color: const Color(0xFF9E9E9E)),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF757575),
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
