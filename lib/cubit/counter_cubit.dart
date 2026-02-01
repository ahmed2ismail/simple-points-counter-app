import 'package:basketball_points_counter_app/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  // التحسين: الحالة الابتدائية الآن تحتوي على القيم 0 و 0
  CounterCubit() : super(CounterState(teamAScore: 0, teamBScore: 0));

  // قائمة لتخزين الحالات السابقة (History) عشان نقدر نعمل Undo
  final List<CounterState> _history = [];

  void incrementCounter({required String teamName, required int points}) {
    // قبل ما نغير الحالة، نحفظ الحالة الحالية في السجل
    _history.add(state);

    if (teamName == "Team A") {
      // التحسين: نأخذ القيمة القديمة من state.teamAScore ونضيف عليها النقاط
      // ونحتفظ بقيمة الفريق الثاني كما هي state.teamBScore
      emit(
        CounterState(
          // state هو الخاصية التي تحتوي على الحالة الحالية (Current State) وبتيجي من ال states اللي بنعرفها في الكلاس CounterState
          teamAScore: state.teamAScore + points,
          teamBScore: state.teamBScore,
        ),
      );
    } else if (teamName == "Team B") {
      // نفس الشيء للفريق الثاني
      emit(
        CounterState(
          teamAScore: state.teamAScore,
          teamBScore: state.teamBScore + points,
        ),
      );
    }
  }

  void resetCounters() {
    // برضه قبل التصفير نحفظ الحالة عشان لو داس تصفير بالغلط يقدر يرجع
    _history.add(state);
    // التحسين: عند التصفير، نرسل حالة جديدة تحتوي على أصفار
    emit(CounterState(teamAScore: 0, teamBScore: 0));
  }

  void undo() {
    // نتأكد ان فيه حالات سابقة محفوظة عشان منعملش error
    if (_history.isNotEmpty) {
      // نجيب اخر حالة تم حفظها ونحذفها من الليست
      final previousState = _history.removeLast();
      // نرجع للحالة دي
      emit(previousState);
    }
  }
}
