import 'package:elmanfy/Features/home_page/presentation/views/screens/customer_details_page.dart';
import 'package:elmanfy/Features/home_page/presentation/views/widgets/Home_Sections/search_section.dart';
import 'package:elmanfy/Features/home_page/presentation/views/widgets/Home_Sections/show_data_section.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
   
  });

  

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: height*0.02),
            SearchSection(),
            SizedBox(height: height/ 2.5),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, CustomerdetailsPage.id);
              },
              child: ShowDataSection()),
            // Text(
            //   Constant.noDebtsCurrently,
            //   style: CustomStyleText.whiteColorBold,
            //   textAlign: TextAlign.center,
            // ),
          ],
        ),
      );
  }
}

