import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:myapp2/ExampleApp/models/data/counter.dart';

// this is objects created specifically for this example app
class CounterModel {
  final List<Counter> _counterList = [
    Counter(counter: 2.obs),
    Counter(counter: 0.obs),
    Counter(counter: 2.obs),
    Counter(counter: 1.obs),
  ];
  List<Counter> get counterList => _counterList;
}
