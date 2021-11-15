import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp2/ExampleApp/controllers/commands/count_down_command.dart';
import 'package:myapp2/ExampleApp/controllers/commands/count_up_command.dart';
import 'package:myapp2/ExampleApp/models/data/counter.dart';

//Here we have all the things that a user can see in my example app
class CountingColumn extends StatelessWidget {
  final Counter item;

  const CountingColumn({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
                backgroundColor: Colors.purple,
                child: const Icon(Icons.add),
                onPressed: () => CountUpCommand().execute(item)),
            Text(
              item.counter.toString(),
              style: const TextStyle(fontSize: 48),
            ),
            FloatingActionButton(
                backgroundColor: Colors.purple,
                child: const Icon(Icons.remove),
                onPressed: () => CountDownCommand().execute(item)),
          ],
        ));
  }
}
