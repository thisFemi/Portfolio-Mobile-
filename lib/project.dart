import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyProject extends StatefulWidget {
  MyProject({Key? key}) : super(key: key);

  @override
  State<MyProject> createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject> {
  projetCard(String lang, String title, String description, int starNum) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 220,
      child: Card(
        child: Container(
          margin: EdgeInsets.only(left: 20, top: 30, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lang,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                description,
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.white70,
                    size: 18,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    starNum.toString(),
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                  Expanded(child: Container()),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.github,
                        color: Colors.white,
                      )),
                ],
              )
            ],
          ),
        ),
        color: Color(0xff262628),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xff252525),
        title: Text('Projects'),
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.only(bottom: 20, top: 10),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            projetCard(
                'Flutter', 'Finapp', 'Finapp Clone app- Few UI/Ux Pages', 7),
            projetCard('Flutter', 'TodoApp', 'Simbia- Entry Task', 4),
            projetCard('Flutter', 'CampuBike ', 'Login & SignUpPage- ', 10),
            projetCard('PowerAutomate, List, PowerApps',
                'Data Collection Portal', 'Intranet Portal', 15),
            projetCard('Flutter', 'MiXpense', 'Expenses Calculator App', 8)
          ],
        ),
      )),
    );
  }
}
