import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:untitled1/screens/tasks/cubit/tasks_state.dart';
import '../../../service/dio_helper/dio_helper.dart';
import '../../../service/secure_storage.dart';
import '../../../service/sp_helper/sp_helper.dart';
import '../../../service/sp_helper/sp_keys.dart';
import '../../../utils/end_points/urls.dart';
import '../../user/model/get_employee_model.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial());
  static TasksCubit get(context) => BlocProvider.of(context);

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateRangePickerController dateController = DateRangePickerController();
  GetEmployeeModel? getEmployeeModel;
  addTask(id) async {
    emit(AddTasksLoading());
    await DioHelper.postData(
        url: EndPoints.storeTasks,
        token: "${await SecureStorage().storage.read(key:SharedPreferencesKeys.token)}",
        data: {
          "name": nameController.text,
          "description": descriptionController.text,
          'employee_id': id,
          'status':0,
          'start_date':'${dateController.selectedRange!.startDate!.year}/${dateController.selectedRange!.startDate!.month}/${dateController.selectedRange!.startDate!.day}',
         'end_date':'${dateController.selectedRange!.endDate!.year}/${dateController.selectedRange!.endDate!.month}/${dateController.selectedRange!.endDate!.day}'
        }).then((value) {
      if (value.data["code"] == 200 || value.data["code"] == 201) {
        getAllEmployee();
        emit(AddTasksSuccess());
      }
    }).catchError((error) {
      if (error is DioException && error.response?.statusCode == 401 || error.response?.statusCode == 422) {
        final data = error.response?.data;
        final message = data['message'];
        print(message);
      }
      emit(AddTasksError());
    });
  }

  getAllEmployee() async {
    DioHelper.getData(
        url: EndPoints.getEmployee,
        token:await SecureStorage().storage.read(key:SharedPreferencesKeys.token)
    ).then((value) {
      print('1');
      getEmployeeModel = GetEmployeeModel.fromJson(value.data);
      emit(GetEmployeeSucc());
    }).catchError((error) {
      if (error is DioError && error.response?.statusCode == 401) {
        final data = error.response?.data;
        final message = data['message'];
        print(message);
      }      emit(GetEmployeeError());
    });
  }


}
