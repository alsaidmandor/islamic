part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class BottomChanged extends AppState {}

class AppChangeModeState extends AppState {}