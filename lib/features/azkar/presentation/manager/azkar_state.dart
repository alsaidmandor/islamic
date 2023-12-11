part of 'azkar_cubit.dart';

@immutable
abstract class AzkarState {}

class AzkarInitial extends AzkarState {}

class AzkarLoading extends AzkarState {}

class AzkarLoaded extends AzkarState {
  final ListAzkar azkar;

  AzkarLoaded({
    required this.azkar,
  });
}

class AzkarFailure extends AzkarState {}

class ChangePageIndex extends AzkarState {}

class ChangeSliderIndex extends AzkarState {}

class SaveCountReadingAzkar extends AzkarState {}

class GetCountReadingAzkar extends AzkarState {
  final AzkarReaded azkarReaded;

  GetCountReadingAzkar({
    required this.azkarReaded,
  });
}
