import 'package:myapp2/using_mvc/controllers/commands/abstract_command.dart';
import 'package:myapp2/using_mvc/models/data/counter.dart';

class CountDownCommand extends AbstractCommand {
  Future<void> execute(Counter item) async {
    item.counter.value--;

    // controller.update();
  }
}
