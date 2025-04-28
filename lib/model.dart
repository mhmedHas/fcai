class PredictionResult {
  final String predictedClass;
  final double confidencePercentage;

  PredictionResult({
    required this.predictedClass,
    required this.confidencePercentage,
  });

  factory PredictionResult.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return PredictionResult(
      predictedClass: data['predicted_class'],
      confidencePercentage: (data['confidence_percentage'] as num).toDouble(),
    );
  }
}
