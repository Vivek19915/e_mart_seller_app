import 'package:e_mart_seller_app/const/const.dart';
import 'package:e_mart_seller_app/views/products_screen/add_new_product.dart';
import 'package:e_mart_seller_app/views/products_screen/products_details.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:intl/intl.dart' as intl;
import '../../widgets/normal_text.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: boldText(text: "Your Products",color: fontGrey,size: 18.0),
        actions: [
          boldText(text: intl.DateFormat('EEE, MMM d, ' 'yy').format(DateTime.now()),color: darkGrey),
          10.widthBox,
        ],
      ),


        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
              child: Column(
                children: List.generate(20, (index) =>
                ListTile(
                  onTap: () { Get.to(()=>ProductDetails());},
                  leading: Image.asset(imgProduct, width: 100, height: 100, fit: BoxFit.cover),
                  title: boldText (text: "Product title", color: fontGrey),
                  subtitle: Row(
                    children: [
                      normalText(text: "\$40.0", color: darkGrey),
                      10.widthBox,
                      boldText(text: "Featured" ,color: green)
                    ],
                  ),
                  trailing: VxPopupMenu(
                    child: Icon(Icons.more_vert_rounded),
                    menuBuilder: ()
                       => Column(
                        children: List.generate(popupMenuIcons.length, (index) {
                          return Row(
                            children: [
                              Icon(popupMenuIcons[index],color: purpleColor,),
                              10.widthBox,
                              normalText(text: popupMenuTitles[index],color: purpleColor)
                            ],
                          ).paddingAll(10).onTap(() {});
                        }),
                      ).box.color(Colors.white).roundedSM.width(200).padding(EdgeInsets.all(10)).make(),
                    clickType: VxClickType.singleClick,

                  )
                  ),
        ),
      ))),

        //to add more products--->>
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Get.to(()=>AddNewProduct());
          },
          child: Icon(Icons.add,color: Colors.white,),
          backgroundColor: purpleColor,
        ),


    );
  }
}
