import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors/custom_colors.dart';
import '../../departments/department_cubit/department_cubit.dart';
import '../../login/login_cubit/login_model_bloc.dart';

class UserPage extends StatefulWidget {

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> with SingleTickerProviderStateMixin{
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }
  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DepartmentCubit, DepartmentState>(
      listener: (context, state) {},
      builder: (context, state) {

        var cubit=DepartmentCubit.get(context);
        return Scaffold(

            backgroundColor: Color(0xffF3FAF9),
            appBar: AppBar(
              bottom: TabBar(

                unselectedLabelStyle: TextStyle(color: CustomColors.darkBlue,),
                controller: _tabController,
                // unselectedLabelColor: Color(0xff091E4A),
                tabs: [
                  Tab(child: Row(children: [
                    Icon(Icons.person_outline_outlined,color:CustomColors.primaryButton,),
                    Text('Users',style: TextStyle(color:CustomColors.primaryButton),),
                  ],)),
                  Tab(child: Row(children: [
                    Icon(Icons.task,color: CustomColors.primaryButton,),
                    Text('TASKS',style: TextStyle(color: CustomColors.primaryButton,),),
                  ],)),
                ],
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Today',style: TextStyle(color: CustomColors.darkBlue,fontSize: 16.sp),),
                  Text('${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',style: TextStyle(color: CustomColors.greyText,fontSize: 12),)


                ],
              ),
              backgroundColor: Color(0xffF3FAF9),
              elevation: 0.0,
              leading: IconButton(
                icon: const Icon(
                  Icons.menu_rounded,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
              actions: [
                PopupMenuButton(
                  color: Colors.white,
                  position: PopupMenuPosition.under,
                  icon: Container(
                    decoration: BoxDecoration(
                        color: CustomColors.primaryButton,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: const Icon(
                      Icons.add,
                    ),
                  ),
                  itemBuilder: (BuildContext context) {
                    return [

                      PopupMenuItem(
                        child: Text('employee', style: TextStyle(color: Colors
                            .black, fontSize: 15),),
                        value: 'option2',
                      ),
                      PopupMenuItem(
                        child: Text('Department', style: TextStyle(color: Colors
                            .black, fontSize: 15,),),
                        value: 'option2',
                      ),
                      PopupMenuItem(
                        child: Text('Tasks', style: TextStyle(color: Colors.black,
                            fontSize: 15.sp),),
                        value: 'option2',
                      ),
                    ];
                  },),
              ],

            ),
            body:TabBarView(
                controller: _tabController,
                children: [
                  SafeArea(
                    child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 25.0.w),
                        child:
                        ListView.builder(
                          itemCount: cubit.getDepartment?.data?.length,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 15.h,),
                              Row(
                                children: [
                                  SizedBox(

                                    child: Divider(color: CustomColors.darkBlue),
                                    width: 50.w,),
                                  SizedBox(width: 3.w,),
                                  Text('${cubit.getDepartment?.data?[index].name}',style: GoogleFonts.roboto(color: CustomColors.darkBlue),)
                                ],
                              ),
                              SizedBox(height: 10.h,),

                              GridView.builder(
                                itemCount: (cubit.getDepartment?.data?[index].employees?.length??0),
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 8/6,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10
                                ),


                                itemBuilder:(context, currentIndex) =>
                                    Container(
                                  height: 85.h,
                                  width: 155.w,
                                  padding: EdgeInsets.symmetric(vertical: 11.0.h,horizontal: 3.w),
                                  decoration: BoxDecoration(
                                      border: Border.all(color:  CustomColors.greyText.withOpacity(0.2)),
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(child: VerticalDivider(color: CustomColors.primaryButton,thickness: 2,),height: 65.h,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width:99,
                                              child: Text('${cubit.getDepartment?.data?[index].employees?[currentIndex].name}',style: TextStyle(color: CustomColors.darkBlue,fontSize: 16.sp,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,)),
                                          Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(3),
                                                  color: CustomColors.primaryButton.withOpacity(0.1)

                                              ),
                                              height: 15.h,
                                              width: 40.w,
                                              child: Center(child: Text('Admin',style: TextStyle(color:CustomColors.primaryButton,fontSize: 10.sp),))),

                                          Row(
                                            children: [
                                              Icon(Icons.email_outlined,color:CustomColors.greyText,),
                                              SizedBox(
                                                  width:95.w,
                                                  child: Text('${cubit.getDepartment?.data?[index].employees?[currentIndex].email??'empty'}',style: TextStyle(color: CustomColors.darkBlue,fontSize: 8.sp),maxLines: 1,overflow: TextOverflow.ellipsis,)),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.phone_outlined,color: CustomColors.greyText,),
                                              Text('${cubit.getDepartment?.data?[index].employees?[currentIndex].phone}',style: TextStyle(color: CustomColors.darkBlue,fontSize: 8.sp),),
                                            ],
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                )

                              )
                            ],),)
                    ),
                  ),
                  Center(child: Text('No Tasks Yet'))
                ])
        );
      },
    );
  }
}
