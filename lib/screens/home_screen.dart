import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled1/screens/tasks/view/edit_task.dart';
import 'package:untitled1/screens/tasks/view/user_page.dart';
import 'package:untitled1/screens/tasks/view/user_tasks.dart';
import 'package:untitled1/screens/user/view/get_employee_screen.dart';
import 'package:untitled1/screens/user/view/get_users_screen.dart';

import '../utils/colors/custom_colors.dart';
import 'departments/view/get_departments_screen.dart';
import 'login/login_cubit/login_model_bloc.dart';
import 'login/view/login_screen.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
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
    return BlocConsumer<AuthenticateCubit, AuthenticateState>(
      listener: (context, state) {
        if(state is UserLogOutSuccessState)
        {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));

        }
      },
      builder: (context, state) {

        final GlobalKey<ScaffoldState> drawerKey = GlobalKey();
        var cubit=AuthenticateCubit.get(context);
        return Scaffold(
            key: drawerKey,
            drawer: NavigationDrawer(

              children: [
                DrawerHeader(

                    child: Center(
                        child: ListTile(
                      title:  Text('Task Management',style: GoogleFonts.roboto(color: Colors.white),),
                      tileColor: CustomColors.primaryButton,
                      subtitle: Text('Training Flutter',style: GoogleFonts.roboto(color: Colors.white),),
                    )
                    )
                ),
                ListTile(
                  leading: Icon(Icons.category_outlined),
                  title: Text(
                    'Departments',
                  ),
                  onTap: () =>Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DepartmentsScreen(),
                      ))
                ),
                ListTile(
                  leading: Icon(Icons.person_outline),
                  title: Text(
                    'Users',
                  ),
                  onTap: () =>Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UsersScreen(),
                      ))
                ),
                ListTile(
                  leading: Icon(Icons.person_2_sharp),
                  title: Text(
                    'Get All Employees',
                  ),
                  onTap: () =>Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GetEmployeeScreen(),
                      ))
                ),
                ListTile(
                  leading: Icon(Icons.task_alt_sharp),
                  title: Text(
                    'UserTasks',
                  ),
                  onTap: () =>Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserTasks(),
                      ))
                ),
                ListTile(
                  leading: Icon(Icons.account_circle_rounded,),
                  title: Text(
                    'User Page',
                  ),
                  onTap: () =>Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserPage(),
                      ))
                ),
                new Divider(
                  color: Colors.black38,
                ),
                ListTile(
                  leading: Icon(Icons.logout_rounded,color: CustomColors.primaryButton,),
                  title: Text(
                    'Log out',
                  ),
                  onTap: () =>cubit.logOut()
                ),
              ],
            ),
            backgroundColor: Color(0xffF3FAF9),
            appBar: AppBar(
              backgroundColor: Color(0xffF3FAF9),
              elevation: 0.0,
              leading: IconButton(
                icon: const Icon(
                  Icons.menu_rounded,
                  color: Colors.black,
                ),
                onPressed: () {
                  drawerKey.currentState?.openDrawer();

                },


              ),

            ),
          body: Center(
            child: Text('Home Page',style: GoogleFonts.roboto(fontSize: 34,color: CustomColors.greyText),),
          ),
        );
      },
    );
  }
}
