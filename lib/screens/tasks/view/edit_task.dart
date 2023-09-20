import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../utils/colors/custom_colors.dart';

class EditTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              SizedBox(
                height: 20.h,
              ),

              // Row(
              //   children: [
              //     RadioMenuButton(
              //         value: false,
              //         groupValue: [],
              //         onChanged: (v) {},
              //         child: Text('hossam')),
              //     RadioMenuButton(
              //         value: true,
              //         groupValue: [],
              //         onChanged: (v) {},
              //         child: Text('Muath')),
              //     RadioMenuButton(
              //         value: true,
              //         groupValue: [],
              //         onChanged: (v) {},
              //         child: Text('hamada')),
              //   ],
              // ),
              // Row(
              //   children: [
              //     RadioMenuButton(
              //         value: true,
              //         groupValue: [],
              //         onChanged: (v) {},
              //         child: Text('hamada')),
              //     RadioMenuButton(
              //         value: true,
              //         groupValue: [],
              //         onChanged: (v) {},
              //         child: Text('hamada')),
              //     RadioMenuButton(
              //         value: true,
              //         groupValue: [],
              //         onChanged: (v) {},
              //         child: Text('hamada')),
              //   ],
              // ),
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
  }
}
