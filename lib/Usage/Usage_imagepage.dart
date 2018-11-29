import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'Usage_list.dart';


class usage_imagepage extends StatelessWidget {
  final Record rec;
  final int order;
  usage_imagepage(this.rec, this.order);




  @override
  Widget build(BuildContext context1) {

    List<Widget> page = [ImagePage(0,rec,context1), ImagePage(0,rec,context1), ImagePage(0, rec,context1)];
    return MaterialApp(

     home : PageView.builder(
         controller: PageController(initialPage: 1,
         viewportFraction: 1.0),

         itemCount: page.length,
         itemBuilder: (BuildContext context, int index)  => page[index] )

    );
  }
}


class ImagePage extends StatelessWidget {
  final BuildContext context1;
  final Record rec;
  final int index ;
  ImagePage(this.index, this.rec, this.context1);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector( 
            onTap: ()=>Navigator.pop(context1),
            child: Center(
              child: Container(
                width: 500.0,

                child: Image.network(rec.photoUrl[index], fit : BoxFit.fitWidth),
              ),
            ),
          ),
        ],
      ),



    );
  }


}