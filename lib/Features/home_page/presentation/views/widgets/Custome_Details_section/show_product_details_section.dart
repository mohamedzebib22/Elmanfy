import 'package:elmanfy/Features/home_page/presentation/views/widgets/components/part_specifications.dart';
import 'package:flutter/material.dart';

class ShowProductDetailsSection extends StatelessWidget {
  const ShowProductDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ProductDetails();
          }),
    );
  }
}