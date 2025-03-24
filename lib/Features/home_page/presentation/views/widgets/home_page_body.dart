import 'package:elmanfy/Features/home_page/data/cubits/get_user_cubit/get_user_cubit.dart';
import 'package:elmanfy/Features/home_page/data/cubits/get_user_cubit/get_user_state.dart';
import 'package:elmanfy/Features/home_page/presentation/views/screens/customer_details_page.dart';
import 'package:elmanfy/Features/home_page/presentation/views/widgets/Home_Sections/search_section.dart';
import 'package:elmanfy/Features/home_page/presentation/views/widgets/Home_Sections/show_data_section.dart';
import 'package:elmanfy/core/di/di.dart';
import 'package:elmanfy/core/theme/custom_style_text.dart';

import 'package:elmanfy/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
  });


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
          SearchSection(),
          SizedBox(height: height * 0.02),
          BlocBuilder<GetUserCubit, GetUserState>(
            bloc: viewModel..getUsersFromeFireStore(context: context),
            builder: (context, state) {
              
              if (state is GetUserLoading) {
                return  Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetUserSucsess) {
                var userList = viewModel.data;
                print('========${userList.length}======');
                if(userList.isEmpty){
                  return Center(child: Text('لا نوجد ديون حاليا', style: CustomStyleText.whiteColorBold,),);
                }else{
                  return Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, CustomerdetailsPage.id);
                        },
                        child: ShowDataSection(
                          name: '${userList[index]['full_name']}',
                          phone: '${userList[index]['phone']}',
                          dateOfAdded: '${userList[index]['dateOfAdded']}',
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
                              .getUsersFromeFireStore(context: context);
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