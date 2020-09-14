import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import '../widget/rateClip.dart';

class RateVideo extends StatefulWidget {
  RateVideo({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RateVideoState createState() => _RateVideoState();
}

class _RateVideoState extends State<RateVideo> {
  final List<String> pic = [
    // 'assets/images/LG5.png',
    // 'assets/images/stress.png',
    // 'assets/images/stress.png',
    // 'assets/images/normal.png',
    // 'assets/images/happy.png',
    // 'assets/images/stress.png',
    // 'assets/images/normal.png',
    // 'assets/images/happy.png'

    'Calm',
    // 'Happy',
    'Surprised',
    'Funny',
    'Sleepy'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.only(right: 10, left: 10, top: 200),
      height: 100,
      width: MediaQuery.of(context).size.width * 0.75,
      //width: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: pic.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: () {
                print(pic[index]);

                // print(new DateFormat.yMMMd().format(new DateTime.now()));
              },
              child: Container(
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/' + pic[index].toString() + '.png',
                      height: 50,
                      width: 50,
                    ),
                    Text(pic[index].toString())
                  ],
                ),
              ),
            ),
            //    child: InkWell(
            //           onTap: () {
            //           },

            //            //I am the clickable child
            //   //          child: Stack(
            //   // children: <Widget> [
            //         child:Image.asset('assets/images/'+pic[index].toString()+'.png', height: 70, width: 70,),
            //         //Padding(padding: EdgeInsets.fromLTRB(0, 0, 20, 20)),
            //       //Text(pic[index].toString())
            //   //])
            // )
          );
        },
      ),
    );
  }
}
