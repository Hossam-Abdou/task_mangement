import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled1/utils/end_points/urls.dart';
import '../../../service/dio_helper/dio_helper.dart';
import '../../../service/secure_storage.dart';
import '../../../service/sp_helper/sp_helper.dart';
import '../../../service/sp_helper/sp_keys.dart';
import '../models/department_model.dart';
import '../models/get_departments_model.dart';
import '../models/update_department.dart';

part 'department_state.dart';

class DepartmentCubit extends Cubit<DepartmentState> {
  DepartmentCubit() : super(DepartmentInitial());

  static DepartmentCubit get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController assignManagerController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  DepModel? depModel;
  UpdateDepartment? updateDepartment;
  GetDepartment? getDepartment;


  CreateDep() async {
    emit(NewDepLoading());
    await DioHelper.postData(
        url: EndPoints.storeDep,
       token: "${SecureStorage().storage.read(key:SharedPreferencesKeys.token)}",
        data: {
          "name": nameController.text,
        }).then((value) {
      if (value.data["code"] == 200 || value.data["code"] == 201) {
        depModel = DepModel.fromJson(value.data);
        print(depModel!.data!.name);
        nameController.clear();
        getAllDepartments();
        emit(NewDepSucc());
      }
    }).catchError((error) {
      if (error is DioError && error.response?.statusCode == 401) {
        final data = error.response?.data;
        final message = data['message'];
        print(message);
      }
      emit(NewDepError());
    });
  }

  updateDep(id) async {
    emit(UpdateDepLoading());
    await DioHelper.postData(
        url: '${EndPoints.updateDep}/$id',
       token: "${await SecureStorage().storage.read(key:SharedPreferencesKeys.token)}",
        data: {
          "name": nameController.text,
        }).then((value) {
      print("1");
      if (value.data["code"] == 200 || value.data["code"] == 201) {
        depModel = DepModel.fromJson(value.data);
        print(depModel!.data!.name);
        nameController.clear();
        assignManagerController.clear();
        getAllDepartments();
        emit(UpdateDepSucc());
      }
    }).catchError((error) {
      if (error is DioError && error.response?.statusCode == 401) {
        final data = error.response?.data;
        final message = data['message'];
        print(message);
      }
      emit(UpdateDepError());
    });
  }

  deleteDep(id) async {
    emit(DeleteDepLoading());
    await DioHelper.deleteData(
      url: '${EndPoints.deleteDepartment}/$id',
      token: "${await SecureStorage().storage.read(key:SharedPreferencesKeys.token)}",
    ).then((value) {

      if (value.data["code"] == 200 || value.data["code"] == 201) {
        emit(DeleteDepSucc());
      }
    }).catchError((error) {
      if (error is DioError && error.response?.statusCode == 500 ||error.response?.statusCode == 401 ) {
        final data = error.response?.data;
        final message = data['message'];
        print(message);
      }
      emit(DeleteDepError());
    });
  }


  getAllDepartments() async{
    DioHelper.getData(
        url: EndPoints.getDepartments,
      token:await SecureStorage().storage.read(key:SharedPreferencesKeys.token)
       ).then((value) {
      getDepartment = GetDepartment.fromJson(value.data);
      emit(GetDepSucc());
    }).catchError((error) {
      if (error is DioError && error.response?.statusCode == 401) {
        final data = error.response?.data;
        final message = data['message'];
        print(message);
      }      emit(GetDepError());
    });
  }




}
