import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic/features/azkar/presentation/manager/azkar_cubit.dart';

import '../../../../../core/color/colors.dart';
import '../../../../../core/route/router.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/constants.dart';

class AzkarScreen extends StatefulWidget {
  const AzkarScreen({super.key});

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  @override
  void initState() {
    AzkarCubit.get(context).getAzkar();
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
        if (cubit.allAzkar!.isNotEmpty) {
          return Scaffold(
              body: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: MediaQuery.of(context).size.height * 0.7,
                child: Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AppImages.background,
                        fit: BoxFit.cover,
                        scale: 2.0,
                        opacity: 0.08),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      const Image(
                        image: AppImages.mosque2,
                        fit: BoxFit.fill,
                        color: Colors.black12,
                      ),
                      Positioned(
                        top: 30,
                        left: 10,
                        right: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton.filled(
                                  constraints: const BoxConstraints(
                                      minHeight: 30,
                                      minWidth: 30,
                                      maxWidth: 37,
                                      maxHeight: 37),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => ColorsManager
                                                .secondaryLight
                                                .withOpacity(0.2)),
                                    shape: const MaterialStatePropertyAll(
                                      CircleBorder(),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.back,
                                    size: 22,
                                    color: ColorsManager.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                const Text(
                                  'Azkar',
                                  style: TextStyle(
                                      color: ColorsManager.white, fontSize: 22),
                                )
                              ],
                            ),
                            // const SizedBox(height: 20.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                        textAlign: TextAlign.right,
                                        text: const TextSpan(
                                            children: [
                                              TextSpan(
                                                  text: 'My Favorite ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20)),
                                              TextSpan(
                                                text: ' Azkar',
                                              ),
                                            ],
                                            style: TextStyle(
                                                color: ColorsManager.white,
                                                fontSize: 18))),
                                    Text('No Collection yet ',
                                        style: TextStyle(
                                          height: 2,
                                          color: ColorsManager.white
                                              .withOpacity(0.8),
                                        ))
                                  ],
                                ),
                                const Image(
                                  image: AppIslamicIcon.openBook,
                                  height: 100,
                                  width: 100,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: getSize(context).height * 0.23,
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
                    child: cubit.allAzkar != null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.only(
                                  left: 20.0,
                                  top: 20.0,
                                ),
                                child: Text(
                                  'Azkar List ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Expanded(
                                child: ListView.separated(
                                  itemCount: 30,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () {
                                        cubit.selectdAzkarIndex(index);
                                        Navigator.pushNamed(
                                            context, Routes.readAzkar);
                                      },
                                      child: SizedBox(
                                        height: 70,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                              child: Container(
                                                height: 35,
                                                width: 35,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onInverseSurface),
                                                child: const Center(
                                                    child: Text('1')),
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  cubit
                                                      .allAzkar![index].category
                                                      .toString(),
                                                  style: const TextStyle(
                                                      height: 2),
                                                ),
                                                Text(
                                                  "today's reading 0 / ${cubit.allAzkar![index].array!.length}",
                                                  style: TextStyle(
                                                      color:
                                                          Colors.grey.shade400,
                                                      fontSize: 12,
                                                      height: 2),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SpaceLine(
                                        context: context, height: 1);
                                  },
                                ),
                              ),
                            ],
                          )
                        : const Center(
                            child: CircularProgressIndicator.adaptive()),
                  ))
            ],
          ));
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
