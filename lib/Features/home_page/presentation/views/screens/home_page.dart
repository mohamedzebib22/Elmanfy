import 'package:elmanfy/Features/home_page/presentation/views/screens/customer_details_page.dart';
import 'package:elmanfy/Features/home_page/presentation/views/widgets/custom_bottom_sheet.dart';
import 'package:elmanfy/Features/home_page/presentation/views/widgets/custom_card_info.dart';
import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/theme/custom_style_text.dart';
import 'package:elmanfy/core/utils/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
               isScrollControlled: true,
                backgroundColor: Color(0xff19181E),
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: SingleChildScrollView(child: CustomBottomSheet()),
                    );
                  });
            }),
        body:  Padding(
            padding:  EdgeInsets.symmetric(horizontal: width*0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: height*0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Expanded(child: CustomTextFeild(hintText: 'Search',isFill: true,fillColor: Colors.white,)),
                  Icon(Icons.search_off_sharp ,color: const Color.fromARGB(255, 110, 108, 108),),
                ],),
                SizedBox(height: height/ 2.5),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, CustomerdetailsPage.id);
                  },
                  child: CustomCardInfo()),
                // Text(
                //   Constant.noDebtsCurrently,
                //   style: CustomStyleText.whiteColorBold,
                //   textAlign: TextAlign.center,
                // ),
              ],
            ),
          ),
        
      ),
    );
  }
}
