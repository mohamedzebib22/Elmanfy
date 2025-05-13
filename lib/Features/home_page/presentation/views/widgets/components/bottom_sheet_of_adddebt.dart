import 'package:elmanfy/Features/home_page/data/cubits/add_dept/add_dept_cubit.dart';
import 'package:elmanfy/Features/home_page/data/cubits/add_dept/add_dept_state.dart';
import 'package:elmanfy/Features/home_page/data/cubits/add_user_cubit/add_user_cubit.dart';
import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/di/di.dart';
import 'package:elmanfy/core/utils/widgets/custom_button.dart';
import 'package:elmanfy/core/utils/widgets/custom_text.dart';
import 'package:elmanfy/core/utils/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomSheetOfAdddebt extends StatelessWidget {
  const BottomSheetOfAdddebt({super.key, required this.userId});
  final String userId;
  @override
  Widget build(BuildContext context) {
    AddDeptCubit viewModel = getIt<AddDeptCubit>();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return BlocBuilder<AddDeptCubit, AddDeptState>(
      bloc: viewModel,
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/elmanfy.jpg'),
                  fit: BoxFit.fill)),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              CustomText(title: Constant.addNewCustomer),
              SizedBox(
                height: height * 0.04,
              ),
              CustomTextFeild(
                controller: AddDeptCubit.get(context).nameOfPiece,
                hintColor: Colors.white,
                hintText: Constant.nameOfThePiece,
                labelText: Constant.nameOfThePiece,
                textStyleColor: Colors.white,
                foucusBorder: Colors.white,
                borderColor: Colors.white,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomTextFeild(
                keyboardType: TextInputType.number,
                controller: AddDeptCubit.get(context).count,
                hintColor: Colors.white,
                hintText: Constant.count,
                labelText: Constant.count,
                textStyleColor: Colors.white,
                foucusBorder: Colors.white,
                borderColor: Colors.white,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomTextFeild(
                keyboardType: TextInputType.number,
                  controller: AddDeptCubit.get(context).price,
                  hintColor: Colors.white,
                  hintText: Constant.priceOfThePiece,
                  labelText: Constant.priceOfThePiece,
                  textStyleColor: Colors.white,
                  foucusBorder: Colors.white,
                  borderColor: Colors.white),
              SizedBox(
                height: height * 0.02,
              ),
              CustomTextFeild(
              
                controller: AddDeptCubit.get(context).dateOfAdded,
                hintColor: Colors.white,
                hintText: Constant.historyOfReligion,
                labelText: Constant.historyOfReligion,
                textStyleColor: Colors.white,
                foucusBorder: Colors.white,
                borderColor: Colors.white,
                sufix: IconButton(
                    onPressed: () {
                      AddDeptCubit.get(context).chooseDate(context: context);
                    },
                    icon:const Icon(
                      Icons.event,
                      color: Colors.white,
                    )),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              state is AddDeptLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : CustomBotton(
                      title: Constant.addDebt,
                      onTap: () {
                        AddDeptCubit.get(context)
                            .addDepts(id: userId, context: context);
                        AddDeptCubit.get(context).nameOfPiece.text = '';
                        AddDeptCubit.get(context).price.text = '';
                        AddDeptCubit.get(context).count.text = '';
                        AddDeptCubit.get(context).dateOfAdded.text = '';
                      },
                    ),
              SizedBox(
                height: height * 0.04,
              ),
            ],
          ),
        );
      },
    );
  }
}
