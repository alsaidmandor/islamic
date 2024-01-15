import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic/core/utils/constants.dart';

import '../../../../core/color/colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../prayertime/domain/entitiy/tasbih.dart';
import '../manager/tasbih_cubit.dart';

class TasbihScreen extends StatelessWidget {
  TasbihScreen({super.key});
  List tasbihs = [
    Tasbih(
        id: 0,
        text: "سُبْحَانَ اللَّهِ",
        text_as_en: "subhana lah",
        text_en: "Glorified is Allah",
        counter: 0,
        counter_end: 33),
    Tasbih(
        id: 1,
        text: "سُبْحَانَ اللَّهِ وَبِحَمْدِه",
        text_as_en: "subhana lahi wa bihamdihi",
        text_en: "Glorified is Allah and by His praise",
        counter: 0,
        counter_end: 33),
    Tasbih(
        id: 2,
        text: "سُبْحَانَ اللَّهِِ وَالْحَمْدُ لِلَّهِ",
        text_as_en: "subhana lahi wa lhamdulilah",
        text_en: "Glorified is Allah, thank Allah",
        counter: 0,
        counter_end: 33),
    Tasbih(
        id: 3,
        text: "سُبْحَانَ اللهِ العَظِيمِ وَبِحَمْدِهِ",
        text_as_en: "subhana lahi laadim wa bihamdihi",
        text_en: "Glorified is Allah and by His praise",
        counter: 0,
        counter_end: 33),
    Tasbih(
        id: 4,
        text: "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ، سُبْحَانَ اللَّهِ الْعَظِيمِ",
        text_as_en: "subhana lahi wa bihamdihi, subhana lahi laadim",
        text_en: "Glorified is my Lord, the Great, and by His praise",
        counter: 0,
        counter_end: 33),
    Tasbih(
        id: 5,
        text:
            "سُبْحَانَ اللَّهِ، وَالْحَمْدُ لِلَّهِ، وَلَا إِلَهَ إِلَّا اللَّهُ، وَاللَّهُ أَكْبَرُِ",
        text_as_en:
            "Subḥānallāh,walḥamdu lillāh, wa lā ilaha illallāh ,wallāhuAkbar",
        text_en:
            "Glory is to Allah and praise is to Allah, and there is none worthy of worship but Allah,and Allah is the Most Great",
        counter: 0,
        counter_end: 33),
    Tasbih(
        id: 6,
        text:
            "لا إله إلّا اللهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلُّ شَيْءٍ قَدِيرِ",
        text_as_en:
            "La ilaha illal-lahu wahdahu la shareeka lah, lahul-mulku walahul-hamd, wahuwa AAala kulli shayin qadeer",
        text_en:
            "None has the right to be worshipped except Allah, alone, without partner. To Him belongs all sovereignty and praise and He is over all things omnipotent",
        counter: 0,
        counter_end: 33),
    Tasbih(
        id: 7,
        text: "لا حَوْلَ وَلا قُوَّةَ إِلا بِاللَّهِِ",
        text_as_en: "La hawla wala quwwata illa billah",
        text_en: "There is no might nor power except with Allah",
        counter: 0,
        counter_end: 33),
    Tasbih(
        id: 8,
        text:
            "لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لا شَرِيكَ لَهُ اللَّهُ أَكْبَرُ كَبِيراً، وَالْحَمْدُ لِلَّهِ كَثِيراً، سُبْحَانَ اللَّهِ رَبِّ العَالَمِينَ لا حَوْلَ وَلا قُوَّةَ إِلَّا بِاللَّهِ الْعَزِيزِ الْحَكِيم",
        text_as_en:
            "La ilaha illal-lah, wahdahu la shareeka lah, Allahu akbaru kabeera, walhamdu lillahi katheera, subhanal-lahi rabbil-AAalameen, la hawla wala quwwata illa billahil-AAazeezil-hakeem",
        text_en:
            "None has the right to be worshipped except Allah, alone without partener. Allah is most great and much praise is for Allah. How perfect Allah is, Lord of the worlds. There is no might nor power",
        counter: 0,
        counter_end: 33),
    Tasbih(
        id: 9,
        text:
            "اللَّهُمَّ اغْفِرِ لِي، وَارْحَمْنِي، وَاهْدِنِي، وَعَافِنِي وَارْزُقْنِيُ",
        text_as_en:
            "Allahummagh-fir lee, warhamnee, wahdinee, waAAafinee warzuqnee",
        text_en:
            "O Allah, forgive me, have mercy upon me, guide me, give me health and grant me sustenance",
        counter: 0,
        counter_end: 33),
    Tasbih(
        id: 9,
        text:
            "اللَّهُمَّ اغْفِرِ لِي، وَارْحَمْنِي، وَاهْدِنِي، وَعَافِنِي وَارْزُقْنِيُ",
        text_as_en:
            "Allahummagh-fir lee, warhamnee, wahdinee, waAAafinee warzuqnee",
        text_en:
            "O Allah, forgive me, have mercy upon me, guide me, give me health and grant me sustenance",
        counter: 0,
        counter_end: 33),
    Tasbih(
        id: 10,
        text: "أَسْتَغْفِرُ اللَّهَ",
        text_as_en: " Astaghfirul-lah",
        text_en: "    I seek forgiveness and repent to Allah",
        counter: 0,
        counter_end: 33),
    Tasbih(
      id: 11,
      text:
          "  أَسْتَغْفِرُ اللَّهَ الْعَظيمَ الَّذِي لا إلَهَ إِلا هُوَ الْحَيُّ القَيَوْمُ وَأَتُوبُ إِلَيهِِ",
      text_as_en:
          "Astaghfirul-lahal-lathee la ilaha illa huwal-hayyul-qayyoomu wa-atoobu ilayh",
      text_en:
          "I seek Allahs forgiveness, besides whom, none has the right to be worshipped except He, The Ever Living, The Self-Subsisting and Supporter of all, and I turn to Him in repentance",
      counter: 0,
      counter_end: 33,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasbihCubit(),
      child: BlocConsumer<TasbihCubit, TasbihState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = TasbihCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(CupertinoIcons.back)),
                title: Column(
                  children: [
                    const Text(
                      'Tasbih',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      '${cubit.numberPage + 1} / 12',
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.refresh_thick)),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.vibration)),
                  IconButton(
                      onPressed: () {
                        buildSettingTasbih(context, cubit);
                      },
                      icon: const Icon(CupertinoIcons.ellipsis)),
                ],
                elevation: 0,
              ),
              body: Column(
                children: [
                  BuildToShowTasbih(cubit: cubit),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const Image(
                          image: AppIslamicIcon.backgroundBotton,
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                          color: ColorsManager.mainColor,
                        ),
                        Positioned(
                          top: 100,
                          child: MaterialButton(
                            onPressed: () {
                              cubit.changeCountTasbih();
                            },
                            color: ColorsManager.mainColor,
                            height: 250,
                            elevation: 2,
                            shape: const CircleBorder(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('${cubit.countReached} / ${cubit.count} '),
                                Text('Round ${cubit.round} '),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ));
        },
      ),
    );
  }

  void buildSettingTasbih(BuildContext context, TasbihCubit cubit) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BlocBuilder<TasbihCubit, TasbihState>(
          builder: (context, state) {
            return Container(
              height: getSize(context).height,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 45,
                        ),
                        buildTextUpperAndDownSpace(
                            text: 'Display',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(CupertinoIcons.clear))
                      ],
                    ),
                    buildTextUpperAndDownSpace(
                        text: 'Theme', style: const TextStyle()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(3, (index) {
                        return GestureDetector(
                          onTap: () {
                            cubit.selectTasbihIndexColor(index);
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            height: 60,
                            width: 100,
                            decoration: BoxDecoration(
                                color: getListColorBackground(context, index),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: getListColorBorderForSelected(
                                        context, index),
                                    width: 1)),
                            child: cubit.backgroundColorTasbihIndex == index
                                ? buildCheckMark()
                                : null,
                          ),
                        );
                      }),
                    ),
                    buildTextUpperAndDownSpace(
                        text: 'Font', style: const TextStyle()),
                    Row(
                      children: [
                        const Text(
                          'A',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        ),
                        Expanded(
                          child: Slider(
                            value: cubit.fontSizeTasbih,
                            onChanged: (value) {
                              cubit.changeSliderValueTasbih(value);
                            },
                            label: cubit.fontSizeTasbih.toString(),
                            divisions: 24,
                            max: 40.0,
                            min: 12,
                            // inactiveColor:
                            //     Colors.grey,
                          ),
                        ),
                        const Text(
                          'A',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
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

class BuildToShowTasbih extends StatelessWidget {
  const BuildToShowTasbih({
    super.key,
    required this.cubit,
  });

  final TasbihCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getSize(context).height * 0.28,
      child: PageView.builder(
        itemCount: cubit.tasbih.length,
        onPageChanged: (value) {
          cubit.changePageIndex(value);
        },
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Container(
              height: getSize(context).height * 0.28,
              width: getSize(context).height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: getListColorBackground(
                      context, cubit.backgroundColorTasbihIndex)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Text(
                              cubit.tasbih[index]['text'],
                              style: TextStyle(fontSize: cubit.fontSizeTasbih),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Divider(
                            color: getListColorBorderForSelected(
                                context, cubit.backgroundColorTasbihIndex),
                            height: 1,
                            endIndent: 5,
                            indent: 5,
                            thickness: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Text(
                              cubit.tasbih[index]['text_as_en'],
                              style: TextStyle(fontSize: cubit.fontSizeTasbih),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Divider(
                            color: getListColorBorderForSelected(
                                context, cubit.backgroundColorTasbihIndex),
                            height: 1,
                            endIndent: 5,
                            indent: 5,
                            thickness: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Text(
                              cubit.tasbih[index]['text_en'],
                              style: TextStyle(fontSize: cubit.fontSizeTasbih),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
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
