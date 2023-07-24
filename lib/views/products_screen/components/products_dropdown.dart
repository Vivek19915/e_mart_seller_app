import 'package:e_mart_seller_app/const/const.dart';
import 'package:e_mart_seller_app/controllers/products_controller.dart';
import 'package:e_mart_seller_app/widgets/normal_text.dart';
import 'package:get/get.dart';

Widget productDropDown(title,List<String> list,dropvalue,ProductsController productsController){
  return Obx(()=> DropdownButtonHideUnderline(
      child: DropdownButton(
          hint: normalText(text: title.toString(),color: purpleColor),
          padding: EdgeInsets.symmetric(horizontal: 10),
          value:dropvalue.value == '' ? null :  dropvalue.value,
          isExpanded: true,
          items: list.map((e){
            return DropdownMenuItem(
              child: e.toString().text.make(),
              value: e,
            );
          }).toList(),

          onChanged: (newValue){
            if(title == "Choose Category"){
              productsController.subcategoryvalue.value = '';
              productsController.populateSubcategory(newValue.toString());
            }
            dropvalue.value = newValue.toString();
          },
      ),
    ).box.white.roundedSM.margin(EdgeInsets.symmetric(horizontal: 10)).make(),
  );
}