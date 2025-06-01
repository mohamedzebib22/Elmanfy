import 'package:elmanfy/core/utils/widgets/show_dialog_msg.dart';
import 'package:elmanfy/features/home_page/data/cubits/add_user_cubit/add_user_cubit.dart';
import 'package:elmanfy/features/home_page/data/cubits/add_user_cubit/add_user_state.dart';
import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/utils/widgets/custom_button.dart';
import 'package:elmanfy/core/utils/widgets/custom_text.dart';
import 'package:elmanfy/core/utils/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/quickalert.dart';

class BottomSheetOfUsers extends StatelessWidget {
  const BottomSheetOfUsers({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.04),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/elmanfy.jpg'),
              fit: BoxFit.fill)),
      child: BlocConsumer<AddUserCubit, AddUserState>(
        builder: (context, state) {
          return Form(
            key: AddUserCubit.get(context).formkey,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                const CustomText(title: Constant.addNewCustomer),
                SizedBox(
                  height: height * 0.04,
                ),
                CustomTextFeild(
                  validator: (name) {
                    if (name == null || name.isEmpty) {
                      return 'برجاء ادخال الاسم';
                    } else {
                      return null;
                    }
                  },
                  controller: AddUserCubit.get(context).name,
                  hintColor: Colors.white,
                  hintText: Constant.customerName,
                  labelText: Constant.customerName,
                  textStyleColor: Colors.white,
                  foucusBorder: Colors.white,
                  borderColor: Colors.white,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomTextFeild(
                    validator: (phone) {
                      if (phone == null || phone.isEmpty) {
                        return 'برجاء ادخال الرقم';
                      } else if (phone.length != 11) {
                        return 'يجب أن يكون رقم الهاتف مكون من 11 رقم';
                      } else if (!RegExp(r'^\d{11}$').hasMatch(phone)) {
                        return 'رقم الهاتف يجب أن يحتوي على أرقام فقط';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    controller: AddUserCubit.get(context).phone,
                    hintColor: Colors.white,
                    hintText: Constant.phoneNumber,
                    labelText: Constant.phoneNumber,
                    textStyleColor: Colors.white,
                    foucusBorder: Colors.white,
                    borderColor: Colors.white),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomTextFeild(
                  validator: (date) {
                    if (date == null || date.isEmpty) {
                      return 'برجاء ادخال التاريخ';
                    } else {
                      return null;
                    }
                  },
                  controller: AddUserCubit.get(context).dateOfAdded,
                  hintColor: Colors.white,
                  hintText: Constant.dateOfAdded,
                  labelText: Constant.dateOfAdded,
                  textStyleColor: Colors.white,
                  foucusBorder: Colors.white,
                  borderColor: Colors.white,
                  sufix: IconButton(
                      onPressed: () {
                        AddUserCubit.get(context).chooseDate(context: context);
                      },
                      icon: const Icon(
                        Icons.event,
                        color: Colors.white,
                      )),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                state is AddUserLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : CustomBotton(
                        title: Constant.addNewCustomer,
                        onTap: () {
                          if (AddUserCubit.get(context)
                                  .formkey
                                  .currentState
                                  ?.validate() ==
                              true) {
                            AddUserCubit.get(context).addUser(context: context);
                          }
                        },
                      ),
                SizedBox(
                  height: height * 0.04,
                ),
              ],
            ),
          );
        },
        listener: (BuildContext context, AddUserState state) {
          if (state is AddUserFaliure) {
            ShowDialogMsg.showDialogtext(
                context: context,
                type: QuickAlertType.info,
                title: 'تلميح',
                body: 'الاسم موجود بالفعل او رقم الهاتف',
                confirm: () {
                  Navigator.pop(context);
                });
          }
        },
      ),
    );
  }
}
