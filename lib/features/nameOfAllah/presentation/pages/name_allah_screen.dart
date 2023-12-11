import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic/features/nameOfAllah/presentation/widgets/build_gridView.dart';
import 'package:islamic/features/nameOfAllah/presentation/widgets/listview_builder.dart';

import '../manager/name_of_allah_cubit.dart';

class NameOfAllahScreen extends StatefulWidget {
  const NameOfAllahScreen({super.key});

  @override
  State<NameOfAllahScreen> createState() => _NameOfAllahScreenState();
}

class _NameOfAllahScreenState extends State<NameOfAllahScreen> {
  @override
  void initState() {
    NameOfAllahCubit.get(context).get99NameOfAlah();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NameOfAllahCubit, NameOfAllahState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = NameOfAllahCubit.get(context);
        return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(CupertinoIcons.back)),
              title: const Text(
                "99 Names of Allah ",
                style: TextStyle(fontSize: 18),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    cubit.isGrid();
                  },
                  icon: cubit.gridView != true
                      ? const Icon(CupertinoIcons.circle_grid_3x3)
                      : const Icon(CupertinoIcons.list_bullet_below_rectangle),
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: cubit.gridView == true
                  ? const BuildGridListNameOfAllah()
                  : const BuildListNameOfAllah(),
            ));
      },
    );
  }
}
