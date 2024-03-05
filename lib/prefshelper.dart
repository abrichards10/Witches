// Load and obtain the shared preferences for this app.
import 'package:flutter/material.dart';
import 'package:witch_unite/prefs.dart';
import 'package:witch_unite/prefs_keys.dart';

final interests = [
  "Sports",
  "Music",
  "Art",
  "Cooking",
  "Travel",
  "Reading",
  "Gaming",
  "Fitness",
  "Outdoor activities",
  "Technology",
  "Fashion",
  "Film and television",
  "Gardening",
  "DIY and crafts",
  "Health and wellness",
  "Writing",
  "Animals and pets",
  "History and culture",
  "Science and nature",
  "Languages",
  "Philosophy and ethics",
  "Volunteering and charity work",
  "Music festivals and concerts",
  "Food festivals and culinary events",
  "Fashion design and styling",
  "Exploring local cuisines",
  "Adventure sports",
  "Board games and tabletop gaming",
  "Comic books and graphic novels",
  "Virtual reality experiences",
  "Historical reenactments",
  "Sustainability and eco-friendly living",
  "Singing and vocal performance",
  "Urban exploration and photography",
  "Fitness challenges and competitions",
  "Astrology and horoscopes",
  "Entrepreneurship and startups",
  "Collecting",
  "Creative writing and storytelling",
  "Podcasting and audio production",
  "Conspiracy theories and paranormal phenomena",
  "Dance and choreography",
  "Martial arts and self-defense",
  "Antiques and antiquities",
  "Psychology and mental health awareness",
  "Amateur astronomy and stargazing",
  "Documentary filmmaking",
  "Magic tricks and illusions"
];

final hobbies = [
  "Painting",
  "Playing an instrument",
  "Photography",
  "Baking",
  "Scuba diving",
  "Model building",
  "Woodworking",
  "Calligraphy",
  "Skiing or snowboarding",
  "Skydiving",
  "Surfing",
  "Chess",
  "Stamp collecting",
  "Hiking",
  "Fishing",
  "Bird watching",
  "Rock climbing",
  "Cycling",
  "Model train building",
  "Reading",
  "Writing poetry",
  "Gardening",
  "Knitting or crocheting",
  "Martial arts",
  "Yoga",
  "Dancing",
  "Singing",
  "Acting",
  "Playing video games",
  "Cooking",
  "Sailing",
  "Pottery",
  "Collecting coins",
  "Camping",
  "Embroidery",
  "Metal detecting",
  "Origami",
  "Target shooting",
  "Wood carving",
  "Astrology",
  "Horseback riding",
  "Volunteering",
  "Beer brewing",
  "Tattooing",
  "Paragliding",
  "Glassblowing",
  "Soap making",
  "Beekeeping",
  "Stargazing"
];

final List<Widget> painters = <Widget>[];

class PrefsHelper {
  static final PrefsHelper _helper = PrefsHelper._internal();

  factory PrefsHelper() {
    return _helper;
  }

  PrefsHelper._internal();

  String get accountName => Prefs.getString(PrefKeys.kname) ?? "";
  String get accountEmail => Prefs.getString(PrefKeys.kaccountLocation) ?? "";

  String get photo => Prefs.getString(PrefKeys.kphoto) ?? "";

  // String get description => Prefs.getString(PrefKeys.description) ?? "";
  String get profession =>
      Prefs.getString(PrefKeys.kprofession) ?? "Software Engineer";
  String get location => Prefs.getString(PrefKeys.klocation) ?? "San Francisco";

  List<String> get savedInterests =>
      Prefs.getStringList(PrefKeys.ksavedInterests) ?? [];

  set accountName(String value) => Prefs.setString(PrefKeys.kname, value);
  set accountEmail(String value) =>
      Prefs.setString(PrefKeys.kaccountLocation, value);

  set photo(String value) => Prefs.setString(PrefKeys.kphoto, value);
  // set description(String value) => Prefs.setString(PrefKeys.description, value);
  set profession(String value) => Prefs.setString(PrefKeys.kprofession, value);
  set location(String value) => Prefs.setString(PrefKeys.klocation, value);

  set savedInterests(List<String> value) =>
      Prefs.setStringList(PrefKeys.ksavedInterests, value);
}
