import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de navegçaõ!!',
      theme: ThemeData(
        primarySwatch: Colors.blue, 
      ),
      home:  HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget{
  TextEditingController _controller = new TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela inicial"),
      ),
      body:Column(
        children: [
          TextField(
            controller:_controller,
          ),
          Center(
            child: ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondScreen(title:_controller.text)
                     )
                );
              },
              
              child: Text("ir para a segunda tela"),
            ),
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
 final String title;

  const SecondScreen({required this.title});
  @override
  State<SecondScreen> createState() => SeconScreenState();


}


class SeconScreenState extends State<SecondScreen>{

  int _count = 0;

  void Contador(count){
    setState((){
     _count++;
     print(_count);
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("segunda tela"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              $title,
              style:TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child:Text("Valor da tela inicial ")
            ),
            Text("Valor contador" + " : " + _count.toString()),
            ElevatedButton(
              onPressed: (){
                Contador(_count);
              },
              child: Text("Clique para implementar"),
            )
          ],
        ),
      ),
    );
  }
}


