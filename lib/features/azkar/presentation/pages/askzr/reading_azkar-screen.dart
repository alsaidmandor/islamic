import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic/core/utils/assets_manager.dart';
import 'package:marquee_text/marquee_direction.dart';
import 'package:marquee_text/marquee_text.dart';
import 'package:screen_brightness/screen_brightness.dart';

import '../../../../../core/color/colors.dart';
import '../../../../../core/utils/constants.dart';
import '../../manager/azkar_cubit.dart';
import '../../widgets/custom_paint_Azkar.dart';

class ReadingAzkarScreen extends StatefulWidget {
  ReadingAzkarScreen({super.key});

  @override
  State<ReadingAzkarScreen> createState() => _ReadingAzkarScreenState();
}

class _ReadingAzkarScreenState extends State<ReadingAzkarScreen>
    with SingleTickerProviderStateMixin {
  final PageController pageController =
      PageController(keepPage: true, initialPage: 0);
  @override
  void initState() {
    AzkarCubit.get(context).currentBrightness;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AzkarCubit, AzkarState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AzkarCubit.get(context);
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(CupertinoIcons.back)),
            title: Column(
              children: [
                Text(
                  cubit.allAzkar![cubit.selectedIndexFromAskarList]!.category!
                      .toString(),
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 18),
                ),
                MarqueeText(
                  speed: 10,
                  textDirection: TextDirection.rtl,
                  marqueeDirection: MarqueeDirection.ltr,
                  textAlign: TextAlign.end,
                  text: TextSpan(
                    text: cubit.allAzkar![cubit.selectedIndexFromAskarList]!
                        .array![cubit.currentAzkarPageIndex].text!,
                    style: TextStyle(
                      fontSize: 12,
                      height: 2,
                      color: Theme.of(context).colorScheme.outline,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.refresh_thick)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.vibration)),
              // IconButton(
              //     onPressed: () {
              //     },
              //     icon: const Icon(CupertinoIcons.ellipsis)),
              PopupMenuButton(
                icon: const Icon(CupertinoIcons.ellipsis),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: const Row(
                      children: [
                        Icon(CupertinoIcons.brightness),
                        Text('Brightness')
                      ],
                    ),
                    onTap: () {
                      // cubit.getWidgetIndex(2);
                    },
                  ),
                  PopupMenuItem(
                    height: 50,
                    child: const Row(
                      children: [
                        Icon(CupertinoIcons.f_cursive),
                        Text('Font Size')
                      ],
                    ),
                    onTap: () {
                      cubit.getWidgetIndex(1);
                    },
                  ),
                ],
              )
            ],
            elevation: 2,
          ),
          body: Stack(
            alignment: Alignment.center,
            children: [
              if (cubit.allAzkar != null) ...{
                Positioned(
                  bottom: 135,
                  left: 0,
                  right: 0,
                  top: 0,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: cubit.allAzkar![cubit.selectedIndexFromAskarList]
                        .array!.length,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (value) {
                      cubit.changeAzkarPageIndex(value);
                    },
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => cubit.getWidgetIndex(0),
                        child: Stack(alignment: Alignment.topCenter, children: [
                          const Positioned(
                            top: 100,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Opacity(
                                opacity: 0.09,
                                child: Image(
                                  image: AppIslamicIcon.flowar,
                                ),
                              ),
                            ),
                          ),
                          Scrollbar(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 20, right: 20, bottom: 20),
                                child: Column(
                                  children: [
                                    Text(
                                      cubit
                                          .allAzkar![
                                              cubit.selectedIndexFromAskarList]
                                          .array![index]
                                          .text
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: cubit.fontSize, height: 2),
                                    ),
                                    const SizedBox(
                                      height: 150,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]),
                      );
                    },
                  ),
                )
              } else ...{
                const Center(
                  child: CircularProgressIndicator(),
                )
              },
              Positioned(
                // top: getSize(context).height * 0.2,
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    slider(cubit)[cubit.isVisiable],
                    Container(
                        height: 70,
                        width: double.maxFinite,
                        color: Theme.of(context).colorScheme.background,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              icon: const Icon(CupertinoIcons.bookmark),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(CupertinoIcons.square_list),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(Icons.backup_table),
                              tooltip: 'copy',
                              onPressed: () {},
                            ),
                            Column(
                              children: [
                                IconButton(
                                  icon: const Icon(CupertinoIcons.share),
                                  onPressed: () {},
                                ),
                                const Text(
                                  'share',
                                  style: TextStyle(height: 0.2),
                                )
                              ],
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> slider(AzkarCubit cubit) {
    return [
      CustomPaint(
        size: Size(
            getSize(context).width, (getSize(context).width * 0.3).toDouble()),
        //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
        painter: RPSCustomPainter(context: context),
        child: Container(
          height: getSize(context).width * 0.28,
          width: getSize(context).width,
          // color: Colors.red,
          child: Stack(
            children: [
              Positioned(
                top: 50,
                left: 20,
                child: IconButton(
                  icon: Icon(CupertinoIcons.arrow_left),
                  onPressed: () {
                    cubit.decrementAzkarPageIndex();
                    pageController.animateToPage(
                      cubit.currentAzkarPageIndex,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      cubit.countAzkarYouRead();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, top: 20, right: 10, bottom: 8),
                      child: Center(
                          child: Container(
                        height: 73,
                        width: 73,
                        decoration: BoxDecoration(
                            color: ColorsManager.mainColor,
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Text(
                            cubit.count.toString(),
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      )),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 50,
                right: 20,
                child: IconButton(
                  icon: Icon(CupertinoIcons.arrow_right),
                  onPressed: () {
                    cubit.incrementAzkarPageIndex();
                    pageController.animateToPage(
                      cubit.currentAzkarPageIndex,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      Column(
        children: [
          Container(
            height: 60,
            color: Theme.of(context).colorScheme.background,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Text('small'),
                    Expanded(
                      child: Slider(
                        value: cubit.fontSize,
                        onChanged: (value) {
                          cubit.changeSliderValue(value);
                        },
                        label: cubit.fontSize.toString(),
                        divisions: 40,
                        max: 40.0,
                        min: 0,
                        inactiveColor: Colors.grey,
                      ),
                    ),
                    Text('large'),
                  ],
                ),
              ),
            ),
          ),
          SpaceLine(
            context: context,
            height: 0.5,
          ),
        ],
      ),
      Column(
        children: [
          Container(
            height: 60,
            color: Theme.of(context).colorScheme.background,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Icon(CupertinoIcons.brightness_solid),
                    Expanded(
                      child: Slider(
                        value: cubit.brightness,
                        onChanged: (value) async {
                          await ScreenBrightness().setScreenBrightness(value);

                          print(value);
                        },
                        label: cubit.brightness.toString(),
                        divisions: 100,
                        max: 100,
                        min: 0,
                        inactiveColor: Colors.grey,
                      ),
                    ),
                    const Icon(CupertinoIcons.brightness),
                  ],
                ),
              ),
            ),
          ),
          SpaceLine(
            context: context,
            height: 0.5,
          ),
        ],
      ),
    ];
  }
}
