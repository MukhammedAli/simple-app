import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:myapp2/ExampleApp/controllers/counter_controller.dart';
import 'package:myapp2/ExampleApp/ui/views/counting_column.dart';
import 'package:google_fonts/google_fonts.dart';

class MyExample extends StatelessWidget {
  const MyExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 40,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
          title: Text(
              'First Try',
              style: GoogleFonts.raleway(
                fontSize: 40,
                fontWeight: FontWeight.w600
              )
          ),
          toolbarHeight: 70,
        ),
        body: GetBuilder<CounterController>(
          init: CounterController(),
          builder: (controller) {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...controller.model.counterList.map((e) => CountingColumn(
                        item: e,
                      ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
