import 'package:get/get.dart';
import 'package:myapp2/ExampleApp/models/counter_model.dart';

//here we state of the model and resultant data
class CounterController extends GetxController {
  static CounterController get to => Get.find();

  final CounterModel _model = CounterModel();
  CounterModel get model => _model;
}
