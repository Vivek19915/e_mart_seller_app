import 'package:e_mart_seller_app/const/const.dart';
import 'package:e_mart_seller_app/controllers/products_controller.dart';
import 'package:e_mart_seller_app/views/products_screen/components/product_images.dart';
import 'package:e_mart_seller_app/widgets/custom_textfield.dart';
import 'package:e_mart_seller_app/widgets/loading_indicator.dart';
import 'package:e_mart_seller_app/widgets/normal_text.dart';
import 'package:get/get.dart';

import '../../widgets/our_button.dart';
import 'components/products_dropdown.dart';

class AddNewProduct extends StatelessWidget {
  const AddNewProduct({super.key});

  @override
  Widget build(BuildContext context) {

    var productController  = Get.find<ProductsController>();

    return Obx(
      ()=> Scaffold(
        backgroundColor: purpleColor,

        bottomNavigationBar: SizedBox(
        height: 60,
        width: context.screenWidth,
        child: productController.isloading.value
            ? Center(child: loadingIndicator(color: white),)
            : ourButton(color: white , onPress: ()async{
                  productController.isloading(true);
                  await productController.uploadProductImages();
                  await productController.uploadProductDetails(context);
                  productController.isloading(false);
                  productController.pnameController.clear();
                  productController.pdescController.clear();
                  productController.ppriceController.clear();
                  productController.pquantityController.clear();
                  Get.back();

        } , title: "Add Product",textcolor: purpleColor),
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
                customTextField2(hint: "eg BMW",label: "Product Name",controller: productController.pnameController),
                5.heightBox,
                customTextField2(hint: "eg description ",label: "Product Description", isDesc: true,controller: productController.pdescController
                ),
                5.heightBox,
                customTextField2(hint: ("eg " + "1000".numCurrency).toString(),label: "Product Price",controller: productController.ppriceController),
                5.heightBox,
                customTextField2(hint: "eg 100",label: "Product Quantity",controller: productController.pquantityController),
                5.heightBox,
                productDropDown( "Choose Category" ,  productController.categoryList ,  productController.categoryvalue,productController),
                5.heightBox,
                productDropDown( "Choose SubCatergory",productController.subcategoryList,productController.subcategoryvalue,productController),
                5.heightBox,
                Divider(color: Colors.white,),
                5.heightBox,
                boldText(text: "Choose products Images").box.margin(EdgeInsets.symmetric(horizontal: 10)).make(),
                5.heightBox,

                //image selecting section--->
                Obx(
                  ()=> Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(3, (index) {
                      return productController.pImagesList[index] != null
                          ?Image.file(productController.pImagesList[index] , width: 100,height: 100,fit: BoxFit.cover,).box.rounded.clip(Clip.antiAlias).make().box.border(color: Colors.white,width: 2).rounded.make()
                            .onTap(() {productController.pickImage(index, context);     /*  <---to select new image---->   */      })
                          :productImages(no: index+1).onTap(() {
                            productController.pickImage(index, context);
                      });
                    }),
                  ),
                ),



                5.heightBox,
                boldText(text: "First Image will be your display image").box.margin(EdgeInsets.symmetric(horizontal: 10)).make(),
                5.heightBox,
                Divider(color: Colors.white,),
                5.heightBox,
                boldText(text: "Choose products Colors").box.margin(EdgeInsets.symmetric(horizontal: 10)).make(),
                10.heightBox,

                Obx(
                  ()=>Wrap(
                    children: List.generate(colorList.length, (index) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          VxBox().color(colorList[index]).height(60).width(60).roundedFull.margin(EdgeInsets.all(10)).make().
                              onTap(() {productController.selectedColorIndex.value = index ; }),
                          productController.selectedColorIndex.value == index
                              ? Icon(Icons.done,color: Colors.white,)
                              : SizedBox()
                        ],
                      );
                    }),
                  ).box.margin(EdgeInsets.symmetric(horizontal: 10)).make(),
                ),







              ],
            ),
          ),
        ),
      ),
    );
  }
}
