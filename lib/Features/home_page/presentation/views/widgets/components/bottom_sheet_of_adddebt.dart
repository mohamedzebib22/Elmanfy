import 'package:elmanfy/Features/home_page/data/cubits/add_dept/add_dept_cubit.dart';
import 'package:elmanfy/Features/home_page/data/cubits/add_dept/add_dept_state.dart';
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
   
    AddDeptCubit viewModel= getIt<AddDeptCubit>();
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
                controller:viewModel.nameOfPiece,
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
                 controller: viewModel.count,
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
                 controller: viewModel.price,
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
                 controller: viewModel.dateOfAdded,
                hintColor: Colors.white,
                hintText: Constant.historyOfReligion,
                labelText: Constant.historyOfReligion,
                textStyleColor: Colors.white,
                foucusBorder: Colors.white,
                borderColor: Colors.white,
                sufix: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.event,
                      color: Colors.white,
                    )),
              ),
              SizedBox(
                height: height * 0.04,
              ),
             state is AddDeptLoading ? Center(child: CircularProgressIndicator(),) : 
             CustomBotton(
                title: Constant.addNewCustomer,
                onTap: () {
                  print('${viewModel.nameOfPiece.text}');
                  print('${viewModel.price.text}');
                  print('${viewModel.count.text}');
                  print('${viewModel.dateOfAdded.text}');
                 
                  viewModel.addDepts(id:userId, context: context);
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
