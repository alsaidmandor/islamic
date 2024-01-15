import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic/core/color/colors.dart';

import '../../../../core/route/router.dart';
import '../../../../core/services/local/cache_helper.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/entitiy/params_get_prayer_time.dart';
import '../manager/prayer_time_cubit.dart';

List<String> popularCities = [
  'Cairo',
  'Giza',
  'Alexandria',
  'Al Mansurah',
  'Port said',
  'Suez',
  'Tanta',
  'Asyut'
];

class SelectLocation extends StatefulWidget {
  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  @override
  void initState() {
    // PrayerTimeCubit.get(context).city('EG');
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SelectLocation oldWidget) {
    oldWidget.createState();
    print('state');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    city = CacheHelper.getData(key: 'cityName');
    country = CacheHelper.getData(key: 'countryName');
    print(city);
    print(CacheHelper.getData(key: 'cityName'));
    print(country);
    print(CacheHelper.getData(key: 'countryName'));
  }

  // void getCountry(String countryCode) async {
  @override
  Widget build(BuildContext context) {
    var cubit = PrayerTimeCubit.get(context);
    return BlocConsumer<PrayerTimeCubit, PrayerTimeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(CupertinoIcons.clear)),
            title: Text('Location'),
            actions: [
              TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.country);
                },
                icon: Icon(CupertinoIcons.globe,
                    color: Theme.of(context).colorScheme.onSurface),
                label: Text('Country',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface)),
              )
            ],
          ),
          body: Padding(
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
                const Text('Current Location'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 35,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onInverseSurface,
                          borderRadius: BorderRadius.circular(10)),
                      child: Visibility(
                        replacement: const Row(
                          children: [
                            Center(child: CircularProgressIndicator()),
                            Text('relocating ...'),
                          ],
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.location_pin,
                              color: ColorsManager.mainColor,
                              size: 15,
                            ),
                            Text(
                                '${CacheHelper.getData(key: 'cityName')} , ${CacheHelper.getData(key: 'countryName')}'),
                          ],
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          cubit.getUserCountryAndCity();
                          cubit.city(countryCode);
                        },
                        child: const Text('Relocate'))
                  ],
                ),

                /*       const Text('Popular Cities'),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    children: List.generate(
                        popularCities.length,
                        (index) => GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Container(
                                    height: 35,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onInverseSurface),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Center(
                                        child: Text(
                                            popularCities[index].toString()),
                                      ),
                                    )),
                              ),
                            )),
                  ),
                ),*/

                const SizedBox(
                  height: 30,
                ),

                Expanded(
                  child: Container(
                    height: double.infinity,
                    child: ListView.builder(
                      itemCount: cubit.cityAll.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 12,
                            ),
                            InkWell(
                                onTap: () {
                                  cubit.getPrayerTime(ParamsGetPrayerTime(
                                    year: dt.year.toString(),
                                    month: dt.month.toString(),
                                    city: cubit.cityAll[index].name,
                                    country: cubit.country,
                                  ));
                                  print(city);
                                  print(country);
                                  print(countryCode);
                                  String cityName = cubit.cityAll[index].name;
                                  cubit.selectedCity(cityName);

                                  print(CacheHelper.getData(key: 'cityName'));
                                },
                                child: Text(cubit.cityAll[index].name)),
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
          ),
        );
      },
    );
  }
}
