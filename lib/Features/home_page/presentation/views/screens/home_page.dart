import 'package:elmanfy/Features/home_page/presentation/views/widgets/components/bottom_sheet_of_users.dart';
import 'package:elmanfy/Features/home_page/presentation/views/widgets/home_page_body.dart';

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
            child:const Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
               isScrollControlled: true,
                backgroundColor:const Color(0xff19181E),
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: const SingleChildScrollView(child: BottomSheetOfUsers()),
                    );
                  });
            }),
        body: const HomePageBody(),
        
      ),
    );
  }
}


