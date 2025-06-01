import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/di/di.dart';
import 'package:elmanfy/core/theme/custom_style_text.dart';
import 'package:elmanfy/core/utils/widgets/custom_text.dart';
import 'package:elmanfy/features/home_page/data/cubits/get_dept/get_dept_cubit.dart';
import 'package:elmanfy/features/home_page/data/cubits/get_dept/get_dept_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsCardUser extends StatefulWidget {
  const DetailsCardUser({super.key});

  @override
  State<DetailsCardUser> createState() => _DetailsCardUserState();
}

class _DetailsCardUserState extends State<DetailsCardUser> {
 // late GetDeptCubit viewModel;
  late Map<String, dynamic> args;
  bool isLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isLoaded) {
      args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      // viewModel = getIt<GetDeptCubit>();
      // viewModel.getDepts(userId: args['id']);
      GetDeptCubit.get(context).getDepts(userId: args['id']);
      isLoaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return BlocBuilder<GetDeptCubit, GetDeptState>(
     // bloc: GetDeptCubit.get(context)..getDepts(userId: args['id']),
      builder: (context, state) {
        
     
        return Card(
          color: const Color(0xffD6D6D6),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.02, vertical: height * 0.01),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomText(
                  title: '${Constant.customerName}:${args['full_name']}',
                  textStyle: CustomStyleText.bold16Black,
                ),
                SizedBox(height: height * 0.02),
                CustomText(
                  title: '${Constant.phoneNumber}:${args['phone']}',
                  textStyle: CustomStyleText.bold16Black,
                ),
                SizedBox(height: height * 0.02),
                CustomText(
                  title: '${Constant.dateOfAdded}:${args['dateOfAdded']}',
                  textStyle: CustomStyleText.bold16Black,
                ),
                SizedBox(height: height * 0.02),
                if (state is GetDeptLodaing)
                  const CircularProgressIndicator()
                else if (state is GetDeptSucsess)
                  CustomText(
                    title: 'اجمالى المبلغ : ${state.totalPrice.toStringAsFixed(2)}',
                    textStyle: CustomStyleText.bold18Primary,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
