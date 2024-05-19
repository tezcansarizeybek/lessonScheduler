import 'package:lessonscheduleandroid/model/lessons_model.dart';
import 'package:lessonscheduleandroid/model/student_model.dart';

class LessonPlanModel {
  List<LessonsModel> plan;
  double fitness = 0.0;

  LessonPlanModel(this.plan);

  double calculateFitness(Student ogrenci) {
    fitness = plan.fold(0.0, (double previousValue, LessonsModel item) {
      return previousValue + (ogrenci.cons.contains(item.ders) ? 1.5 : 1.0);
    });
    return fitness;
  }
}
