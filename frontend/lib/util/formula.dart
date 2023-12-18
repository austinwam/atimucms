import 'package:statistics/statistics.dart';

class Math {
  Future<void> means(List items) async {
    var ns = [10, 20.0, 30];
    print('ns: $ns');

    var mean = ns.mean;
    print('mean: $mean');

    var sdv = ns.standardDeviation;
    print('sdv: $sdv');

    var squares = ns.square;
    print('squares: $squares');
  }
  // Future<void> average(params) async {}
}
