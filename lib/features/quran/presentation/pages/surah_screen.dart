import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic/core/utils/constants.dart';

import '../../../../core/utils/assets_manager.dart';
import '../manager/quran_cubit.dart';

class SurahScreen extends StatelessWidget {
  const SurahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuranCubit, QuranState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = QuranCubit.get(context);
        int pages = 1;

        Widget linepage(int page) {
          pages = page;
          return Column(
            children: [
              Text(page.toString()),
              SpaceLine(height: 3, context: context),
            ],
          );
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.surface,
          ),
          body: SafeArea(
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 60,
                        width: getSize(context).width * 0.78,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              width: 2,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withOpacity(0.3),
                            )),
                        child: Center(
                          child: Text(
                              '${cubit.listOfSurahs![cubit.indexItem].name}'),
                        ),
                      ),
                      if (cubit.listOfSurahs![cubit.indexItem].englishName !=
                              'At-Tawba' &&
                          cubit.listOfSurahs![cubit.indexItem].englishName !=
                              'Al-Faatiha')
                        Image(
                          image: AppImages.starterSurah,
                          height: 100,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      const SizedBox(
                        height: 20,
                      ),
                      RichText(
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                            children: [
                              for (int i = 0;
                                  i <
                                      cubit.listOfSurahs![cubit.indexItem]
                                          .ayahs!.length;
                                  i++) ...{
                                if (cubit.listOfSurahs![cubit.indexItem]
                                        .englishName !=
                                    'At-Tawba') ...{
                                  if (i == 0) ...{
                                    if (cubit.listOfSurahs![cubit.indexItem]
                                            .englishName !=
                                        'Al-Faatiha') ...{
                                      TextSpan(
                                        text: cubit
                                            .listOfSurahs![cubit.indexItem]
                                            .ayahs![i]
                                            .text!
                                            .substring(39),
                                      ),
                                      WidgetSpan(
                                          child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: SizedBox(
                                          height: 35,
                                          width: 35,
                                          child: Stack(
                                            children: [
                                              const Image(
                                                image:
                                                    AppIslamicIcon.ahyaNumber,
                                                width: 35,
                                                height: 35,
                                                fit: BoxFit.cover,
                                                // color: ColorsManager.white,
                                              ),
                                              Center(
                                                child: Text(
                                                  ' ${cubit.listOfSurahs![cubit.indexItem].ayahs![i].numberInSurah}',
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                    } else ...{
                                      TextSpan(
                                        text: cubit
                                            .listOfSurahs![cubit.indexItem]
                                            .ayahs![i]
                                            .text!,
                                      ),
                                      WidgetSpan(
                                          child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: SizedBox(
                                          height: 35,
                                          width: 35,
                                          child: Stack(
                                            children: [
                                              const Image(
                                                image:
                                                    AppIslamicIcon.ahyaNumber,
                                                width: 35,
                                                height: 35,
                                                fit: BoxFit.cover,
                                                // color: ColorsManager.white,
                                              ),
                                              Center(
                                                child: Text(
                                                  ' ${cubit.listOfSurahs![cubit.indexItem].ayahs![i].numberInSurah}',
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                    }
                                  } else ...{
                                    // if(page <=cubit.listOfSurahs![cubit.indexItem].ayahs![i].page!.toInt())...{
                                    // }
                                    TextSpan(
                                      text: cubit.listOfSurahs![cubit.indexItem]
                                          .ayahs![i].text!,
                                    ),
                                    WidgetSpan(
                                        child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: SizedBox(
                                        height: 35,
                                        width: 35,
                                        child: Stack(
                                          children: [
                                            const Image(
                                              image: AppIslamicIcon.ahyaNumber,
                                              width: 35,
                                              height: 35,
                                              fit: BoxFit.cover,
                                              // color: ColorsManager.white,
                                            ),
                                            Center(
                                              child: Text(
                                                ' ${cubit.listOfSurahs![cubit.indexItem].ayahs![i].numberInSurah}',
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )),

                                    if (cubit.listOfSurahs![cubit.indexItem]
                                            .ayahs![i].page !=
                                        pages) ...{
                                      if (cubit.listOfSurahs![cubit.indexItem]
                                              .ayahs!.length >
                                          11) ...{
                                        WidgetSpan(
                                            child: linepage(cubit
                                                .listOfSurahs![cubit.indexItem]
                                                .ayahs![i]
                                                .page!))
                                      }
                                    }
                                  }
                                } else ...{
                                  TextSpan(
                                    text: cubit.listOfSurahs![cubit.indexItem]
                                        .ayahs![i].text!,
                                  ),
                                  WidgetSpan(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Container(
                                      height: 27,
                                      width: 27,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface),
                                        borderRadius: BorderRadius.circular(
                                          25,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          ' ${cubit.listOfSurahs![cubit.indexItem].ayahs![i].numberInSurah}',
                                        ),
                                      ),
                                    ),
                                  )),
                                },
                              }
                            ],
                            style: TextStyle(
                                fontSize: 25,
                                letterSpacing: 0.9,
                                height: 2.5,
                                wordSpacing: 0.2,
                                color:
                                    Theme.of(context).colorScheme.onSurface)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
