
import 'package:e_mart_seller_app/const/const.dart';

Widget normalText({text,color = white,size=14.0}){
  return text.toString().text.color(color).size(size).make();
}


Widget boldText({text,color = white,size=14.0}){
  return text.toString().text.semiBold.size(size).color(color).make();
}

