import 'package:elmanfy/Features/home_page/data/cubits/get_dept/get_dept_cubit.dart';
import 'package:elmanfy/Features/home_page/data/cubits/get_dept/get_dept_state.dart';
import 'package:elmanfy/Features/home_page/presentation/views/widgets/components/part_specifications.dart';
import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/di/di.dart';
import 'package:elmanfy/core/theme/custom_style_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowProductDetailsSection extends StatelessWidget {
  const ShowProductDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    GetDeptCubit viewModel = getIt<GetDeptCubit>();

    Future.microtask(() => viewModel.getDepts(userId: args['id']));

    return BlocBuilder<GetDeptCubit, GetDeptState>(
      bloc: viewModel,
      // viewModel..getDepts(userId: args['id']),
      builder: (context, state) {
        if (state is GetDeptLodaing) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetDeptSucsess) {
          var deptList = viewModel.data;

          if (deptList.isEmpty) {
            return const Center(
              child: Text(
                Constant.noDebtsCurrently,
                style: CustomStyleText.whiteColorBold,
              ),
            );
          } else {
            return Expanded(
              child: ListView.builder(
                  itemCount: deptList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ProductDetails(
                      nameOfThePiece: deptList[index]['itemName'],
                      priceOfThePiece: deptList[index]['itemPrice'],
                      count: deptList[index]['quantity'],
                      historyOfReligion: deptList[index]['debtDate'],
                      totalPrice: deptList[index]['totalPrice'],
                      deptID: deptList[index]['id'],
                    
                    );
                  }),
            );
          }
        } else if (state is GetDeptFaliure) {
          return Center(
            child: Text(state.faliures.errMessage),
          );
        }
        return Container(
         
        );
      },
    );
  }
}
