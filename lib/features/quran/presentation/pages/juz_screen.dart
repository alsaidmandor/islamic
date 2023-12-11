import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/constants.dart';
import '../manager/quran_cubit.dart';

class JuzScreen extends StatefulWidget {
  const JuzScreen({super.key});

  @override
  State<JuzScreen> createState() => _JuzScreenState();
}

class _JuzScreenState extends State<JuzScreen> {
  @override
  void initState() {
    super.initState();
  }

  int hizbQuarter = 1;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuranCubit, QuranState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = QuranCubit.get(context);

        return Scaffold(
          body: ListView.separated(
            separatorBuilder: (context, index) {
              return SpaceLine(context: context, height: 7);
            },
            itemCount: cubit.getALlJuzList.length,
            itemBuilder: (context, index) {
              Widget quarter(int quarter) {
                hizbQuarter = quarter;
                // cubit.changePageNumber(quarter);
                return Text(
                  hizbQuarter.toString(),
                  style: TextStyle(fontSize: 10),
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      ' Juz - ${cubit.getALlJuzList[index].juzAyahs![index].juz.toString()}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SpaceLine(context: context, height: 0.4),
                  for (int indexSurahJuz = 0;
                      indexSurahJuz <
                          cubit.getALlJuzList[index].juzAyahs!.length;
                      indexSurahJuz++) ...{
                    if (cubit.getALlJuzList[index].juzAyahs![indexSurahJuz]
                            .hizbQuarter! !=
                        hizbQuarter) ...{
                      Container(
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
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
                                        child: quarter(cubit
                                            .getALlJuzList[index]
                                            .juzAyahs![indexSurahJuz]
                                            .hizbQuarter!
                                            .toInt()),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Text(
                                            cubit
                                                .getALlJuzList[index]
                                                .juzAyahs![indexSurahJuz]
                                                .ayahsText!,
                                            style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                letterSpacing: 0.02,
                                                fontSize: 14),
                                          )),
                                      Text(
                                        '${cubit.getALlJuzList[index].juzAyahs![indexSurahJuz].surahName} - Ayah ${cubit.getALlJuzList[index].juzAyahs![indexSurahJuz].numberInSurah}',
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurfaceVariant
                                              .withOpacity(0.4),
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(cubit.getALlJuzList[index]
                                    .juzAyahs![indexSurahJuz].page!
                                    .toString())
                              ]),
                        ),
                      ),
                      SpaceLine(context: context, height: 0.4),
                    }
                  }
                ],
              );
            },
          ),
        );
      },
    );
  }
}
