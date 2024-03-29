import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vasundhara_api/second_screen.dart';
import 'controller/frist_screen_controller.dart';
import 'modelclass/use_data_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class FristScreen extends StatefulWidget {
  const FristScreen({Key? key}) : super(key: key);

  @override
  State<FristScreen> createState() => _FristScreenState();
}

class _FristScreenState extends State<FristScreen> {
  // var model = ModelClass();
  var modellcontroller = Get.put(FristScreenController());

  @override
  void initState(){
    modellcontroller.getapiCaling();
    super.initState();
  }

  // getapiCaling()async{
  //   var response = await http.get(Uri.parse("http://vasundharaapps.com/artwork_apps/api/AdvertiseNewApplications/17/com.latest.status.message.text.jokes.funny"));
  //   // print("RESPONSE:::::: ${response.body}");
  //   if(response.statusCode==200){
  //     var jsonDecodeResponse= await jsonDecode(response.body);
  //     model=ModelClass.fromJson(jsonDecodeResponse);
  //     setState(() {
  //
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("API"),
        ),
        body: Obx(() => modellcontroller.model.value.appCenter == null
            ?Center(
          child: CircularProgressIndicator(),
        )
            :GridView.builder(
            itemCount: modellcontroller.model.value.appCenter!.length,
            // itemCount: 1,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context,index){
              return GestureDetector(
                onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>SecodeScreen(SubList: model!.appCenter![index].subCategory,)));
                  // Get.to(SecodeScreen(SubList: modellcontroller.model.value.appCenter![index].subCategory,),);
                  Get.to(SecodeScreen(),arguments: modellcontroller.model.value.appCenter![index].subCategory);
                },
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(modellcontroller.model.value.appCenter![index].name!,style: TextStyle(color: Colors.white),),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
        ),
        ),


      ),
    );
  }
}
