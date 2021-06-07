import 'package:flutter/material.dart';
import 'package:flutter_app_tosend_k/HomePage.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class FavouritePage extends StatefulWidget {
  @override
  _FavouritePageState createState() => _FavouritePageState();
}

List<String> listOfIndexs= [];
String url;

/*
Map<int, String> imageMap = {};
String img;
var file = DefaultCacheManager().getSingleFile(img);
*/

class _FavouritePageState extends State<FavouritePage> {

  bool duplicateOfImages(String url) {
    if(!listOfIndexs.contains(url)){
      return true;
    }
  }

  bool shsh(List<String> x) {
    if( x!=null){
      return true;
    }
  }


  @override
  Widget build(BuildContext context) {
    listOfIndexs=listImg;

    /*
    int a=0, b=0;
    for(var item in listOfIndexs ){
      for(var item2 in listImg) {
        if(a==b){
          if(item!=item2){
            int x =listOfIndexs.indexOf(item);
            listOfIndexs.remove(x);
          }
        }
        b++;
      }
      a++;
    }
    */
    /*
    int y =0;
    for(var it in listOfIndexs){
      for(var it2 in listOfIndexs){
        if(it2!=null)
        if(it==it2) {
          listOfIndexs.remove(it);
        }
      }
    }
    */

     //int d = listOfIndexs.getRange(0, listImg.length);

    return new Scaffold(
      body: new Center(
        child: GridView.builder(
        itemCount: images.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
        itemBuilder: (BuildContext context, int index) {
          //if(duplicateOfImages(url)) {
          //if(shsh(listOfIndexs)) {
            return Image.network(listOfIndexs[index], fit: BoxFit.contain,
              alignment: Alignment.center,);
         // }
          //}
        },
      ),
      ),
    );
    /*
    return new Scaffold(
      body: new Center(
        child: GridView(
          children: [
            Image.network(listOfIndexs[i])
          ],
        ),
      ),
    );
  */
  }
}

