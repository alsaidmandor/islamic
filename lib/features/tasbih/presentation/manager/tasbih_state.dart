part of 'tasbih_cubit.dart';

@immutable
abstract class TasbihState {}

class TasbihInitial extends TasbihState {}

class TasbihChangeBackgroundPage extends TasbihState {}

class TasbihChangeFontSize extends TasbihState {}

class TasbihChangeCountTasbih extends TasbihState {}

class TasbihChangeCountRound extends TasbihState {}
class TasbihChangePageIndex extends TasbihState {}
