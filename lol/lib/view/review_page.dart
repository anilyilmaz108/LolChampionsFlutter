import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lol/model/review_item.dart';


class ReviewPage extends StatelessWidget {
  final ReviewItem _reviewItem;
  ReviewPage(this._reviewItem);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${_reviewItem.name} - ${_reviewItem.title}"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Image.network('${_reviewItem.icon}')),
              ),
              Text("${_reviewItem.tags}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text("${_reviewItem.description}",style: TextStyle(fontSize: 16,color: Colors.black87),),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.hammer, color: Colors.amber,),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text("${_reviewItem.attackdamage}",style: TextStyle(fontSize: 20),),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Icon(FontAwesomeIcons.shieldAlt, color: Colors.amber,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text("${_reviewItem.armor}",style: TextStyle(fontSize: 20),),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.locationArrow, color: Colors.amber,),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text("${_reviewItem.attackrange}",style: TextStyle(fontSize: 20),),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left : 30.0),
                          child: Icon(FontAwesomeIcons.wind, color: Colors.amber,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text("${_reviewItem.attackspeed}",style: TextStyle(fontSize: 20),),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.shoePrints, color: Colors.amber,),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text("${_reviewItem.movespeed}",style: TextStyle(fontSize: 20),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Icon(FontAwesomeIcons.heart, color: Colors.amber,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text("${_reviewItem.hp}",style: TextStyle(fontSize: 20),),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
