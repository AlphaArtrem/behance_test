import 'package:behance/business/helpers/sizing.dart';
import 'package:behance/data/theme_colors.dart';
import 'package:behance/presentation/widgets/text_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  const NewTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Sizing.getProportionateScreenHeight(20.0)),
      height: Sizing.screenHeight * 0.4,
      child: Column(
        children: [
          Text(
            "New Transaction",
            style: TextStyle(
              color: ThemeColors.kSelectedColor,
              fontWeight: FontWeight.w600,
              fontSize: Sizing.getProportionateScreenHeight(25.0),
            ),
          ),
          SizedBox(
            height: Sizing.getProportionateScreenHeight(20.0),
          ),
          field(Icons.send, "Select Wallet"),
          field(Icons.call_received, "Send to Address"),
          const Spacer(),
          MaterialButton(
              minWidth: Sizing.getProportionateScreenWidth(200.0),
              height: Sizing.getProportionateScreenHeight(45.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              color: ThemeColors.kSecondaryColor,
              child: Text(
                "Send",
                style: TextStyle(
                  color: ThemeColors.kPrimaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: Sizing.getProportionateScreenHeight(20.0),
                ),
              ),
              onPressed: () => Navigator.pop(context))
        ],
      ),
    );
  }

  Widget field(IconData prefixIconData, String hintText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: commonTextField(prefixIconData, hintText),
          ),
          SizedBox(
            width: Sizing.getProportionateScreenWidth(10.0),
          ),
          Icon(
            Icons.arrow_drop_down,
            color: ThemeColors.kUnselectedColor,
          )
        ],
      ),
    );
  }
}
