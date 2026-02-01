import 'package:basketball_points_counter_app/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  // التحسين: الحالة الابتدائية الآن تحتوي على القيم 0 و 0
  CounterCubit() : super(CounterState(teamAScore: 0, teamBScore: 0));

  void incrementCounter({required String teamName, required int points}) {
    if (teamName == "Team A") {
      // التحسين: نأخذ القيمة القديمة من state.teamAScore ونضيف عليها النقاط
      // ونحتفظ بقيمة الفريق الثاني كما هي state.teamBScore
      emit(CounterState(
        // state هو الخاصية التي تحتوي على الحالة الحالية (Current State) وبتيجي من ال states اللي بنعرفها في الكلاس CounterState
        teamAScore: state.teamAScore + points,
        teamBScore: state.teamBScore,
      ));
    } else if (teamName == "Team B") {
      // نفس الشيء للفريق الثاني
      emit(CounterState(
        teamAScore: state.teamAScore,
        teamBScore: state.teamBScore + points,
      ));
    }
  }

  void resetCounters() {
    // التحسين: عند التصفير، نرسل حالة جديدة تحتوي على أصفار
    emit(CounterState(teamAScore: 0, teamBScore: 0));
  }
}
