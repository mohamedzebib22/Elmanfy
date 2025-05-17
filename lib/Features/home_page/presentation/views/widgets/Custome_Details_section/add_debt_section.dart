
import 'package:elmanfy/features/home_page/presentation/views/widgets/components/bottom_sheet_of_adddebt.dart';
import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/theme/custom_style_text.dart';
import 'package:flutter/material.dart';

class AddDeptSection extends StatelessWidget {
  const AddDeptSection({
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: MaterialButton(
        color: Colors.white,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled:true,
            backgroundColor:Color(0xff19181E), 
            context: context, builder: (context){
            return Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SingleChildScrollView(child: BottomSheetOfAdddebt(userId:  args['id'],)),
            );
          });
        },
        child: Center(
          child: Text(Constant.addDebt,
              style: CustomStyleText.bold18Primary),
        ),
      ),
    );
  }
}

