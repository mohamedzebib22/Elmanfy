import 'package:elmanfy/Features/home_page/presentation/views/widgets/components/custom_card_info.dart';
import 'package:flutter/material.dart';

class ShowDataSection extends StatelessWidget {
  const ShowDataSection({
    super.key, required this.name, required this.phone, required this.dateOfAdded, required this.onTap,
  });
  final String name;
  final String phone;
  final String dateOfAdded;
   final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return CustomCardInfo(name: name, phone: phone, dateOfAdded: dateOfAdded, onTap: onTap,);
  }
}

