import 'package:flutter/material.dart';
//import '../widget/rateClip.dart';

class RateVideo extends StatefulWidget {
  RateVideo({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RateVideoState createState() => _RateVideoState();
}

class _RateVideoState extends State<RateVideo> {
  final List<String> pic = [
    'assets/images/LG5.png',
    'assets/images/stress.png',
    'assets/images/stress.png',
    'assets/images/normal.png',
    'assets/images/happy.png',
    'assets/images/stress.png',
    'assets/images/normal.png',
    'assets/images/happy.png'
  ];

@override
  Widget build(BuildContext context) {
    return Container(
        //margin: const EdgeInsets.only(right: 10, left: 10, top: 200),
        height: 60,
        width: MediaQuery.of(context).size.width*0.75,
        //width: 40,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: pic.length,
            itemBuilder: (context, index) {
              return  Container(
                margin: const EdgeInsets.only(right: 10),
                 child: InkWell(
                        onTap: () {
                        }, //I am the clickable child
                        child: Image.asset(pic[index].toString(), height: 70, width: 70,),
                  ));
            }));   
  }

}