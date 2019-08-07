import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;



void main() async{
  List _data = await getJson();
  String _body = '';


  for(int i=0; i< _data.length; i++) {
    print(_data[i]['title']);
    print('body: ${_data[i]['body']}');
  }
  _body= _data[0]['body'];
    runApp(new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.amber,
          title: new Text('JSON Parse'),
          centerTitle: true,

        ),
        body: new Center(
          child: new ListView.builder(
            itemCount: _data.length,
              padding: const EdgeInsets.all(14.5),

              itemBuilder: (BuildContext context, int position){
              return Column(
                children: <Widget>[
                  new Divider(height: 5.5),
                  new ListTile(
                    title: Text("${_data[position]['title']}"),

                    subtitle: Text("${_data[position]['body']}",
                      style: new TextStyle(fontSize: 13.9),),

                    leading: new CircleAvatar(
                      backgroundColor: Colors.yellowAccent,
                      child: Text("${_data[position]['body'][0]}",
                        style: new TextStyle(fontSize: 20.9, color: Colors.orange)),
                      ),



                  )
                ],
              );
              })
        ),
      ),
    ));
  }


Future<List> getJson() async{
  String apiUrl= 'https://jsonplaceholder.typicode.com/posts';

  http.Response response = await http.get(apiUrl);

  return json.decode(response.body);


}