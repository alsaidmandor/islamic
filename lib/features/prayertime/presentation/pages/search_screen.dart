import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/constants.dart';
import '../../domain/entitiy/params_get_prayer_time.dart';
import '../manager/prayer_time_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

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
                icon: const Icon(CupertinoIcons.back)),
            title: Text('Location'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: 40,
                    child: SearchBar(
                      onChanged: (value) {
                        cubit.getSearchCity(value);
                      },
                      padding: const MaterialStatePropertyAll(
                          EdgeInsetsDirectional.symmetric(horizontal: 10)),
                      elevation: const MaterialStatePropertyAll<double>(0.0),
                      backgroundColor: MaterialStatePropertyAll(Color(
                          Theme.of(context)
                              .colorScheme
                              .onInverseSurface
                              .value)),
                      focusNode: FocusNode(canRequestFocus: true),
                      leading: const Icon(
                        CupertinoIcons.search,
                        size: 20,
                      ),
                      hintText: 'Search City',
                    )),
                const SizedBox(
                  height: 10,
                ),
                const Text('Courrent Location'),
                const SizedBox(
                  height: 100,
                ),
                Expanded(
                  child: Container(
                    height: double.infinity,
                    child: ListView.builder(
                      itemCount: cubit.searchCity.length,
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
                                },
                                child: Text(cubit.cityAll[index].name)),
                            const SizedBox(
                              height: 12,
                            ),
                            SpaceLine(context: context, height: 1)
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
