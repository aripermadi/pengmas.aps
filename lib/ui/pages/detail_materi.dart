part of 'pages.dart';

class DetailMateriPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToMainPage());

        return;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          Container(color: accentColor4),
          SafeArea(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF6F7F9),
                image: DecorationImage(
                  image: AssetImage("assets/images/newpack/6 SCENE.png"),
                  alignment: Alignment.topRight,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 10),
                    height: 50,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              context
                                  .bloc<PageBloc>()
                                  .add(GoToDetailMateriPage());
                            },
                            child: Icon(Icons.arrow_back),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // children: <Widget>[
                          //   SvgPicture.asset("assets/icons/arrow-left.svg"),
                          //   SvgPicture.asset("assets/icons/more-vertical.svg"),
                          // ],
                        ),
                        SizedBox(height: 30),
                        ClipPath(
                          clipper: BestSellerClipper(),
                          child: Container(
                            color: accentColor2,
                            padding: EdgeInsets.only(
                                left: 10, top: 5, right: 20, bottom: 5),
                            child: Text(
                              "Tenang".toUpperCase(),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text("Mindfulnes", style: kHeadingextStyle),
                      ],
                    ),
                  ),
                  SizedBox(height: 60),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(0),
                        ),
                        color: accentColor4,
                      ),
                      child: Stack(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Daftar Latihan",
                                    style: kTitleTextStyle.copyWith(
                                        color: Colors.white)),
                                SizedBox(height: 30),
                                CourseContent(
                                  number: "01",
                                  duration: 4.06,
                                  title: "Selamat Datang di Kelas",
                                  isDone: true,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context
                                        .bloc<PageBloc>()
                                        .add(GoToTaskPage());
                                  },
                                  child: Container(
                                    child: CourseContent(
                                      number: '02',
                                      duration: 15.04,
                                      title: "Bernafas - Intro",
                                      isDone: true,
                                    ),
                                  ),
                                ),
                                CourseContent(
                                  number: '03',
                                  duration: 10.35,
                                  title: "Bernafas - Process",
                                ),
                                CourseContent(
                                  number: '04',
                                  duration: 8.02,
                                  title: "Mengamati Pikiran",
                                ),
                              ],
                            ),
                          ),
                          // Positioned(
                          //   right: 0,
                          //   left: 0,
                          //   bottom: 0,
                          //   child: Container(
                          //     padding: EdgeInsets.all(20),
                          //     height: 100,
                          //     width: double.infinity,
                          //     decoration: BoxDecoration(
                          //       color: Colors.white,
                          //       borderRadius: BorderRadius.circular(40),
                          //       boxShadow: [
                          //         BoxShadow(
                          //           offset: Offset(0, 4),
                          //           blurRadius: 50,
                          //           color: kTextColor.withOpacity(.1),
                          //         ),
                          //       ],
                          //     ),
                          //     child: Row(
                          //       children: <Widget>[
                          //         // Container(
                          //         //   padding: EdgeInsets.all(14),
                          //         //   height: 56,
                          //         //   width: 80,
                          //         //   decoration: BoxDecoration(
                          //         //     color: Color(0xFFFFEDEE),
                          //         //     borderRadius: BorderRadius.circular(40),
                          //         //   ),
                          //         //   // child: SvgPicture.asset(
                          //         //   //     "assets/icons/shopping-bag.svg"),
                          //         // ),
                          //         SizedBox(width: 20),
                          //         // Expanded(
                          //         //   child: Container(
                          //         //     alignment: Alignment.center,
                          //         //     height: 56,
                          //         //     decoration: BoxDecoration(
                          //         //       borderRadius: BorderRadius.circular(40),
                          //         //       color: kBlueColor,
                          //         //     ),
                          //         //     child: Text(
                          //         //       "Buy Now",
                          //         //       style: kSubtitleTextSyule.copyWith(
                          //         //         color: Colors.white,
                          //         //         fontWeight: FontWeight.bold,
                          //         //       ),
                          //         //     ),
                          //         //   ),
                          //         // )
                          //       ],
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class CourseContent extends StatelessWidget {
  final String number;
  final double duration;
  final String title;
  final bool isDone;
  const CourseContent({
    Key key,
    this.number,
    this.duration,
    this.title,
    this.isDone = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: <Widget>[
          Text(
            number,
            style: kHeadingextStyle.copyWith(
              color: kTextColor.withOpacity(.15),
              fontSize: 32,
            ),
          ),
          SizedBox(width: 20),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$duration mins\n",
                  style: TextStyle(
                    color: kTextColor.withOpacity(.5),
                    fontSize: 18,
                  ),
                ),
                TextSpan(
                  text: title,
                  style: kSubtitleTextSyule.copyWith(
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(left: 20),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kGreenColor.withOpacity(isDone ? 1 : .5),
            ),
            child: Icon(Icons.play_arrow, color: Colors.white),
          )
        ],
      ),
    );
  }
}

class BestSellerClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(size.width - 20, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
