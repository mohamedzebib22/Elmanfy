import 'package:elmanfy/core/utils/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({
    super.key, required this.onTap, required this.menuDrawer,
  });
  final Function(String) onTap;
  final VoidCallback menuDrawer;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: menuDrawer, icon: const Icon(Icons.menu,color: Colors.white,size: 30,)),
        Expanded(
          child: CustomTextFeild(
          onChanged: onTap,
                hintText: 'Search',
                isFill: true,
                fillColor: Colors.white,
                sufix: const Icon(Icons.search_sharp),
                
              ),
        ),
      ],
    );
  }
}
