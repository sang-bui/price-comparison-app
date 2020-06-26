import 'package:flutter/material.dart';






class PhysicalStores extends StatelessWidget {

  
  Map result;
  bool dataReceived = false;

  PhysicalStores({@required this.result});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(31, 27, 36, 1),
      appBar: AppBar(title: Text("Physical Stores"), backgroundColor: Color.fromRGBO(31, 41, 51, 1),),
      body:
        Column(children: <Widget>[
          Row(children: <Widget>[
            Flexible(
              child: 
                Container(
                  child:
                    Row(
                      children: <Widget>[
                        Image.asset('../images/Walmart.png', scale: 12, alignment: Alignment(-1.0, 0.0),),
                        Text(result['walmart'], style: TextStyle(fontSize: 46, fontFamily: 'Montserrat'),)

                      
                      ],
                    ),
                    
                    
                  margin: EdgeInsets.all(30),
                  height: 175,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        spreadRadius: 3,
                        blurRadius: 2,
                        offset: Offset(1, 0), // changes position of shadow
                      ),
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.blue[50], Colors.indigo]
                    ),
                    borderRadius: BorderRadius.circular(20)
                  ),
              
                  ),
            ),
            Flexible(child: 
              Container(
                  child:
                    Row(
                      children: <Widget>[
                        Image.asset('../images/Target.png', scale: 9, alignment: Alignment(-0.80, 0.0),),
                        Text(result['target'], style: TextStyle(fontSize: 46, fontFamily: 'Montserrat'),)
                      ],
                    ),
                   
                  margin: EdgeInsets.all(30),
                  height: 175,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        spreadRadius: 3,
                        blurRadius: 2,
                        offset: Offset(1, 0), // changes position of shadow
                      ),
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.red[100], Colors.red[500]]
                    ),
                    borderRadius: BorderRadius.circular(20)
                  ),
                )
            )


            

          ],),


          Row(children: <Widget>[
            Flexible(
              child: 
                Container(
                  child:
                    Row(
                      children: <Widget>[
                        Image.asset('../images/Walgreens.png', scale: 8, alignment: Alignment(-1.0, 0.0),),
                        Text(result['walgreens'], style: TextStyle(fontSize: 46, fontFamily: 'Montserrat'),)

                      
                      ],
                    ),
                    
                    
                  margin: EdgeInsets.all(30),
                  height: 175,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        spreadRadius: 3,
                        blurRadius: 2,
                        offset: Offset(1, 0), // changes position of shadow
                      ),
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.red[50], Colors.redAccent[700]]
                    ),
                    borderRadius: BorderRadius.circular(20)
                  ),
              
                  ),
            ),
            Flexible(child: 
              Container(
                  child:
                    Row(
                      children: <Widget>[
                        Image.asset('../images/Staples.png', scale: 9, alignment: Alignment(-0.95, 0.0),),
                        Text(result['staples'], style: TextStyle(fontSize: 46, fontFamily: 'Montserrat'),)
                      ],
                    ),
                   
                  margin: EdgeInsets.all(30),
                  height: 175,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        spreadRadius: 3,
                        blurRadius: 2,
                        offset: Offset(1, 0), // changes position of shadow
                      ),
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.red[100], Colors.red[500]]
                    ),
                    borderRadius: BorderRadius.circular(20)
                  ),
                )
            ),



            


          ],),




          Row(children: <Widget>[
            Flexible(
              child: 
                Container(
                  child:
                    Row(
                      children: <Widget>[
                        Image.asset('../images/BestBuy.png', scale: 7, alignment: Alignment(0.5, 0),),
                        Text(result['bestbuy'], style: TextStyle(fontSize: 46, fontFamily: 'Montserrat'),)

                      
                      ],
                    ),
                    
                    
                  margin: EdgeInsets.all(30),
                  height: 175,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        spreadRadius: 3,
                        blurRadius: 2,
                        offset: Offset(1, 0), // changes position of shadow
                      ),
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.blue[50], Colors.indigo]
                    ),
                    borderRadius: BorderRadius.circular(20)
                  ),
              
                  ),
            ),
            


            Flexible(child: 
              Container(
                  margin: EdgeInsets.all(30),
                  height: 175,
                  width: double.infinity,
                )
            )
          ],),
        ],)
      
    );
  }
}