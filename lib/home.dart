import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHome extends StatefulWidget {
  MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: PopupMenuButton(
            color: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            icon: Icon(Icons.menu),
            itemBuilder: (context) => [
                  PopupMenuItem(
                    child: TextButton(
                        child: Text(
                          'Projects',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/project');
                        }),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: TextButton(
                        child: Text(
                          'About Me',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/about');
                        }),
                    value: 2,
                  )
                ]),
      ),
      body: SlidingSheet(
        elevation: 8,
        cornerRadius: 50,
        snapSpec: const SnapSpec(
          // Enable snapping. This is true by default.
          snap: true,
          // Set custom snapping points.
          snappings: [0.38, 0.7, 1.0],
          // Define to what the snappings relate to. In this case,
          // the total available space that the sheet can expand to.
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        // The body widget will be displayed under the SlidingSheet
        // and a parallax effect can be applied to it.
        body: Container(
            child: Stack(
          children: [
            Container(
                margin: EdgeInsets.only(top: 35),
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black, Colors.transparent])
                        .createShader(
                            Rect.fromLTRB(0, 0, rect.width, rect.height));
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.asset(
                    'assets/femi_adubuola.jpg',
                    height: 700,
                    fit: BoxFit.contain,
                  ),
                )),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.49),
              child: Column(
                children: [
                  Text(
                    'Oluwafemi Adubuola',
                    style: TextStyle(
                        fontFamily: "Soho",
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Software Developer',
                    style: TextStyle(
                        color: Colors.white, fontFamily: "Soho", fontSize: 20),
                  )
                ],
              ),
            )
          ],
        )),
        builder: (context, state) {
          // This is the content of the sheet that will get
          // scrolled, if the content is bigger than the available
          // height of the sheet.
          return Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 30),
              height: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      myArchiev(12, 'Projects'),
                      myArchiev(5, 'Clients'),
                      myArchiev(50, 'Messages')
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Specialized In",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: "Soho",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildmySpec(FontAwesomeIcons.android, 'Android'),
                          buildmySpec(
                              FontAwesomeIcons.microsoft, 'Power-Platform'),
                          buildmySpec(FontAwesomeIcons.usersViewfinder,
                              'Virtual Assitant'),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildmySpec(FontAwesomeIcons.github, 'Github '),
                          buildmySpec(
                              Icons.phonelink_setup_outlined, 'IT Support'),
                          buildmySpec(
                              Icons.data_exploration, 'Data\nExploration'),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildmySpec(FontAwesomeIcons.terminal, 'Scripting'),
                          buildmySpec(Icons.manage_accounts,
                              'Active-Directory\nImplementation'),
                          buildmySpec(FontAwesomeIcons.aws, 'Aws'),
                        ],
                      ),
                    ],
                  )
                ],
              ));
        },
      ),
    );
  }

  Container buildmySpec(IconData icon, String tech) {
    return Container(
        width: 105,
        height: 115,
        child: Card(
            margin: EdgeInsets.all(0),
            color: Color(0xff252525),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      tech,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Soho",
                      ),
                    )
                  ],
                ),
              ),
            )));
  }

  myArchiev(int num, String type) {
    return Row(
      children: [
        Text(
          num.toString(),
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: "Soho",
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 10,
          ),
          child: Text(' ' + type),
        ),
      ],
    );
  }
}
