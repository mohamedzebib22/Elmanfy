import 'package:elmanfy/features/home_page/presentation/views/widgets/customer_details_body.dart';
import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class CustomerdetailsPage extends StatelessWidget {
  const CustomerdetailsPage({super.key});
  static String id = 'Customerdetails';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back,color: Colors.white,)),
          title: const Text(
            Constant.customerDetails,
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: AppColor.primaryColor,
        ),
        body:const CustomerDetailsBody(),
      ),
    );
  }
}

