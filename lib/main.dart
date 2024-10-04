import 'package:calculator/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  Widget build(BuildContext context) {
        //We can Change our Navigation Buttons Color by using this code
     SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,           // Change this color to your desired color
    ));
    return MaterialApp(
  
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
         primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  int firstnum=0;
int secondnum=0;
String texttodisplay="";
String res="";
String operationtoperform="";
void btnclicked(String btnval){
  if(btnval=="C"){
    texttodisplay="";
    firstnum=0;
    secondnum=0;
    res="";
  }
  else if(btnval=="+"||btnval=="%"||btnval=="÷"||btnval=="X"||btnval=="-"){
    firstnum=int.parse(texttodisplay);
    res="";
    operationtoperform=btnval;
  }
  else if(btnval=="="){
  secondnum=int.parse(texttodisplay);
  if(operationtoperform=="+"){
    res=(firstnum+secondnum).toString();
  }
  if(operationtoperform=="-"){
    res=(firstnum-secondnum).toString();
  }
  if(operationtoperform=="X"){
    res=(firstnum*secondnum).toString();
  }
  if(operationtoperform=="%"){
    res=(firstnum%secondnum).toString();
  }
  if(operationtoperform=="÷"){
    res=(firstnum/secondnum).toString();
  }
  }
   else{
    res=(texttodisplay+btnval).toString();
  }
  setState(() {
    texttodisplay=res;
  });
  
}
 
  Widget custombutton(String btnval){
return Expanded(
  
  child:Padding(
    padding: const EdgeInsets.all(5.0),
    child: TextButton(
      style: TextButton.styleFrom(
        backgroundColor: NumberBgColor,
        
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: (){
        btnclicked(btnval);
      },
       child:  Text(
          btnval,
        style: const TextStyle(fontSize: 25,color: NumberTextColor),),
        ),
  ),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: const Color(0Xff010101),
      // appBar: AppBar(title: const Text('Calculator')),
      body: Container(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Material(
                elevation: 1,
                child: Container(
                  padding: const EdgeInsets.all(10),
                alignment: Alignment.bottomRight,
                  width: double.infinity,
                  color: Colors.black,
                  
                  child:  Text("$texttodisplay",style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w300,color: Colors.white),),),
                  
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                
                children: [
                  SizedBox(width: 10,),
                   Icon(Icons.history,color: Color(0Xffa3a3a3)),
                   SizedBox(width: 40,),
                   Icon(Icons.straighten,color: Color(0Xffa3a3a3)),
                    SizedBox(width: 40,),
                   Icon(Icons.newspaper,color: Color(0Xffa3a3a3)),
                    SizedBox(width: 140,),
                   Icon(Icons.cancel_presentation_sharp,color: Color(0Xffa3a3a3)),
                  
                ],),
            ),
            const Divider(
              height: 10,
              thickness: 2,
            color: Color.fromARGB(255, 88, 80, 80),),
                Row(
                  children: [
                    custombutton("C"),
                    custombutton("()"),
                    custombutton("%"), 
                    custombutton("÷"),
                    
                  
                  ],),
                  Row(
                  children: [
                    custombutton("7"),
                    custombutton("8"),
                    custombutton("9"),
                    custombutton("X"),
                    
                  
                  ],),
                  Row(
                  children: [
                    custombutton("4"),
                    custombutton("5"),
                    custombutton("6"),
                    custombutton("-"),
                    
                  
                  ],),
                    Row(
                  children: [
                    custombutton("1"),
                    custombutton("2"),
                    custombutton("3"),
                    custombutton("+"),
                  ],),
                  Row(
                  children: [
                    custombutton("+/-"),
                    custombutton("0"),
                    custombutton("."),
                    custombutton("="),
                  ],),
                  
                  
                
          ],
        ),
      ),
    );
  }
}

