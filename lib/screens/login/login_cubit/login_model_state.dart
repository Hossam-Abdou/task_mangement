part of 'login_model_bloc.dart';

@immutable
abstract class AuthenticateState {}

class LoginModelInitial extends AuthenticateState {}

class UserLoginSuccessState extends AuthenticateState{

}
class UserLoginErrorState extends AuthenticateState{

}
class UserLoginLoadingState extends AuthenticateState{}


class UserLogOutSuccessState extends AuthenticateState{

}
class UserLogOutErrorState extends AuthenticateState{


}
class UserLogOutLoadingState extends AuthenticateState{}

class CheckBoxChangeState extends AuthenticateState{}

