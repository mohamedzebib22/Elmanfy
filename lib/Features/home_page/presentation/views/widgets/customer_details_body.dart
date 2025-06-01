import 'package:elmanfy/features/home_page/presentation/views/widgets/Custome_Details_section/add_debt_section.dart';
import 'package:elmanfy/features/home_page/presentation/views/widgets/Custome_Details_section/show_product_details_section.dart';
import 'package:elmanfy/features/home_page/presentation/views/widgets/Home_Sections/view_all_dept_section.dart';
import 'package:elmanfy/features/home_page/presentation/views/widgets/components/custom_divider.dart';
import 'package:elmanfy/features/home_page/presentation/views/widgets/components/details_card_user.dart';

import 'package:elmanfy/core/constants/constant.dart';

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
          Expanded(
              child: CustomScrollView(
               physics:const BouncingScrollPhysics(),
            slivers: [
              const SliverToBoxAdapter(
                child: DetailsCardUser(),
              ),
              const SliverToBoxAdapter(
                child: CustomDivider(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: height * 0.02,
                ),
              ),
              const SliverToBoxAdapter(
                child: Center(child: CustomText(title: Constant.debts)),
              ),
            const  ShowProductDetailsSection(),
            
              SliverToBoxAdapter(
                child: SizedBox(
                  height: height * 0.02,
                ),
              )
            ],
          )),
          const CustomDivider(),
          SizedBox(
            height: height * 0.02,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [ViewAllDeptSection(), 
            AddDeptSection()],
          ),
          SizedBox(
            height: height * 0.02,
          )
        ],
      ),
    );
  }
}
