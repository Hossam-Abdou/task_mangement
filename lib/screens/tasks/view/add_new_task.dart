import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:untitled1/screens/tasks/cubit/tasks_state.dart';
import '../../../utils/colors/custom_colors.dart';
import '../../../utils/widgets/custom_button.dart';
import '../../../utils/widgets/custom_field.dart';
import '../../user/view/get_employee_screen.dart';
import '../cubit/tasks_cubit.dart';


class AddNewTask extends StatelessWidget {
  int? id;

  AddNewTask({this.id});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TasksCubit, TasksState>(
  listener: (context, state) {
    if(state is AddTasksSuccess)
      {
        Navigator.pop(context, MaterialPageRoute(builder: (context) =>GetEmployeeScreen() ,));
      }
  },
  builder: (context, state) {
    var cubit= TasksCubit.get(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Column(
              children: [
                Text('Add New Task!',style: GoogleFonts.roboto(color: CustomColors.darkBlue,fontSize: 34.sp),),
                SizedBox(height: 20.h,),

                Text('Create a new task now and assign it to employees right away.',style: GoogleFonts.roboto(color: CustomColors.greyText,fontSize: 16.sp),),
                SizedBox(height: 20.h,),

                SfDateRangePicker(
                  view: DateRangePickerView.month,
                  monthViewSettings: DateRangePickerMonthViewSettings(firstDayOfWeek: 6),
                  selectionMode: DateRangePickerSelectionMode.range,
                  controller: cubit.dateController,
                  onSelectionChanged: (value) {},
                ),
                SizedBox(height: 20.h,),
                CustomField(label: 'Title', controller: cubit.nameController),
                SizedBox(height: 20.h,),
                CustomField(label: 'Description', controller: cubit.descriptionController,maxLines: 3),
                SizedBox(height: 20.h,),
                ConditionalBuilder(
                    condition: state is AddTasksLoading,
                    builder:(context) =>  Center(child: CircularProgressIndicator( color: CustomColors.primaryButton,)),
                    fallback: (context) =>     InkWell(
                        onTap: ()
                        {
                          cubit.addTask(id);
                        },
                        child: CustomButton(text: 'Create',))

                )


          ],
            ),
          ),
        ),
      ),
    );
  },
); 
  }
}

