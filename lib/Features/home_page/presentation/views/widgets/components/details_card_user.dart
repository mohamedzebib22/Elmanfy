import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/theme/custom_style_text.dart';
import 'package:elmanfy/core/utils/functions/tel_and_watsapp.dart';
import 'package:elmanfy/core/utils/widgets/custom_text.dart';
import 'package:elmanfy/features/home_page/data/cubits/get_dept/get_dept_cubit.dart';
import 'package:elmanfy/features/home_page/data/cubits/get_dept/get_dept_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsCardUser extends StatefulWidget {
  const DetailsCardUser({super.key});

  @override
  State<DetailsCardUser> createState() => _DetailsCardUserState();
}

class _DetailsCardUserState extends State<DetailsCardUser> {
 
  late Map<String, dynamic> args;
  bool isLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isLoaded) {
      args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      
      GetDeptCubit.get(context).getDepts(userId: args['id']);
      isLoaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return BlocBuilder<GetDeptCubit, GetDeptState>(
      builder: (context, state) {
        
        double price = GetDeptCubit.get(context).totalPrice;
        return Card(
          color: const Color(0xffD6D6D6),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.02, vertical: height * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    TelAndWatsapp.openWhatsApp(phoneNumber: args['phone'],
                     message: 'السلام عليكم ورحمة الله معاك مكتب المنفى حضرتك عليك مبلغ:$priceبرجاء الارسال ');
                  },
                  child: ClipOval(
                    child: Image.asset('assets/images/watsappicon.png',width: width*0.2,height: height*0.06,),
                    
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomText(
                      title: '${Constant.customerName}:${args['full_name']}',
                      textStyle: CustomStyleText.bold16Black,
                    ),
                    SizedBox(height: height * 0.02),
                    CustomText(
                      title: '${Constant.phoneNumber}:${args['phone']}',
                      textStyle: CustomStyleText.bold16Black,
                    ),
                    SizedBox(height: height * 0.02),
                    CustomText(
                      title: '${Constant.dateOfAdded}:${args['dateOfAdded']}',
                      textStyle: CustomStyleText.bold16Black,
                    ),
                    SizedBox(height: height * 0.02),
                    if (state is GetDeptLodaing)
                      const CircularProgressIndicator()
                    else if (state is GetDeptSucsess)
                      CustomText(
                        title: 'اجمالى المبلغ : ${state.totalPrice.toStringAsFixed(2)}',
                        textStyle: CustomStyleText.bold18Primary,
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
