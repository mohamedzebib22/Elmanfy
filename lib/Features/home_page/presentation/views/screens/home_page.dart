import 'package:elmanfy/Features/home_page/presentation/views/screens/customer_details_page.dart';
import 'package:elmanfy/Features/home_page/presentation/views/widgets/components/bottom_sheet_of_users.dart';
import 'package:elmanfy/Features/home_page/presentation/views/widgets/components/custom_card_info.dart';
import 'package:elmanfy/Features/home_page/presentation/views/widgets/home_page_body.dart';
import 'package:elmanfy/Features/home_page/presentation/views/widgets/Home_Sections/search_section.dart';
import 'package:elmanfy/Features/home_page/presentation/views/widgets/Home_Sections/show_data_section.dart';
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
                      child: SingleChildScrollView(child: BottomSheetOfUsers()),
                    );
                  });
            }),
        body:  HomePageBody(),
        
      ),
    );
  }
}


