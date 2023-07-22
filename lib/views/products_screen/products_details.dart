import 'package:e_mart_seller_app/const/const.dart';
import 'package:e_mart_seller_app/widgets/normal_text.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/utils.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: "Product Title",color: fontGrey,size: 16.0),
      ),



      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //swiper section
            VxSwiper.builder(
                aspectRatio: 16/9,
                autoPlay: true,
                height: 350,
                viewportFraction: 1.0,
                autoPlayCurve: Curves.fastOutSlowIn,
                itemCount: 5,
                itemBuilder: (context,index){
                  return Image.asset(imgProduct,width: double.infinity,fit: BoxFit.cover).box.padding(EdgeInsets.symmetric(horizontal: 10)).make();
                }
            ),





            //title ans details section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.heightBox,
                "Product Title".toString().text.size(16).color(purpleColor).semiBold.make(),
                Row(
                  children: [
                    boldText(text: "Category",color: fontGrey,size: 16.0),
                    10.widthBox,
                    normalText(text: "SubCategory",color: fontGrey,size: 16.0),
                  ],
                ),

                //rating sysytem --->Velocityx
                10.heightBox,
                VxRating(
                  isSelectable: false,   //so that rating wont change
                  value: double.parse("4.0"),
                  onRatingUpdate: (value){},
                  normalColor: textfieldGrey,
                  selectionColor: golden,
                  count: 5 ,
                  maxRating: 5,
                  size: 25,
                ),


                //price
                10.heightBox,
                "1000".numCurrency.toString().text.color(red).bold.size(18).make(),




                //color
                20.heightBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 150,
                          child: "Color: ".text.color(fontGrey).size(22).bold.make(),
                        ),


                        //color row  ----->>>>>
                         Row(
                          children: List.generate(3,
                                (index) => VxBox().size(40, 40).roundedFull.color(Vx.randomPrimaryColor).margin(EdgeInsets.symmetric(horizontal: 4)).make()
                                    .onTap(() {}),
                          ),
                        ).scrollHorizontal().expand(),
                      ],
                    ).box.padding(EdgeInsets.all(8)).make(),


                    //quantity row-->
                    10.heightBox,
                    Row(
                      children: [
                        boldText(text: "Quantity :",color: fontGrey,size: 22.0).box.width(150).make(),
                        normalText(text: "20 items",color: fontGrey,size: 22.0)
                      ]
                    ).paddingSymmetric(horizontal: 10),



                    //descriptions section
                    20.heightBox,
                    Align(alignment:Alignment.centerLeft, child: boldText(text: "Description" , color: fontGrey)),
                    10.heightBox,
                    Text(
                      "Descritio of product ".toString(),
                    ),








                  ],
                ).box.white.padding(EdgeInsets.symmetric(vertical: 10)).make()
              ],
            ).box.padding(EdgeInsets.all(8)).make(),

          ],
        ).box.padding(EdgeInsets.all(8)).make(),
      ),
    );
  }
}
