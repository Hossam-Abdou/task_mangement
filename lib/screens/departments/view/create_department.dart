import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors/custom_colors.dart';
import '../../../utils/widgets/custom_button.dart';
import '../../../utils/widgets/custom_field.dart';
import '../department_cubit/department_cubit.dart';
import 'get_departments_screen.dart';

class CreateDepartmentScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<DepartmentCubit, DepartmentState>(
      listener: (context, state) {
        if(state is NewDepSucc)
          {
            Navigator.pop(context, MaterialPageRoute(builder: (context) =>DepartmentsScreen() ,));
          }
      },
      builder: (context, state) {
        var cubit=DepartmentCubit.get(context);
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.only(left: 20.0.w,right: 20.0.w,top: 20.0.h),
            child: SafeArea(
              child: Form(
                key: cubit.formKey,
                child: Column(
                  children: [
                    Text('New Department!', style: GoogleFonts.roboto(
                        fontSize: 34.sp, color:CustomColors.darkBlue),),
                    SizedBox(height: 20.h,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: Text('Create a new department now and assign a manager to start the work!',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            fontSize: 16, color:CustomColors.greyText)
                        ,),
                    ),
                    SizedBox(height: 20.h,),
                    CustomField(
                      label: 'Name',
                      controller:cubit.nameController,
                    ),
                    SizedBox(height: 20.h,),
                    ConditionalBuilder(
                      condition: state is NewDepLoading,
                      builder:(context) =>  Center(child: CircularProgressIndicator( color: CustomColors.primaryButton,)),
                      fallback: (context) =>InkWell(
                          onTap: () {
                            if (cubit.formKey.currentState!.validate()) {
                              cubit.CreateDep();
                            }
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
