part of 'pages.dart';

class UserAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Container(height: 100, color: mainColor),
      body: Stack(children: <Widget>[
        Container(color: accentColor4),
        SafeArea(
            child: Container(
          color: Color(0xFFF6F7F9),
        )),
        HomePage()
      ]),
    );
  }
}
