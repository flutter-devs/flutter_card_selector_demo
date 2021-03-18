
import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  final Map _cardDetails;

  CardPage(this._cardDetails);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        color: Color(_cardDetails['color']),
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/${_cardDetails['background_layer']}.png',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(_cardDetails['bank'], style: textTheme.title),
                  Text(_cardDetails['type'].toUpperCase(), style: textTheme.caption),
                  Expanded(child: Container()),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Expanded(
                        child: Text(_cardDetails['number'],
                            style: textTheme.subhead, overflow: TextOverflow.ellipsis),
                      ),
                      Image.asset('assets/${_cardDetails['branch']}.png', width: 48.0)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}