// التحسين: بدلاً من استخدام abstract class وحالات متعددة فارغة (Initial, IncrementA, IncrementB)
// الأفضل جعل الـ State تحمل البيانات نفسها.
// هذا يسمى "Single Source of Truth" أي أن الحالة هي المصدر الوحيد للبيانات.

class CounterState {
  final int teamAScore;
  final int teamBScore;

  // نستخدم required لضمان وجود قيم ابتدائية دائماً
  // المتغيرات final لضمان عدم تغييرها يدوياً من خارج الكلاس (Immutability)
  CounterState({required this.teamAScore, required this.teamBScore});
}
