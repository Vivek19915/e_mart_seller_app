import 'package:e_mart_seller_app/const/const.dart';

import '../../widgets/normal_text.dart';
import 'package:intl/intl.dart' as intl;
class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
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


      body: Column(
        children: List.generate(20, (index) =>
            ListTile(
              onTap: () {},
              title: boldText (text: "12345678912331", color: purpleColor),
              subtitle: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.calendar_month,color: fontGrey,),
                      10.widthBox,
                      boldText(text: intl.DateFormat().add_yMd().format(DateTime.now()),color: purpleColor)
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
              trailing: boldText(text: 4000.numCurrency,color: purpleColor,size: 16.0),

            ).box.color(textfieldGrey).roundedSM.margin(EdgeInsets.only(bottom: 5)).make(),
        ),
      ).scrollVertical(physics: BouncingScrollPhysics()).box.padding(EdgeInsets.all(10)).make(),
    );
  }
}
