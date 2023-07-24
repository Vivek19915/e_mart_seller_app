import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_mart_seller_app/const/const.dart';
import 'package:e_mart_seller_app/controllers/orders_controller.dart';
import 'package:e_mart_seller_app/services/store_services.dart';
import 'package:e_mart_seller_app/views/orders_screen/order_details.dart';
import 'package:e_mart_seller_app/widgets/loading_indicator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../widgets/normal_text.dart';
import 'package:intl/intl.dart' as intl;


class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {

    var ordersController = Get.put(OrdersController());

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: boldText(text: "Orders",color: fontGrey,size: 18.0),
        actions: [
          boldText(text: intl.DateFormat('EEE, MMM d, ' 'yy').format(DateTime.now()),color: darkGrey),
          10.widthBox,
        ],
      ),

      body: StreamBuilder(
        stream: StoreServices.getOrders(currentUser!.uid),
        builder: (BuildContext context , AsyncSnapshot<QuerySnapshot>snapshot){
          if(snapshot.hasData == false){
            return loadingIndicator().box.makeCentered();
          }
          else if(snapshot.data!.docs.isEmpty){
            return normalText(text: "No Orders Yet!",color: purpleColor).box.makeCentered();
          }
          else {

            var data = snapshot.data!.docs;

            return Column(
              children: List.generate(data.length, (index) {
                //-------->>>> so that seller will see total of its product order ---> not overall orders price of user
                ordersController.getOrdersTotalAmount(data[index]);

                var time = data[index]['order_date'].toDate();
                return ListTile(
                  onTap: () {
                    Get.to(()=>OrderDetails(data: data[index]));
                  },
                  title: boldText (text: data[index]['order_code'], color: purpleColor),
                  subtitle: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.calendar_month,color: fontGrey,),
                          10.widthBox,
                          boldText(text: intl.DateFormat().add_yMEd().format(time),color: purpleColor)
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.payment,color: fontGrey,),
                          10.widthBox,
                          boldText(text: "Unpaid",color: red)
                        ],
                      ),
                    ],
                  ),
                  trailing: boldText(text: ordersController.total_amount.toString().numCurrency,color: purpleColor,size: 16.0),

                ).box.color(textfieldGrey).roundedSM.margin(EdgeInsets.only(bottom: 5)).make();
              }
              ),
            ).scrollVertical(physics: BouncingScrollPhysics()).box.padding(EdgeInsets.all(10)).make();
          }
        },
      ),

    );
  }
}
