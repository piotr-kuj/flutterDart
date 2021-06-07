import 'dart:math';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app_tosend_k/FavouritePage.dart';



class HomePage extends StatefulWidget{
/*
  final client = UnsplashClient(
    settings: ClientSettings(credentials: AppCredentials(
      accessKey: 'X1HkK0ERMatATvj04paJRGKulfKTyuBXcUnrNuabWVc',
      secretKey: 'g3a1xN_sxFteC-AFtmd0YJQu2ivYKDRfo7Hf56PcD1o',
    )),

  );


  final photos = await client.photos.random(count: 1).goAndGet();

// The api returns a `Photo` which contains metadata about the photo and urls to download it.
  final photo = photos.first;
  final custom = photo.urls.raw.resizePhoto(width: 400, height: 400);
  int page = 0, totalPages = -1;
  List<Image> images = [];
  bool loadingImages = false;
  String keyword;

    */

  @override
  _HomePageState createState() => _HomePageState();
}

List _buildItems(int count) {
  List<Widget> listItems = List();

  for (int i = 0; i < count; i++) {
    listItems.add(
      Card(
        color: RandomColor().getColor(),
        elevation: 5.0,
        child: Center(
          child: Text(
            'Grid Item ${i.toString()}',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22.0),
          ),
        ),
      ),
    );
  }
  return listItems;
}

class RandomColor {
  Random random = Random();
  Color getColor() {
    return Color.fromARGB(random.nextInt(255), random.nextInt(255),
        random.nextInt(255), random.nextInt(255));
  }
}
List<String> images = ["https://placeimg.com/500/500/any", "https://placeimg.com/500/500/any", "https://placeimg.com/500/500/any",
  "https://placeimg.com/500/500/any", "https://placeimg.com/500/500/any","https://placeimg.com/500/500/any","https://placeimg.com/500/500/any",
  "https://placeimg.com/500/500/any","https://placeimg.com/500/500/any","https://placeimg.com/500/500/any",
  "https://placeimg.com/500/500/any","https://placeimg.com/500/500/any"];

class _HomePageState extends State<HomePage>{
  /*
  List data;
  List imagesUrl = [];
  @override
  void initState() {
    super.initState();
    fetchDataFromApi();
  }
  Future<String> fetchDataFromApi() async {
    var jsonData = await http.get(
        "https://s3-us-west-2.amazonaws.com/appsdeveloperblog.com/tutorials/files/cats.json");
    var fetchData = jsonDecode(jsonData.body);
    setState(() {
      data = fetchData;
      data.forEach((element) {
        imagesUrl.add(element['url']);
      });
    });
    return "Success";
  }
  Future<http.Response> fetchAlbum() {
    return http.get(Uri.https('jsonplaceholder.typicode.com', 'albums/1'));
  }
  */

  var imagesUrl;
  int index =0;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: GestureDetector(
          child: Hero(
            tag: 'imageHero',
            child: GridView.builder(
               itemCount: images.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
               itemBuilder: (BuildContext context, int index) {
               //Align(alignment: Alignment.center, child: Icon(Icons.favorite));
                return Image.network(images[index], fit: BoxFit.contain, alignment: Alignment.center, );
        },
      ),
      ),
          onTap: () {
             i=this.index;
             Navigator.push(context,MaterialPageRoute(builder: (_) {
             return DetailScreen();
           }
          ),
        );
      },
    ),
    ),
    );
  }
}

int i = 0;
List<String> listImg = [];

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.network(images[i],
            ),
          ),
        ),

        onDoubleTap: () {
          //Navigator.push();
        },
        onTap: () {
          Navigator.pop(context);
        },
      ),

      floatingActionButton: FlatButton.icon(onPressed: () {//new Color(Colors.red),
        //listOfIndexs.add(images[i].toString());
        //img=images[i].toString();
        listImg.add(images[i].toString());
        Navigator.pop(context, images[i]);
      }, icon: new Icon(Icons.favorite, color: Colors.red,), label: new Text('Add to Fav'),
      ),

    );
  }
}