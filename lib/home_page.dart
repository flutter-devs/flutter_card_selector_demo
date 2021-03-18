
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:card_selector/card_selector.dart';
import 'package:flutter_card_selector_demo/amount_page.dart';
import 'package:flutter_card_selector_demo/card_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _cards;
  Map _data;
  double _width = 0;

  @override
  void initState() {
    super.initState();
    DefaultAssetBundle.of(context).loadString("assets/data.json").then((d) {
      _cards = json.decode(d);
      setState(() => _data = _cards[0]);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_cards == null) return Container();
    if (_width <= 0) _width = MediaQuery.of(context).size.width - 40.0;
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text("Flutter Card Selector Demo"),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
                "Wallets",
                style: TextStyle(color: Colors.white,fontSize: 25)
            ),
          ),
          SizedBox(height: 20.0),
          CardSelector(
              cards: _cards.map((context) => CardPage(context)).toList(),
              mainCardWidth: _width,
              mainCardHeight: _width * 0.63,
              mainCardPadding: -16.0,
              onChanged: (i) => setState(() => _data = _cards[i])),
          SizedBox(height: 10.0),
          Expanded(child: AmountPage(_data)),
        ],
      ),
    );
  }
}