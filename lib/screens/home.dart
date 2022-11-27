import 'package:fifa/models/card.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/card.dart';
import 'details.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

List<String> _tags = ["المجموعة A", "المجموعة B", "المجموعة C"];
List<String> image = ["images/arr.png", "images/alma.png", "images/qa.png"];
int selectedTag = 0;
int currentIndex = 0;

class _homeScreenState extends State<homeScreen> {
  @override
  Widget _buildgroups(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedTag = index;
          });
        },
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    image[index],
                    height: 40,
                  ),
                  Text(
                    _tags[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color:
                    selectedTag == index ? Color(0xffFF004C) : Colors.white54,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white54,
          fixedColor: kPrimaryColor,
          type: BottomNavigationBarType.fixed,
          elevation: 20.0,
          currentIndex: currentIndex, // يحدد الصفحة
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
            // print(index);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الريسية'),
            BottomNavigationBarItem(
                icon: Icon(Icons.date_range_rounded), label: 'الاخبار'),
            BottomNavigationBarItem(
                icon: Icon(Icons.signal_cellular_alt), label: 'النتائج'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'الملف الشخصي'),
          ]),
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0.0,
        title: Text('متابعة حية'),
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notification_add_outlined,
                    size: 28,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: 28,
                  )),
            ],
          )
        ],
      ),
      body: Column(children: [
        cardd(),
        // Collection(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _tags
              .asMap()
              .entries
              .map((MapEntry map) => _buildgroups(map.key))
              .toList(),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Text(
                'الأحد 20 نوفمبر',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Icon(
                Icons.chevron_right,
                color: Colors.white,
                size: 32,
              )
            ],
          ),
        ),
        InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => detailsP(),
                  ));
            },
            child: card(
                Team1: 'قطر',
                Team2: 'الإكوادور',
                Target1: 1,
                Target2: 0,
                image1: 'images/qa.png',
                image2: 'images/qa.png',
                text: 'تمت')),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Text(
                'الاثنين 21 نوفمبر',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Icon(
                Icons.chevron_right,
                color: Colors.white,
                size: 32,
              )
            ],
          ),
        ),
        InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => detailsP(),
                  ));
            },
            child: card(
                Team1: 'السنغال',
                Team2: 'هولندا',
                Target1: 1,
                Target2: 1,
                image1: 'images/s.png',
                image2: 'images/h.png',
                text: '67')),
      ]),
    );
  }
}
