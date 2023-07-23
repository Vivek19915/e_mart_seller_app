import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_mart_seller_app/const/const.dart';
import 'package:e_mart_seller_app/services/store_services.dart';
import 'package:e_mart_seller_app/widgets/loading_indicator.dart';
import 'package:e_mart_seller_app/widgets/normal_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;

import 'chat_screen.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: "Messages",size: 16.0,color: purpleColor),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: StreamBuilder(
            stream: StoreServices.getMessages(currentUser!.uid),
            builder: (BuildContext context , AsyncSnapshot<QuerySnapshot>snapshot){
              if(snapshot.hasData == false){
                return loadingIndicator().box.makeCentered();
              }
              else if(snapshot.data!.docs.isEmpty){
                return normalText(text: "No Messages Yet!");
              }
              else {
                var data  = snapshot.data!.docs;
                return Column(
                  children: List.generate(data.length, (index) {

                    var t = data[index]['created_on'] == null ? DateTime.now() : data[index]['created_on'].toDate();
                    var time = intl.DateFormat("h:mma").format(t);

                    return ListTile(
                      onTap: (){
                        Get.to(()=>ChatScreen());
                      },
                      leading: CircleAvatar(backgroundColor:Colors.white,child: Icon(Icons.person,color: purpleColor,)),
                      title: boldText(text: data[index]['sender_name']),
                      subtitle: normalText(text: data[index]['last_msg']),
                      trailing: normalText(text: time),
                    ).box.color(purpleColor).margin(EdgeInsets.all(5)).roundedSM.make();
                  }),
                );
              }
            },
          )

        ),
      ),
    );
  }
}
