import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../utils/colors/custom_colors.dart';

class UserTasks extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Color(0xffF3FAF9),
        elevation: 0.0,
        leadingWidth: 110,
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.menu_rounded,
                color: Colors.black,
              ),
              onPressed: () {

              },),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Today',style: TextStyle(color:CustomColors.darkBlue,fontSize: 16.sp),),
                Text('${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',style: TextStyle(color: CustomColors.greyText,fontSize: 12),)
              ],
            ),
          ],
        ),

      actions: [
         new CircularPercentIndicator(
          radius: 25.r,
          lineWidth: 7.0,
          percent:9/20,
          center: Text('9/20'),
          backgroundColor:  Color(0xff94C68D).withOpacity(0.4),
          progressColor: Color(0xff94C68D),
        ),
        SizedBox(width: 10,),
        new CircularPercentIndicator(
          radius: 25.r,
          lineWidth: 7.0,
          percent: 5/20,
          center: Text('5/20'),
          backgroundColor: Color(0xffFBA85B).withOpacity(0.4),
          progressColor: Color(0xffFBA85B),
        ),
        SizedBox(width: 10,),

        new CircularPercentIndicator(
          radius: 25.r,
          lineWidth: 7.0,
          percent: 6/20,
          center: Text('6/20'),
          backgroundColor: Color(0xffF87B7B).withOpacity(0.4),
          progressColor: Color(0xffF87B7B),
        ),
        SizedBox(width: 10,),

      ],
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.0.w),
        child: Column(
          children: [
          CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime(2019, 1, 15),
            lastDate: DateTime(2030, 11, 20),
            onDateSelected: (date) => print(date),
            leftMargin: 20,
            monthColor: Colors.blueGrey,
            dayColor: CustomColors.darkBlue,
            activeDayColor: Colors.white,
            shrink: true,
            activeBackgroundDayColor: CustomColors.primaryButton,
            dotsColor: Color(0xFF333A47),
            selectableDayPredicate: (date) => date.day != 23,
          ),
          SizedBox(height: 20.h,),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 15.h,),
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder:(context, index) =>  Container(
                height: 163.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10.0.h,horizontal: 2.w),
                decoration: BoxDecoration(
                    border: Border.all(color: CustomColors.greyText.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('New',style: GoogleFonts.roboto(color:CustomColors.primaryButton,fontSize: 16.sp,fontWeight: FontWeight.bold),),
                        Divider(),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 5),
                              decoration: BoxDecoration(
                                border: Border(left: BorderSide(color:CustomColors.primaryButton,width: 3, ))
                              ),
                              height: 53.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Text('Create a High-Intensity Interval...',style: TextStyle(color: CustomColors.darkBlue,fontSize: 16.sp,fontWeight: FontWeight.bold,),),

                                      Icon(Icons.more_vert)
                                    ],
                                  ),
                                  Text('Design a 20-minute HIIT workout routine.',style: TextStyle(color:CustomColors.greyText,fontSize: 12.sp,fontWeight: FontWeight.bold),),

                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24.h,),
                        Row(
                          children: [
                            Icon(Icons.alarm_sharp),
                            Text('starts 12/9/2023 - ends 15/9/2023',style: GoogleFonts.roboto(color: CustomColors.darkBlue,fontWeight: FontWeight.bold),)
                          ],
                        )
                      ],
                    ),

                ),
              ),
            ),
          ) ,
        ],),
      ),
    );
  }
}
