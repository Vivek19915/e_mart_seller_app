import 'package:e_mart_seller_app/const/const.dart';
import 'package:e_mart_seller_app/widgets/our_button.dart';

import '../../widgets/normal_text.dart';
import 'components/order_placed.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: boldText(text: "Orders Details",color: fontGrey,size: 18.0),
      ),


      bottomNavigationBar: SizedBox(
        height: 60,
        width: context.screenWidth,
        child: ourButton(color: green , onPress: (){} , title: 'Confirm Order'),
      ),


      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),


        child: Column(
          children: [
            Visibility(
              child: Column(
                children: [
                  20.heightBox,

                  //order delivery section
                  Column(
                    children: [
                      boldText(text: "Order Status" ,color: purpleColor,size: 16.0),

                      SwitchListTile(
                          value: true,                    //value for on and off of witch
                          onChanged: (value){},
                          title: boldText(text: "Placed",color: purpleColor),
                          activeColor: Colors.green,
                      ),
                      SwitchListTile(
                        value: true,                    //value for on and off of witch
                        onChanged: (value){},
                        title: boldText(text: "Confirm",color: purpleColor),
                        activeColor: Colors.green,
                      ),
                      SwitchListTile(
                        value: false,                    //value for on and off of witch
                        onChanged: (value){},
                        title: boldText(text: "On Delievery",color: purpleColor),
                        activeColor: Colors.green,
                      ),
                      SwitchListTile(
                        value: false,                    //value for on and off of witch
                        onChanged: (value){},
                        title: boldText(text: "Delievered",color: purpleColor),
                        activeColor: Colors.green,
                      )


                    ],
                  ).box.color(lightGrey).margin(EdgeInsets.symmetric(horizontal: 15)).padding(EdgeInsets.symmetric(vertical: 10)).shadowSm.roundedSM.make(),


                  20.heightBox,
                  //orders details section ------->>>>>>
                  Column(
                    children: [
                      orderPlaceDetails(title1: "Order No",title2: "Shipping Method",d1:"data['order_code']",d2:"data['shipping_method']"),
                      orderPlaceDetails(
                          title1: "Order Date",
                          title2: "Payment Method",
                          d1: "ASDASDASDAD",
                          d2: "data['payment_method']"
                      ),
                      orderPlaceDetails(
                          title1: "Payment Status",
                          title2: "Delivery Status",
                          d1:"Unpaid",
                          d2: "Order Placed"
                      ),

                      Divider(),

                      //more details and total amunt
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              boldText(text: "Shipping Address" , color: purpleColor),
                              "data['order_by_name']".text.make(),
                              "data['order_by_email']".text.make(),
                              "data['order_by_address']".text.make(),
                              "data['order_by_city']".text.make(),
                              "data['order_by_state']".text.make(),
                              "data['order_by_phone']".text.make(),
                              "data['order_by_postalcode']".text.make(),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              boldText(text: "Total Amount",color: purpleColor),
                              boldText(text: 3000.numCurrency , color: red),
                            ],
                          )
                        ],
                      ).box.margin(EdgeInsets.symmetric(horizontal: 10)).padding(EdgeInsets.symmetric(vertical: 10)).make(),
                    ],
                  ).box.color(lightGrey).margin(EdgeInsets.symmetric(horizontal: 15)).shadowSm.roundedSM.make(),


                  Divider(),
                  10.heightBox,
                  boldText(text: "Ordered Products",color: fontGrey,size: 16.0),
                  10.heightBox,
                  ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(4, (index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          orderPlaceDetails(
                              title1: "Order title",
                              title2: "Order total price",
                              d1: "{order quantity",
                              d2: "Refundable"
                          ),
                          VxBox().color(purpleColor).size(20, 20).margin(EdgeInsets.symmetric(horizontal: 10)).roundedFull.make(),
                          Divider()
                        ],
                      );
                    }).toList(),
                  ).box.padding(EdgeInsets.symmetric(horizontal: 10,vertical: 10)).color(lightGrey).margin(EdgeInsets.symmetric(horizontal: 15)).shadowSm.roundedSM.make(),


                  // subtotal section
                  20.heightBox,



                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
