import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/name_of_allah_cubit.dart';

class BuildListNameOfAllah extends StatelessWidget {
  const BuildListNameOfAllah({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NameOfAllahCubit, NameOfAllahState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = NameOfAllahCubit.get(context);
        if (cubit.ListnameOfAllah!.isNotEmpty) {
          return ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onInverseSurface),
                                  child: Center(
                                    child: Text(cubit
                                        .ListnameOfAllah![index].number
                                        .toString()),
                                  )),
                              Icon(CupertinoIcons.share)
                            ],
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                    cubit
                                        .ListnameOfAllah![index].transliteration
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 25, letterSpacing: 0.002)),
                              ),
                              Expanded(
                                child: Text(
                                  cubit.ListnameOfAllah![index].name.toString(),
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                    fontSize: 25,
                                    letterSpacing: 0.002,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: cubit.ListnameOfAllah!.length);
        }
        return const Center(child: CircularProgressIndicator.adaptive());
      },
    );
  }
}
