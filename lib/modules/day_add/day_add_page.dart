import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lessonscheduleandroid/model/index.dart';
import 'package:lessonscheduleandroid/modules/MainController.dart';
import 'package:lessonscheduleandroid/modules/day_add/widgets/day_select_widget.dart';
import 'package:lessonscheduleandroid/routes/app_pages.dart';
import 'package:lessonscheduleandroid/shared/constants/index.dart';
import 'package:lessonscheduleandroid/shared/extensions/index.dart';
import 'package:lessonscheduleandroid/shared/widgets/AppBar/CustomAppBar.dart';

class DayAddPage extends StatelessWidget {
  DayAddPage({super.key});

  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController intervalController = TextEditingController();
  final FocusNode focus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.done),
        onPressed: () {
          Get.dialog(
              const Dialog(
                child: CircularProgressIndicator(),
              ),
              barrierDismissible: false);
          Get.find<MainController>().runGeneticAlgorithm(
              Student(Get.find<MainController>().prosList,
                  Get.find<MainController>().consList),
              Get.find<MainController>().lessonList,
              20,
              50,
              Get.find<MainController>().workingTimes);
          Get.back();
          Get.toNamed(Routes.GETLESSONSCHEDULE);
        },
      ),
      body: GestureDetector(
        onTap: () => focus.requestFocus(),
        child: Obx(
          () => Column(
            children: [
              const DaySelectWidget(),
              Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: 8.padAll,
                        child: TextFormField(
                          keyboardType: TextInputType.datetime,
                          validator: (value) => _validateTime(value),
                          controller: startTimeController,
                          decoration: InputDecoration(
                              labelText: AppStrings.STARTTIME,
                              labelStyle: TextStyle(fontSize: 18.spMin)),
                          style: TextStyle(fontSize: 18.spMin),
                        ),
                      ),
                      Padding(
                        padding: 8.padAll,
                        child: TextFormField(
                          keyboardType: TextInputType.datetime,
                          validator: (value) => _validateTime(value),
                          controller: endTimeController,
                          decoration: InputDecoration(
                              labelText: AppStrings.ENDTIME,
                              labelStyle: TextStyle(fontSize: 18.spMin)),
                        ),
                      ),
                      Padding(
                        padding: 8.padAll,
                        child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          controller: intervalController,
                          decoration: InputDecoration(
                              labelText: AppStrings.INTERVAL,
                              labelStyle: TextStyle(fontSize: 18.spMin)),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: 8.padAll,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      AppColors.ULTRA_VIOLET)),
                              onPressed: () => Get.find<MainController>()
                                  .workingTimes
                                  .assignAll([]),
                              child: const Text(
                                AppStrings.CLEARTIME,
                                style: TextStyle(color: AppColors.WHITE),
                              ),
                            ),
                          ),
                          Padding(
                            padding: 8.padAll,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      AppColors.ULTRA_VIOLET)),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Get.find<MainController>().generateTimeSlots(
                                      startTimeController,
                                      endTimeController,
                                      intervalController);
                                }
                              },
                              child: const Text(
                                AppStrings.ADDTIME,
                                style: TextStyle(color: AppColors.WHITE),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => ListTile(
                    title: Text(Get.find<MainController>()
                        .workingTimes
                        .elementAt(index)
                        .gun),
                    subtitle: Text(Get.find<MainController>()
                        .workingTimes
                        .elementAt(index)
                        .saat),
                  ),
                  itemCount: Get.find<MainController>().workingTimes.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String? _validateTime(String? value) {
    final timeRegExp = RegExp(r'^([01]?[0-9]|2[0-3]):[0-5][0-9]$');
    if (!timeRegExp.hasMatch(value ?? "")) {
      return AppStrings.VALIDATEERROR;
    }
    return null;
  }
}
