import 'package:e_mart_seller_app/const/const.dart';
import 'package:e_mart_seller_app/widgets/normal_text.dart';

Widget productDropDown({title}){
  return DropdownButtonHideUnderline(
    child: DropdownButton<String>(
        hint: normalText(text: title.toString(),color: purpleColor),
        padding: EdgeInsets.symmetric(horizontal: 10),
        value: null,
        isExpanded: true,
        items: [],
        onChanged: (value){},
    ),
  ).box.white.roundedSM.margin(EdgeInsets.symmetric(horizontal: 10)).make();
}