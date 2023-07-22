import 'package:e_mart_seller_app/const/const.dart';
import 'package:e_mart_seller_app/widgets/normal_text.dart';

Widget productImages({required no , onPress}){
  return no.toString().text.size(20).makeCentered().box.color(Colors.white).size(100, 100).roundedSM.make();
}