import 'package:elmanfy/Features/home_page/presentation/views/widgets/Custome_Details_section/show_product_details_section.dart';
import 'package:elmanfy/Features/home_page/presentation/views/widgets/components/bottom_sheet_of_adddebt.dart';
import 'package:elmanfy/Features/home_page/presentation/views/widgets/components/custom_divider.dart';
import 'package:elmanfy/Features/home_page/presentation/views/widgets/components/details_card_user.dart';
import 'package:elmanfy/Features/home_page/presentation/views/widgets/components/part_specifications.dart';
import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/theme/custom_style_text.dart';
import 'package:elmanfy/core/utils/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomerDetailsBody extends StatelessWidget {
  const CustomerDetailsBody({
    super.key,
    
  });

  

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
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
          ShowProductDetailsSection(),
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
    );
  }
}


