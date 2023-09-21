part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}


class NewUserLoading extends UserState {}
class NewUserSucc extends UserState {}
class NewUserError extends UserState {}


class UpdateUserLoading extends UserState {}
class UpdateUserSucc extends UserState {}
class UpdateUserError extends UserState {}


class GetUserLoading extends UserState {}
class GetUserSucc extends UserState {}
class GetUserError extends UserState {}


class DeleteUserLoading extends UserState {}
class DeleteUserSucc extends UserState {}
class DeleteUserError  extends UserState {}

class mn extends UserState {}
class RadioValueChanged extends UserState {}


