import 'package:flutter/material.dart';
import 'package:flutter_app/api_manager.dart';
import 'package:flutter_app/newsinfo.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Welcome> _newsmodel;
  @override
  void initState() {
    // TODO: implement initState
    _newsmodel = API_Manager().getNews();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.pink,
        title: Text("NEWS"),
      ),
      body: Container(
        child: FutureBuilder <Welcome>(future: _newsmodel, builder: (context,snapshoat){
            if(snapshoat.hasData){
              return ListView.builder(itemCount: snapshoat.data.articles.length, itemBuilder: (context,index){
                    var artical = snapshoat.data.articles[index];
                return Container(
                  color: Colors.white,
                  height: 100,
                  child: Row(
                    children:<Widget> [
                      Card(
                        clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24),),
                        child: AspectRatio(aspectRatio: 1,child: Image.network(artical.urlToImage,fit:BoxFit.cover),),),
                      Flexible(child:
                      Column(children:
                      [Text(artical.title,overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        Text(artical.description,maxLines: 2,overflow: TextOverflow.ellipsis)],)),
                    ],
                  ),
                );
              });
            }
            else
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      );
  }
}
