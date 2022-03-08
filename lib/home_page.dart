import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 Future getUserData() async {
    var response = await http.get(Uri.http("jsonplaceholder.typicode.com", "users"));
    print("---------------Response-------------------------");
    print(response.body);
    print("---------------Response-------------------------");

    var jsonData =jsonDecode(response.body);
    List<User> users = [];
    for (var u in jsonData){

      User user = User(u['name'], u['email'], u['username']);
      users.add(user);
    }
    print("---------------Length-------------------------");
    print(users.length);
    return users;

  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Card(
     /*     child: FutureBuilder(
              future: getUserData(),
              builder: (context, snapshot){
                if(snapshot.data == null){
                  return Container(
                    child: const Center(
                      child: Text("Loading........."),
                    ),
                  );
                }
                else {
                  return
                  ListView.builder(
                  itemCount:snapshot.data?.length,
                    itemBuilder: (context,index){
                  //  var client=snapshot.data[index]['address'];
                    return ListTile(
                        title: Text(snapshot.data![index].name),
                    );
                    }
                    );
                }

              }),*/
        ),
      ),

    );
  }
}
class User{
  final String name,email,userName;
   User(this.name,this.email,this.userName);
}
