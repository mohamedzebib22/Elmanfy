import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elmanfy/features/home_page/data/cubits/get_dept/get_dept_cubit.dart';
import 'package:elmanfy/features/home_page/data/cubits/get_dept/get_dept_state.dart';
import 'package:elmanfy/features/home_page/presentation/views/widgets/components/part_specifications.dart';
import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/theme/custom_style_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowProductDetailsSection extends StatelessWidget {
  const ShowProductDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    // final viewModel = getIt<GetDeptCubit>();

    // Future.microtask(() => viewModel.getDepts(userId: args['id']));

    return BlocBuilder<GetDeptCubit, GetDeptState>(
      bloc: GetDeptCubit.get(context)..getDepts(userId: args['id']),
      builder: (context, state) {
        if (state is GetDeptLodaing) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is GetDeptSucsess) {
          var deptList = state.depts;

          if (deptList.isEmpty) {
            return const SliverToBoxAdapter(
              child: Center(
                child: Text(
                  Constant.noDebtsCurrently,
                  style: CustomStyleText.whiteColorBold,
                ),
              ),
            );
          }

          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return buildProductDetails(deptList, index);
              },
              childCount: deptList.length,
            ),
          );
        } else if (state is GetDeptFaliure) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(state.faliures.errMessage),
            ),
          );
        }

        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }

  ProductDetails buildProductDetails(
      List<QueryDocumentSnapshot<Object?>> deptList, int index) {
    return ProductDetails(
      nameOfThePiece: deptList[index]['itemName'],
      priceOfThePiece: deptList[index]['itemPrice'],
      count: deptList[index]['quantity'],
      historyOfReligion: deptList[index]['debtDate'],
      totalPrice: deptList[index]['totalPrice'],
      deptID: deptList[index]['id'],
    );
  }
}
