import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';

main() => runApp(Controles());

class Controles extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Estado();
  }

}

class Estado extends State{

  int x; 
  int y; 
  String a, b;
  String imagen, imagen1;
 
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mi Nivel'),
        ),
        body: 
         Column(children: <Widget>[
             Container(
             alignment: Alignment.center,
             child: Text('Mi nivel indica si un plano o una superficie se encuentra en posición perfectamente horizontal o vertical',
             style: TextStyle(
                   fontSize: 15, 
                   fontWeight: FontWeight.bold,
                   color: Colors.white
                   ),),
             decoration: BoxDecoration(
               shape: BoxShape.rectangle,
               color: Colors.lightBlue,
               borderRadius: BorderRadius.circular(15)
             ),
             margin: EdgeInsets.all(8.0),
             padding: EdgeInsets.all(10.0),
             ),
             Container(
               alignment: Alignment.center,
               child: Text('Eje X: $x  Eje Y: $y',
                 style: TextStyle(
                   fontSize: 20, 
                   fontWeight: FontWeight.bold,
                   letterSpacing: 20.0,
                   color: Colors.white
                   ), ),
               decoration: BoxDecoration(
                 shape: BoxShape.rectangle,
                 color: Colors.lightBlue,
                 borderRadius: BorderRadius.circular(15)
               ) ,
               margin: EdgeInsets.all(10.0),
               padding: EdgeInsets.all(20.0),
             ),
             Container(
               decoration: BoxDecoration(
                 shape: BoxShape.circle,
                 color: Colors.lightBlue,
                 image: DecorationImage(
                   fit: BoxFit.cover,
                   image:AssetImage(imagen)
                 )
               ),
               margin: EdgeInsets.all(25.0),
               padding: EdgeInsets.all(80.0),
             ),
             Text('$a',style: TextStyle(
               fontSize: 15.0,
               fontWeight: FontWeight.bold,
               letterSpacing: 5.0
             )),
             Container(
               decoration: BoxDecoration(
                 shape: BoxShape.circle,
                 color: Colors.lightBlue,
                 image: DecorationImage(
                   fit: BoxFit.cover,
                   image:AssetImage(imagen1)
                 )
               ),
               margin: EdgeInsets.all(25.0),
               padding: EdgeInsets.all(80.0),
             ),
             Text('$b',style: TextStyle(
               fontSize: 15.0,
               fontWeight: FontWeight.bold,
               letterSpacing: 5.0
             )),
         ],
         )
          
       ),
    );
  }
@override
void initState(){
  super.initState();
  accelerometerEvents.listen(
    (AccelerometerEvent event){
       setState(() {
             x=event.x.round();
             y=event.y.round();
             if (x>0){
               a= 'Inclina a la derecha';
               imagen= "assets/flechad.jpg";
             } else if(x<0){
               a= 'Inclina a la izquierda';
               imagen= "assets/flechai.jpg";
             } else {
               a ='Horizontal';
               imagen= "assets/nx.jpg";

             }
            if (y>0){
               b= 'Inclina hacía arriba';
               imagen1= "assets/flechaar.jpg";
             } else if(y<0){
               b= 'Inclina hacía abajo';
               imagen1= "assets/flechaa.jpg";

             } else {
               b='Vertical';
               imagen1= "assets/ny.jpg";
             }
            }
      );
   });
}
}

