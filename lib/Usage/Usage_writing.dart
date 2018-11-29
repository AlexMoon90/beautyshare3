import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'dart:async';
import 'dart:math';
import 'dart:io';
import 'package:beautyshare3/fancyButton.dart';
import  'package:english_words/english_words.dart';
import 'package:easy_alert/easy_alert.dart';




class Usagewriting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
       return MaterialApp(
      color: Colors.white,
      debugShowCheckedModeBanner: false,

      home: MyCustomForm(context)
    );
  }
}

// Create a Form Widget
class MyCustomForm extends StatefulWidget {
  @override
  final BuildContext context;
  MyCustomForm(this.context);
  MyCustomFormState createState() => MyCustomFormState();
}

class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a GlobalKey<FormState>, not a GlobalKey<MyCustomFormState>!
  GlobalKey _formKey = GlobalKey();

  GeoPoint shoploca = GeoPoint(0.0, 0.0);
  double Shop_lat = 0.0;
  double Shop_int = 0.0;
  final TextEditingController userid_controller = new TextEditingController();
  final TextEditingController shoptitle_controller =  new TextEditingController();
  final TextEditingController styleist_controller = new TextEditingController();
  final TextEditingController reviewtext_controller =   new TextEditingController();
  final TextEditingController favorite_controller = new TextEditingController();


  String url1;
  Uri uri2;

  File selectImage1;
  File selectImage2;
  File selectImage3;

  String imagename1;
  String imagename2;
  String imagename3;

  Future getImage1() async {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      selectImage1 = tempImage;
    });
  }


  Future getImage2() async {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      selectImage2 = tempImage;
    });
  }

  Future getImage3() async {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      selectImage3 = tempImage;
    });
  }

  cancelcall1() {
    setState(() {
      selectImage1 = null;
    });
  }

  cancelcall2() {
    setState(() {
      selectImage2 = null;
    });
  }

  cancelcall3() {
    setState(() {
      selectImage3 = null;
    });
  }


 /* postdbinform (BuildContext context) {
    Alert.toast(context,
        "성공적으로 등록이 되었습니다",
        position: ToastPosition.bottom, duration: ToastDuration.long);
  } */



  String dropdown1Value = '헤어';  //서비스종류 드롭다운버튼에 초기값 설정, 이용후기 내용에 이변수로 저장함
  bool imagenull;


  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above

   if(selectImage1!=null&&selectImage2!=null&&selectImage3!=null) {imagenull= true;} else {imagenull=false;} //사진을 3가지 모두 선택하였는지 체크
   _showDialog() {
     // flutter defined function
     showDialog(
       context: context,
       builder: (BuildContext context2) {
         // return object of type Dialog
         return AlertDialog(
           title: new Text("수고하셨습니다 작성하신 내용을 등록하겠습니다"),
           // content: new Text("Alert Dialog body"),
           actions: <Widget>[
             // usually buttons at the bottom of the dialog
             new FlatButton(
               child: new Text("확인"),
               onPressed: () {
                 Navigator.of(context2).pop();
                 Navigator.of(widget.context).pop();
                 firestore_upload();

               },
             ),

             new FlatButton(
               child: new Text("취소"),
               onPressed: () {
                 Navigator.of(context).pop();

               },
             ),

           ],
         );
       },
     );
   }

   alertnullphoto () {
     Alert.toast(context,
         "사진은 3개 모두 선택하셔야 합니다",
         position: ToastPosition.bottom, duration: ToastDuration.long);
   }




   return
      Scaffold(

        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBar(
            elevation: 2.0,
            backgroundColor: Colors.white,
            title: Padding(
              padding: const EdgeInsets.only(top : 13.0),
              child: Text( '이용후기 작성',

                style: TextStyle(color: Colors.black),
              ),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top : 15.0),
                child: IconButton(
                    icon: Icon(
                      Icons.close,
                      color:  Color.fromRGBO(227, 101, 180, 1.0),
                    ),
                    onPressed: () {
                      Navigator.pop(widget.context);
                    }),
              )
            ],
          ),
        ),
        body:     Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              // call this method here to hide soft keyboard
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: ListView(children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 30.0,
                  top: 15.0,
                ),
                child: Row(
                  children: <Widget>[
                    Text(
                      '이용 후기 사진',
                      style: TextStyle(fontSize: 20.0),
                    )
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Card(
                      child: GestureDetector(
                        onTap: getImage1,
                        onLongPress: cancelcall1,
                        child: Container(
                          padding: EdgeInsets.all(0.0),
                          height: 100.0,
                          width: 100.0,
                          child: selectImage1 == null
                              ? Icon(
                                  Icons.add,
                                  size: 35.0,
                                )
                              : Image.file(selectImage1, height: 120.0, width: 120.0),
                        ),
                      ),
                    ),
                    Card(
                      child: GestureDetector(
                        onTap: getImage2,
                        onLongPress: cancelcall2,
                        child: Container(
                          padding: EdgeInsets.all(0.0),
                          height: 100.0,
                          width: 100.0,
                          child: selectImage2 == null
                              ? Icon(
                            Icons.add,
                            size: 35.0,
                          )
                              : Image.file(selectImage2, height: 120.0, width: 120.0),
                        ),
                      ),
                    ),

                    Card(
                      child: GestureDetector(
                        onTap: getImage3,
                        onLongPress: cancelcall3,
                        child: Container(
                          padding: EdgeInsets.all(0.0),
                          height: 100.0,
                          width: 100.0,
                          child: selectImage3 == null
                              ? Icon(
                            Icons.add,
                            size: 35.0,
                          )
                              : Image.file(selectImage3, height: 120.0, width: 120.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                children : [Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25.0),
                  child: Text('이용서비스 종류    : ', style : TextStyle(fontSize: 18.0),),
                ),
                 Expanded(
                  child: DropdownButton(
                      items:
                       <String>['헤어','네일','스킨','메이크업','속눈썹', '왁싱','마사지', '태닝', '기타'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child : Text(value),
                        );
                      }
                      ).toList(),
                      value: dropdown1Value,
                      onChanged: (String newValue){
                    setState(() {
                      dropdown1Value = newValue;
                    });
                     }

                  ),
                ),]
              ),


              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Padding(
                      padding:
                          const EdgeInsets.only(right: 20.0, left: 20.0, top: 10.0),
                      child: TextFormField(
                        controller: shoptitle_controller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          labelText: '뷰티샵 상호를 입력해주세요',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return '입력해주셔야 합니다';
                          }

                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 20.0, left: 20.0, top: 10.0),
                      child: TextFormField(
                        controller: styleist_controller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          labelText: '담당자 이름을 입력해주세요',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return '입력해주셔야 합니다';
                          }

                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 20.0, left: 20.0, top: 10.0, bottom : 80.0),
                      child: TextFormField(
                        controller: reviewtext_controller,
                        maxLength: 300,
                        maxLines: 15,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          labelText: '이용후기를 입력해주세요',
                          hintText: '''이용후기 내용은 이렇게 적어주세요 
사진으로는 전하지 못한 경험들을적어주시면 
보시는 분들이 판단하는데 
도움을 많이 받을 것입니다 ''',
                          hintStyle: TextStyle(
                            color: Colors.black26,
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return '입력해주셔야 합니다';
                          }

                        },
                      ),
                    ),
                        ],
                ),
              ),


            ]),
          ),
        ),
        floatingActionButton: Fancybutton('작성을 완료합니다', _showDialog, alertnullphoto,imagenull ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,


    );
  }
  //사진파일을 유저아이디를 폴더로 하고 현재날자와시간을 파일명으로 지정 후에

  Future firestore_upload() async {

    String userid_re = WordPair.random().toString()+ Random().nextInt(100).toString();
    imagename1 = '${userid_re}' + '/${DateTime.now()}' + '1.jpg';
    imagename2 = '${userid_re}' + '/${DateTime.now()}' + '2.jpg';
    imagename3 = '${userid_re}' + '/${DateTime.now()}' + '3.jpg';
    List imagename = [imagename1, imagename2, imagename3];

    await (uploadImage(selectImage1, selectImage2, selectImage3).then((
        List data) {
      postToFireStore(photoUrl: data,
          userid: userid_re,
          shoptitle: shoptitle_controller.text,
          stylistname: styleist_controller.text,
          serv_class: dropdown1Value,
          reviewtext: reviewtext_controller.text,
          photoloca: imagename);
    }));


  }



  // 사진 3개를 Firestor에 저장하고 URL 다운로드 주소를 받아오는 기능
  Future<List> uploadImage(var imageFile1, var imageFile2, var imageFile3 ) async {

    String url1, url2, url3;
    FirebaseStorage storage = FirebaseStorage.instance;

    if(imageFile1 != null) {
      StorageReference ref1 = storage.ref().child(imagename1);
      StorageUploadTask uploadTask1 = ref1.putFile(imageFile1);
      var dowurl1 = await ( await uploadTask1.onComplete).ref.getDownloadURL();
      url1 = dowurl1.toString();
    }
    if(imageFile2 != null) {
      StorageReference ref2 = storage.ref().child(imagename2);
      StorageUploadTask uploadTask2 = ref2.putFile(imageFile2);
      var dowurl2 = await (await uploadTask2.onComplete).ref.getDownloadURL();
      url2 = dowurl2.toString();
    }
    if(imageFile3 != null) {
      StorageReference ref3 = storage.ref().child(imagename3);
      StorageUploadTask uploadTask3 = ref3.putFile(imageFile3);
      var dowurl3 = await (await uploadTask3.onComplete).ref.getDownloadURL();
      url3 = dowurl3.toString();
    }
    return [url1, url2, url3];
  }
// 파이어스토어 리뷰정보를 저장하는 기능
  void postToFireStore(
      {String userid, String shoptitle, String stylistname, String serv_class, String reviewtext, List photoUrl, List photoloca}) async {
    var reference = Firestore.instance.collection('Review');
    reference.add({
      "userid": userid,
      "shoptitle": shoptitle,
      "stylistname" : stylistname,
      "photoUrl": photoUrl,
      "serv_class" : serv_class,
      "reviewtext" : reviewtext,
      "photoloca"  : photoloca,
      "favor_review" : 0,
      "shop_loca" : shoploca,
      "timestamp": Timestamp.now(),
    });
  }






}

