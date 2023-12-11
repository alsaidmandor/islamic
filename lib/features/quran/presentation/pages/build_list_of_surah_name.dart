import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic/core/color/colors.dart';

import '../../../../core/route/router.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/constants.dart';
import '../manager/quran_cubit.dart';

class BuildListOfSurahName extends StatefulWidget {
  const BuildListOfSurahName({super.key});

  @override
  State<BuildListOfSurahName> createState() => _BuildListOfSurahNameState();
}

class _BuildListOfSurahNameState extends State<BuildListOfSurahName> {
  @override
  void initState() {
    // context.read<QuranCubit>().getSurahs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuranCubit, QuranState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = QuranCubit.get(context);
        if (state is QuranGetSurahLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: cubit.listOfSurahs!.length,
          itemBuilder: (context, index) {
            var cubit = QuranCubit.get(context);
            return InkWell(
              onTap: () {
                cubit.setSelectedItemColor(index);
                Navigator.pushNamed(context, Routes.surah);
              },
              child: SizedBox(
                height: 60,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          height: 35,
                          width: 35,
                          child: Stack(
                            children: [
                              const Image(
                                image: AppIslamicIcon.star,
                                width: 35,
                                height: 35,
                                fit: BoxFit.cover,
                                color: Colors.white,
                                // color: ColorsManager.white,
                              ),
                              Center(
                                child: Text(
                                  '${index + 1}',
                                  style: const TextStyle(fontSize: 10),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${cubit.listOfSurahs![index].englishName}  ${cubit.listOfSurahs![index].name}',
                              style: const TextStyle(letterSpacing: 0.1),
                            ),
                            Text(
                              '${cubit.listOfSurahs![index].revelationType} - ${cubit.listOfSurahs![index].ayahs!.length}  Ayahs',
                              style: const TextStyle(
                                  color: ColorsManager.brightnessLight),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text('${cubit.listOfSurahs![index].ayahs![0].page}'),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SpaceLine(context: context, height: 0.2)
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
