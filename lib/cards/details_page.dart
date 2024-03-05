// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'dart:ui';

class DetailsPage extends StatefulWidget {
  final String name, gender, city, state, country, email, avatar, age, phone;

  DetailsPage({
    Key? key,
    required this.name,
    required this.age,
    required this.gender,
    required this.city,
    required this.state,
    required this.country,
    required this.phone,
    required this.email,
    required this.avatar,
  }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            top: screenWidth * .2,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Card(
                      elevation: 16.0,
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(screenWidth * .01),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            24.0,
                          ),
                          child: Image.network(
                            widget.avatar,
                            // "https://images.pexels.com/photos/3532552/pexels-photo-3532552.jpeg?cs=srgb&dl=pexels-hitesh-choudhary-3532552.jpg&fm=jpg",

                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(screenWidth * .01),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(24.0),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                              left: screenWidth * .04,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            width: screenWidth * .08,
                            height: screenWidth * .1,
                            margin: EdgeInsets.all(
                              screenWidth * .1,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.menu_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: Container(
                              width: screenWidth,
                              height: screenWidth * .2,
                              margin: EdgeInsets.fromLTRB(
                                screenWidth * .02,
                                0,
                                screenWidth * .02,
                                screenWidth * .02,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(24.0),
                                  bottomRight: Radius.circular(24.0),
                                ),
                                // Clip it cleanly.
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.fromLTRB(
                                          0,
                                          0,
                                          screenWidth * .04,
                                          0,
                                        ),
                                        child: ElevatedButton.icon(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                    content: Text("HELLO"));
                                              },
                                            );
                                          },
                                          icon: Icon(
                                            Icons.mark_chat_read_rounded,
                                            color: Color.fromARGB(
                                                255, 62, 35, 109),
                                          ),
                                          label: Text(
                                            "Say Hi",
                                            style: TextStyle(
                                              fontSize: screenWidth * .04,
                                              overflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 62, 35, 109),
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.all(
                                              screenWidth * .03,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            elevation: 8.0,
                                            shadowColor: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  screenWidth * .04,
                  screenWidth * .04,
                  screenWidth * .04,
                  0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.name}, ${widget.age}",
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            bottom: 5,
                          ),
                          child: Text(
                            "${widget.city} ${widget.state} ,${widget.country}",
                            style: TextStyle(
                              fontSize: screenWidth * .035,
                              fontWeight: FontWeight.normal,
                              overflow: TextOverflow.ellipsis,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: screenWidth * .15,
                      width: screenWidth * .1,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                        right: screenWidth * .04,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(1.0),
                        ),
                      ),
                      child: Icon(
                        widget.gender == 'male' ? Icons.male : Icons.female,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  screenWidth * .05,
                  screenWidth * .01,
                  screenWidth * .05,
                  0,
                ),
                child: SizedBox(
                  height: screenWidth * .4,
                  child: Card(
                    elevation: 8.0,
                    shadowColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        30.0,
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(screenWidth * .04),
                          child: Text(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
                            style: TextStyle(
                              fontSize: screenWidth * .035,
                              fontWeight: FontWeight.normal,
                            ),
                            maxLines: 2,
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                        Divider(
                          height: 1,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                screenWidth * .05,
                                screenWidth * .035,
                                0,
                                screenWidth * .035,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.phone,
                                  ),
                                  Text(
                                    widget.phone,
                                    style: TextStyle(
                                      fontSize: screenWidth * .03,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                0,
                                screenWidth * .035,
                                screenWidth * .035,
                                screenWidth * .035,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.email_rounded,
                                  ),
                                  Text(
                                    widget.email,
                                    style: TextStyle(
                                      overflow: TextOverflow.fade,
                                      fontSize: screenWidth * .03,
                                    ),
                                    overflow: TextOverflow.fade,
                                    textAlign: TextAlign.center,
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
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  screenWidth * .05,
                  screenWidth * .05,
                  screenWidth * .05,
                  0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
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
                        child: IconButton(
                          icon: Icon(
                            Icons.thumb_down_alt_rounded,
                          ),
                          onPressed: () {
                            // _matchEngine!.currentItem?.nope();
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
                        radius: screenWidth * .08,
                        child: CircleAvatar(
                          radius: 32.0,
                          child: Center(
                            child: IconButton(
                              icon: Icon(
                                Icons.favorite,
                                size: 36.0,
                              ),
                              onPressed: () {
                                //  _matchEngine!.currentItem?.superLike();
                              },
                              //child:  Text("Superlike"),
                            ),
                          ),
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
                        child: IconButton(
                          icon: Icon(
                            Icons.thumb_up_alt_rounded,
                          ),
                          onPressed: () {
                            //_matchEngine!.currentItem?.like();
                          },
                          //  child:  Text("Like"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
