import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic/features/quran/presentation/manager/quran_cubit.dart';

import '../../../../core/color/colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/constants.dart';
import 'build_list_of_surah_name.dart';
import 'juz_screen.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final tabs = const [
    Tab(
      text: 'Surah',
    ),
    Tab(
      text: 'Juz',
    ),
    Tab(
      text: 'Note',
    ),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuranCubit, QuranState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = QuranCubit.get(context);
        return Scaffold(
          body: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: MediaQuery.of(context).size.height * 0.6,
                child: Container(
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AppImages.background,
                          fit: BoxFit.cover,
                          scale: 2.0,
                          opacity: 0.2),
                      color: Theme.of(context).colorScheme.primary),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.05,
                left: 15,
                right: 15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Row(
                      children: [
                        Text(
                          'Quran',
                          style: TextStyle(
                              color: ColorsManager.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Image(
                          image: AppImages.quranArText,
                          color: Colors.white,
                          width: 25,
                          height: 25,
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton.filled(
                      iconSize: 22,
                      constraints: const BoxConstraints(
                          minHeight: 30,
                          minWidth: 30,
                          maxWidth: 35,
                          maxHeight: 35),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) =>
                                ColorsManager.secondaryLight.withOpacity(0.1)),
                        shape: const MaterialStatePropertyAll(
                          CircleBorder(),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: ColorsManager.white,
                      ),
                    ),
                    IconButton.filled(
                      iconSize: 18,
                      constraints: const BoxConstraints(
                          minHeight: 30,
                          minWidth: 30,
                          maxWidth: 35,
                          maxHeight: 35),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) =>
                                ColorsManager.secondaryLight.withOpacity(0.1)),
                        shape: const MaterialStatePropertyAll(
                          CircleBorder(),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.share,
                        color: ColorsManager.white,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.12,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    color: Theme.of(context).colorScheme.background,
                  ),
                  child: Column(
                    children: <Widget>[
                      TabBar(
                        controller: _tabController,
                        tabs: tabs,
                        labelColor: ColorsManager.mainColor,
                        indicatorColor: ColorsManager.mainColor,
                        unselectedLabelColor:
                            Theme.of(context).colorScheme.onSurface,
                        indicatorSize: TabBarIndicatorSize.label,
                        isScrollable: false,
                      ),
                      SpaceLine(context: context, height: 1),
                      Expanded(
                        child: TabBarView(
                            controller: _tabController,
                            children: const [
                              // BuildListOfSurahScreen(),
                              BuildListOfSurahName(),
                              JuzScreen(),
                              SingleChildScrollView(
                                  child: Column(
                                children: [
                                  Image(
                                    image: AppIslamicIcon.backgroundBotton,
                                    width: 300,
                                    height: 300,
                                    fit: BoxFit.cover,
                                    color: ColorsManager.white,
                                  ),
                                  Image(
                                    image: AppIslamicIcon.log,
                                    width: 70,
                                    height: 70,
                                    fit: BoxFit.cover,
                                    color: ColorsManager.white,
                                  ),
                                  Center(child: Text('Note')),
                                ],
                              )),
                            ]),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  // Widget buildQuranLIst() {
  //   return BlocBuilder<QuranCubit, QuranState>(
  //     builder: (context, state) {
  //       if (state is LoadingQuran) {
  //         return Center(
  //           child: CircularProgressIndicator(),
  //         );
  //       } else if (state is SuccessLoadingQuran) {
  //         final quran = state.surahs;
  //         return ListView.builder(
  //           itemCount: quran?.length,
  //           itemBuilder: (context, index) {
  //             final chapter = quran![index];
  //             return ListTile(
  //               title: Text(chapter!.name!),
  //               subtitle: Text(chapter.number.toString()),
  //             );
  //           },
  //         );
  //       } else if (state is ErrorLoadingQuran) {
  //         return Center(
  //           child: Text('Error: ${state.message}'),
  //         );
  //       } else {
  //         return const Center(
  //           child: Text('Unknown state'),
  //         );
  //       }
  //     },
  //   );
  // }
}
