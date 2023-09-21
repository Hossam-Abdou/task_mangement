import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:untitled1/screens/tasks/cubit/tasks_cubit.dart';
import 'package:untitled1/screens/tasks/cubit/tasks_state.dart';

import '../../../utils/colors/custom_colors.dart';

class EditTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TasksCubit, TasksState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit=TasksCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF3FAF9),
        elevation: 0.0,
        leadingWidth: 110.w,
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.menu_rounded,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Today',
                  style:
                      TextStyle(color: CustomColors.darkBlue, fontSize: 16.sp),
                ),
                Text(
                  '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                  style: TextStyle(color: CustomColors.greyText, fontSize: 12),
                )
              ],
            ),
          ],
        ),
        actions: [
          new CircularPercentIndicator(
            radius: 25.r,
            lineWidth: 7.0,
            percent: 9 / 20,
            center: Text('9/20'),
            backgroundColor: Color(0xff94C68D).withOpacity(0.4),
            progressColor: Color(0xff94C68D),
          ),
          SizedBox(
            width: 10,
          ),
          new CircularPercentIndicator(
            radius: 25.r,
            lineWidth: 7.0,
            percent: 5 / 20,
            center: Text('5/20'),
            backgroundColor: Color(0xffFBA85B).withOpacity(0.4),
            progressColor: Color(0xffFBA85B),
          ),
          SizedBox(
            width: 10,
          ),
          new CircularPercentIndicator(
            radius: 25.r,
            lineWidth: 7.0,
            percent: 6 / 20,
            center: Text('6/20'),
            backgroundColor: Color(0xffF87B7B).withOpacity(0.4),
            progressColor: Color(0xffF87B7B),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Create a High-Intensity Interval Training (HIIT) Workout Routine tap to edit',
                style: GoogleFonts.roboto(
                    fontSize: 16.sp, color: CustomColors.darkBlue,fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        'Created By',
                        style: GoogleFonts.roboto(
                            fontSize: 16.sp, color: CustomColors.greyText),
                      ),
                      Text(
                        'Creator Name',
                        style: GoogleFonts.roboto(
                            fontSize: 18.sp, color: CustomColors.darkBlue),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Due date',
                        style: GoogleFonts.roboto(
                            fontSize: 16.sp, color: CustomColors.greyText),
                      ),
                      Text(
                        '16 September',
                        style: GoogleFonts.roboto(
                            fontSize: 18.sp, color: CustomColors.darkBlue),
                      ),
                    ],
                  ),
                ],
              ),
              RadioMenuButton(
                  value:0,
                  groupValue: cubit.selectedCheckbox,
                  onChanged: (value) =>
                      cubit.updateRadioValue(value),
                  child: Text('New')),
              RadioMenuButton(
                  value: 1,
                  groupValue:  cubit.selectedCheckbox,
                  onChanged: (value) => cubit.updateRadioValue(value!),
                  child: Text('Processing')),
              RadioMenuButton(
                  value: 2,
                  groupValue:  cubit.selectedCheckbox,
                  onChanged: (value) => cubit.updateRadioValue(value!),
                  child: Text('Completed')),
              RadioMenuButton(
                  value: 3,
                  groupValue:  cubit.selectedCheckbox,
                  onChanged: (value) => cubit.updateRadioValue(value!),
                  child: Text('Expired')),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Text(
                    'Description',
                    style: GoogleFonts.roboto(
                        fontSize: 18.sp, color: CustomColors.darkBlue),
                  ),
                  Text(
                    'tap to edit',
                    style: GoogleFonts.roboto(
                        fontSize: 8.sp, color: CustomColors.greyText),
                  ),
                ],
              ),
              Text(
                'Design a 20-minute HIIT workout routine that includes a warm-up, alternating periods of intense exercise and rest, and a cool-down. Specify the exercises, durations, and intensity levels for each interval.',
                style: GoogleFonts.roboto(
                    fontSize: 14.sp, color: CustomColors.greyText),
              ),
            ],
          ),
        ),
      ),
    );
  },
);
  }
}
