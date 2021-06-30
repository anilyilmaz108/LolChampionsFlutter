import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:lol/component/my_card.dart';
import 'package:lol/model/items.dart';
import 'package:lol/model/review_item.dart';
import 'package:lol/view/review_page.dart';
import 'package:search_page/search_page.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Champion> championList = [];
  final String localJsonPath = 'assets/dummy_data.json';

  Future<void> loadLocalJson() async {
    var dummyData = await rootBundle.loadString(localJsonPath);
    List<dynamic> decodedJson = json.decode(dummyData);
    championList = decodedJson.map((champ) => Champion.fromMap(champ)).toList();
    setState(() {
      return championList;
    });
  }



  @override
  void initState() {
    super.initState();
    loadLocalJson();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Champions"),
          centerTitle: true,
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        tooltip: 'Search champion',
        onPressed: () => showSearch(
          context: context,
          delegate: SearchPage<Champion>(
            items: championList,
            searchLabel: 'Search champion',
            suggestion: Center(
              child: Text('Filter champion by name, title or image'),
            ),
            failure: Center(
              child: Text('No champion found'),
            ),
            filter: (person) => [
              person.name,
              person.title,
              person.icon
            ],
            builder: (person) => ListTile(
              title: Text(person.name),
              subtitle: Text(person.title),
              leading: ClipOval(
                child: Image.network('${person.icon}'),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewPage(
                    ReviewItem(
                      title: person.title,
                      name: person.name,
                      icon: person.icon,
                      description: person.description,
                      tags: person.tags,
                      hp: person.hp,
                      movespeed: person.movespeed,
                      attackspeed: person.attackspeed,
                      attackrange: person.attackrange,
                      attackdamage: person.attackdamage,
                      armor: person.armor,
                    )
                )));
              },
            ),
          ),
        ),
      ),
      body: championList.length == 0
          ? const Center(child: CircularProgressIndicator())
          : listItems(context, championList),
    );
  }



  Widget listItems(BuildContext context, List<Champion> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return PersonCard(
          title: list[index].title,
          name: list[index].name,
          icon: list[index].icon,
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewPage(
              ReviewItem(
                title: list[index].title,
                name: list[index].name,
                icon: list[index].icon,
                description: list[index].description,
                tags: list[index].tags,
                hp: list[index].hp,
                movespeed: list[index].movespeed,
                attackspeed: list[index].attackspeed,
                attackrange: list[index].attackrange,
                attackdamage: list[index].attackdamage,
                armor: list[index].armor,
              )
            )));
          },
        );
      },
    );
  }


}




