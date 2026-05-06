enum WorkshopStatus { tersedia, hampirPenuh, penuh }

class Workshop {
  final String judul;
  final String tanggal;
  final String lokasi;
  final int kuotaTerisi;
  final int kuotaTotal;

  const Workshop({
    required this.judul,
    required this.tanggal,
    required this.lokasi,
    required this.kuotaTerisi,
    required this.kuotaTotal,
  });

  double get persentaseKuota => kuotaTerisi / kuotaTotal;

  bool get isFull => kuotaTerisi >= kuotaTotal;

  WorkshopStatus get status {
    if (kuotaTerisi >= kuotaTotal) return WorkshopStatus.penuh;
    if (persentaseKuota >= 0.8) return WorkshopStatus.hampirPenuh;
    return WorkshopStatus.tersedia;
  }

  String get statusLabel {
    switch (status) {
      case WorkshopStatus.tersedia:
        return 'Tersedia';
      case WorkshopStatus.hampirPenuh:
        return 'Hampir Penuh';
      case WorkshopStatus.penuh:
        return 'Penuh';
    }
  }
}
