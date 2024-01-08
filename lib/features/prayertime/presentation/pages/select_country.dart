import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/route/router.dart';

import '../../../../core/utils/constants.dart';
import '../manager/prayer_time_cubit.dart';

class SelectCountry extends StatefulWidget {
  const SelectCountry({super.key});

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  @override
  void initState() {
    PrayerTimeCubit.get(context).getCountry();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(CupertinoIcons.clear)),
        title: Text('Country'),
      ),
      body: BlocConsumer<PrayerTimeCubit, PrayerTimeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = PrayerTimeCubit.get(context);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.search);
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).colorScheme.onInverseSurface),
                    child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(
                              CupertinoIcons.search,
                              size: 20,
                            ),
                          ),
                          Text(
                            'Search City',
                          ),
                        ]),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    height: double.infinity,
                    child: ListView.builder(
                      itemCount: cubit.country.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 12,
                            ),
                            Text(cubit.country[index].name),
                            const SizedBox(
                              height: 12,
                            ),
                            SpaceLine(context: context, height: 0.5)
                          ],
                        );
                      },
                    ),
                  ),
                ),
                // for (int i = 0; i < cubit.cityAll.length; i++) ...{
                //   Text(cubit.cityAll[i].name)
                // }
              ],
            ),
          );
        },
      ),
    );
  }
}
