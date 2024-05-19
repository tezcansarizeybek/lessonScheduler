import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lessonscheduleandroid/model/index.dart';

class MainController extends GetxController {
  var lessonList = <String>[].obs;
  var prosList = <String>[].obs;
  var consList = <String>[].obs;
  var workingTimes = <LessonsModel>[].obs;
  var lessonPlan = LessonPlanModel([]).obs;

  var days = {
    "Pzt": "Pazartesi",
    "Sal": "Salı",
    "Çrş": "Çarşamba",
    "Per": "Perşembe",
    "Cum": "Cuma",
    "Cmt": "Cumartesi",
    "Paz": "Pazar"
  };

  var selectedDay = "Pzt".obs;

  void generateTimeSlots(
      TextEditingController startTimeController,
      TextEditingController endTimeController,
      TextEditingController intervalController) {
    final startTimeInput = startTimeController.text;
    final endTimeInput = endTimeController.text;
    final intervalMinutes = int.tryParse(intervalController.text) ?? 30;

    List<String> slots = [];
    TimeOfDay startTime = _parseTime(startTimeInput);
    TimeOfDay endTime = _parseTime(endTimeInput);

    TimeOfDay currentTime = startTime;
    while (currentTime.hour < endTime.hour ||
        (currentTime.hour == endTime.hour &&
            currentTime.minute < endTime.minute)) {
      slots.add(_formatTime(currentTime));
      currentTime = _addMinutes(currentTime, intervalMinutes);
    }

    for (var slot in slots) {
      LessonsModel addingWorkingTime = LessonsModel(
          ders: "",
          saat: slot,
          gun: days.entries
              .firstWhere((element) => element.key == selectedDay.value)
              .value);
      bool exist = workingTimes.where((p) {
        return p.saat == addingWorkingTime.saat &&
            p.gun == addingWorkingTime.gun;
      }).isEmpty;
      if (exist) {
        workingTimes.add(addingWorkingTime);
      }
    }
    sortWorkingTimes();
  }

  TimeOfDay _parseTime(String time) {
    final parts = time.split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }

  String _formatTime(TimeOfDay time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  TimeOfDay _addMinutes(TimeOfDay time, int minutes) {
    int totalMinutes = time.hour * 60 + time.minute + minutes;
    int newHour = totalMinutes ~/ 60;
    int newMinute = totalMinutes % 60;
    return TimeOfDay(hour: newHour % 24, minute: newMinute);
  }

  void sortWorkingTimes() {
    final daysOrder = {
      'Pazartesi': 1,
      'Salı': 2,
      'Çarşamba': 3,
      'Perşembe': 4,
      'Cuma': 5,
      'Cumartesi': 6,
      'Pazar': 7
    };

    workingTimes.sort((a, b) {
      int dayComparison = daysOrder[a.gun]!.compareTo(daysOrder[b.gun]!);
      if (dayComparison != 0) return dayComparison;
      return a.saat.compareTo(b.saat);
    });
  }

  void addLesson(TextEditingController controller, FocusNode focusNode) {
    if (!lessonList.contains(controller.text) && controller.text.isNotEmpty) {
      lessonList.add(controller.text);
      controller.text = "";
      focusNode.requestFocus();
    }
  }

  List<LessonsModel> createRandomPlan(
      List<String> lessons, List<LessonsModel> workingTime) {
    Random random = Random();
    return workingTime.map((LessonsModel zaman) {
      return LessonsModel(
          gun: zaman.gun,
          saat: zaman.saat,
          ders: lessons[random.nextInt(lessons.length)]);
    }).toList();
  }

  List<LessonPlanModel> createPopulation(
      int size, List<String> lessons, List<LessonsModel> workingTime) {
    return List.generate(
        size, (_) => LessonPlanModel(createRandomPlan(lessons, workingTime)));
  }

  List<LessonPlanModel> selection(List<LessonPlanModel> population) {
    population.sort((a, b) => b.fitness.compareTo(a.fitness));
    return population.sublist(0, population.length ~/ 2);
  }

  LessonPlanModel cross(LessonPlanModel parent1, LessonPlanModel parent2) {
    Random random = Random();
    int cuttingPoint = random.nextInt(parent1.plan.length);
    List<LessonsModel> yeniPlan = [
      ...parent1.plan.sublist(0, cuttingPoint),
      ...parent2.plan.sublist(cuttingPoint)
    ];
    return LessonPlanModel(yeniPlan);
  }

  void mutation(LessonPlanModel plan, List<String> dersler) {
    Random random = Random();
    for (var item in plan.plan) {
      if (random.nextDouble() < 0.1) {
        item.ders = dersler[random.nextInt(dersler.length)];
      }
    }
  }

  LessonPlanModel runGeneticAlgorithm(Student student, List<String> lessons,
      int populationSize, int genNumber, List<LessonsModel> workingTime) {
    List<LessonPlanModel> population =
        createPopulation(populationSize, lessons, workingTime);
    for (int i = 0; i < genNumber; i++) {
      for (LessonPlanModel plan in population) {
        plan.calculateFitness(student);
      }
      population = selection(population);
      List<LessonPlanModel> newPopulation = List.from(population);
      for (int j = 0; j < population.length; j++) {
        newPopulation
            .add(cross(population[j], population[(j + 1) % population.length]));
      }
      for (LessonPlanModel plan in newPopulation) {
        mutation(plan, lessons);
      }
      population = newPopulation;
    }
    population.sort((a, b) => b.fitness.compareTo(a.fitness));

    lessonPlan.value = population.first;

    return population.first;
  }
}
