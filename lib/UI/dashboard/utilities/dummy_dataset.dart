import 'dart:math';
import 'package:fl_chart/fl_chart.dart';

double roundOff(double value) {
  return double.parse(value.toStringAsFixed(2));
}

List<FlSpot> generateGradualCryptoChartData({
  double initialPrice = 200,
  double minRateIncrease = 0.03,
  double maxRateIncrease = 0.1,
  double timePeriod = 100,
}) {
  List<FlSpot> spotList = [];
  Random random = Random();

  double currentPrice = initialPrice;
  double rateIncrease;

  for (int i = 0; i < timePeriod; i++) {
    // Gradually increase the rate of price change
    double progress = i / timePeriod;
    rateIncrease = roundOff(minRateIncrease +
        (maxRateIncrease - minRateIncrease) * pow(progress, 2));

    // Simulate price fluctuations
    double priceChangePercentage = rateIncrease * (random.nextDouble() - 0.5);
    currentPrice *= (1 + priceChangePercentage);

    spotList.add(FlSpot(roundOff(i.toDouble()), roundOff(currentPrice)));
  }

  return spotList;
}
