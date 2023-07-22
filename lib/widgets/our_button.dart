import 'package:e_mart_seller_app/const/const.dart';

Widget ourButton({title,color = purpleColor,onPress,textcolor = white}){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: color,
      padding: EdgeInsets.all(12),
    ),
      onPressed: onPress,
      child: title.toString().text.semiBold.size(16).color(textcolor).make()
  );
}