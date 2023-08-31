import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class dashboardScreen extends StatefulWidget {

  @override
  State<dashboardScreen> createState() => _dashboardScreenState();
}

class _dashboardScreenState extends State<dashboardScreen> {
  var name = ["Rain","Soil","Temprature","Humidity","Water Level ","Control"];
  var image = ["images/rain1.png","images/soil11.png","images/temp.png","images/humidity11.png","images/water11.png","images/control11.jpg"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Dashboard"),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.only(top: 20.0,left: 5.0,bottom: 20.0,right: 5.0),
          child: GridView.builder(
              itemCount: name.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 2.0,
                  crossAxisCount: 2,
                  crossAxisSpacing: 2.0
              ),
              itemBuilder: (context,index) {
                return Container(
                  height: 170,
                  child: InkWell(
                    onTap: (){

                    },
                    child: Card(
                      elevation: 10.0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(child: Image.asset(image[index],fit: BoxFit.cover,width: 80.0,height: 80.0,),),
                          SizedBox(height: 10.0,),
                          Center(child: Text(name[index],style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),),
                        ],
                      ),
                    ),
                  ),
                );
              }
          )
      ),
    );
  }
}
