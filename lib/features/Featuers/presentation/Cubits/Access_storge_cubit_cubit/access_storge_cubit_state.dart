part of 'access_storge_cubit_cubit.dart';

@immutable
sealed class AccessStorgeCubitState {}

final class AccessStorgeCubitInitial extends AccessStorgeCubitState {}

final class AccessStorgeLoading extends AccessStorgeCubitState {}

final class AccessStorgeDone extends AccessStorgeCubitState {}

final class AccessStorgeError extends AccessStorgeCubitState {}

final class PLaySong extends AccessStorgeCubitState {}

final class ErrorPlaySong extends AccessStorgeCubitState {}

final class SwapingPlayOrStopingSong extends AccessStorgeCubitState {}

final class AnyAction extends AccessStorgeCubitState {}
