import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindfultodo/core/assets/colors/colors.dart';
import 'package:mindfultodo/core/di/service_locator.dart';
import 'package:mindfultodo/features/app-layout/presentation/pages/app_layout.dart';
import 'package:mindfultodo/features/app-layout/presentation/cubit/app_layout_cubit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindfultodo/features/calender/presentation/cubit/calender_cubit.dart';
import 'package:mindfultodo/features/create_task/presentation/cubit/task_cubit.dart';
import 'package:mindfultodo/features/today/presentation/cubit/today_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(Render());
}

class Render extends StatelessWidget {
  const Render({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AppLayoutCubit()),
          BlocProvider(create: (context) => TaskCubit()),
          BlocProvider(create: (context) => TodayCubit()),
          BlocProvider(create: (context) => CalenderCubit()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Test => Mindful Todo List Maker',
          theme: ThemeData(
            useMaterial3: true,
            textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
            appBarTheme: AppBarTheme(
              titleTextStyle: GoogleFonts.literata(fontSize: 22),
            ),
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primary,
              primary: AppColors.primary,
              secondary: AppColors.secondary,
              tertiary: AppColors.tertiary,
            ),
          ),
          themeMode: ThemeMode.system,
          home: AppLayout(),
        ),
      ),
    );
  }
}
