import 'package:get/get.dart';
import 'package:myapp2/ExampleApp/controllers/counter_controller.dart';

abstract class AbstractCommand {
  CounterController get controller => Get.find();
}