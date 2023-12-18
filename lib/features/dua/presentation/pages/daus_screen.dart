import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:islamic/core/utils/constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

import '../../../../core/color/colors.dart';
import '../manager/dua_cubit.dart';

class DausScreen extends StatefulWidget {
  DausScreen({super.key});

  @override
  State<DausScreen> createState() => _DausScreenState();
}

class _DausScreenState extends State<DausScreen> {
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    DuaCubit.get(context).getDuas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = DuaCubit.get(context);

    return BlocConsumer<DuaCubit, DuaState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (cubit.listDua.isNotEmpty) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(CupertinoIcons.clear)),
              centerTitle: true,
              title: const Text(
                'Dua ',
                style: TextStyle(fontSize: 18),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Screenshot(
                            controller: screenshotController,
                            child: Container(
                              height: getSize(context).height * 0.35,
                              width: getSize(context).width * 0.8,
                              decoration: BoxDecoration(
                                  // color: ColorsManager.white,
                                  image: DecorationImage(
                                    image: backgroundDua[
                                        cubit.indexBackgroundSelected],
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Center(
                                  child: Text(
                                    cubit.listDua[cubit.indexSelected].arabic
                                        .toString(),
                                    style: TextStyle(
                                        wordSpacing: 2,
                                        color:
                                            cubit.indexBackgroundSelected == 0
                                                ? ColorsManager.dua1
                                                : ColorsManager.dua),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),

                              /*

                                                */
                            ),
                          ),
                          Positioned(
                            top: 20,
                            right: 15,
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                  color: ColorsManager.brightnessLight
                                      .withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(
                                CupertinoIcons.arrow_down_right_arrow_up_left,
                                size: 15,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Wrap(
                      children: List.generate(
                          backgroundDua.length,
                          (index) => GestureDetector(
                                onTap: () {
                                  cubit.selectedBackgroundDua(index);
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(
                                    height: 55,
                                    width: 55,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: backgroundDua[index],
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 2,
                                            color:
                                                cubit.indexBackgroundSelected ==
                                                        index
                                                    ? ColorsManager.mainColor
                                                    : Colors.transparent),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onInverseSurface),
                                  ),
                                ),
                              )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                        children: List.generate(
                            cubit.listDua.length,
                            (index) => GestureDetector(
                                  onTap: () {
                                    cubit.selectedDua(index);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Container(
                                        height: 35,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 1,
                                                color: cubit.indexSelected ==
                                                        index
                                                    ? ColorsManager.mainColor
                                                    : Colors.transparent),
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onInverseSurface),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: Center(
                                            child: Text(cubit
                                                .listDua[index].title
                                                .toString()),
                                          ),
                                        )),
                                  ),
                                )),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        MaterialButton(
                          onPressed: () async {
                           await screenshotController
                                .capture()
                                .then((value) => saveImage(value!));

                            // await saveImage(image);
                          },
                          height: 50,
                          minWidth: 50,
                          splashColor: ColorsManager.mainColor.withOpacity(0.4),
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 1, color: ColorsManager.mainColor),
                              borderRadius: BorderRadius.circular(
                                15,
                              )),
                          child: const Icon(
                            CupertinoIcons.arrow_down_to_line_alt,
                            color: ColorsManager.mainColor,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Ink(
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorsManager.mainColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () async {
                                await screenshotController
                                    .capture()
                                    .then((Uint8List? image) async {
                                  if (image != null) {
                                    final directory =
                                        await getApplicationDocumentsDirectory();
                                    final imagePath = await File(
                                            '${directory.path}/image.png')
                                        .create();
                                    await imagePath.writeAsBytes(image);

                                    /// Share Plugin
                                    await Share.shareFiles([imagePath.path]);
                                  }
                                });
                                // await Share.share('');
                              },
                              child: const Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    CupertinoIcons.share,
                                    color: ColorsManager.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'share to noe love',
                                    style: TextStyle(
                                        color: ColorsManager.white,
                                        fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ]),
            ),
          );
        }
        return Center(child: const CircularProgressIndicator());
      },
    );
  }
}

saveImage(Uint8List image) async {
  await Permission.photos.request();
  if (await Permission.photos.request().isGranted) {
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final name = 'islamicDua_$time';
    final result = await ImageGallerySaver.saveImage(
      image,
      name: name,
    );
    print(result.toString());
  } else if (await Permission.photos.request().isDenied) {
    if (await Permission.photos.request().isDenied) {
      await Permission.photos.request();
    }
    else{
      await openAppSettings();
    }
  } else if (await Permission.photos.request().isPermanentlyDenied) {
    await openAppSettings();
  }
}
