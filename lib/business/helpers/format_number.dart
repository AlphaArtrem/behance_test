String formatAmount(int amount) {
  String priceText = amount.toString();
  String formattedPrice = "";
  int counter = 0;
  for (int i = (priceText.length - 1); i >= 0; i--) {
    counter++;
    String str = priceText[i];
    if ((counter % 3) != 0 && i != 0) {
      formattedPrice = "$str$formattedPrice";
    } else if (i == 0) {
      formattedPrice = "$str$formattedPrice";
    } else {
      formattedPrice = " $str$formattedPrice";
    }
  }
  return formattedPrice;
}
