part of 'prayer_time_cubit.dart';

@immutable
abstract class PrayerTimeState {}

class PrayerTimeLoading extends PrayerTimeState {}

class PrayerTimeLoaded extends PrayerTimeState {
  final List<PrayerDate>? prayerTime;

  // final List<Map<String, dynamic>> time;

  PrayerTimeLoaded({
    required this.prayerTime,
  });
}

class PrayerTimeFailure extends PrayerTimeState {
  final String message;

  PrayerTimeFailure({
    required this.message,
  });
}

class LocationLoading extends PrayerTimeState {}

class LocationLoaded extends PrayerTimeState {
  final Placemark placemark;

  LocationLoaded({
    required this.placemark,
  });
}

class LocationSavePosition extends PrayerTimeState {
  final Position position;

  LocationSavePosition({
    required this.position,
  });
}

class LocationFailure extends PrayerTimeState {}

class IndexNextPrayer extends PrayerTimeState {
  int index;

  IndexNextPrayer({
    required this.index,
  });
}

class ChangePageIndexInPrayerTime extends PrayerTimeState {}

class DifferenceDurationBetweenCurrentTimeAndPrayerTime
    extends PrayerTimeState {
  Duration duration;

  DifferenceDurationBetweenCurrentTimeAndPrayerTime({
    required this.duration,
  });
}

class NextPrayer extends PrayerTimeState {
  NextPrayer();
}

class Search extends PrayerTimeState {}
