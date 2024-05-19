import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lessonscheduleandroid/routes/app_pages.dart';
import 'package:lessonscheduleandroid/shared/constants/index.dart';
import 'package:lessonscheduleandroid/shared/extensions/index.dart';
import 'package:lessonscheduleandroid/shared/widgets/AppBar/CustomAppBar.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: 16.padAll,
              child: const Text(AppStrings.APPDESC),
            ),
            Padding(
              padding: 16.padAll,
              child: ElevatedButton(
                  onPressed: () => Get.toNamed(Routes.LESSONSELECT),
                  child: const Text(AppStrings.CLICKTOSTART)),
            )
          ],
        ),
      ),
    );
  }
}
