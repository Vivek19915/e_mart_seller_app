import 'package:e_mart_seller_app/const/const.dart';
import 'package:e_mart_seller_app/views/products_screen/components/product_images.dart';
import 'package:e_mart_seller_app/widgets/custom_textfield.dart';
import 'package:e_mart_seller_app/widgets/normal_text.dart';

import '../../widgets/our_button.dart';
import 'components/products_dropdown.dart';

class AddNewProduct extends StatelessWidget {
  const AddNewProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,

      bottomNavigationBar: SizedBox(
      height: 60,
      width: context.screenWidth,
      child: ourButton(color: white , onPress: (){} , title: "Add Product",textcolor: purpleColor),
    ),

      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: "Add Product",color: white,size: 18.0,),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customTextField2(hint: "eg BMW",label: "Product Name",),
              5.heightBox,
              customTextField2(hint: "eg description ",label: "Product Description", isDesc: true),
              5.heightBox,
              customTextField2(hint: ("eg " + "1000".numCurrency).toString(),label: "Product Price",),
              5.heightBox,
              customTextField2(hint: "eg 100",label: "Product Quantity",),
              5.heightBox,
              productDropDown(title: "Choose Category"),
              5.heightBox,
              productDropDown(title: "Choose SubCatergory"),
              5.heightBox,
              Divider(color: Colors.white,),
              5.heightBox,
              boldText(text: "Choose products Images").box.margin(EdgeInsets.symmetric(horizontal: 10)).make(),
              5.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(3, (index) {
                  return productImages(no: index+1);
                }),
              ),
              5.heightBox,
              boldText(text: "First Image will be your display image").box.margin(EdgeInsets.symmetric(horizontal: 10)).make(),
              5.heightBox,
              Divider(color: Colors.white,),
              5.heightBox,
              boldText(text: "Choose products Colors").box.margin(EdgeInsets.symmetric(horizontal: 10)).make(),
              10.heightBox,
              Wrap(
                children: List.generate(10, (index) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      VxBox().color(Vx.randomPrimaryColor).height(60).width(60).roundedFull.margin(EdgeInsets.all(10)).make(),
                      Icon(Icons.done,color: Colors.white,)
                    ],
                  );
                }),
              ).box.margin(EdgeInsets.symmetric(horizontal: 10)).make(),







            ],
          ),
        ),
      ),
    );
  }
}
