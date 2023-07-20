import 'package:e_mart_seller_app/const/const.dart';

Widget ourButton({title,color = purpleColor,onPress}){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: color,
      padding: EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
    ),
      onPressed: onPress,
      child: title.toString().text.semiBold.size(16).color(Colors.white).make()
  );
}