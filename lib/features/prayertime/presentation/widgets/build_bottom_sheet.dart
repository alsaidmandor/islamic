import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic/core/utils/constants.dart';

import '../../../../core/color/colors.dart';
import '../../../../core/route/router.dart';
import '../../../../core/utils/assets_manager.dart';
import '../manager/prayer_time_cubit.dart';

class BuildBottomSheet extends StatefulWidget {
  const BuildBottomSheet();

  @override
  State<BuildBottomSheet> createState() => _BuildBottomSheetState();
}

class _BuildBottomSheetState extends State<BuildBottomSheet> {
  final PageController pageController =
      PageController(keepPage: true, initialPage: dt.day - 1);
  static const double mainAppbarPadding = 28;
  static const double _mosqueWidthFraction = 0.323;

  @override
  Widget build(BuildContext context) {
    final safeAreaTop = MediaQuery.of(context).padding.top;

    final mosqueSize = getSize(context).width * _mosqueWidthFraction;
    final appBarHeight = AppBar().preferredSize.height;
    const iconButtonPadding = mainAppbarPadding;
    final iconSize = IconTheme.of(context).size ?? 0;
    final mosqueTopMargin =
        -(mosqueSize / 2 - safeAreaTop - appBarHeight / 3.5);
    final mosqueMargin = -(mosqueSize / 2 - iconButtonPadding - iconSize / 2);

    return BlocConsumer<PrayerTimeCubit, PrayerTimeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = PrayerTimeCubit.get(context);

        return DraggableScrollableSheet(
          initialChildSize: 0.70,
          minChildSize: 0.70,
          maxChildSize: 0.85,
          builder: (BuildContext context, controller) {
            return Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: SingleChildScrollView(
                  controller: controller,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                IconButton.filled(
                                  iconSize: 15,
                                  constraints: const BoxConstraints(
                                      maxWidth: 30, maxHeight: 30),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => ColorsManager.gray
                                                .withOpacity(0.1)),
                                    shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    cubit.decrementPrayerTimePageIndex();
                                    pageController.animateToPage(
                                      cubit.currentPrayerTimePageIndex,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_ios_sharp,
                                    color: ColorsManager.mainColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                if (cubit.prayerTimeList.isNotEmpty) ...{
                                  Text(cubit
                                      .prayerTimeList[
                                          cubit.currentPrayerTimePageIndex]
                                      .date)
                                },
                                const Spacer(),
                                if (dt.day !=
                                    cubit.currentPrayerTimePageIndex + 1) ...{
                                  GestureDetector(
                                    onTap: () {
                                      pageController.animateToPage(
                                        dt.day - 1,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeInOut,
                                      );
                                    },
                                    child: Container(
                                        height: 26,
                                        width: 58,
                                        decoration: BoxDecoration(
                                            color: ColorsManager.onErrorLight,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: const Center(
                                          child: Text(
                                            'Today',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: ColorsManager.mainColor),
                                          ),
                                        )),
                                  ),
                                },
                                const SizedBox(
                                  width: 5,
                                ),
                                IconButton.filled(
                                  iconSize: 15,
                                  constraints: const BoxConstraints(
                                      maxWidth: 30, maxHeight: 30),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => ColorsManager.gray
                                                .withOpacity(0.1)),
                                    shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    cubit.incrementPrayerTimePageIndex();

                                    pageController.animateToPage(
                                      cubit.currentPrayerTimePageIndex,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward_ios,
                                    color: ColorsManager.mainColor,
                                  ),
                                ),
                              ],
                            ),
                            if (cubit.prayerTimeList.isNotEmpty) ...{
                              SizedBox(
                                  height: 365,
                                  child: PageView.builder(
                                      controller: pageController,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: cubit.prayerTimeList.length,
                                      onPageChanged: (value) {
                                        cubit.changePrayerTimePageIndex(value);
                                      },
                                      itemBuilder: (context, indexPage) {
                                        return Column(
                                          children: [
                                            for (int indexPrayer = 0;
                                                indexPrayer <
                                                    playerTimeIcon.length;
                                                indexPrayer++) ...{
                                              itemPrayerTime(
                                                  image: playerTimeIcon[
                                                      indexPrayer],
                                                  color: playerTimeIconColor[
                                                      indexPrayer],
                                                  text: cubit
                                                      .prayerTimeList[indexPage]
                                                      .prayers[indexPrayer]
                                                      .title,
                                                  isSelected: false,
                                                  time: cubit
                                                      .prayerTimeList[indexPage]
                                                      .prayers[indexPrayer]
                                                      .time,
                                                  indexPage: indexPage,
                                                  indexSelectedPage: dt.day - 1,
                                                  indexPrayer: indexPrayer,
                                                  indexSelectedPrayer:
                                                      cubit.indexNextPray,
                                                  context: context,
                                                  icon: CupertinoIcons
                                                      .speaker_1_fill),
                                              SpaceLine(
                                                  context: context,
                                                  height: 0.2),
                                            }
                                          ],
                                        );
                                      })),
                            } else ...{
                              SizedBox(
                                height: 365,
                                child: ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      SpaceLine(context: context, height: 0.5),
                                  itemCount: playerTimeIcon.length,
                                  itemBuilder: (context, index) =>
                                      itemPrayerTime(
                                          image: playerTimeIcon[index],
                                          color: playerTimeIconColor[index],
                                          text: prayerName[index],
                                          isSelected: false,
                                          time: '--:--',
                                          indexPage: 6,
                                          indexSelectedPage: 6,
                                          indexPrayer: 6,
                                          indexSelectedPrayer: 6,
                                          context: context,
                                          icon: CupertinoIcons.speaker_1_fill),
                                ),
                              ),
                            },
                            /* const SizedBox(
                              height: 5,
                            ),*/
                            Text('Discover',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface)),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Wrap(
                                spacing: 30.0,
                                runSpacing: 20,
                                children: List.generate(
                                  6,
                                  (index) => SizedBox(
                                    height: 62,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(context,
                                            nameOfScreenDiscover[index]);
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 35,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                color: ColorsManager
                                                    .greenboldColor
                                                    .withOpacity(0.1)),
                                            child: Image(
                                              image: islamicIcon[index],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            discoverName[index],
                                            style: TextStyle(fontSize: 10),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 110,
                        child: Stack(children: [
                          const Center(
                              child: Text(
                            'Feedback',
                            style: TextStyle(color: ColorsManager.mainColor),
                          )),
                          Positioned(
                            bottom: mosqueTopMargin,
                            right: mosqueMargin - 10,
                            left: mosqueMargin,
                            child: Image(
                              image: AppImages.mosqueHomeBackground,
                              width: mosqueSize,
                              height: mosqueSize + 10,
                              fit: BoxFit.cover,
                              color:
                                  ColorsManager.greenboldColor.withOpacity(0.1),
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ));
          },
        );
      },
    );
  }

  Widget itemPrayerTime(
      {required BuildContext context,
      required ImageProvider image,
      required Color color,
      required String text,
      required bool isSelected,
      required String time,
      required IconData icon,
      required int indexPrayer,
      required int indexSelectedPrayer,
      required int indexPage,
      required int indexSelectedPage}) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
            color: indexPage == indexSelectedPage
                ? indexPrayer == indexSelectedPrayer
                    ? ColorsManager.mainColor.withOpacity(0.2)
                    : Colors.transparent
                : Colors.transparent,
            width: 1),
        borderRadius: BorderRadius.circular(10),
        color: indexPage == indexSelectedPage
            ? indexPrayer == indexSelectedPrayer
                ? ColorsManager.mainColor.withOpacity(0.2)
                : Colors.transparent
            : Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image(
              image: image,
              color: color,
              width: 20,
              height: 20,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(text),
            const SizedBox(
              width: 10,
            ),
            Icon(
              icon,
              color: ColorsManager.onBackgroundLight,
            ),
            const Spacer(),
            Text(time),
            // Checkbox(
            //   value: false,
            //   onChanged: (bool? value) {
            //
            //   },
            // ),

            SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: ColorsManager.mainColor,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
