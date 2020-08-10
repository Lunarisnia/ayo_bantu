import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Stack(
            fit: StackFit.passthrough,
            children: <Widget>[
              Image.network(
                'https://picsum.photos/200/100',
                fit: BoxFit.cover,
                color: Colors.black38,
                colorBlendMode: BlendMode.darken,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      PopupMenuButton(
                        onSelected: (value){
                          print(value);
                        },
                        itemBuilder: (BuildContext context) {
                          var popup = List<PopupMenuEntry<Object>>();
                          popup.add(
                            PopupMenuItem(
                              value: 'Report',
                              child: Text('Report'),
                            ),
                          );
                          return popup;
                        },
                        icon: Icon(
                          FontAwesomeIcons.ellipsisV,
                          color: Colors.white,
                        ),
                      )
                      // IconButton(
                      //   icon: Icon(
                      //     FontAwesomeIcons.ellipsisV,
                      //     color: Colors.white,
                      //   ),
                      //   onPressed: () {
                      //     return Text('test');
                      //   },
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.mapMarkerAlt,
                              color: Colors.white,
                              size: 14,
                            ),
                            Text(
                              "Sudirman, Jakarta",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ],
                        ),
                        AutoSizeText(
                          'Bantu Ruslan Untuk makan siang ricis/hokben/solaria/sushitime/mangengking',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                    subtitle: Text(
                      "19 Agustus 2020",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Center(
            heightFactor: 1.4,
            child: Column(
              children: <Widget>[
                Text(
                  "500",
                  style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
                Text(
                  'orang telah berdonasi',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                _DonateButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DonateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: FlatButton(
        onPressed: () {
          print("donasi page");
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(85, 190, 186, 1),
                  Color.fromRGBO(218, 235, 199, 1)
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            constraints: BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              "DONASI",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
