import 'package:e_mart_seller_app/const/const.dart';
import 'package:e_mart_seller_app/widgets/normal_text.dart';

Widget customTextField({label,hint,controller,icon , isDesc = false}){
  return TextFormField(
    maxLines: isDesc?5:1,
    style: TextStyle(color: Colors.white),

    decoration: InputDecoration(

      isDense: true,
      label: normalText(text: label),
      hintText: hint,
      prefixIcon: Icon(icon, color: Colors.white,),

      hintStyle: TextStyle(color: Colors.white),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.white),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: lightGrey),
      ),

    ),
  ).box.padding(EdgeInsets.all(8)).make();
}