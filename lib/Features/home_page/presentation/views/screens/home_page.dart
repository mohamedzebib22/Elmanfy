import 'package:elmanfy/core/theme/custom_style_text.dart';
import 'package:elmanfy/core/utils/functions/tel_and_watsapp.dart';
import 'package:elmanfy/core/utils/widgets/custom_text.dart';
import 'package:elmanfy/features/home_page/presentation/views/widgets/components/bottom_sheet_of_users.dart';
import 'package:elmanfy/features/home_page/presentation/views/widgets/home_page_body.dart';
import 'package:elmanfy/features/login_page/presentation/views/login_page.dart';
import 'package:elmanfy/core/utils/widgets/custom_button.dart';
import 'package:elmanfy/core/utils/widgets/show_dialog_msg.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

Widget buildDrawerItem(BuildContext context,double height,double imageHeight) {
  return Column(children: [
    Image.asset('assets/images/logo.jpg',width: double.infinity,height: imageHeight,fit: BoxFit.fill,),
    SizedBox(height:height ,),
   InkWell(
    onTap: (){
      TelAndWatsapp.callClient(phone: '01064328893');
    },
     child: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.contact_emergency_sharp,size: 34,color: Colors.green,),
        CustomText(title: 'تواصل مع خدمة العملاء',textStyle: CustomStyleText.bold16Black,)
      ],),
   ),
    SizedBox(height:height ,),
     CustomBotton(
      title: 'تسجيل الخروج',
      onTap: ()async{
        ShowDialogMsg.showDialogtext(context: context,
         type: QuickAlertType.warning, 
         title: 'تسجيل الخروج',
          body: 'هل تريد بالفعل تسجيل الخروج', 
          confirm: ()async{
            await FirebaseAuth.instance.signOut();
        Navigator.pushReplacementNamed(context, LoginPage.id);
          });
        
      },
    )
  ]);
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
   
  static String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
            child: buildDrawerItem(context,height*0.2,height*0.3),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor:  Colors.transparent,
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
