

import 'package:e_mart_seller_app/widgets/normal_text.dart';
import 'package:get/get.dart';

import '../../../const/const.dart';


Widget orderPlaceDetails({title1, title2, d1, d2}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          boldText(text: title1 ,color: purpleColor),
          boldText(text: d1 ,color: red),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [

          boldText(text: title2 ,color: purpleColor),
          boldText(text: d2 ,color: red),

        ],
      )
    ],
  ).box.padding(EdgeInsets.symmetric(horizontal: 10,vertical: 10)).roundedSM.make();
}