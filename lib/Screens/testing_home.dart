import 'package:api_get_data_5/Models/model_info.dart';
import 'package:api_get_data_5/Services/api_manager.dart';
import 'package:flutter/material.dart';



class TestingHome extends StatefulWidget {
  const TestingHome({Key? key}) : super(key: key);

  @override
  _TestingHomeState createState() => _TestingHomeState();
}

class _TestingHomeState extends State<TestingHome> {

  List<AlbumModel>? get_data;
  bool isLoaded=false;


  @override
  void initState() {
    listdata();
    super.initState();

  }

 void listdata()async{
    get_data = await Api_Manger().fecth_data();
    if(get_data !=null){
      setState(() {
        isLoaded=true;

      });
    }
 }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
                     itemCount: get_data?.length,
                     itemBuilder: (context,index){
                       //var clients=snapshot.data;

                       return Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Container(
                           //margin: EdgeInsets.all(12),
                           decoration: BoxDecoration(
                             //color: Colors.red,
                             color: Colors.white,
                               borderRadius: BorderRadius.circular(8),
                             boxShadow: [
                               BoxShadow(
                                 color: Colors.grey.withOpacity(0.2),
                                 offset: Offset(0, 0),
                                 spreadRadius: 2,
                                 blurRadius: 5


                               ),
                             ]

                           ),
                           child:  Column(
                             children: [
                               Text(get_data![index].id.toString(),
                               style: TextStyle(
                                 fontSize: 19,
                                 fontWeight: FontWeight.bold,
                               ),

                               ),
                               Text(get_data![index].title,
                                 style: TextStyle(
                                   fontSize: 17,
                                   //fontWeight: FontWeight.bold,
                                 ),
                               ),
                               Text(get_data![index].body ?? ""),

                             ],
                           ),
                         ),
                       );
                     }
                     ),
        replacement: Center(
          child: CircularProgressIndicator(
            color: Colors.red,



          ),
        ),
      ),







    );
  }
}
