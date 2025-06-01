import 'package:elmanfy/features/home_page/data/cubits/get_and_delete_user_cubit/get_and_delete_user_cubit.dart';
import 'package:elmanfy/features/home_page/data/cubits/get_and_delete_user_cubit/get_and_delete_user_state.dart';
import 'package:elmanfy/features/home_page/presentation/views/screens/customer_details_page.dart';
import 'package:elmanfy/features/home_page/presentation/views/widgets/Home_Sections/search_section.dart';
import 'package:elmanfy/features/home_page/presentation/views/widgets/Home_Sections/show_data_section.dart';
import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/di/di.dart';
import 'package:elmanfy/core/theme/custom_style_text.dart';

import 'package:elmanfy/core/utils/widgets/custom_button.dart';
import 'package:elmanfy/core/utils/widgets/show_dialog_msg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/quickalert.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key, required this.menuDrawer,
  });

  final VoidCallback menuDrawer;
  @override
  Widget build(BuildContext context) {
    GetUserCubit viewModel = getIt<GetUserCubit>();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: height * 0.02),
          SearchSection(onTap: (title ) { 
            viewModel.searchProduct(title);
           }, menuDrawer: menuDrawer,),
          SizedBox(height: height * 0.02),
          BlocBuilder<GetUserCubit, GetAndDeleteUserState>(
            bloc: viewModel..getUsersFromeFireStore(),
            builder: (context, state) {
              
              if (state is GetUserLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetUserSucsess) {
                var userList = viewModel.filterData;
                print('========${userList.length}======');
                if(userList.isEmpty){
                  return const Center(child: Text('لا نوجد ديون حاليا', style: CustomStyleText.whiteColorBold,),);
                }else{
                  return Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, CustomerdetailsPage.id,arguments: {
                            'full_name' :userList[index]['full_name'],
                            'phone' :userList[index]['phone'],
                            'dateOfAdded' :userList[index]['dateOfAdded'],
                            'id' :userList[index]['id'],
                          });
                        },
                        child: ShowDataSection(
                          name: '${userList[index]['full_name']}',
                          phone: '${userList[index]['phone']}',
                          dateOfAdded: '${userList[index]['dateOfAdded']}', 
                          onTap: () {
                            ShowDialogMsg.showDialogtext(context: context, 
                            type: QuickAlertType.warning, 
                            title: Constant.deleteUser,
                             body: Constant.deleteUserConfirm, 
                             confirm: ()async{
                             await viewModel.deleteUser(id: '${userList[index].id}', context: context);
                              Navigator.pop(context);
                             }) ;
                           },
                        ),
                      );
                    },
                  ),
                );
                }
                
              } else if (state is GetUserFailuer) {
                return Center(
                  child: Column(
                    children: [
                      Text(state.faliures.errMessage),
                      CustomBotton(
                        title: 'اعادة المحاولة',
                        onTap: () {
                         viewModel
                              .getUsersFromeFireStore();
                        },
                      )
                    ],
                  ),
                );
              }
              return  Container(
                child: const Text('Some Thing Went Wrong'),
              );
            },
          ),

          // Text(
          //   Constant.noDebtsCurrently,
          //   style: CustomStyleText.whiteColorBold,
          //   textAlign: TextAlign.center,
          // ),
        ],
      ),
    );
  }
}

/**
 
 */