import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_mart_seller_app/const/const.dart';
import 'package:e_mart_seller_app/controllers/products_controller.dart';
import 'package:e_mart_seller_app/services/store_services.dart';
import 'package:e_mart_seller_app/views/products_screen/add_new_product.dart';
import 'package:e_mart_seller_app/views/products_screen/edit_product_details.dart';
import 'package:e_mart_seller_app/views/products_screen/products_details.dart';
import 'package:e_mart_seller_app/widgets/loading_indicator.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:intl/intl.dart' as intl;
import '../../widgets/normal_text.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var productCOntroller = Get.put(ProductsController());

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



      body: StreamBuilder(
        stream: StoreServices.getProducts(),
        builder: (BuildContext context , AsyncSnapshot<QuerySnapshot>snapshot){
          if(snapshot.hasData == false){
            return Center(child: loadingIndicator(color: purpleColor),);
          }
          else if(snapshot.data!.docs.isEmpty){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                "No Products yet!!".text.color(purpleColor).bold.makeCentered(),
                10.heightBox,
                "Add new Products!!".text.color(purpleColor).bold.makeCentered(),

              ],
            );
          }
          else {

            var data = snapshot.data!.docs;

            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: List.generate(data.length, (index) =>
                          ListTile(
                              onTap: () { Get.to(()=>ProductDetails(data: data[index]));},
                              leading: Image.network(data[index]['p_imgs'][0], width: 100, height: 100, fit: BoxFit.cover).box.roundedSM.clip(Clip.antiAlias).make(),
                              title: boldText (text: data[index]['p_name'].toString(), color: fontGrey),
                              subtitle: Row(
                                children: [
                                  normalText(text: data[index]['p_price'].toString().numCurrency, color: darkGrey),
                                  10.widthBox,
                                  //featured product or not----->
                                  data[index]['p_featured'] ? boldText(text: "Featured" ,color: green):Container(),
                                ],
                              ),
                              trailing: VxPopupMenu(
                                child: Icon(Icons.more_vert_rounded),
                                menuBuilder: ()
                                => Column(
                                  children: List.generate(popupMenuIcons.length, (i) {
                                    return Row(
                                      children: [


                                        //show showing featured button green ----->
                                        Icon(
                                          popupMenuIcons[i],
                                          color: data[index]['featured_id'] == currentUser!.uid && i==0 ? green  : purpleColor,),
                                        10.widthBox,
                                        normalText(text:data[index]['featured_id'] == currentUser!.uid && i==0 ?"Remove Featured" : popupMenuTitles[i],color: purpleColor)
                                      ],
                                    ).paddingAll(10).onTap(() {

                                      //When user click on featured
                                      if(i==0 ){
                                        if(data[index]['p_featured'] == true ){
                                          //means user product already featured and user wnats to remove it thats why he click
                                          productCOntroller.removeFeatured(data[index].id);
                                          VxToast.show(context, msg: "Product Removed From Featured");
                                        }
                                        else{
                                          productCOntroller.addFeatured(data[index].id);
                                          VxToast.show(context, msg: "Product Added to Featured");
                                        }
                                      }

                                      //When user click on edit
                                      if(i==1){
                                          Get.to(()=>EditProductDetails(data: data[index],));
                                      }

                                      //when user click on remove
                                      if(i==2){
                                        productCOntroller.removeProduct(data[index].id);
                                        VxToast.show(context, msg: "Product Removed");
                                      }

                                    });
                                  }),
                                ).box.color(Colors.white).roundedSM.width(200).padding(EdgeInsets.all(10)).make(),
                                clickType: VxClickType.singleClick,

                              )
                          ),
                      ),
                    )));
          }
        },
      ),


        // to add more products--->>
        floatingActionButton: FloatingActionButton(
          onPressed: ()async{
            await productCOntroller.getCategories();
            productCOntroller.populateCategoryList();

            Get.to(()=>AddNewProduct());
          },
          child: Icon(Icons.add,color: Colors.white,),
          backgroundColor: purpleColor,
        ),


    );
  }
}
