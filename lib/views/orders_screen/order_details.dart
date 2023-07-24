import 'package:e_mart_seller_app/const/const.dart';
import 'package:e_mart_seller_app/controllers/orders_controller.dart';
import 'package:e_mart_seller_app/widgets/our_button.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import '../../widgets/normal_text.dart';
import 'components/order_placed.dart';

class OrderDetails extends StatefulWidget {

  final dynamic data;

  const OrderDetails({super.key, this.data});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {

  var ordersController = Get.find<OrdersController>();

  @override
  void initState() {
    ordersController.getOrders(widget.data);
    ordersController.getOrdersTotalAmount(widget.data);
    //setting values of order-status from database
    ordersController.confirmed.value = widget.data['order_confirmed'];
    ordersController.onDelievery.value = widget.data['order_on_delivery'];
    ordersController.delievered.value = widget.data['order_delivered'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=>Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: boldText(text: "Orders Details",color: fontGrey,size: 18.0),
        ),


        bottomNavigationBar: Visibility(
          visible: !ordersController.confirmed.value,
          child: SizedBox(
            height: 60,
            width: context.screenWidth,
            child: ourButton(color: green ,
              onPress: (){
                ordersController.confirmed.value = true;
                ordersController.changeOrderStatus(title: "order_confirmed" , status: true, docId: widget.data.id);
            } , title: 'Confirm Order'),
          ),
        ),


        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Column(
                children: [
                  20.heightBox,

                  //order delivery section
                  Obx(
                    ()=> Visibility(
                      visible: ordersController.confirmed.value,
                      child: Column(
                        children: [
                          boldText(text: "Order Status" ,color: purpleColor,size: 16.0),

                          SwitchListTile(
                              value: true,                    //value for on and off of witch
                              onChanged: (value){},
                              title: boldText(text: "Placed",color: purpleColor),
                              activeColor: Colors.green,
                          ),
                          SwitchListTile(
                            value: ordersController.confirmed.value,                    //value for on and off of witch
                            onChanged: (choosen_value){
                              ordersController.confirmed.value = choosen_value;
                              ordersController.changeOrderStatus(title: "order_confirmed" , status: choosen_value, docId: widget.data.id);
                            },
                            title: boldText(text: "Confirmed",color: purpleColor),
                            activeColor: Colors.green,
                          ),
                          SwitchListTile(
                            value: ordersController.onDelievery.value,                    //value for on and off of witch
                            onChanged: (choosen_value){
                              ordersController.onDelievery.value = choosen_value;
                              ordersController.changeOrderStatus(title: "order_on_delivery" , status: choosen_value, docId: widget.data.id);
                            },
                            title: boldText(text: "On Delievery",color: purpleColor),
                            activeColor: Colors.green,
                          ),
                          SwitchListTile(
                            value: ordersController.delievered.value,                    //value for on and off of witch
                            onChanged: (choosen_value){
                              ordersController.delievered.value = choosen_value;
                              ordersController.changeOrderStatus(title: "order_delivered" , status: choosen_value, docId: widget.data.id);
                            },
                            title: boldText(text: "Delievered",color: purpleColor),
                            activeColor: Colors.green,
                          )


                        ],
                      ).box.color(lightGrey).margin(EdgeInsets.symmetric(horizontal: 15)).padding(EdgeInsets.symmetric(vertical: 10)).shadowSm.roundedSM.make(),
                    ),
                  ),


                  20.heightBox,
                  //orders details section ------->>>>>>
                  Column(
                    children: [
                      orderPlaceDetails(
                          title1: "Order Code",
                          title2: "Shipping Method",
                          d1: widget.data['order_code'].toString(),
                          d2:widget.data['shipping_method'].toString(),
                      ),
                      orderPlaceDetails(
                          title1: "Order Date",
                          title2: "Payment Method",
                          d1: intl.DateFormat().add_yMd().format((widget.data['order_date'].toDate())),
                          d2: widget.data['payment_method'].toString(),
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
                              widget.data['order_by_name'].toString().text.make(),
                              widget.data['order_by_email'].toString().text.make(),
                              widget.data['order_by_address'].toString().text.make(),
                              widget.data['order_by_city'].toString().text.make(),
                              widget.data['order_by_state'].toString().text.make(),
                              widget.data['order_by_phone'].toString().text.make(),
                              widget.data['order_by_postalcode'].toString().text.make(),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              boldText(text: "Total Amount",color: purpleColor),
                              boldText(text: ordersController.total_amount.toString().numCurrency , color: red),
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
                    children: List.generate(ordersController.ordersLIst.length, (index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          orderPlaceDetails(
                              title1: ordersController.ordersLIst[index]['title'].toString(),
                              title2: ordersController.ordersLIst[index]['total_price'].toString().numCurrency,
                              d1: ordersController.ordersLIst[index]['quantity'].toString(),
                              d2: "Refundable"
                          ),
                          VxBox().color(Color(ordersController.ordersLIst[index]['color'])).size(20, 20).margin(EdgeInsets.symmetric(horizontal: 10)).roundedFull.make(),
                          Divider()
                        ],
                      );
                    }).toList(),
                  ).box.padding(EdgeInsets.symmetric(horizontal: 10,vertical: 10)).color(lightGrey).margin(EdgeInsets.symmetric(horizontal: 15)).shadowSm.roundedSM.make(),


                  // subtotal section
                  20.heightBox,



                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
