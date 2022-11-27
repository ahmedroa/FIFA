import 'package:fifa/constants/constants.dart';
import 'package:fifa/models/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class detailsP extends StatefulWidget {
  const detailsP({Key? key}) : super(key: key);

  @override
  State<detailsP> createState() => _detailsPState();
}

class _detailsPState extends State<detailsP> {
  @override
  Widget build(BuildContext context) {
    List<String> type = [" ملخص", "احصائيات", "التشكيل", "متابعة حيه"];
    List<String> Summary1 = [
      'التسديدات',
      'الهجمات',
      'الاستحواذ',
      'بطاقة صفراء',
      'ضربة ركنية'
    ];
    List<String> Number1 = ['12', '29', '85', '5', '7'];
    List<String> Number2 = ["8", "22", "42", "3", "8"];
    int selectedTag = 1;
    Widget _buildTags(int index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedTag = index;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
            color: selectedTag == index ? Color(0xffff004c) : Color(0xff8A1538),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            type[index],
            style: TextStyle(
              color: selectedTag != index ? Colors.grey[400] : Colors.white,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      );
    }

    Summarys(int index) {
      return Column(
        children: [
          Text(
            Summary1[index],
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
          SizedBox(
            height: 13,
          ),
        ],
      );
    }

    SummarysN(int index) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Column(
          children: [
            Text(
              Number1[index],
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      );
    }

    SummarysN2(int index) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Column(
          children: [
            Text(
              Number2[index],
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0.0,
        title: Text(
          'المجموعة A',
          style: TextStyle(),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                height: 120,
                width: 10,
                color: kPrimaryColor,
                child: Column(
                  children: [
                    Image.asset(
                      'images/s.png',
                      height: 70,
                    ),
                    Text(
                      'السنغال',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              )),
              Expanded(
                  child: Container(
                height: 120,
                width: 10,
                color: kPrimaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '2 - 3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '9:00 مساء',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              )),
              Expanded(
                  child: Container(
                height: 120,
                width: 10,
                color: kPrimaryColor,
                child: Column(
                  children: [
                    Image.asset(
                      'images/h.png',
                      height: 70,
                    ),
                    Text(
                      'هولندا',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              )),
            ],
          ),
          Expanded(
              child: Container(
            // color: Colors.white,
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: type
                        .asMap()
                        .entries
                        .map((MapEntry map) => _buildTags(map.key))
                        .toList()),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                          children: Number1.asMap()
                              .entries
                              .map((MapEntry map) => SummarysN(map.key))
                              .toList()),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: Number1.asMap()
                              .entries
                              .map((MapEntry map) => Summarys(map.key))
                              .toList()),
                      SizedBox(
                        width: 35,
                      ),
                      Column(
                          children: Number2.asMap()
                              .entries
                              .map((MapEntry map) => SummarysN2(map.key))
                              .toList()),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "مباريات أخرى ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "مشاهدة الكل",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
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
                    SizedBox(
                      height: 10,
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
                  ],
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
