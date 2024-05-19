// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:lessonscheduleandroid/modules/MainBinding.dart';
import 'package:lessonscheduleandroid/modules/day_add/day_add_page.dart';
import 'package:lessonscheduleandroid/modules/get_lesson_schedule/get_lesson_schedule_page.dart';
import 'package:lessonscheduleandroid/modules/intro/intro_page.dart';
import 'package:lessonscheduleandroid/modules/lesson_select/lesson_select_page.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.INTRO;

  static final List<GetPage<dynamic>> routes = <GetPage>[
    // Auth Routes
    GetPage(
      name: Routes.INTRO,
      page: () => const IntroPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.LESSONSELECT,
      page: () => LessonSelectPage(),
    ),
    GetPage(
      name: Routes.DAYADDPAGE,
      page: () => DayAddPage(),
    ),
    GetPage(
      name: Routes.GETLESSONSCHEDULE,
      page: () => const GetLessonSchedulePage(),
    ),
  ];
}
