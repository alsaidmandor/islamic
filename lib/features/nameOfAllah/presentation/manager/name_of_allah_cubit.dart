import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/asmaAlh_husna/AsmaAlahHusna.dart';
import '../../data/models/asmaAlh_husna/Data.dart';

part 'name_of_allah_state.dart';

class NameOfAllahCubit extends Cubit<NameOfAllahState> {
  NameOfAllahCubit() : super(NameOfAllahInitial());

  static NameOfAllahCubit get(context) => BlocProvider.of(context);

  List<Data>? ListnameOfAllah = [];

  Future<void> get99NameOfAlah() async {
    emit(NameOfAllahLoading());
    try {
      final String response =
          await rootBundle.loadString('assets/asmaAlHusna.json');
      final AsmaAlahHusna nameOfAlah = asmaAlahHusnaFromJson(response);
      ListnameOfAllah = nameOfAlah.data!;
      if (kDebugMode) {
        print(nameOfAlah.data!.length);
      }
      emit(NameOfAllahLoaded());
    } catch (e) {
      emit(NameOfAllahFailure());
    }
  }

  bool gridView = false;
  void isGrid() {
    gridView = !gridView;
    emit(ChangeToGridViewOrListView());
  }
}
