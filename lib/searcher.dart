import 'dart:html';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import './physicalStores.dart';
import './onlineStores.dart';
import './supportedStores.dart';


class Searcher extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearcherState();
  }
}

class _SearcherState extends State<Searcher> {
var physical;
  var online;
  var productInfo;
  var status;
  bool findProduct = false;

  getPrices(upc) async {
    // Target, Staples, Walmart, and BestBuy API.

    var response = await http.get('http://127.0.0.1:5000/getphysicalprice?upc=$upc');
    physical = json.decode(response.body);

    var responseTwo = await http.get('http://127.0.0.1:5000/getonlineprice?upc=$upc');
    online = json.decode(responseTwo.body);
    
    var responseThree = await http.get('http://127.0.0.1:5000/getproductinfo?upc=$upc');
    productInfo = json.decode(responseThree.body);

    
    setState(() {
      findProduct = true;
    });

  }


  statusCheck() async {


    var response = await http.get('http://127.0.0.1:5000/getstatus');
    status = json.decode(response.body);

  }


  @override
  Widget build(BuildContext context) {

    statusCheck();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.local_offer),
        onPressed: () => {
          Navigator.push(context,  MaterialPageRoute(builder: (context) => SupportedStores(status: status,))
          )
        }
      ),
      body: Scaffold(
        backgroundColor: Color.fromRGBO(31, 27, 36, 1),
        body:
          Center(child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

              findProduct ? Container(
                margin: EdgeInsets.all(30),
                height: 305,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(31, 41, 51, 1),
                ),
                child: 
                  Column(children: <Widget> [
                    Container(
                      margin: EdgeInsets.only(top: 15, left: 5, right: 5),
                      child: Text(productInfo['productname'], style: TextStyle(color: Colors.white, fontSize: 16, fontFamily:'Montserrat'), textAlign: TextAlign.center,),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child:
                        Image.network(productInfo['productimage'])
                    )
                  ],)
                
              ) : Container(),


                Container(
                  margin: EdgeInsets.all(2),
                  child: 
                  Text("Price Finder", style: TextStyle(fontSize: 64, color: Colors.white)),
                ),
     
                Container(
                  margin: EdgeInsets.only(bottom: 18),
                  
                  child: 
                    TypewriterAnimatedTextKit(
                      repeatForever: true,
                      pause: Duration(milliseconds: 2500),
                      text: [
                        "Prices all in one place.",
                        "Endless Savings.",
                        "Beat the system.",
                        "Spend less.",
                        "Endless Possibilities."
                      ],
                      textStyle: TextStyle(
                          fontSize: 30.0,
                          fontFamily: "Agne",
                          color: Colors.white
                      ),
                      textAlign: TextAlign.start,
                      alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                    ),
                ),
                
                Container(
              height: 175,
              width: 750,
              decoration: BoxDecoration(
                color: Color.fromRGBO(31, 41, 51, 1),
                borderRadius: BorderRadius.circular(20)
              ),
              child: 
                Center(
                  child: 
                  Column(
                    
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      
                      Container(
                        margin: EdgeInsets.all(15),
                        child:
                          TextField(
                            onChanged: (text) {
                              if (text.length == 12) {
                                getPrices(text);
                              }
                              else if (text.length < 12) {
                                setState(() {
                                  findProduct = false;
                                });
                              }
                              else if (text.length > 12) {
                                setState(() {
                                  findProduct = false;
                                });
                              }
                            },
                            style: TextStyle(color: Color.fromRGBO(103, 58, 183, 1)),
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: Color.fromRGBO(103, 58, 183, 1)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color.fromRGBO(103, 58, 183, 1)),
                              ),
                            labelText: 'UPC of Product',
                          ),
                        ),
                        width: 575
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          findProduct ? RaisedButton(
                            child: Text("Physical Stores"),
                            onPressed: () => {
                              Navigator.push(context,  MaterialPageRoute(builder: (context) => PhysicalStores(result: physical))
                              )
                            }
                          ) : Container(),


                          findProduct ? RaisedButton(
                            child: Text("Online Stores"),
                            onPressed: () => {
                              Navigator.push(context,  MaterialPageRoute(builder: (context) => OnlineStores(result: online))
                              )
                            }
                          ) : Container()
                      ])
                  ],)
                ),
            )

            ],)
            
            
          ,)
          
          

      )
      );
      
      
  }
}
