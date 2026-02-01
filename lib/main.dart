import 'package:basketball_points_counter_app/cubit/counter_cubit.dart';
import 'package:basketball_points_counter_app/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const PointsCounter());
}

class PointsCounter extends StatelessWidget {
  const PointsCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.orange),
        ),
        home: HomeView(),
      ),
    );
  }
}
