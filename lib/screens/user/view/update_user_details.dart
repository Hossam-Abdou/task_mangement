import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
import '../../../utils/colors/custom_colors.dart';
import '../../../utils/widgets/custom_button.dart';
import '../../../utils/widgets/custom_field.dart';
import '../user_cubit/user_cubit.dart';
import 'get_users_screen.dart';


class UpdateUserDetails extends StatelessWidget {
  int? id;

  UpdateUserDetails({this.id});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if(state is UpdateUserSucc)
        {
          Navigator.pop(context, MaterialPageRoute(builder:(context) => UsersScreen(),));
        }
        if(state is DeleteUserSucc)
        {
          Navigator.pop(context, MaterialPageRoute(builder:(context) => UsersScreen(),));
        }

      },
      builder: (context, state) {
        var cubit=UserCubit.get(context);
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text('Update User Details!', style: GoogleFonts.roboto(
                        fontSize: 34.sp, color: CustomColors.darkBlue),),
                    SizedBox(height: 20.h,),
                    Text('Update user details and give them a new identity.',
                      style: GoogleFonts.roboto(
                          fontSize: 16.sp, color: CustomColors.greyText),),
                    SizedBox(height: 20.h,),

                    CustomField(
                      label: 'Name',
                      controller:cubit.nameController,
                    ),
                    SizedBox(height: 20.h,),

                    CustomField(
                      label: 'Email',
                      controller:cubit.emailController,
                    ),
                    SizedBox(height: 24.h,),

                    CustomField(
                      label: 'Phone',
                      controller:cubit.phoneController,
                    ),
                    SizedBox(height: 24.h,),
                    CustomField(
                      label: 'Password',
                      controller:cubit.passwordController,
                    ),


                        RadioMenuButton(
                            value:0,
                            groupValue: cubit.selectedCheckbox,
                            onChanged: (value) =>
                                cubit.updateRadioValue(value),
                            child: Text('admin')),

                           RadioMenuButton(
                              value: 1,
                              groupValue:  cubit.selectedCheckbox,
                              onChanged: (value) => cubit.updateRadioValue(value!),
                              child: Text('manager')),


                          RadioMenuButton(
                              value: 2,
                              groupValue:  cubit.selectedCheckbox,
                              onChanged: (value) => cubit.updateRadioValue(value!),
                              child: Text('employee')),



                
                    SizedBox(height: 26.h,),
                    ConditionalBuilder(
                      condition: state is UpdateUserLoading,
                      builder:(context) =>  Center(child: CircularProgressIndicator( color: CustomColors.primaryButton,)),
                      fallback: (context) => InkWell(
                          onTap: ()
                          {
                            cubit.updateUser(id);
                          },
                          child: CustomButton(text: 'Update',))

                    ),
                    SizedBox(height: 24.h,),
                    ConditionalBuilder(
                      condition: state is DeleteUserLoading,
                      builder:(context) =>  Center(child: CircularProgressIndicator( color:Colors.redAccent,)),
                      fallback: (context) => InkWell(
                          onTap: ()
                          {
                            cubit.deleteUser(id);
                          },
                          child: CustomButton(text: 'Delete',color:Colors.redAccent,))

                    ),
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
