import 'package:e_mart_seller_app/const/const.dart';
import 'package:e_mart_seller_app/widgets/normal_text.dart';
import 'package:intl/intl.dart' as intl;

import '../../widgets/dashboard_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: "Dashboard",color: fontGrey,size: 18.0),
        actions: [
          boldText(text: intl.DateFormat('EEE, MMM d, ' 'yy').format(DateTime.now()),color: darkGrey),
          10.widthBox,
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dashboardButton(context,title: products,count: 75,icon: icProducts),
                dashboardButton(context,title: orders,count: 50,icon: icOrders),
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
              children: List.generate(4, (index) {
                return ListTile(
                  onTap: (){},
                  leading: Image.asset(imgProduct, width: 100, height: 100, fit: BoxFit.cover),
                  title: boldText(text: "Product title", color: fontGrey),
                  subtitle: normalText(text: 400.numCurrency , color: darkGrey),
                );
              }),
            )


          ],
        ).box.padding(EdgeInsets.all(8)).make(),
      ),
    );
  }
}
