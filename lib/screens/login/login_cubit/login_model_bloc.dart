import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/screens/user/model/get_user_model.dart';
import 'package:untitled1/service/secure_storage.dart';
import '../../../service/dio_helper/dio_helper.dart';
import '../../../service/sp_helper/sp_keys.dart';
import '../../../utils/end_points/urls.dart';
import '../model/authentication_model.dart';
part 'login_model_state.dart';

class AuthenticateCubit extends Cubit<AuthenticateState> {
  AuthenticateCubit() : super(LoginModelInitial());

  static AuthenticateCubit get(context) => BlocProvider.of(context);
TextEditingController emailController= TextEditingController();
TextEditingController passwordController= TextEditingController();
  var formKey=GlobalKey<FormState>();

  AuthenticationModel? authentication;
  GetUserModel? getUserModel;

  Login()async {
    emit(UserLoginLoadingState());
    DioHelper.postData(
        url: EndPoints.LogIn,
        data: {
      "email": emailController.text,
      "password": passwordController.text
    }).then((value)async {
      authentication = AuthenticationModel.fromJson(value.data);
      if (authentication!.code == 200) {
        print(authentication!.data!.userType);
        emailController.clear();
        passwordController.clear();
        emit(UserLoginSuccessState());
      }
      await SecureStorage().storage.write(key: SharedPreferencesKeys.token, value: authentication!.data!.token);
      print( ' fssfsf  ${await SecureStorage().storage.read(key:SharedPreferencesKeys.token)}' );
    }).catchError((error) {
      emit(UserLoginErrorState());
      print(error);
    });
  }

  logOut()async {
    emit(UserLogOutLoadingState());
    DioHelper.postData(
        url: EndPoints.logOut,
        token:await SecureStorage().storage.read(key:SharedPreferencesKeys.token),
        data: {
    }
    ).then((value) async{
      SecureStorage().deleteSecureData(SharedPreferencesKeys.token);
      print('loggg out');
      print( ' fssfsf  ${await SecureStorage().storage.read(key:SharedPreferencesKeys.token)}' );
      emit(UserLogOutSuccessState());
    }).catchError((error) {
      print('error log out ');
      emit(UserLogOutErrorState());
    });
  }


  bool authenticateCheckBox=false;
  void changeCheck()
  {
    authenticateCheckBox=!authenticateCheckBox;
  emit(CheckBoxChangeState());
  }




}
