import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:vibration/vibration.dart';

part 'tasbih_state.dart';

class TasbihCubit extends Cubit<TasbihState> {
  TasbihCubit() : super(TasbihInitial());

  static TasbihCubit get(context) => BlocProvider.of(context);
  List tasbih = [
    {
      "id": 0,
      "text": "سُبْحَانَ اللَّهِ",
      "text_as_en": "subhana lah",
      "text_en": "Glorified is Allah",
      "counter": 0,
      "counter_end": 33,
      "round": 1,
    },
    {
      "id": 1,
      "text": "سُبْحَانَ اللَّهِ وَبِحَمْدِه",
      "text_as_en": "subhana lahi wa bihamdihi",
      "text_en": "Glorified is Allah and by His praise",
      "counter": 0,
      "counter_end": 33,
      "round": 1,
    },
    {
      "id": 2,
      "text": "سُبْحَانَ اللَّهِِ وَالْحَمْدُ لِلَّهِ",
      "text_as_en": "subhana lahi wa lhamdulilah",
      "text_en": "Glorified is Allah, thank Allah",
      "counter": 0,
      "counter_end": 33,
      "round": 1,
    },
    {
      "id": 3,
      "text": " سُبْحَانَ اللهِ العَظِيمِ وَبِحَمْدِهِ",
      "text_as_en": "subhana lahi laadim wa bihamdihi",
      "text_en": "Glorified is Allah and by His praise",
      "counter": 0,
      "counter_end": 33,
      "round": 1,
    },
    {
      "id": 4,
      "text": "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ، سُبْحَانَ اللَّهِ الْعَظِيمِ",
      "text_as_en": "subhana lahi wa bihamdihi, subhana lahi laadim",
      "text_en": "Glorified is my Lord, the Great, and by His praise",
      "counter": 0,
      "counter_end": 33,
      "round": 1,
    },
    {
      "id": 5,
      "text":
          "سُبْحَانَ اللَّهِ، وَالْحَمْدُ لِلَّهِ، وَلَا إِلَهَ إِلَّا اللَّهُ، وَاللَّهُ أَكْبَرُ",
      "text_as_en":
          "Subḥānallāh,walḥamdu lillāh, wa lā ilaha illallāh ,wallāhuAkbar",
      "text_en":
          "Glory is to Allah and praise is to Allah, and there is none worthy of worship but Allah,and Allah is the Most Great",
      "counter": 0,
      "counter_end": 33,
      "round": 1,
    },
    {
      "id": 6,
      "text":
          "لا إله إلّا اللهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلُّ شَيْءٍ قَدِير",
      "text_as_en":
          "La ilaha illal-lahu wahdahu la shareeka lah, lahul-mulku walahul-hamd, wahuwa AAala kulli shayin qadeer",
      "text_en":
          "None has the right to be worshipped except Allah, alone, without partner. To Him belongs all sovereignty and praise and He is over all things omnipotent",
      "counter": 0,
      "counter_end": 33,
      "round": 1,
    },
    {
      "id": 7,
      "text": " لا حَوْلَ وَلا قُوَّةَ إِلا بِاللَّهِ",
      "text_as_en": "La hawla wala quwwata illa billah",
      "text_en": "There is no might nor power except with Allah",
      "counter": 0,
      "counter_end": 33,
      "round": 1,
    },
    {
      "id": 8,
      "text":
          "لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لا شَرِيكَ لَهُ اللَّهُ أَكْبَرُ كَبِيراً، وَالْحَمْدُ لِلَّهِ كَثِيراً، سُبْحَانَ اللَّهِ رَبِّ العَالَمِينَ لا حَوْلَ وَلا قُوَّةَ إِلَّا بِاللَّهِ الْعَزِيزِ الْحَكِيم",
      "text_as_en":
          "La ilaha illal-lah, wahdahu la shareeka lah, Allahu akbaru kabeera, walhamdu lillahi katheera, subhanal-lahi rabbil-AAalameen, la hawla wala quwwata illa billahil-AAazeezil-hakeem",
      "text_en":
          "None has the right to be worshipped except Allah, alone without partener. Allah is most great and much praise is for Allah. How perfect Allah is, Lord of the worlds. There is no might nor power",
      "counter": 0,
      "counter_end": 33,
      "round": 1,
    },
    {
      "id": 9,
      "text":
          "اللَّهُمَّ اغْفِرِ لِي، وَارْحَمْنِي، وَاهْدِنِي، وَعَافِنِي وَارْزُقْنِيُ",
      "text_as_en":
          "Allahummagh-fir lee, warhamnee, wahdinee, waAAafinee warzuqnee",
      "text_en":
          "O Allah, forgive me, have mercy upon me, guide me, give me health and grant me sustenance",
      "counter": 0,
      "counter_end": 33,
      "round": 1,
    },
    {
      "id": 10,
      "text": "أَسْتَغْفِرُ اللَّهَ",
      "text_as_en": " Astaghfirul-lah",
      "text_en": "    I seek forgiveness and repent to Allah",
      "counter": 0,
      "counter_end": 33,
      "round": 1,
    },
    {
      "id": 11,
      "text":
          "  أَسْتَغْفِرُ اللَّهَ الْعَظيمَ الَّذِي لا إلَهَ إِلا هُوَ الْحَيُّ القَيَوْمُ وَأَتُوبُ إِلَيهِِ",
      "text_as_en":
          "Astaghfirul-lahal-lathee la ilaha illa huwal-hayyul-qayyoomu wa-atoobu ilayh",
      "text_en":
          "I seek Allahs forgiveness, besides whom, none has the right to be worshipped except He, The Ever Living, The Self-Subsisting and Supporter of all, and I turn to Him in repentance",
      "counter": 0,
      "counter_end": 33,
      "round": 1,
    },
  ];

  int numberPage = 0;

  void changePageIndex(int value) {
    numberPage = value;
    count = tasbih[value]['counter'];
    round = tasbih[value]['round'];
    countReached = tasbih[value]['counter_end'];
    emit(TasbihChangePageIndex());
  }

  void incrementPageIndex() {
    if (numberPage < tasbih.length + 1) {
      numberPage += 1;
      emit(TasbihChangePageIndex());
    }
  }

  void decrementPageIndex() {
    if (numberPage != 0) {
      numberPage -= 1;
      emit(TasbihChangePageIndex());
    }
  }

  int backgroundColorTasbihIndex = 0;

  void selectTasbihIndexColor(int index) {
    backgroundColorTasbihIndex = index;
    emit(TasbihChangeBackgroundPage());
  }

  double fontSizeTasbih = 18;

  void changeSliderValueTasbih(double value) {
    if (value >= 12) {
      fontSizeTasbih = value;
    }
    emit(TasbihChangeFontSize());
  }

  int count = 0;

  int round = 1;

  int countReached = 33;

  void changeCountTasbih() async {
    count += 1;
    tasbih[numberPage]['counter'] = count;
    if (count == countReached) {
      count = 0;
      if (round <= 3) {
        round += 1;

        tasbih[numberPage]['round'] = round;
        emit(TasbihChangeCountRound());
      }
    }
    Vibration.vibrate(duration: 50, amplitude: 128);

    emit(TasbihChangeCountTasbih());
  }
}
