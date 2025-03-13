import 'package:elmanfy/Features/home_page/presentation/views/widgets/bottom_sheet_of_adddebt.dart';
import 'package:elmanfy/Features/home_page/presentation/views/widgets/custom_divider.dart';
import 'package:elmanfy/Features/home_page/presentation/views/widgets/custom_icon_button.dart';
import 'package:elmanfy/Features/home_page/presentation/views/widgets/details_card_user.dart';
import 'package:elmanfy/Features/home_page/presentation/views/widgets/part_specifications.dart';
import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/theme/app_color.dart';
import 'package:elmanfy/core/theme/custom_style_text.dart';
import 'package:elmanfy/core/utils/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomerdetailsPage extends StatelessWidget {
  const CustomerdetailsPage({super.key});
  static String id = 'Customerdetails';
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            Constant.customerDetails,
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: AppColor.primaryColor,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DetailsCardUser(),
              SizedBox(
                height: height * 0.02,
              ),
              CustomDivider(),
              SizedBox(
                height: height * 0.02,
              ),
              Center(child: CustomText(title: Constant.debts)),
              Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return PartSpecifications();
                    }),
              ),
             SizedBox(height: height*0.02,),
              CustomDivider(),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        Text(
                          Constant.viewAllDebt,
                          style: CustomStyleText.whiteColorBold,
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: MaterialButton(
                      color: Colors.white,
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled:true,
                          backgroundColor:Color(0xff19181E), 
                          context: context, builder: (context){
                          return Padding(
                            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                            child: SingleChildScrollView(child: BottomSheetOfAdddebt()),
                          );
                        });
                      },
                      child: Center(
                        child: Text(Constant.addDebt,
                            style: CustomStyleText.bold18Primary),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.02,
              )
            ],
          ),
        ),
      ),
    );
  }
}
