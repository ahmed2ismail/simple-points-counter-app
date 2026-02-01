import 'package:basketball_points_counter_app/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// --- Function --> cubit --> states --- // this is the flow of using cubit pattern
// هنحط الحالة الاب اللي هي CounterState في الكيوبت بتاعنا عشان نقدر نستخدمه كل الحالات الابناء اللي بيرثوها
// وبعد كده هيبقي فاضل ال Function اللي ال كيوبت هيستخدمها عشان يغير الحالة بتاعته
class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterCubitInitial());

  // --- هنا ال logic بتاع الكيوبت اللي هيغير ال states بناء علي ال functions ---
  int counterA = 0;
  int counterB = 0;

  dynamic incrementCounter({required String teamName, required int points}) {
    if (teamName == "Team A") {
      counterA += points;
      // بعد مكتبت ال logic اللي هيحصل بقوله طلع ال state الجديدة دي عن طريق ال emit بمعني طلع او اظهرلي ال state دي
      emit(CounterAIncrementState());
    } else if (teamName == "Team B") {
      counterB += points;
      // بعد مكتبت ال logic اللي هيحصل بقوله طلع ال state الجديدة دي عن طريق ال emit بمعني طلع او اظهرلي ال state دي
      emit(CounterBIncrementState());
    }
  }

  void resetCounters() {
    counterA = 0;
    counterB = 0;
    emit(CounterAIncrementState());
  }

  // --- end of logic ---
  // وكده نقدر نستخدم ال cubit بتاعنا في اي مكان في التطبيق عشان نغير الحالة بتاعتنا في ال UI
}
