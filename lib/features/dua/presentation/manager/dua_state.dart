part of 'dua_cubit.dart';

@immutable
abstract class DuaState {}

class DuaInitial extends DuaState {}

class DuaLoading extends DuaState {}

class DuaLoaded extends DuaState {}

class DuaFailure extends DuaState {}

class DuaSelectedIndex extends DuaState {}

class DuaBackgroundSelectedIndex extends DuaState {}
