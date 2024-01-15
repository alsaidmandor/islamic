import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic/core/color/colors.dart';

import '../../../../core/route/router.dart';
import '../../../../core/services/local/cache_helper.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/constants.dart';
import '../manager/prayer_time_cubit.dart';

// Duration? timeDifference;

class BuildTopBodyHomeScreen extends StatefulWidget {
  const BuildTopBodyHomeScreen({super.key});

  static const double mainAppbarPadding = 28;
  static const double _mosqueWidthFraction = 0.323;

  @override
  State<BuildTopBodyHomeScreen> createState() => _BuildTopBodyHomeScreenState();
}

class _BuildTopBodyHomeScreenState extends State<BuildTopBodyHomeScreen> {
  // Timer? timer;

  @override
  initState() {
    // PrayerTimeCubit.get(context).startTimer();
    if (PrayerTimeCubit.get(context).timeDifference != null) {
      FlutterBackgroundService().invoke("setAsForeground");
    }

    super.initState();
  }

  @override
  void didUpdateWidget(covariant BuildTopBodyHomeScreen oldWidget) {
    setState(() {
      oldWidget.createState();
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // PrayerTimeCubit.get(context).cancelTime();

    super.didChangeDependencies();
  }
  // Duration? timeDifference;
/*
  void startTimer() {
    Future.delayed(
      Duration(seconds: 10),
      () => timer = Timer.periodic(Duration(seconds: 1), (timer) async {
        DateTime now = DateTime.now();
        if (PrayerTimeCubit.get(context).nextPrayerTime != null) {
          DateTime nextPrayer = PrayerTimeCubit.get(context).nextPrayerTime!;
          if (nextPrayer.isAtSameMomentAs(now)) {
            PrayerTimeCubit.get(context).calculateNextPrayerTime();
          } else if (nextPrayer.isAfter(now)) {
            setState(() {
              timeDifference = nextPrayer.difference(now);
            });
          }
          // print("${nextPrayer.day} => gggggggggggggggggggggg");
        }
      }),
    );
  }
*/

  // @override
  // void dispose() {
  //   // timer!.cancel();
  //   // FlutterBackgroundService().invoke("setAsBackground");
  //   PrayerTimeCubit.get(context).cancelTime();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final safeAreaTop = MediaQuery.of(context).padding.top;

    final mosqueSize =
        getSize(context).width * BuildTopBodyHomeScreen._mosqueWidthFraction;
    final appBarHeight = AppBar().preferredSize.height;
    const iconButtonPadding = BuildTopBodyHomeScreen.mainAppbarPadding;
    final iconSize = IconTheme.of(context).size ?? 0;
    final mosqueTopMargin =
        -(mosqueSize / 2 - safeAreaTop - appBarHeight / 3.5);
    final mosqueMargin = -(mosqueSize / 2 - iconButtonPadding - iconSize / 2);

    return BlocConsumer<PrayerTimeCubit, PrayerTimeState>(
      listener: (context, state) {
        if (state is DifferenceDurationBetweenCurrentTimeAndPrayerTime) {
          // NotificationService().permissionRequest();
          // NotificationService().createPlantFoodNotification(
          //     PrayerTimeCubit.get(context).timeDifference!);
        }
      },
      builder: (context, state) {
        var cubit = PrayerTimeCubit.get(context);

        if (cubit.prayerTimeList.isNotEmpty) {
          return Container(
              height: 250,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AppImages.background,
                      fit: BoxFit.cover,
                      scale: 2.0,
                      opacity: 0.2),
                  color: Theme.of(context).colorScheme.primary),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    bottom: mosqueTopMargin,
                    right: mosqueMargin - 5,
                    left: mosqueMargin,
                    child: Image(
                      image: AppImages.mosqueHomeBackground,
                      width: mosqueSize,
                      height: mosqueSize + 10,
                      fit: BoxFit.cover,
                      color: Colors.grey.shade800.withOpacity(0.7),
                    ),
                  ),
                  Positioned(
                    top: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 50),
                      child: Row(children: [
                        Container(
                            // margin: const EdgeInsets.symmetric(horizontal: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            width: 140,
                            height: 35,
                            decoration: BoxDecoration(
                                color: ColorsManager.secondaryLight
                                    .withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20)),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, Routes.location);
                              },
                              child: Row(
                                children: [
                                  const Icon(
                                    CupertinoIcons.location_solid,
                                    size: 22,
                                    color: ColorsManager.white,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Text(
                                      CacheHelper.getData(key: 'cityName'),
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: ColorsManager.white,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        const Spacer(),
                        IconButton.filled(
                          // iconSize: 25,
                          constraints: const BoxConstraints(
                              minHeight: 30,
                              minWidth: 30,
                              maxWidth: 40,
                              maxHeight: 40),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => ColorsManager.secondaryLight
                                    .withOpacity(0.1)),
                            shape: const MaterialStatePropertyAll(
                              CircleBorder(),
                            ),
                          ),
                          onPressed: () {
                            FlutterBackgroundService()
                                .invoke("setAsForeground");
                          },
                          icon: const Icon(
                            Icons.settings,
                            color: ColorsManager.white,
                          ),
                        ),
                        IconButton.filled(
                          // iconSize: 25,
                          constraints: const BoxConstraints(
                              minHeight: 30,
                              minWidth: 30,
                              maxWidth: 40,
                              maxHeight: 40),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => ColorsManager.secondaryLight
                                    .withOpacity(0.1)),
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
                      ]),
                    ),
                  ),
                  if (cubit.prayerTimeList.isNotEmpty) ...{
                    Positioned(
                      top: 210 * 0.45,
                      child: Text(
                        cubit.prayerTimeList[dt.day - 1]
                            .prayers[cubit.indexNextPray].title
                            .toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      top: 210 * 0.6,
                      child: RichText(
                        maxLines: 1,
                        text: TextSpan(children: [
                          if (cubit.isFajr != true) ...{
                            TextSpan(
                              text: cubit.prayerTimeList[dt.day - 1]
                                  .prayers[cubit.indexNextPray].time
                                  .substring(0, 6)
                                  .toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 38,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: cubit.prayerTimeList[dt.day - 1]
                                  .prayers[cubit.indexNextPray].time
                                  .substring(6, 8)
                                  .toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          } else ...{
                            TextSpan(
                              text: cubit.prayerTimeList[dt.day]
                                  .prayers[cubit.indexNextPray].time
                                  .substring(0, 6)
                                  .toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 38,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: cubit.prayerTimeList[dt.day]
                                  .prayers[cubit.indexNextPray].time
                                  .substring(6, 8)
                                  .toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          },
                        ]),
                      ),
                    ),
                    if (cubit.timeDifference != null) ...{
                      Positioned(
                        top: 210 * 0.8,
                        child: cubit.timeDifference!.inHours == 0
                            ? Text(
                                'Next Prayer:  ${cubit.timeDifference!.inMinutes.remainder(60)} : ${cubit.timeDifference!.inSeconds.remainder(60)} ',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              )
                            : Text(
                                'Next Prayer: ${cubit.timeDifference!.inHours} : ${cubit.timeDifference!.inMinutes.remainder(60)} : ${cubit.timeDifference!.inSeconds.remainder(60)} ',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                      ),
                    }
                  },
                ],
              ));
        }
        return Container(
          height: 250,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AppImages.backgroundMap,
                  fit: BoxFit.cover,
                  scale: 2.0,
                  opacity: 0.06),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [
                    Colors.black45,
                    Colors.transparent
                  ],
                  stops: [
                    0,
                    0.2,
                  ])),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AppImages.mapIcon,
                    height: 45,
                    width: 45,
                  ),
                  Text(
                    'Obtaining  location ... the prayer time is being '
                    'generated',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
