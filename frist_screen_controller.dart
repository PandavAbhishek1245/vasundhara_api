
import 'dart:convert';
import 'package:get/get.dart';
import 'package:vasundhara_api/modelclass/use_data_model.dart';
import 'package:http/http.dart'as http;

class FristScreenController extends GetxController{

  var model = ModelClass().obs;
  // List appCenter = [];
  // List SubCategary =[];

  getapiCaling()async{
    var response = await http.get(Uri.parse("http://vasundharaapps.com/artwork_apps/api/AdvertiseNewApplications/17/com.latest.status.message.text.jokes.funny"));
    // print("RESPONSE:::::: ${response.body}");
    if(response.statusCode==200){
      var jsonDecodeResponse= await jsonDecode(response.body);
      model.value=ModelClass.fromJson(jsonDecodeResponse);
    }
  }

}

