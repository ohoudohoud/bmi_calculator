import 'dart:math';
import 'package:bmi_calculator/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class StartUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>HomeScreen();
}
class HomeScreen extends State<StartUp>{
  bool isMale=true;
  double sliderValue=120.0;
  int weight=40;
  int age=20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('BMI CALCULATOR',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body:  Column(
          children: [
            Expanded(
              child:
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            setState((){
                              isMale=false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: !isMale? Colors.blue : Colors.grey[400]
                            ),
                              child:
                          Column(
                          children: [
                            Icon(Icons.female,size: 130.0,),
                            SizedBox(height: 10.0,),
                            Text('Femal',style: TextStyle(color: Colors.white)),
                            SizedBox(height: 5.0,),
                          ],)),
                        ),
                      ),
                      SizedBox(width: 15.0,),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            setState((){
                              isMale=true;
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color:isMale? Colors.blue :Colors.grey[400]
                              ),
                              child:
                              Column(
                                children: [
                                  Icon(Icons.male,size: 130.0,),
                                  SizedBox(height: 10.0,),
                                  Text('Male',style: TextStyle(color: Colors.white)),
                                  SizedBox(height: 5.0,),
                                ],)),
                        ),
                      ),
                  ],),
                ),
              ),
            ),
            Expanded(
              child:Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(15.0),
                 color: Colors.grey[400]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text('Height',style: TextStyle(color: Colors.white,fontSize: 25.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text('${sliderValue.round()}',style: TextStyle(color: Colors.white,fontSize: 30.0)),
                      Text('cm',style: TextStyle(color: Colors.white,fontSize: 15.0)),
                    ],),
                    Slider(value:sliderValue,max: 220.0,min: 80.0,
                        onChanged: (value){
                      setState((){
                        sliderValue=value;
                      });
                    })
                  ],),
            ),
              ),
            ),
            Expanded(
              child:Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                      children: [
                        Expanded(
                          child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.grey[400]
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Text('Age',style: TextStyle(color: Colors.white,fontSize: 25.0)),
                              SizedBox(height: 5.0,),
                            Text('${age}',style: TextStyle(color: Colors.white,fontSize: 30.0)),
                              SizedBox(height: 5.0,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(onPressed: (){
                                  setState((){
                                    age--;
                                  });
                                },mini: true,child: Icon(Icons.remove,),),
                                FloatingActionButton(onPressed: (){
                                  setState((){
                                    age++;
                                  });
                                },mini: true,child: Icon(Icons.add),)
                              ],
                            )
                          ],
                      ),),
                        ),
                        SizedBox(width: 15.0,),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.grey[400]
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Weight',style: TextStyle(color: Colors.white,fontSize: 25.0)),
                                SizedBox(height: 5.0,),
                                Text('${weight} ',style: TextStyle(color: Colors.white,fontSize: 30.0)),
                                SizedBox(height: 5.0,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FloatingActionButton(onPressed: (){
                                      setState((){
                                        weight--;
                                      });
                                    },mini: true,child: Icon(Icons.remove,),),
                                    FloatingActionButton(onPressed: (){
                                      setState((){
                                        weight++;
                                      });
                                    },mini: true,child: Icon(Icons.add),)
                                  ],
                                )

                              ],
                            ),
                          ),
                        ),
                  ]),
            ),
              ),
            ),
            Container(
                width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.blue,
    ),
    child: MaterialButton(

                  onPressed: (){
                    double result=weight/pow(sliderValue/100,2);
                    String resultText;
                    if (result<18.4){
                      resultText="Underweight";
                    }else {
                      if (result>18.5&&result<24.9){
                        resultText="Normal";
                      }
                      else {
                        if (result>25&&result<39.9){
                          resultText="Overweight";
                        }
                        else {
                          resultText="Obese";
                        }
                      }
                    }
                    Navigator.push(context,MaterialPageRoute(
                      builder:(context)=>BMIResutScreen(
                          result=result,
                          resultText=resultText
                      )
                    ));
                  },
                  child: Text(
                    'Calcualte',
                    style: TextStyle(color: Colors.white,fontSize: 20.0),),))

          ],
      ),

    );
  }

}
