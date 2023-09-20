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


class CreateUserScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if(state is NewUserSucc)
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
                    Text('Add New User!', style: GoogleFonts.roboto(
                        fontSize: 34.sp, color: CustomColors.darkBlue),),
                    SizedBox(height: 20.h,),
                    Text('Create a new user now and assign them tasks right away.',
                      style: GoogleFonts.roboto(
                          fontSize: 16.sp, color: Color(0xff7C808A)),),
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
                    SizedBox(height: 20.h,),

                    CustomField(
                      label: 'Phone',
                      controller:cubit.phoneController,
                    ),
                    SizedBox(height: 20.h,),
                    CustomField(
                      label: 'Password',
                      controller:cubit.passwordController,
                    ),


                    SizedBox(height: 20.h,),
                    ConditionalBuilder(
                      condition: state is NewUserLoading,
                      builder:(context) =>  Center(child: CircularProgressIndicator( color: CustomColors.primaryButton,)),
                      fallback: (context) =>    InkWell(
                          onTap: ()
                          {
                            cubit.AddUser();
                          },
                          child: CustomButton(text: 'Create',)) ,
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
