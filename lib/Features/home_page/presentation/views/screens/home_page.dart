import 'package:elmanfy/features/home_page/presentation/views/widgets/components/bottom_sheet_of_users.dart';
import 'package:elmanfy/features/home_page/presentation/views/widgets/home_page_body.dart';
import 'package:elmanfy/features/login_page/presentation/views/login_page.dart';
import 'package:elmanfy/core/utils/widgets/custom_button.dart';
import 'package:elmanfy/core/utils/widgets/show_dialog_msg.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

Widget buildDrawerItem(BuildContext context,double height) {
  return Column(children: [
    SizedBox(height:height ,),
     CustomBotton(
      title: 'تسجيل الخروج',
      onTap: ()async{
        ShowDialogMsg.showDialogtext(context: context,
         type: QuickAlertType.warning, 
         title: 'title',
          body: 'body', 
          confirm: ()async{
            await FirebaseAuth.instance.signOut();
        Navigator.pushReplacementNamed(context, LoginPage.id);
          });
        
      },
    )
  ]);
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: width*0.04),
            child: buildDrawerItem(context,height*0.8),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: const Color(0xff19181E),
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: const SingleChildScrollView(
                          child: BottomSheetOfUsers()),
                    );
                  });
            }),
        body: HomePageBody(
          menuDrawer: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
    );
  }
}
