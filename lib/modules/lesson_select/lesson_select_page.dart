import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lessonscheduleandroid/modules/MainController.dart';
import 'package:lessonscheduleandroid/modules/lesson_select/lesson_list_widget/lesson_list_widget.dart';
import 'package:lessonscheduleandroid/routes/app_pages.dart';
import 'package:lessonscheduleandroid/shared/constants/index.dart';
import 'package:lessonscheduleandroid/shared/extensions/index.dart';
import 'package:lessonscheduleandroid/shared/widgets/AppBar/CustomAppBar.dart';

class LessonSelectPage extends StatelessWidget {
  LessonSelectPage({super.key});

  final TextEditingController lessonTxt = TextEditingController();
  final FocusNode lessonFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (Get.find<MainController>().lessonList.isNotEmpty) {
            Get.toNamed(Routes.DAYADDPAGE);
          } else {
            Get.snackbar(AppStrings.ALERT, AppStrings.LESSONSNOTEMPTY);
          }
        },
        child: const Icon(Icons.navigate_next),
      ),
      body: GestureDetector(
        onTap: () => lessonFocus.unfocus(),
        child: Column(
          children: [
            Padding(
              padding: 8.padAll,
              child: TextField(
                focusNode: lessonFocus,
                decoration: InputDecoration(
                    label: Text(
                      AppStrings.ENTERLESSONNAME,
                      style: TextStyle(fontSize: 18.spMin),
                    ),
                    suffix: InkWell(
                      child: const Icon(Icons.send),
                      onTap: () {
                        Get.find<MainController>()
                            .addLesson(lessonTxt, lessonFocus);
                      },
                    )),
                onSubmitted: (value) => Get.find<MainController>()
                    .addLesson(lessonTxt, lessonFocus),
                controller: lessonTxt,
              ),
            ),
            const LessonListWidget(),
          ],
        ),
      ),
    );
  }
}
