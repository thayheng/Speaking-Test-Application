import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Speaking Test Application'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  FlutterSound _flutterSound = new FlutterSound();

 
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(
            child: Text(
          widget.title,
          textAlign: TextAlign.center,
        )),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                  const Radius.circular(10.0),
                )),
              ),
            ),
          ),
          Container(
            constraints:BoxConstraints(
              minHeight: 300
            ),
            margin: EdgeInsets.only(top: 80,left: 10,right: 10),
            padding: EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all()),
            child: Column(
              children: <Widget>[
                Text(
                  "data",
                  style: TextStyle(fontSize: 18),
                ),
                Text("Result")
              ],
            ),
          ),
          Expanded(child: SizedBox()),
          RaisedButton(
            onPressed:() {
              if(_flutterSound.isRecording) {
                _stopRecorder();
                return;
              }
               _starRecorder();
            },
            child: Text("Record"),
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.red)),
          ),
         InkWell(
           onTap: (){},
           child: Container(
             margin: EdgeInsets.all(10),
             padding: EdgeInsets.all(16),
             height: 50,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(8),
               color: Colors.lightBlue
             ),
             width: MediaQuery.of(context).size.width,
             child: Center(child: Text("Submit",style: TextStyle(color: Colors.black),)),
           )
         ),
          SizedBox(
            height: 20,
          ),
          
        ],
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );

   
  }

   void _starRecorder() {
      Future<String> result = _flutterSound.startRecorder(null);
      result.then((path){
        print("Rcorder Path" + path);  
      });
    }

    void _stopRecorder() {
      _flutterSound.stopRecorder();
    }
 
}
