import 'dart:developer';

import 'package:elmanfy/features/home_page/data/cubits/add_dept/add_dept_cubit.dart';
import 'package:elmanfy/features/home_page/data/cubits/add_dept/add_dept_state.dart';
import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/di/di.dart';
import 'package:elmanfy/core/utils/widgets/custom_button.dart';
import 'package:elmanfy/core/utils/widgets/custom_text.dart';
import 'package:elmanfy/core/utils/widgets/custom_text_feild.dart';
import 'package:elmanfy/features/home_page/data/cubits/get_dept/get_dept_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomSheetOfAdddebt extends StatelessWidget {
  const BottomSheetOfAdddebt({super.key, required this.userId});
  final String userId;
  
  @override
  Widget build(BuildContext context) {
   
    
    AddDeptCubit viewModel = getIt<AddDeptCubit>();
    var height = MediaQuery.of(context).size.height;
     var width = MediaQuery.of(context).size.width;
    return BlocBuilder<AddDeptCubit, AddDeptState>(
      bloc: viewModel,
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: width*0.02),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
              image:const DecorationImage(
                  image: AssetImage('assets/images/elmanfy.jpg',),
                  
                  fit: BoxFit.fill)),
          child: Form(
            key: AddDeptCubit.get(context).formkey,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
              const  CustomText(title: Constant.addNewCustomer),
                SizedBox(
                  height: height * 0.04,
                ),
                CustomTextFeild(
                  validator: (nameOfPiece){
                    if(nameOfPiece==null || nameOfPiece.isEmpty){
                      return 'برجاء ادخال اسم القطعه';
                    }else{
                      return null;
                    }
                  },
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
                  validator: (nunberOfPiece){
                    if(nunberOfPiece==null || nunberOfPiece.isEmpty){
                      return 'برجاء ادخال عدد القطع';
                    }else{
                      return null;
                    }
                  },
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
                  validator: (price){
                    if(price==null || price.isEmpty){
                      return 'برجاء ادخال سعر القطعه';
                    }else{
                      return null;
                    }
                  },
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
                  validator: (date){
                    if(date==null || date.isEmpty){
                      return 'برجاء ادخال تاريح  الاضافه';
                    }else{
                      return null;
                    }
                  },
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
                        onTap: ()async {
                          if(AddDeptCubit.get(context).formkey.currentState?.validate()==true){
                             await AddDeptCubit.get(context)
                              .addDepts(id: userId, context: context);
                      // await getIt<GetDeptCubit>().getDepts(userId: userId);
                        Navigator.pop(context);
                         
                          }
                        },
                      ),
                SizedBox(
                  height: height * 0.04,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
