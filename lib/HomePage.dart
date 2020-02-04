import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

  
class _HomePageState extends State<HomePage> {

  AssetImage cross = AssetImage("assets/cross.jpeg");
  AssetImage circle = AssetImage("assets/circle.jpeg");
  AssetImage edit = AssetImage("assets/edit.jpeg");
  bool isCross = true;
  List<String> gameState;
  String message;
  @override
  void initState(){
    super.initState();
    setState((){
    this.gameState= [
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
    ];
    
    this.message="";
    
   } );
  }
   void reset(){
     setState(() {
       
     isCross = true;
     this.gameState= [
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
    ];
    
     message = "";
     });
   }
  
  void playGame(int index){
    if(this.gameState[index]== "empty"){
        setState(() {
         if(this.isCross){
           this.gameState[index] = "cross";
           
         } 
         else{
           this.gameState[index] = "circle";
        
         }
         this.isCross = !this.isCross;
         this.checkWin();
        });
    }
  }

  checkWin(){
    if((gameState[0]!= 'empty')&& (gameState[0]==gameState[1])&&(gameState[1]==gameState[2])){
      setState(() {
       this.message = "${this.gameState[0]} wins";
      
      });
    }
    else if((gameState[3]!= 'empty')&& (gameState[3]==gameState[4])&&(gameState[4]==gameState[5])){
      setState(() {
       this.message = "${this.gameState[3]} wins";
       
      });
    }
    else if((gameState[6]!= 'empty')&& (gameState[6]==gameState[7])&&(gameState[7]==gameState[8])){
      setState(() {
       this.message = "${this.gameState[6]} wins";
       
      });
    }
    else if((gameState[0]!= 'empty')&& (gameState[0]==gameState[3])&&(gameState[3]==gameState[6])){
      setState(() {
       this.message = "${this.gameState[0]} wins";
       
      });
    }
    else if((gameState[1]!= 'empty')&& (gameState[1]==gameState[4])&&(gameState[4]==gameState[7])){
      setState(() {
       this.message = "${this.gameState[1]} wins";
    
      });
    }
    else if((gameState[2]!= 'empty')&& (gameState[2]==gameState[5])&&(gameState[5]==gameState[8])){
      setState(() {
       this.message = "${this.gameState[2]} wins";
      
      });
    }
     else if((gameState[0]!= 'empty')&& (gameState[0]==gameState[4])&&(gameState[4]==gameState[8])){
      setState(() {
       this.message = "${this.gameState[0]} wins";
      
      });
    }
     else if((gameState[2]!= 'empty')&& (gameState[2]==gameState[4])&&(gameState[4]==gameState[6])){
      setState(() {
       this.message = "${this.gameState[2]} wins";
       
      });
    }
    else if(!gameState.contains("empty"))
    setState(() {
      this.message="draws";
    });
  }
  AssetImage getImage(String value){
    switch (value){
    case('empty'):
      return edit;
      break;
    case('cross'):
      return cross;
      break;
    case('circle'):
    return circle;
    break;
    }
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
          body: Column(
            children: <Widget>[
              Expanded(
                child: GridView.builder(
                   
                  itemCount: this.gameState.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,),
                  itemBuilder: (BuildContext context, index){
                      return SizedBox(
                        width: 90,
                        height: 90,
                        child: MaterialButton(
                          onPressed:()=> this.playGame(index),
                         child: Image(
                           image: this.getImage(this.gameState[index])
                         )
                        ),
                      )
                      ;
                  }         
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  this.message,
                  style:TextStyle(fontSize:30,
                  )
                ),
              ),
              Container(
                child: RaisedButton(
                  child: Text("Reset",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  onPressed: ()=> reset(),

                ),
              )
            ],
          ),
          
    );
  }
}
  