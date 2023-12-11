import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/color/colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../Cubit/app_cubit.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                cubit.changeBottom(index);
              },
              currentIndex: cubit.currentIndex,
              selectedItemColor: ColorsManager.mainColor,
              unselectedItemColor: ColorsManager.greenboldColor,
              elevation: 0.0,
              items: const [
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AppIslamicIcon.mosqueHome,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                    icon: ImageIcon(AppIslamicIcon.quran2), label: 'Quran'),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_3,
                  ),
                  label: 'Profile',
                )
              ],
              backgroundColor: Theme.of(context).colorScheme.background,
            ),
            body: cubit.bottomScreens[cubit.currentIndex]);
      },
    );
  }
}
