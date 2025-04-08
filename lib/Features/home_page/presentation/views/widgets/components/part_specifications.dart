import 'package:elmanfy/Features/home_page/data/cubits/dept_paid_done/dept_paid_done_cubit.dart';
import 'package:elmanfy/Features/home_page/data/cubits/dept_paid_done/dept_paid_done_state.dart';
import 'package:elmanfy/Features/home_page/presentation/views/widgets/components/custom_icon_button.dart';
import 'package:elmanfy/Features/home_page/presentation/views/widgets/components/custome_product_details.dart';
import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/di/di.dart';
import 'package:elmanfy/core/theme/custom_style_text.dart';
import 'package:elmanfy/core/utils/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
    required this.nameOfThePiece,
    required this.priceOfThePiece,
    required this.count,
    required this.historyOfReligion,
    required this.totalPrice, required this.deptID,
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
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Card(
      color: Color(0xffD6D6D6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.02, horizontal: width * 0.02),
            child: Column(
              children: [
                CustomIconButton(
                  title: Constant.discount,
                  iconName:const Icon(
                    Icons.sell_sharp,
                    color: Colors.white,
                  ),
                  buttonColor: Colors.orange,
                  onTap: () {},
                ),
                SizedBox(
                  height: height * 0.001,
                ),
                BlocBuilder<DeptPaidDoneCubit, DeptPaidDoneState>(
                  bloc: viewModel,
                  builder: (context, state) {
                     return CustomIconButton(
                      title: Constant.payment,
                      iconName: state is DeptPaidDoneLoading ?const Center(child: CircularProgressIndicator(),):const Icon(
                        Icons.payment_sharp,
                        color: Colors.white,
                      ),
                      buttonColor: Colors.green,
                      onTap: () {
                        viewModel.deptDone(deptId: deptID,
                         userId: args['id'], 
                         nameOfPiece: nameOfThePiece,
                          price: priceOfThePiece, 
                          count: count,
                           dateOfAdded: historyOfReligion, 
                           totalPrice: totalPrice);
                     
                      },
                    );
                  },
                ),
                SizedBox(
                  height: height * 0.001,
                ),
                CustomIconButton(
                  title: Constant.delete,
                  iconName:const Icon(
                    Icons.delete_sharp,
                    color: Colors.white,
                  ),
                  buttonColor: Colors.red,
                  onTap: () {},
                ),
              ],
            ),
          ),
          CustomeProductDetails(nameOfThePiece: nameOfThePiece, priceOfThePiece: priceOfThePiece, count: count, historyOfReligion: historyOfReligion, totalPrice: totalPrice),
        ],
      ),
    );
  }
}


