import 'package:flutter/material.dart';
import 'package:loan_calculator/style/app_colors.dart';

class DefaultButton extends StatelessWidget {
  final Function press;
  final String text;

  const DefaultButton({Key key,@required this.press,@required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   
    return SizedBox(
      width: double.infinity,
      height:MediaQuery.of(context).size.height/16,
      child: FlatButton(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(
                color: AppColors.lightBlue, fontSize:14),
          )),
    );
  }
}
