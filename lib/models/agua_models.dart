class AguaModels {
  final String time;
  final String ml;

  AguaModels({
    required this.time,
    required this.ml,
  });

  @override
  String toString() {
    return 'Hora: $time, Quantidade: $ml ml';
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'ml': ml,
    };
  }
}
