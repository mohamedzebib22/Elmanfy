import 'package:elmanfy/core/utils/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Expanded(child: CustomTextFeild(hintText: 'Search',isFill: true,fillColor: Colors.white,)),
      Icon(Icons.search_off_sharp ,color:Colors.white,),
    ],);
  }
}