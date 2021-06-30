import 'dart:convert';

List<Champion> championFromMap(String str) => List<Champion>.from(json.decode(str).map((x) => Champion.fromMap(x)));

String championToMap(List<Champion> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Champion {
  Champion({
    this.name,
    this.title,
    this.icon,
    this.description,
    this.tags,
    this.hp,
    this.movespeed,
    this.armor,
    this.attackrange,
    this.attackdamage,
    this.attackspeed
  });

  String name;
  String title;
  String icon;
  String description;
  String tags;
  String hp;
  String movespeed;
  String armor;
  String attackrange;
  String attackdamage;
  String attackspeed;



  factory Champion.fromMap(Map<String, dynamic> json) => Champion(
    name: json["name"],
    title: json["title"],
    icon: json["icon"],
    description: json["description"],
    tags: json["tags"],
    hp: json["hp"],
    movespeed: json["movespeed"],
    armor: json["armor"],
    attackrange: json["attackrange"],
    attackdamage: json["attackdamage"],
    attackspeed: json["attackspeed"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "title": title,
    "icon": icon,
    "description": description,
    "tags": tags,
    "hp": hp,
    "movespeed": movespeed,
    "armor": armor,
    "attackrange": attackrange,
    "attackdamage": attackdamage,
    "attackspeed": attackspeed,
  };
}

