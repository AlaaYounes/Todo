import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindfultodo/features/app-layout/presentation/cubit/app_layout_cubit.dart';
import 'package:mindfultodo/features/app-layout/presentation/cubit/app_layout_states.dart';
import 'package:mindfultodo/features/app-layout/presentation/widgets/bottom_nav_bar_widget.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = AppLayoutCubit.get(context);
    return BlocBuilder<AppLayoutCubit, AppLayoutStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text(
              'Mindful Planner',
              style: TextStyle(
                color: Color.fromRGBO(148, 73, 49, 1),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          bottomNavigationBar: BottomNavBarWidget(cubit: cubit),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
