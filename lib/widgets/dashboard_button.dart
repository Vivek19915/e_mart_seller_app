import 'package:e_mart_seller_app/const/const.dart';

import 'normal_text.dart';


Widget dashboardButton(context,{title,count,icon}){
  var size = MediaQuery.of(context).size;
  return Row(
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          boldText(text: title,size: 16.0),
          boldText(text: count.toString(),size: 20.0),

        ],
      ).expand(),
      5.widthBox,
      Image.asset(icon,width: 40,color: Colors.white,),
    ],
  ).box.width(size.width*0.43).height(80).rounded.color(purpleColor).padding(EdgeInsets.all(8)).make();

}