import 'package:bmi_calculator/StartUp.dart';
import 'package:flutter/material.dart';


class BMIResutScreen extends StatelessWidget{
   final double result;
   final String resultText;
  BMIResutScreen(this.result,this.resultText);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
       backgroundColor: Colors.black,
       appBar: AppBar(
         centerTitle: true,
         backgroundColor: Colors.black,
         title: Text('BMI CALCULATOR',
           style: TextStyle(color: Colors.white,),
         ),
       ),
     body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
           children: [
             SizedBox(height: 20.0,),
             Expanded(
               child: Container(
                 child:
                 Text("Your Result Is :",style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize: 30.0)),
               ),
             ),
             SizedBox(height: 20.0,),
             Expanded(
               child: Container(
                     decoration: BoxDecoration(
                       color: Colors.grey[400],
                       borderRadius: BorderRadius.circular(15.0),
                     ),
                     child: Padding(
                       padding: const EdgeInsets.all(20.0),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,

                         children: [
                           Text("$result",style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize: 30.0)),
                           Text("$resultText",style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize: 30.0)),
                             ],
                   ),
                     ),
                 ),
             ),
    Expanded(
    child: Container()),
             Container(
                 width: double.infinity,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(15.0),
                   color: Colors.blue,
                 ),
                 child: MaterialButton(

                   onPressed: (){
                     Navigator.pushReplacement(context,MaterialPageRoute(
                         builder:(context)=>StartUp()
                     ));
                   },
                   child: Text(
                     'Re-Calcualte',
                     style: TextStyle(color: Colors.white,fontSize: 20.0),),))

           ],

     ),


   );


  }



}