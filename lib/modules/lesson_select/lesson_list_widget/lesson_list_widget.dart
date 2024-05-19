import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:lessonscheduleandroid/modules/MainController.dart';
import 'package:lessonscheduleandroid/shared/constants/index.dart';

class LessonListWidget extends StatelessWidget {
  const LessonListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 3,
        child: Obx(
          () => ListView.builder(
            itemBuilder: (context, index) => Slidable(
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      Get.find<MainController>().lessonList.remove(
                          Get.find<MainController>()
                              .lessonList
                              .elementAt(index));
                    },
                    backgroundColor: AppColors.RED,
                    foregroundColor: AppColors.WHITE,
                    icon: Icons.delete,
                    label: AppStrings.DELETE,
                  ),
                ],
              ),
              child: ListTile(
                title: Text(
                    Get.find<MainController>().lessonList.elementAt(index)),
                trailing: Obx(
                  () => Checkbox(
                    onChanged: (bool? value) {
                      if (value!) {
                        Get.find<MainController>().prosList.add(
                            Get.find<MainController>()
                                .lessonList
                                .elementAt(index));
                        Get.find<MainController>().consList.remove(
                            Get.find<MainController>()
                                .lessonList
                                .elementAt(index));
                      } else {
                        Get.find<MainController>().prosList.remove(
                            Get.find<MainController>()
                                .lessonList
                                .elementAt(index));
                        Get.find<MainController>().consList.add(
                            Get.find<MainController>()
                                .lessonList
                                .elementAt(index));
                      }
                    },
                    value: Get.find<MainController>().prosList.contains(
                        Get.find<MainController>().lessonList.elementAt(index)),
                  ),
                ),
                onTap: () {
                  Get.dialog(AlertDialog(
                    title: Text(
                        "${Get.find<MainController>().lessonList.elementAt(index)} ${AppStrings.DELETEALERT}"),
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Get.find<MainController>().lessonList.remove(
                                Get.find<MainController>()
                                    .lessonList
                                    .elementAt(index));
                            Get.back();
                          },
                          child: Text(AppStrings.YES),
                        ),
                        ElevatedButton(
                            onPressed: () => Get.back(),
                            child: Text(AppStrings.NO))
                      ],
                    ),
                  ));
                },
              ),
            ),
            itemCount: Get.find<MainController>().lessonList.length,
          ),
        ));
  }
}
