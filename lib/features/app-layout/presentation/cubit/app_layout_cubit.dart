import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindfultodo/features/app-layout/presentation/cubit/app_layout_states.dart';
import 'package:mindfultodo/features/calender/presentation/pages/calender_screen.dart';
import 'package:mindfultodo/features/create_task/presentation/pages/create_task_screen.dart';
import 'package:mindfultodo/features/library/presentation/pages/library_screen.dart';
import 'package:mindfultodo/features/today/presentation/pages/today_screen.dart';

class AppLayoutCubit extends Cubit<AppLayoutStates> {
  AppLayoutCubit() : super(AppLayoutInitialState());
  static AppLayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    const TodayScreen(),
    const CalenderScreen(),
    const CreateTaskScreen(),
    const LibraryScreen(),
  ];
  void changeTab(int index) {
    currentIndex = index;
    emit(ChangeBottomNavIndexState());
  }
}
