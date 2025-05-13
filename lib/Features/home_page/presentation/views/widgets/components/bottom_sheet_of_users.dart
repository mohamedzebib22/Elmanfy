import 'package:elmanfy/Features/home_page/data/cubits/add_user_cubit/add_user_cubit.dart';
import 'package:elmanfy/Features/home_page/data/cubits/add_user_cubit/add_user_state.dart';
import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/utils/widgets/custom_button.dart';
import 'package:elmanfy/core/utils/widgets/custom_text.dart';
import 'package:elmanfy/core/utils/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomSheetOfUsers extends StatelessWidget {
  const BottomSheetOfUsers({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.04),
      decoration:const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/elmanfy.jpg'),
              fit: BoxFit.fill)),
      child: BlocBuilder<AddUserCubit, AddUserState>(
       
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(
                height: height * 0.02,
              ),
            const  CustomText(title: Constant.addNewCustomer),
              SizedBox(
                height: height * 0.04,
              ),
              CustomTextFeild(
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
       
                controller: AddUserCubit.get(context).dateOfAdded,
                hintColor: Colors.white,
                hintText: Constant.dateOfAdded,
                labelText: Constant.dateOfAdded,
                textStyleColor: Colors.white,
                foucusBorder: Colors.white,
                borderColor: Colors.white,
                sufix: IconButton(
                    onPressed: ()  {
                      AddUserCubit.get(context).chooseDate(context: context);
                    },
                    icon:const Icon(
                      Icons.event,
                      color: Colors.white,
                    )),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              state is AddUserLoading
                  ?const Center(
                      child: CircularProgressIndicator(),
                    )
                  : CustomBotton(
                      title: Constant.addNewCustomer,
                      onTap: () {
                        AddUserCubit.get(context).addUser(context: context);
                        AddUserCubit.get(context).name.text = '';
                        AddUserCubit.get(context).phone.text = '';
                        AddUserCubit.get(context).dateOfAdded.text = '';
                      },
                    ),
              SizedBox(
                height: height * 0.04,
              ),
            ],
          );
        },
      ),
    );
  }
}
