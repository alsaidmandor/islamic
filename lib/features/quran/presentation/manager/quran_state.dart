part of 'quran_cubit.dart';

@immutable
abstract class QuranState {}

class QuranInitial extends QuranState {}

///  get Surah state
class QuranGetSurahLoading extends QuranState {}

class QuranGetSurahLoaded extends QuranState {
  final SurahsList surahsList;

  QuranGetSurahLoaded({
    required this.surahsList,
  });
}

class QuranGetSurahFailed extends QuranState {
  final String message;

  QuranGetSurahFailed({
    required this.message,
  });
}

/// get Juz state
class QuranGetJuzLoading extends QuranState {}

class QuranGetJuzLoaded extends QuranState {
  final JuzList getALlJuzList;

  QuranGetJuzLoaded({
    required this.getALlJuzList,
  });
}

class QuranGetJuzFailed extends QuranState {
  final String message;

  QuranGetJuzFailed({
    required this.message,
  });
}

/// get Sajda state

class QuranGetSajdaLoading extends QuranState {}

class QuranGetSajdaLoaded extends QuranState {
  final SajdaList sajdaList;

  QuranGetSajdaLoaded({
    required this.sajdaList,
  });
}

class QuranGetSajdaFailed extends QuranState {
  final String message;

  QuranGetSajdaFailed({
    required this.message,
  });
}

/// selected item
class SelectedItemListQuran extends QuranState {
  final int index;

  SelectedItemListQuran({
    required this.index,
  });
}

class ChangePageNumber extends QuranState {
  final int index;

  ChangePageNumber({
    required this.index,
  });
}

class ChangeTheme extends QuranState {}

class ChangeSliderFontSizeSurah extends QuranState {}
