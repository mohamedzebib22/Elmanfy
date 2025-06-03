import 'dart:developer';

import 'package:elmanfy/core/notification/local_notifications.dart';
import 'package:elmanfy/core/theme/custom_style_text.dart';
import 'package:elmanfy/core/utils/widgets/custom_text_feild.dart';
import 'package:elmanfy/features/home_page/data/cubits/cubit/delete_dept_cubit.dart';
import 'package:elmanfy/features/home_page/data/cubits/cubit/delete_dept_state.dart';
import 'package:elmanfy/features/home_page/data/cubits/dept_paid_done/dept_paid_done_cubit.dart';
import 'package:elmanfy/features/home_page/data/cubits/dept_paid_done/dept_paid_done_state.dart';
import 'package:elmanfy/features/home_page/data/cubits/get_dept/get_dept_cubit.dart';
import 'package:elmanfy/features/home_page/data/cubits/get_dept_done/get_depts_done_cubit.dart';
import 'package:elmanfy/features/home_page/presentation/views/widgets/components/custom_icon_button.dart';
import 'package:elmanfy/features/home_page/presentation/views/widgets/components/custome_product_details.dart';
import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/di/di.dart';
import 'package:elmanfy/core/utils/widgets/show_dialog_msg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/quickalert.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
    required this.nameOfThePiece,
    required this.priceOfThePiece,
    required this.count,
    required this.historyOfReligion,
    required this.totalPrice,
    required this.deptID,
  });

  final String nameOfThePiece;
  final int priceOfThePiece;
  final int count;
  final String historyOfReligion;
  final int totalPrice;
  final String deptID;

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    DeptPaidDoneCubit viewModel = getIt<DeptPaidDoneCubit>();
    DeleteDeptCubit deleteDept = getIt<DeleteDeptCubit>();

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Card(
      color: const Color(0xffD6D6D6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.02, horizontal: width * 0.02),
            child: Column(
              children: [
                buildNotificationIcon(context, args),
                SizedBox(
                  height: height * 0.001,
                ),
                buildPayTheDept(viewModel, args),
                SizedBox(
                  height: height * 0.001,
                ),
                buildDeleteDept(deleteDept, args),
              ],
            ),
          ),
          buildProductDetails(),
        ],
      ),
    );
  }

  CustomeProductDetails buildProductDetails() {
    return CustomeProductDetails(
        nameOfThePiece: nameOfThePiece,
        priceOfThePiece: priceOfThePiece,
        count: count,
        historyOfReligion: historyOfReligion,
        totalPrice: totalPrice);
  }

  BlocBuilder<DeleteDeptCubit, DeleteDeptState> buildDeleteDept(
      DeleteDeptCubit deleteDept, Map<String, dynamic> args) {
    return BlocBuilder<DeleteDeptCubit, DeleteDeptState>(
      bloc: deleteDept,
      builder: (context, state) {
        return state is DeleteDeptLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : CustomIconButton(
                title: Constant.delete,
                iconName: const Icon(
                  Icons.delete_sharp,
                  color: Colors.white,
                ),
                buttonColor: Colors.red,
                onTap: () {
                  deleteDept.deleteDeptFromFireStore(
                    userId: args['id'],
                    deptId: deptID,
                    context: context,
                  );
                },
              );
      },
    );
  }

  BlocBuilder<DeptPaidDoneCubit, DeptPaidDoneState> buildPayTheDept(
      DeptPaidDoneCubit viewModel, Map<String, dynamic> args) {
    return BlocBuilder<DeptPaidDoneCubit, DeptPaidDoneState>(
      bloc: viewModel,
      builder: (context, state) {
        return CustomIconButton(
          title: Constant.payment,
          iconName: state is DeptPaidDoneLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const Icon(
                  Icons.payment_sharp,
                  color: Colors.white,
                ),
          buttonColor: Colors.green,
          onTap: () {
            buildSelectPaymentTypeDialog(context, viewModel, args);
          },
        );
      },
    );
  }

  CustomIconButton buildNotificationIcon(
      BuildContext context, Map<String, dynamic> args) {
    return CustomIconButton(
      title: Constant.rememperPayment,
      iconName: const Icon(
        Icons.notification_important_sharp,
        color: Colors.white,
      ),
      buttonColor: Colors.orange,
      onTap: () {
        buildShowDialogNotification(context, args);
      },
    );
  }

  Future<dynamic> buildSelectPaymentTypeDialog(BuildContext context,
      DeptPaidDoneCubit viewModel, Map<String, dynamic> args) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('اختر نوع الدفع'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () async {
                    await viewModel.totalPayment(
                      context: context,
                      deptId: deptID,
                      userId: args['id'],
                      nameOfPiece: nameOfThePiece,
                      price: priceOfThePiece,
                      count: count,
                      dateOfAdded: historyOfReligion,
                      totalPrice: totalPrice,
                      fullName: args['full_name'],
                      phone: args['phone'],
                    );
                    await DeleteDeptCubit.get(context).deleteDeptFromFireStore(
                        userId: args['id'], deptId: deptID, context: context);
                    Navigator.of(context).pop();
                  },
                  child: const Text('دفع كلي',style: TextStyle(color: Colors.white,fontSize: 16),),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
                  onPressed: () {
                    Navigator.of(context).pop();
                    buildpartialPaymentDialog(context, viewModel, args);
                  },
                  child: const Text('دفع جزئي',style: TextStyle(color: Colors.white,fontSize: 16),),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> buildpartialPaymentDialog(BuildContext context,
      DeptPaidDoneCubit viewModel, Map<String, dynamic> args) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('دفع جزئي'),
          content: CustomTextFeild(
            controller: viewModel.controller,
            keyboardType: TextInputType.number,
              hintText: 'أدخل المبلغ المدفوع'
            
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('إلغاء',style:CustomStyleText.bold16Black ,),
            ),
            TextButton(
              onPressed: () {
                final paid = int.tryParse(viewModel.controller.text) ?? 0;

                if (paid <= 0 || paid >= totalPrice) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text('برجاء إدخال مبلغ صحيح أقل من المبلغ الكلي'),
                    ),
                  );
                  return;
                }

                viewModel.partialPaymentDone(
                  context: context,
                  deptId: deptID,
                  userId: args['id'],
                  nameOfPiece: nameOfThePiece,
                  price: priceOfThePiece,
                  count: count,
                  dateOfAdded: historyOfReligion,
                  totalPrice: totalPrice,
                  paidAmount: paid,
                );
                Navigator.pop(context);
              },
              child: const Text('تأكيد الدفع الجزئي',style: CustomStyleText.bold18Primary,),
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> buildShowDialogNotification(
      BuildContext context, Map<String, dynamic> args) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('تاكيد تذكير الدفع'),
            content: CustomTextFeild(
              keyboardType: TextInputType.number,
              hintText: 'برجاء ادخال عدد  الايام',
              controller: GetDeptCubit.get(context).notifictionRememper,
            ),
            actions: [
              TextButton(
                child: const Text('إلغاء'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('موافق'),
                onPressed: () {
                  print(
                      '${int.parse(GetDeptCubit.get(context).notifictionRememper.text)}');
                  log('===The id is :${DateTime.now().millisecondsSinceEpoch % 2147483647} ===');
                  LocalNotificationsServices.showSchduledNotification(
                      id: DateTime.now().millisecondsSinceEpoch % 2147483647,
                      title: args['full_name'],
                      body: 'برجاء الاتصال على الزبون لسداد هذا الدين',
                      numberOfDay: int.parse(
                          GetDeptCubit.get(context).notifictionRememper.text));
                  GetDeptCubit.get(context).notifictionRememper.clear();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}


 // viewModel.totalPayment(
                        //     context: context,
                        //     deptId: deptID,
                        //     userId: args['id'],
                        //     nameOfPiece: nameOfThePiece,
                        //     price: priceOfThePiece,
                        //     count: count,
                        //     dateOfAdded: historyOfReligion,
                        //     totalPrice: totalPrice,
                        //     fullName: args['full_name'],
                        //     phone: args['phone']);