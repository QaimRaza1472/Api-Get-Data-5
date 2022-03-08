

import 'dart:convert';
import 'package:api_get_data_5/Constants/strings.dart';
import 'package:api_get_data_5/Models/model_info.dart';
import 'package:http/http.dart' as http;
/*

class Api_Manger{

  Future<List<AlbumModel>> getDatt() async {
    var client=http.Client();
     var response= await client .get(Uri.parse(Strings.my_url));

     print("-------------------------------");
     print(response.body);
     print("-------------------------------");

     if(response.statusCode==200){
       var responseString = response.body;
       print("******************************");
       print(response.body);
       print("******************************");

       return albumModelFromJson(responseString);

     }
  }
}


*/
































class Api_Manger{
  Future<List<AlbumModel>?>  fecth_data() async{
     var client=http.Client();
     var uri=Uri.parse(Strings.my_url);
     var response= await client.get(uri);
     if(response.statusCode==200){
       var responseString=response.body;
       return albumModelFromJson(responseString);
     }
  }
}