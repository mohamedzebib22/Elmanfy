import 'package:elmanfy/core/utils/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({
    super.key, required this.onTap,
  });
  final Function(String) onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: CustomTextFeild(
            onChanged: onTap,
          hintText: 'Search',
          isFill: true,
          fillColor: Colors.white,
        )),
        Icon(
          Icons.search_off_sharp,
          color: Colors.white,
        ),
      ],
    );
  }
}
