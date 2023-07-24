import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_mart_seller_app/const/const.dart';
import 'package:e_mart_seller_app/controllers/home_controllers.dart';
import 'package:e_mart_seller_app/services/store_services.dart';
import 'package:e_mart_seller_app/views/products_screen/products_details.dart';
import 'package:e_mart_seller_app/widgets/loading_indicator.dart';
import 'package:e_mart_seller_app/widgets/normal_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart' as intl;

import '../../widgets/dashboard_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var homeController  = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: "Dashboard",color: fontGrey,size: 18.0),
        actions: [
          boldText(text: intl.DateFormat('EEE, MMM d, ' 'yy').format(DateTime.now()),color: darkGrey),
          10.widthBox,
        ],
      ),
      
      
      
      body: StreamBuilder(
        stream: StoreServices.getProducts(),
        builder: (BuildContext context , AsyncSnapshot<QuerySnapshot>snapshot){
          if(snapshot.hasData == false){
            return Center(child: loadingIndicator(),);
          }
          else{
            
            var data = snapshot.data!.docs;
            data = data.sortedBy((a, b) => b['p_wishlist'].length.compareTo(a['p_wishlist'].length));  //sorted on the basis of length of b>a


            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      dashboardButton(context,title: products,count: data.length.toString(),icon: icProducts),
                      dashboardButton(context,title: orders,count: homeController.count,icon: icOrders),
                    ],
                  ),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      dashboardButton(context,title: rating,count: 75,icon: icStar),
                      dashboardButton(context,title: totalSales,count: 50,icon: icOrders),
                    ],
                  ),
                  10.heightBox,
                  Divider(),
                  10.heightBox,

                  //popular products --> which are in wishlist of users
                  boldText(text: popular,color: fontGrey,size: 16.0).box.margin(EdgeInsets.symmetric(horizontal: 10)).make(),
                  20.heightBox,
                  ListView(
                    physics:NeverScrollableScrollPhysics(),
                    shrinkWrap: true,       //since it is inside colomn
                    children: List.generate(data.length, (index) {
                      return ListTile(
                        onTap: (){
                          Get.to(()=>ProductDetails(data: data[index],));
                        },
                        leading: Image.network(data[index]['p_imgs'][0], width: 100, height: 100, fit: BoxFit.cover).box.roundedSM.clip(Clip.antiAlias).make(),
                        title: boldText(text: data[index]['p_name'], color: fontGrey),
                        subtitle: normalText(text: data[index]['p_price'].toString().numCurrency , color: darkGrey),
                        trailing: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.favorite,color: red,),
                            boldText(text: data[index]['p_wishlist'].length.toString(), color: fontGrey),
                          ],
                        ).box.width(50).make(),
                      );
                    }),
                  )


                ],
              ).box.padding(EdgeInsets.all(8)).make(),
            );
          }
        },
      ),
    );
  }
}
