import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic/core/use_case/no_params.dart';
import 'package:islamic/features/quran/data/models/juzz/juz_list.dart';
import 'package:islamic/features/quran/data/models/sajda/sajda_list.dart';
import 'package:islamic/features/quran/data/models/surah/surah_list.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/app_strings.dart';
import '../../data/models/sajda/sajda.dart';
import '../../data/models/surah/surah.dart';
import '../../domain/entities/params_get_juz.dart';
import '../../domain/use_cases/get_juz_use_case.dart';
import '../../domain/use_cases/get_sajda_use_case.dart';
import '../../domain/use_cases/get_surah_use_case.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  final GetJuzUseCase juzUseCase;
  final GetSajdaUseCase sajdaUseCase;

  final GetSurahUseCase surahUseCase;

  QuranCubit({
    required this.juzUseCase,
    required this.sajdaUseCase,
    required this.surahUseCase,
  }) : super(QuranInitial());

  static QuranCubit get(context) => BlocProvider.of(context);

  List<Surah>? listOfSurahs = [];

  void getSurahs() async {
    emit(QuranGetSurahLoading());
    final getSurahList = await surahUseCase.call(NoParams());
    getSurahList.fold((failure) {
      emit(QuranGetSurahFailed(message: _mapFailureToMessage(failure)));
    }, (surah) {
      listOfSurahs = surah.surahs;
      print(surah.surahs!.length);
      emit(QuranGetSurahLoaded(surahsList: surah));
    });
  }

  Future<JuzList> getJuz({required int index}) async {
    emit(QuranGetJuzLoading());
    JuzList lisJuz = JuzList();
    final getJuz = await juzUseCase.call(ParamsGetJuz(index: index));
    getJuz.fold((failure) {
      emit(QuranGetJuzFailed(message: _mapFailureToMessage(failure)));
    }, (juz) {
      print('+++++++++++++');

      print(juz.juzNumber);
      print(juz.juzAyahs![1].ayahsText);
      print(juz.juzAyahs![1].hizbQuarter.toString());
      emit(QuranGetJuzLoaded(getALlJuzList: juz));
      getALlJuzList.add(juz);
      lisJuz = juz;
    });
    return lisJuz;
  }

  List<JuzList> getALlJuzList = [];

  Future<void> getAllJuz() async {
    for (int i = 1; i <= 30; i++) {
      await getJuz(index: i);
    }
  }

  List<SajdaAyat> sajdaList = [];

  void getSajda() async {
    emit(QuranGetSajdaLoading());

    final getSajda = await sajdaUseCase.call(NoParams());
    getSajda.fold((failure) {
      emit(QuranGetSajdaFailed(message: _mapFailureToMessage(failure)));
    }, (sajda) {
      sajdaList = sajda as List<SajdaAyat>;
      emit(QuranGetSajdaLoaded(sajdaList: sajda));
    });
  }

  int indexItem = 0;
  setSelectedItemColor(int index) {
    indexItem = index;
    emit(SelectedItemListQuran(
      index: index,
    ));
  }

  int pageNumber = 1;
  void changePageNumber(int index) {
    if (index != pageNumber) {
      pageNumber = index;
      print('$pageNumber   + ============');
      // emit(ChangePageNumber(
      //   index: index,
      // ));
    }
  }

  int backgroundColorSurahIndex = 0;
  void selectSurahIndexColor(int index) {
    backgroundColorSurahIndex = index;
    emit(ChangeTheme());
  }

  double fontSizeSurah = 25;

  void changeSliderValue(double value) {
    if (value >= 16) {
      fontSizeSurah = value;
    }
    emit(ChangeSliderFontSizeSurah());
  }

  bool isSaveLocal = false;
  void checkIsSaveLocalOrNot() {
    isSaveLocal = !isSaveLocal;
    emit(SaveLocal());
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return AppStrings.CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexcepted error';
    }
  }
}
