import 'package:elmanfy/features/home_page/data/cubits/get_dept_done/get_depts_done_cubit.dart';
import 'package:elmanfy/features/home_page/data/cubits/get_dept_done/get_depts_done_state.dart';
import 'package:elmanfy/features/home_page/presentation/views/widgets/components/payment_done.dart';
import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/di/di.dart';
import 'package:elmanfy/core/theme/app_color.dart';
import 'package:elmanfy/core/theme/custom_style_text.dart';
import 'package:elmanfy/core/utils/widgets/custom_button.dart';
import 'package:elmanfy/core/utils/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PaidDebtsPage extends StatelessWidget {
  const PaidDebtsPage({super.key});
  static String id = 'PaidDebtsPage';
  @override
  Widget build(BuildContext context) {

    String formattedDateTime(String rawDateTime) {
  DateTime dt = DateTime.parse(rawDateTime);
  return dt.toString().split('.')[0]; 
}
    var args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    GetDeptsDoneCubit viewModel = getIt<GetDeptsDoneCubit>();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              Constant.debtDone,
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: AppColor.primaryColor,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.02, vertical: height * 0.02),
            child: BlocBuilder<GetDeptsDoneCubit, GetDeptsDoneState>(
              bloc: viewModel..getDeptsDoneFromFireStore(userId: args['id']),
              builder: (context, state) {
                if(state is GetDeptsDoneLoading){
                  return Center(child: CircularProgressIndicator(),);
                }else if(state is GetDeptsDoneSucsess){
                  var deptList = viewModel.data;
                  return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: deptList.length,
                          itemBuilder: (context, index) {
                            return PaymentDone(
                              totalPrice: deptList[index]['totalPrice'],
                             nameOfType: deptList[index]['itemName'],
                              price: deptList[index]['itemPrice'], 
                              count: deptList[index]['quantity'], 
                              dateOfPaid:formattedDateTime(deptList[index]['paidDate']));
                          }),
                    )
                  ],
                );
                }else if(state is GetDeptsDoneFaluire){
                  return Text(state.faliures.errMessage);
                }
                return Container(child: Text('Invalid Error'),);
              },
            ),
          )),
    );
  }
}
