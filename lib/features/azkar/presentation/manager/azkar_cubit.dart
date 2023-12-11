import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic/features/azkar/data/models/CountReaded.dart';
import 'package:islamic/features/azkar/data/models/azkar/Data.dart';
import 'package:meta/meta.dart';
import 'package:screen_brightness/screen_brightness.dart';

import '../../data/models/AzkarReaded.dart';
import '../../data/models/azkar/ListAzkar.dart';

part 'azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {
  AzkarCubit() : super(AzkarInitial());

  static AzkarCubit get(context) => BlocProvider.of(context);

  int currentAzkarPageIndex = 0;

  void changeAzkarPageIndex(int value) {
    currentAzkarPageIndex = value;
    print(value);
    count = allAzkar![selectedIndexFromAskarList]
        .array![currentAzkarPageIndex]
        .count!
        .toInt();
    emit(ChangePageIndex());
  }

  void incrementAzkarPageIndex() {
    if (currentAzkarPageIndex <
        allAzkar![selectedIndexFromAskarList].array!.length + 1) {
      currentAzkarPageIndex += 1;

      count = allAzkar![selectedIndexFromAskarList]
          .array![currentAzkarPageIndex]
          .count!
          .toInt();
    }
  }

  void decrementAzkarPageIndex() {
    if (currentAzkarPageIndex != 0) {
      currentAzkarPageIndex -= 1;
      count = allAzkar![selectedIndexFromAskarList]
          .array![currentAzkarPageIndex]
          .count!
          .toInt();
      emit(ChangePageIndex());
    }
  }

  int selectedIndexFromAskarList = 0;
  void selectdAzkarIndex(int index) {
    selectedIndexFromAskarList = index;
  }

  double fontSize = 19;

  void changeSliderValue(double value) {
    fontSize = value;
    emit(ChangeSliderIndex());
  }

  int isVisiable = 0;
  void getWidgetIndex(int value) {
    isVisiable = value;
    emit(ChangeSliderIndex());
  }

  double brightness = 0.0;
  Future<void> get currentBrightness async {
    try {
      brightness = await ScreenBrightness().current;
    } catch (e) {
      print(e);
      throw 'Failed to get current brightness';
    }
  }

  Future<void> setBrightness(double brightness) async {
    try {
      await ScreenBrightness().setScreenBrightness(brightness);
      emit(ChangeSliderIndex());
    } catch (e) {
      print(e);
      throw 'Failed to set brightness';
    }
  }

  List<Data>? allAzkar = [];
  Future<void> getAzkar() async {
    emit(AzkarLoading());
    final String response = await rootBundle.loadString('assets/adhkar.json');
    final ListAzkar azkar = listAzkarFromJson(response);
    allAzkar = azkar.data;
    emit(AzkarLoaded(azkar: azkar));
    print(azkar.data!.length);
  }

  int countRepeatAlzekr = 0;
  List<CountReaded>? saveReadedAzker = [];

  int count = 0;
  List<CountReaded>? countReaded = [];

  void countAzkarYouRead() {
    if (count != 0) {
      count -= 1;
      emit(SaveCountReadingAzkar());
    } else {
      saveReadedAzker!
          .add(CountReaded(indexPage: currentAzkarPageIndex, count: count));
    }

    AzkarReaded azkarReaded = AzkarReaded(
        countReaded: saveReadedAzker,
        indexListOfAzkar: selectedIndexFromAskarList);
    countReaded = azkarReaded.countReaded;
    emit(GetCountReadingAzkar(azkarReaded: azkarReaded));
  }
}
/*
*  id List Azkar : 1
*    index:0 => count = 0
*
* */
