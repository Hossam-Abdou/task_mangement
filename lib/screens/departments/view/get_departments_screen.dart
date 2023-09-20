import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:untitled1/screens/departments/view/update_department.dart';
import '../../../utils/colors/custom_colors.dart';
import '../department_cubit/department_cubit.dart';
import 'create_department.dart';

class DepartmentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DepartmentCubit, DepartmentState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = DepartmentCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor:CustomColors.primaryButton,
            elevation: 0,


          ),
          body: cubit.getDepartment==null?  Scaffold(
            body: Center(
              child: SimpleCircularProgressBar(
                progressColors:  [CustomColors.darkBlue],
                fullProgressColor: CustomColors.primaryButton,
                mergeMode: true,
                size: 25,

              ),
            ),
          ) :  ListView.builder(
            itemCount: cubit.getDepartment?.data?.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                print(cubit.getDepartment!.data![index].id);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateDepartmentScreen(
                          id: cubit.getDepartment!.data![index].id),
                    ));
              },
              child: Card(
                child: ListTile(
                  title: Text('${cubit.getDepartment!.data![index].name}'),
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: CustomColors.darkBlue,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateDepartmentScreen(),
                  ));
            },
            child: Icon(Icons.add,color: Colors.white,),
          ),
        );
      },
    );
  }
}
