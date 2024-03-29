import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic/core/utils/constants.dart';

import '../../../../core/color/colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/quran_icon.dart';
import '../manager/quran_cubit.dart';

class SurahScreen extends StatelessWidget {
  SurahScreen({super.key});

  int pages = 1;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuranCubit, QuranState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = QuranCubit.get(context);

        return Scaffold(
          backgroundColor:
              getListColorBackground(context, cubit.backgroundColorSurahIndex),
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                                'Juz ${cubit.listOfSurahs![cubit.indexItem].ayahs![0].juz.toString()} ,'),
                            Text(
                                ' hizb ${cubit.listOfSurahs![cubit.indexItem].ayahs![0].juz.toString()}'),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return BlocBuilder<QuranCubit,
                                          QuranState>(
                                        builder: (context, state) {
                                          return Container(
                                            height: getSize(context).height,
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .background,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(25),
                                                      topRight:
                                                          Radius.circular(25)),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const SizedBox(
                                                        width: 45,
                                                      ),
                                                      buildTextUpperAndDownSpace(
                                                          text: 'Display',
                                                          style: const TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      IconButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          icon: const Icon(
                                                              CupertinoIcons
                                                                  .clear))
                                                    ],
                                                  ),
                                                  buildTextUpperAndDownSpace(
                                                      text: 'Theme',
                                                      style: const TextStyle()),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: List.generate(3,
                                                        (index) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          cubit
                                                              .selectSurahIndexColor(
                                                                  index);
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Container(
                                                          height: 60,
                                                          width: 100,
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  getListColorBackground(
                                                                      context,
                                                                      index),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              border: Border.all(
                                                                  color: getListColorBorderForSelected(
                                                                      context,
                                                                      index),
                                                                  width: 1)),
                                                          child: cubit.backgroundColorSurahIndex ==
                                                                  index
                                                              ? buildCheckMark()
                                                              : null,
                                                        ),
                                                      );
                                                    }),
                                                  ),
                                                  buildTextUpperAndDownSpace(
                                                      text: 'Font',
                                                      style: const TextStyle()),
                                                  Row(
                                                    children: [
                                                      const Text(
                                                        'A',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                      ),
                                                      Expanded(
                                                        child: Slider(
                                                          value: cubit
                                                              .fontSizeSurah,
                                                          onChanged: (value) {
                                                            cubit
                                                                .changeSliderValue(
                                                                    value);
                                                          },
                                                          label: cubit
                                                              .fontSizeSurah
                                                              .toString(),
                                                          divisions: 24,
                                                          max: 40.0,
                                                          min: 16,
                                                          // inactiveColor:
                                                          //     Colors.grey,
                                                        ),
                                                      ),
                                                      const Text(
                                                        'A',
                                                        style: TextStyle(
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 40,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {},
                                                    child: const Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'MoreSetting',
                                                          style: TextStyle(
                                                              fontSize: 18),
                                                        ),
                                                        Icon(
                                                          CupertinoIcons
                                                              .right_chevron,
                                                          size: 18,
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                                icon: const Icon(CupertinoIcons.book)),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(CupertinoIcons.ellipsis)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox.shrink(),
                Expanded(
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 60,
                              width: getSize(context).width * 0.9,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  const Image(
                                    image: AppIslamicIcon.nameBorder,

                                    fit: BoxFit.cover,
                                    // color: ColorsManager.white,
                                  ),
                                  Text(cubit.listOfSurahs![cubit.indexItem].name
                                      .toString())
                                ],
                              ),
                            ),
                            if (cubit.listOfSurahs![cubit.indexItem]
                                        .englishName !=
                                    'At-Tawba' &&
                                cubit.listOfSurahs![cubit.indexItem]
                                        .englishName !=
                                    'Al-Faatiha')
                              Image(
                                image: AppImages.starterSurah,
                                height: 100,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            const SizedBox(
                              height: 20,
                            ),
                            buildShowSurahText(cubit, context),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  int hzpp = 1;
  Widget buildShowSurahText(QuranCubit cubit, BuildContext context) {
    return RichText(
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.justify,
      text: TextSpan(
          children: [
            for (int i = 0;
                i < cubit.listOfSurahs![cubit.indexItem].ayahs!.length;
                i++) ...{
              if (cubit.listOfSurahs![cubit.indexItem].englishName !=
                  'At-Tawba') ...{
                if (i == 0) ...{
                  if (cubit.listOfSurahs![cubit.indexItem].englishName !=
                      'Al-Faatiha') ...{
                    TextSpan(
                      text: cubit.listOfSurahs![cubit.indexItem].ayahs![i].text!
                          .substring(39),
                    ),
                    WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: SizedBox(
                          height: 40,
                          width: 35,
                          child: Center(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                const Positioned(
                                    bottom: 16,
                                    width: 35,
                                    height: 40,
                                    child: Icon(IconQuran.aya, size: 40)),
                                Positioned(
                                  bottom: 12,
                                  child: Center(
                                    child: Text(
                                      '${cubit.listOfSurahs![cubit.indexItem].ayahs![i].numberInSurah}',
                                      style: const TextStyle(fontSize: 12),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  } else ...{
                    TextSpan(
                      text:
                          cubit.listOfSurahs![cubit.indexItem].ayahs![i].text!,
                    ),
                    WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: SizedBox(
                          height: 40,
                          width: 35,
                          child: Center(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                    bottom: 16,
                                    width: 35,
                                    height: 40,
                                    child: const Icon(IconQuran.aya, size: 40)),
                                Positioned(
                                  bottom: 12,
                                  child: Center(
                                    child: Text(
                                      '${cubit.listOfSurahs![cubit.indexItem].ayahs![i].numberInSurah}',
                                      style: const TextStyle(fontSize: 12),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  }
                } else ...{
                  // if(page <=cubit.listOfSurahs![cubit.indexItem].ayahs![i].page!.toInt())...{
                  // }
                  TextSpan(
                    text: cubit.listOfSurahs![cubit.indexItem].ayahs![i].text!,
                  ),
                  WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: SizedBox(
                        height: 40,
                        width: 35,
                        child: Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                  bottom: 16,
                                  width: 35,
                                  height: 40,
                                  child: const Icon(IconQuran.aya, size: 40)),
                              Positioned(
                                bottom: 12,
                                child: Center(
                                  child: Text(
                                    '${cubit.listOfSurahs![cubit.indexItem].ayahs![i].numberInSurah}',
                                    style: const TextStyle(fontSize: 12),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),

                  if (cubit.listOfSurahs![cubit.indexItem].ayahs![i].page !=
                      pages) ...{
                    if (cubit.listOfSurahs![cubit.indexItem].ayahs!.length >
                        11) ...{
                      WidgetSpan(
                          child: linePage(
                              cubit.listOfSurahs![cubit.indexItem].ayahs![i]
                                  .page!,
                              context))
                    }
                  }
                }
              } else ...{
                TextSpan(
                  text: cubit.listOfSurahs![cubit.indexItem].ayahs![i].text!,
                ),
                WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: SizedBox(
                      height: 40,
                      width: 35,
                      child: Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                                bottom: 16,
                                width: 35,
                                height: 40,
                                child: const Icon(IconQuran.aya, size: 40)),
                            Positioned(
                              bottom: 12,
                              child: Center(
                                child: Text(
                                  '${cubit.listOfSurahs![cubit.indexItem].ayahs![i].numberInSurah}',
                                  style: const TextStyle(fontSize: 12),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              },
            }
          ],
          style: TextStyle(
              fontSize: cubit.fontSizeSurah,
              letterSpacing: 0.9,
              height: 2.5,
              wordSpacing: 0.2,
              color: Theme.of(context).colorScheme.onSurface)),
    );
  }

  Widget linePage(int page, BuildContext context) {
    pages = page;
    return Column(
      children: [
        Text(page.toString()),
        SpaceLine(height: 3, context: context),
      ],
    );
  }

  Widget buildTextUpperAndDownSpace(
      {required String text, required TextStyle style}) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Text(
          text,
          style: style,
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget buildCheckMark() {
    return Center(
      child: Container(
        height: 20,
        width: 20,
        decoration: const BoxDecoration(
            color: ColorsManager.mainColor, shape: BoxShape.circle),
        child: const Center(
          child: Icon(
            CupertinoIcons.checkmark_alt,
            size: 14,
          ),
        ),
      ),
    );
  }
}
