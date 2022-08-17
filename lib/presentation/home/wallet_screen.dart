import 'package:behance/business/helpers/format_number.dart';
import 'package:behance/business/helpers/sizing.dart';
import 'package:behance/data/image_assets.dart';
import 'package:behance/data/theme_colors.dart';
import 'package:behance/data/token.dart';
import 'package:behance/presentation/widgets/text_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(Sizing.getProportionateScreenHeight(15.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(),
            SizedBox(
              height: Sizing.getProportionateScreenHeight(8.0),
            ),
            _walletInfo(),
            _walletOption(),
            SizedBox(
              height: Sizing.getProportionateScreenHeight(20.0),
            ),
            _assetSwitchAndSearch(),
            SizedBox(
              height: Sizing.getProportionateScreenHeight(20.0),
            ),
            _tokens(),
            SizedBox(
              height: Sizing.getProportionateScreenHeight(20.0),
            ),
            _collapsedSection("Hidden tokens (2)"),
            SizedBox(
              height: Sizing.getProportionateScreenHeight(20.0),
            ),
            _collapsedSection("Suspicious tokens (15)"),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.notifications_none,
          size: Sizing.getProportionateScreenHeight(23.0),
        ),
        Container(
          padding: EdgeInsets.all(Sizing.getProportionateScreenHeight(10.0)),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(ImageAssets.user),
            ),
          ),
        ),
      ],
    );
  }

  Widget _walletInfo() {
    return Padding(
      padding: EdgeInsets.all(Sizing.getProportionateScreenHeight(4.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _normalText("Wallet"),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mobile Team",
                style: TextStyle(
                    color: ThemeColors.kSelectedColor,
                    fontSize: Sizing.getProportionateScreenHeight(25.0),
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: Sizing.getProportionateScreenWidth(5.0),
                    top: Sizing.getProportionateScreenHeight(3.0)),
                child: Column(
                  children: [
                    Icon(
                      Icons.keyboard_arrow_up,
                      color: ThemeColors.kSecondaryTextColor,
                      size: Sizing.getProportionateScreenHeight(11.0),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: ThemeColors.kSecondaryTextColor,
                      size: Sizing.getProportionateScreenHeight(11.0),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Text _normalText(String text,
      {Color? color, FontWeight fontWeight = FontWeight.normal}) {
    return Text(
      text,
      style: TextStyle(
          color: color ?? ThemeColors.kSecondaryTextColor,
          fontSize: Sizing.getProportionateScreenHeight(13.0),
          fontWeight: fontWeight),
    );
  }

  Widget _walletOption() {
    Widget balanceSwitch = Transform.scale(
      scale: Sizing.mediaQueryData.devicePixelRatio * 0.25,
      alignment: Alignment.topLeft,
      child: CupertinoSwitch(
        value: true,
        onChanged: (_) {},
        activeColor: ThemeColors.kSecondaryColor,
      ),
    );
    Map<String, dynamic> options = {
      "Your address": Icons.qr_code_2,
      "Aliases": Icons.supervisor_account_rounded,
      "Balance": balanceSwitch,
      "Receive": Icons.call_received
    };
    return SizedBox(
      height: Sizing.getProportionateScreenHeight(80.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: options.length,
        itemBuilder: (context, index) {
          MapEntry<String, dynamic> option = options.entries.elementAt(index);
          return _walletOptionCard(
            text: option.key,
            isSelected: index == 0,
            iconData: option.value is IconData ? option.value : null,
            widget: option.value is Widget ? option.value : null,
          );
        },
      ),
    );
  }

  Widget _walletOptionCard(
      {required String text,
      required bool isSelected,
      IconData? iconData,
      Widget? widget}) {
    assert((iconData == null && widget != null) ||
        (iconData != null && widget == null));
    return Card(
      color:
          isSelected ? ThemeColors.kSecondaryColor : ThemeColors.kPrimaryColor,
      child: Container(
        padding: EdgeInsets.all(Sizing.getProportionateScreenHeight(10.0)),
        width: Sizing.getProportionateScreenWidth(100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            iconData != null
                ? Icon(
                    iconData,
                    color: isSelected
                        ? ThemeColors.kPrimaryColor
                        : ThemeColors.kSelectedColor,
                    size: Sizing.getProportionateScreenHeight(25.0),
                  )
                : widget!,
            _normalText(
              text,
              color: ThemeColors.kUnselectedColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _assetSwitchAndSearch() {
    return Column(
      children: [
        Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _normalText("Tokens",
                    color: ThemeColors.kSelectedColor,
                    fontWeight: FontWeight.bold),
                Container(
                  margin: EdgeInsets.only(
                      left: Sizing.getProportionateScreenWidth(1.0)),
                  color: ThemeColors.kSecondaryColor,
                  height: Sizing.getProportionateScreenHeight(2.5),
                  width: Sizing.getProportionateScreenWidth(13.0),
                )
              ],
            ),
            SizedBox(
              width: Sizing.getProportionateScreenWidth(20.0),
            ),
            _normalText("Leasing",
                color: ThemeColors.kUnselectedColor,
                fontWeight: FontWeight.bold),
          ],
        ),
        SizedBox(
          height: Sizing.getProportionateScreenHeight(15.0),
        ),
        Row(
          children: [
            Expanded(child: commonTextField(Icons.search, "Search")),
            SizedBox(
              width: Sizing.getProportionateScreenWidth(10.0),
            ),
            Icon(
              Icons.swap_vert,
              color: ThemeColors.kUnselectedColor,
            )
          ],
        ),
      ],
    );
  }

  Widget _tokens() {
    return SizedBox(
      height: Sizing.screenHeight * 0.3,
      child: ListView.builder(
        itemBuilder: (context, index) {
          Token token = Token.dummyData[index];
          return Card(
            child: ListTile(
              leading: SizedBox(
                width: Sizing.getProportionateScreenWidth(40.0),
                child: Stack(
                  children: [
                    Container(
                      width: Sizing.getProportionateScreenWidth(40.0),
                      padding: EdgeInsets.all(
                          Sizing.getProportionateScreenHeight(10.0)),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(token.imagePath),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        radius: Sizing.getProportionateScreenHeight(8.0),
                        backgroundColor: ThemeColors.kPrimaryColor,
                        child: Icon(
                          token.showCheck ? Icons.check : Icons.compare_arrows,
                          color: ThemeColors.kSelectedColor,
                          size: Sizing.getProportionateScreenHeight(12.0),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              title: Row(
                children: [
                  _normalText(token.name),
                  token.isMine
                      ? Text(
                          ' /My Token',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              color:
                                  ThemeColors.kSecondaryColor.withOpacity(0.3),
                              fontSize:
                                  Sizing.getProportionateScreenHeight(9.0)),
                        )
                      : const SizedBox.shrink(),
                  token.isFavorite
                      ? Icon(
                          Icons.favorite,
                          color: ThemeColors.kSecondaryColor,
                          size: Sizing.getProportionateScreenHeight(15.0),
                        )
                      : const SizedBox.shrink()
                ],
              ),
              subtitle: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: ThemeColors.kSelectedColor,
                    fontSize: Sizing.getProportionateScreenHeight(18.0),
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: "${formatAmount(token.value.toInt())}.",
                    ),
                    TextSpan(
                      text: token.value.toString().split('.').last,
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: Token.dummyData.length,
      ),
    );
  }

  Widget _collapsedSection(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _normalText(text),
        Icon(
          Icons.keyboard_arrow_down,
          color: ThemeColors.kSecondaryTextColor,
          size: Sizing.getProportionateScreenHeight(20.0),
        ),
      ],
    );
  }
}
