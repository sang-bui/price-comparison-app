import 'package:flutter/material.dart';



class SupportedStores extends StatelessWidget {

  var status;
  SupportedStores({@required this.status});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(31, 27, 36, 1),
      appBar: AppBar(title: Text("Supported Stores"), backgroundColor: Color.fromRGBO(31, 41, 51, 1),),
      body: SingleChildScrollView(child:
      
        Center(child:
          Column(children: <Widget> [
            
            Row(
              
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget> [
              
                Container(
                  width: 295,
                  height: 350,
                  margin: EdgeInsets.all(35),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(31, 41, 51, 1),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child:
                    Column(children: <Widget>[
                      Image.asset('../images/Walmart.png'),
                      
                    ],) 
                  ,
                ),


                Container(
                  
                  width: 295,
                  height: 350,
                  margin: EdgeInsets.all(35),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(31, 41, 51, 1),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child:
                    Column(children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child:
                          Image.asset('../images/Target.png', scale: 12),
                          
                      


                      ),

               
                    ],) 
                  ,
                ),



                Container(
                  width: 295,
                  height: 350,
                  margin: EdgeInsets.all(35),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(31, 41, 51, 1),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(children: <Widget>[
                    Container(
                      
                      margin: EdgeInsets.only(top: 5),
                      child: 
                      Image.asset('../images/Staples2.png', scale: 11,)
                    ,),
                    
                  ],),
                )
            ],),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                Container(
                  width: 295,
                  height: 350,
                  margin: EdgeInsets.all(35),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(31, 41, 51, 1),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child:
                    Column(children: <Widget> [
                      Image.asset('../images/Walgreens.png', scale: 5,),
                      

                    ],)
                ),


                Container(
                  width: 295,
                  height: 350,
                  margin: EdgeInsets.all(35),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(31, 41, 51, 1),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: 
                    Column(children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: 
                          Image.asset('../images/BestBuy2.png', scale: 1.5,)
                      
                      ,),
                      
                      
                    ],)
                ),



                Container(
                  width: 295,
                  height: 350,
                  margin: EdgeInsets.all(35),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(31, 41, 51, 1),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child:
                    Column(children: <Widget>[
                      Image.asset('../images/TigerDirect.png', scale: 1.2),
                      
                    ],)
                  ,
                )


            ],)
            
          ],)
        )
      
      )
      
    );
  }
}