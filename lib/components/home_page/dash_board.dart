import 'package:flutter/material.dart';
import 'package:ayo_bantu/components/home_page/donate_form.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ayo_bantu/components/home_page/donation_list.dart';
import 'package:ayo_bantu/models/donate_model.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final List<Donate> _donations = [
    Donate(title: 'Mie Ayam 1 porsi', name: 'ruslan', address: 'Pondok Arum',),
    Donate(title: 'Mie Ayam 5 porsi', name: 'ruslan', address: 'Pondok Labu'),
  ];

  Donate addDonation;

  @override
  void setState(fn) {
    _donations.add(addDonation);
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(85, 190, 186, 1),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return DonateForm(addDonation);
            },
          );
        },
        child: Icon(
          FontAwesomeIcons.pencilAlt,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
      child: Column(
        children: _donations.map((donation) {
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
                              onSelected: (value) {
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
                                    donation.address,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                ],
                              ),
                              AutoSizeText(
                                donation.title,
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
              ],
            ),
          );
        }).toList(),
      ),
    ),
    );
  }
}
