import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/name_of_allah_cubit.dart';

class BuildGridListNameOfAllah extends StatelessWidget {
  const BuildGridListNameOfAllah({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NameOfAllahCubit, NameOfAllahState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = NameOfAllahCubit.get(context);
        if (cubit.ListnameOfAllah!.isNotEmpty) {
          return GridView.builder(
            itemCount: cubit.ListnameOfAllah!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.65,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10),
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                        child: Center(
                          child: Text(
                            cubit.ListnameOfAllah![index].name.toString(),
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              fontSize: 20,
                              overflow: TextOverflow.visible,
                              letterSpacing: 0.002,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Center(
                        child: Text(
                            cubit.ListnameOfAllah![index].transliteration
                                .toString(),
                            style: const TextStyle(
                                fontSize: 18,
                                overflow: TextOverflow.visible,
                                letterSpacing: 0.002)),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
        return const Center(child: CircularProgressIndicator.adaptive());
      },
    );
  }
}
