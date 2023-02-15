import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'package:vasundhara_api/modelclass/use_data_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

import 'controller/second_screen_controller.dart';

class SecodeScreen extends StatefulWidget {
  // List<SubCategory>? SubList;
  SecodeScreen({Key? key}) : super(key: key);

  @override
  State<SecodeScreen> createState() => _SecodeScreenState();
}

class _SecodeScreenState extends State<SecodeScreen> {

  var data = Get.arguments;

  String baseUrl ="https://play.google.com/store/apps/details?id=";
  // var app = AppCenter();

  var apppcontroller = Get.put(SecodeScreenController());

  void initState(){
    apppcontroller.getapiCaling();
    super.initState();
  }

  // getapiCaling()async{
  //   var response = await http.get(Uri.parse("http://vasundharaapps.com/artwork_apps/api/AdvertiseNewApplications/17/com.latest.status.message.text.jokes.funny"));
  //    // print("RESPONSE :::: ${response.body}");
  //
  //    if(response.statusCode==200){
  //     var jsonDecodeResponse = await jsonDecode(response.body);
  //     app = AppCenter.fromJson(jsonDecodeResponse);
  //     setState(() {
  //
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API "),
      ),
      body:data == null
      ?Center()
      :ListView.separated(
        itemCount: data!.length,
        itemBuilder: (context,index){
          return Container(
            height: 120,
            // width: 100,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.7),
                      offset: Offset(0.5,0.5),
                      blurRadius: 12,
                      spreadRadius: 7,
                    ),
                  ],
                ),
                child: Row(
                children: [
                  Image.network(data![index].icon!),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(data![index].name!,overflow: TextOverflow.visible,),
                        SizedBox(height: 5,),
                     RatingBar.builder(
                      initialRating: double.parse(data![index].star!),
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 20,
                      ignoreGestures: true,
                      // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),

                        Text(data![index].installedRange!,style: TextStyle(fontSize: 15),),
                      ],
                    ),
                  ),

                  Container(
                    height: 35,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(child: GestureDetector(
                      onTap: (){
                        _launchUrl(appLink: data![index].appLink);
                      },
                        child: Text("Download",style: TextStyle(color: Colors.white),))),
                  )
                ],
              ),


          );
        }, separatorBuilder: (context,index){return SizedBox(height: 15);},),
    );
  }

  Future<void> _launchUrl({String? appLink}) async {
    if (!await launchUrl(Uri.parse(baseUrl+appLink!))) {
      throw 'Could not launch $baseUrl+appLink!';
    }
  }

}
