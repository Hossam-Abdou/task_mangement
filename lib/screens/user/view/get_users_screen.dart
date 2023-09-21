import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:untitled1/screens/user/view/update_user_details.dart';
import '../../../utils/colors/custom_colors.dart';
import '../user_cubit/user_cubit.dart';
import 'add_new_user_screen.dart';


class UsersScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var cubit=UserCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor:CustomColors.primaryButton,
            elevation: 0,
          ),
          body: cubit.getUserModel==null?  Scaffold(
        body: Center(
        child: SimpleCircularProgressBar(
        progressColors:  [CustomColors.darkBlue],
          fullProgressColor: CustomColors.primaryButton,
          mergeMode: true,
          size: 25,

        ),
        ),
        ) : ListView.builder(
            itemCount:cubit.getUserModel?.data?.length,
            shrinkWrap: true,
            itemBuilder: (context, index) =>

              InkWell(
                  onTap: ()
                  {
                    print(cubit.getUserModel!.data![index].id);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateUserDetails(id: cubit.getUserModel!.data![index].id),));
                  },
                  child: Card(
                    child: ListTile(
                      title: Text('${cubit.getUserModel!.data![index].name}'),
                    ),
                  ),
                )
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor:  CustomColors.darkBlue,
            onPressed: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CreateUserScreen(),));
            },
            child: Icon(Icons.person_add_alt_1,color: Colors.white,),

          ),
        );
      },
    );
  }
}
