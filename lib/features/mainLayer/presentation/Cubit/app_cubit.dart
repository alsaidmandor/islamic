import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../prayertime/presentation/pages/home.dart';
import '../../../profile/presentation/pages/profile_screen.dart';
import '../../../quran/presentation/pages/quran_screen.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  List<Widget> bottomScreens = [
    const HomePrayerTime(),
    const QuranScreen(),
    const ProfileScreen(),
  ];

  int currentIndex = 0;

  void changeBottom(int index) {
    currentIndex = index;
    emit(BottomChanged());
  }

  bool isDark = false;

  void changeAppMode() {
    isDark = !isDark;
    emit(AppChangeModeState());
  }
}
