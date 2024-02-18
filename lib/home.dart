// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:witch_unite/cards/content.dart';
import 'package:witch_unite/cards/details_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url = "https://randomuser.me/api/?results=50";
  bool isLoading = true;
  late List usersData;
  final List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  Future getData() async {
    var response = await http.get(
      Uri.parse(url),
      headers: {"Accept": "application/json"},
    );

    List data = jsonDecode(response.body)['results'];
    setState(() {
      usersData = data;

      if (usersData.isNotEmpty) {
        for (int i = 0; i < usersData.length; i++) {
          _swipeItems.add(SwipeItem(
              content: Content(text: usersData[i]['name']['first']),
              likeAction: () {
                _scaffoldKey.currentState?.showSnackBar(SnackBar(
                  content: Text("Liked "),
                  //  content: Text("Liked ${_names[i]}"),
                  duration: Duration(milliseconds: 500),
                ));
              },
              nopeAction: () {
                _scaffoldKey.currentState?.showSnackBar(SnackBar(
                  content: Text("Nope ${usersData[i]['name']['first']}"),
                  duration: Duration(milliseconds: 500),
                ));
              },
              superlikeAction: () {
                _scaffoldKey.currentState?.showSnackBar(SnackBar(
                  content: Text("Superliked ${usersData[i]['name']['first']}"),
                  duration: Duration(milliseconds: 500),
                ));
              },
              onSlideUpdate: (SlideRegion? region) async {
                // print("Region $region");
              }));
        } //for loop
        _matchEngine = MatchEngine(swipeItems: _swipeItems);
        isLoading = false;
      } //if
    }); // setState
  } // getData

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBody: true,
      key: _scaffoldKey,
      appBar: AppBar(
        toolbarHeight: screenWidth * .12,
        title: Text(
          'Witch Trials',
          style: TextStyle(
            fontSize: screenWidth * .08,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(
              0,
              0,
              screenWidth * .04,
              0,
            ),
            child: CircleAvatar(
              child: IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {},
                // size: screenWidth * .05,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: SizedBox(
                      height: screenHeight * .6,
                      child: SwipeCards(
                        matchEngine: _matchEngine!,
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              Card(
                                margin: EdgeInsets.all(
                                  screenWidth * .04,
                                ),
                                elevation: 8.0,
                                shadowColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(
                                    screenWidth * .01,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(24.0),
                                    child: Image.network(
                                      "https://images.pexels.com/photos/3532552/pexels-photo-3532552.jpeg?cs=srgb&dl=pexels-hitesh-choudhary-3532552.jpg&fm=jpg",
                                      // usersData[index]['picture']
                                      //     ['large'], //TODO: GETS PICTURE
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(
                                  screenWidth * .04,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(24.0)),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: screenWidth * .2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(24.0),
                                      bottomRight: Radius.circular(24.0),
                                    ),
                                  ),
                                  margin: EdgeInsets.fromLTRB(
                                    screenWidth * .07,
                                    0,
                                    screenWidth * .06,
                                    screenWidth * .06,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                            70,
                                            0,
                                            0,
                                            0,
                                          ),
                                          border: Border(),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Flexible(
                                              child: Padding(
                                                padding: EdgeInsets.all(
                                                  screenWidth * .01,
                                                ),
                                                child: Text(
                                                  usersData[index]['name']
                                                          ['first'] +
                                                      ", " +
                                                      usersData[index]['dob']
                                                              ['age']
                                                          .toString(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  softWrap: false,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: screenWidth * .06,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Padding(
                                                padding: EdgeInsets.all(
                                                  screenWidth * .01,
                                                ),
                                                child: Text(
                                                  usersData[index]['location']
                                                          ['city'] +
                                                      ", " +
                                                      usersData[index]
                                                              ['location']
                                                          ['country'],
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  softWrap: false,
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: screenWidth * .04,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(
                                          screenWidth * .02,
                                        ),
                                        child: ElevatedButton.icon(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailsPage(
                                                  name: usersData[index]['name']
                                                      ['first'],
                                                  age: usersData[index]['dob']
                                                          ['age']
                                                      .toString(),
                                                  gender: usersData[index]
                                                      ['gender'],
                                                  city: usersData[index]
                                                      ['location']['city'],
                                                  state: usersData[index]
                                                      ['location']['state'],
                                                  country: usersData[index]
                                                      ['location']['country'],
                                                  phone: usersData[index]
                                                          ['phone']
                                                      .toString(),
                                                  email: usersData[index]
                                                      ['email'],
                                                  avatar: usersData[index]
                                                      ['picture']['large'],
                                                ),
                                              ),
                                            );
                                          },
                                          icon: Icon(
                                            Icons.directions,
                                            color: Color(0xFF210255),
                                          ),
                                          label: Text(
                                            "Snoop",
                                            style: TextStyle(
                                              fontSize: screenWidth * .045,
                                              overflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF210255),
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            elevation: 8.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        onStackFinished: () {
                          _scaffoldKey.currentState!.showSnackBar(SnackBar(
                            content: Text("Stack Finished"),
                            duration: Duration(
                              milliseconds: 500,
                            ),
                          ));
                        },
                        itemChanged: (SwipeItem item, int index) {
                          print("item: ${item.content.text}, index: $index");
                        },
                        upSwipeAllowed: true,
                        fillSpace: true,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: screenWidth * .13,
                        width: screenWidth * .13,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 2,
                            )
                          ],
                        ),
                        child: CircleAvatar(
                          child: IconButton(
                            icon: Image.asset("assets/LeftWitch.png"),
                            onPressed: () {
                              _matchEngine!.currentItem?.nope(); // NOT A MATCH
                            },
                            // child:  Text("Nope"),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 2,
                            )
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 40.0,
                          child: CircleAvatar(
                            radius: 35.0,
                            child: Center(
                              child: IconButton(
                                icon: Image.asset("assets/Owl.png"),
                                iconSize: screenWidth * .09,
                                onPressed: () {
                                  _matchEngine!.currentItem?.superLike();
                                },
                                //child:  Text("Superlike"),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: screenWidth * .13,
                        width: screenWidth * .13,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 2,
                            )
                          ],
                        ),
                        child: CircleAvatar(
                          child: IconButton(
                            icon: Image.asset("assets/RightWitch.png"),
                            onPressed: () {
                              _matchEngine!.currentItem?.like();
                            },
                            //  child:  Text("Like"),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
      ),
      bottomNavigationBar: SizedBox(
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.0),
            topRight: Radius.circular(50.0),
          ),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            iconSize: screenWidth * .08,
            enableFeedback: true,
            mouseCursor: MouseCursor.uncontrolled,
            elevation: 16.0,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Icon(
                      Icons.home,
                      color: Color(0xFF210255),
                      size: 36,
                    ),
                  ),
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                label: "Matches",
                icon: Icon(
                  Icons.favorite_border,
                  color: Color(0xFF210255),
                ),
              ),
              BottomNavigationBarItem(
                label: "Account",
                icon: Image.asset(
                  "assets/Witch_ICON.png",
                  height: screenWidth * .08,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
