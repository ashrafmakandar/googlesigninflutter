import 'package:charts_flutter/flutter.dart' as charts;

class Click {
  final double batterylevel;
  final deviceid;
  final charts.Color barColor;

  Click(this.batterylevel, this.deviceid, this.barColor);
}
