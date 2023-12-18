import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/Dua.dart';
import '../../data/models/ListDua.dart';

part 'dua_state.dart';

class DuaCubit extends Cubit<DuaState> {
  DuaCubit() : super(DuaInitial());
  static DuaCubit get(context) => BlocProvider.of(context);

  List<Dua> listDua = [];
  Future<void> getDuas() async {
    emit(DuaLoading());
    try {
      final String response = await rootBundle.loadString('assets/dua.json');
      final ListDua dua = listDuaFromJson(response);
      listDua = dua.dua!;
      if (kDebugMode) {
        print('${dua.dua!.length.toString()}');
      }
      emit(DuaLoaded());
    } catch (e) {
      emit(DuaFailure());
    }
  }

  int indexSelected = 0;
  void selectedDua(int index) {
    indexSelected = index;
    emit(DuaSelectedIndex());
  }

  int indexBackgroundSelected = 0;

  void selectedBackgroundDua(int index) {
    indexBackgroundSelected = index;
    emit(DuaBackgroundSelectedIndex());
  }
}
