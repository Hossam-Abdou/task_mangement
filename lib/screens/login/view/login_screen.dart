import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled1/utils/colors/custom_colors.dart';
import '../../../utils/widgets/custom_button.dart';
import '../../../utils/widgets/custom_field.dart';
import '../../home_screen.dart';
import '../../tasks/view/user_page.dart';
import '../login_cubit/login_model_bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticateCubit, AuthenticateState>(
      listener: (context, state) async {
        if (state is UserLoginSuccessState) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ));

          const snackBar = SnackBar(
            content: Text('Login Successfully'),
            backgroundColor: Colors.green,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state is UserLoginErrorState) {
          const snackBar = SnackBar(
            content: Text('Password or Email is not correct'),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        var cubit = AuthenticateCubit.get(context);
        return Scaffold(
          body: Form(
            key: cubit.formKey,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome Back !',
                          style: GoogleFonts.roboto(
                              fontSize: 34.sp,
                              color: CustomColors.darkBlue),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: Text(
                            'Login to access your assigned tasks and personal overview.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.normal,
                                color:CustomColors.greyText),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomField(
                            controller: cubit.emailController,

                            label: 'Email'),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomField(
                            controller: cubit.passwordController,
                            label: 'Paasword'),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            Checkbox(value: cubit.authenticateCheckBox, onChanged: (value)
                            {
                              cubit.changeCheck();
                            }),
                            Text(
                              'Keep me Logged In',
                              style: GoogleFonts.roboto(
                                  fontSize: 16.sp, color: CustomColors.darkBlue),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ConditionalBuilder(
                            condition: state is UserLoginLoadingState,
                            builder:(context) =>  Center(child: CircularProgressIndicator( color: CustomColors.primaryButton,)),
                            fallback:(context) => InkWell(
                              onTap: () {

                                cubit.emailController.text='hssggs@admin.com';
                                cubit.passwordController.text='password';
                                cubit.Login();
                              },
                              child:CustomButton(text:'Login') ,
                            ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
