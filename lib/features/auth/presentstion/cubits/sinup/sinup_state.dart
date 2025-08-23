part of 'sinup_cubit.dart';

@immutable
sealed class SinupState {}

final class SinupInitial extends SinupState {}

final class SinupLoading extends SinupState {}
final class SinupSussecc extends SinupState {
  final UserEntity userEntity;

  SinupSussecc(this.userEntity);
}
final class SinupFauiler extends SinupState {

  final String errMassege;

  SinupFauiler(this.errMassege);
}




