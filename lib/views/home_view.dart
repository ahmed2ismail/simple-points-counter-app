import 'package:basketball_points_counter_app/cubit/counter_cubit.dart';
import 'package:basketball_points_counter_app/cubit/counter_state.dart';
import 'package:basketball_points_counter_app/widgets/team_score_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // التحسين: استخدمنا BlocBuilder بدلاً من BlocConsumer لأننا نحتاج فقط لإعادة بناء الواجهة (Rebuild)
    // ولا نحتاج لـ listener في الوقت الحالي (الـ listener يستخدم للـ Side Effects مثل الـ SnackBar)
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Points Counter",
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              IconButton(
                onPressed: () => BlocProvider.of<CounterCubit>(context).undo(),
                icon: const Icon(Icons.undo, color: Colors.white),
                tooltip: 'Undo',
              ),
            ],
          ),
          body: Column(
            spacing: 70,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TeamScoreColumn(
                    teamName: "Team A",
                    // التحسين: نأخذ القيمة من الـ state مباشرة وليس من متغيرات الـ Cubit
                    counter: state.teamAScore,
                    onAddPoints: (points) {
                      BlocProvider.of<CounterCubit>(
                        context,
                      ).incrementCounter(teamName: "Team A", points: points);
                    },
                  ),
                  Container(
                    height: 430,
                    width: 16,
                    margin: const EdgeInsets.only(top: 20),
                    child: VerticalDivider(
                      color: Colors.grey[400],
                      thickness: 1,
                    ),
                  ),
                  TeamScoreColumn(
                    teamName: "Team B",
                    // التحسين: نأخذ القيمة من الـ state مباشرة
                    counter: state.teamBScore,
                    onAddPoints: (points) {
                      BlocProvider.of<CounterCubit>(
                        context,
                      ).incrementCounter(teamName: "Team B", points: points);
                    },
                  ),
                ],
              ),
              MaterialButton(
                color: Colors.orange,
                padding: const EdgeInsets.symmetric(
                  horizontal: 60,
                  vertical: 15,
                ),
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).resetCounters();
                },
                child: const Text("Reset"),
              ),
            ],
          ),
        );
      },
    );
  }
}
