import 'package:get/get.dart';
import 'package:myapp2/using_mvc/controllers/counter_controller.dart';

abstract class AbstractCommand {
  CounterController get controller => Get.find();
}