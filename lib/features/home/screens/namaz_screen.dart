import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ruhani_app/constants/app_color.dart';
import 'package:ruhani_app/features/home/models/namaz_makala.dart';
import 'package:ruhani_app/features/home/screens/namaz_list.dart';

class NamazScreen extends StatefulWidget {
  const NamazScreen({super.key});

  @override
  State<NamazScreen> createState() => _NamazScreenState();
}

class _NamazScreenState extends State<NamazScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 50, left: 15),
              child: Text(
                "Мақалалар",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000000),
                  height: 24 / 20,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, right: 15),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: AppColor.thirdColor,
                  ),
                  child: const Center(
                      child: Icon(Icons.generating_tokens_outlined)),
                ),
              ),
            ),
          ],
        ),
        NamazMakalalar(),
        /*
        SizedBox(
          height: MediaQuery.of(context).size.height / 2.3,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                itemN(),
                itemN(),
                itemN(),
                itemN(),
                itemN(),
              ],
            ),
          ),
        ),

        */
        const SizedBox(height: 15),
        const Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Text(
            "Намаз оқып үйрену",
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 25,
              fontWeight: FontWeight.w400,
              color: Color(0xff000000),
              height: 24 / 20,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const NamazList(),
      ],
    );
  }

  Widget itemN() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //image
          Container(
            height: MediaQuery.of(context).size.height / 8.8,
            width: MediaQuery.of(context).size.width / 2.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/walp2.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),

          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Намаз жайлы",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000000),
                  height: 1,
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                "Аллаға құлшылық қылу. Бес \nпарыздың біреуі",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000000),
                  height: 1.5,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),

          Container(
            margin: EdgeInsets.only(right: 15),
            child: Transform.rotate(
              angle: -45 * pi / 180,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_right_alt),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NamazMakalalar extends StatefulWidget {
  const NamazMakalalar({Key? key}) : super(key: key);

  @override
  State<NamazMakalalar> createState() => _NamazMakalalarState();
}

class _NamazMakalalarState extends State<NamazMakalalar> {
  List<NamazMakala> namazMakalaList = [
    NamazMakala(
        image: 'assets/images/tan.png',
        title: 'Намаз жайлы',
        desc: 'Аллаға құлшылық қылу. 1 парыздың біреуі'),
    NamazMakala(
        image: 'assets/images/tan.png',
        title: 'Намаз жайлы',
        desc: 'Аллаға құлшылық қылу. 2 парыздың біреуі'),
    NamazMakala(
        image: 'assets/images/tan.png',
        title: 'Намаз жайлы',
        desc: 'Аллаға құлшылық қылу. 3 парыздың біреуі'),
    NamazMakala(
        image: 'assets/images/tan.png',
        title: 'Намаз жайлы',
        desc: 'Аллаға құлшылық қылу. Бес парыздың біреуі'),
    NamazMakala(
        image: 'assets/images/tan.png',
        title: 'Намаз жайлы',
        desc: 'Аллаға құлшылық қылу. Бес парыздың біреуі'),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, top: 10.0),
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: namazMakalaList.length,
                (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //image
                        Container(
                          height: MediaQuery.of(context).size.height / 8.8,
                          width: MediaQuery.of(context).size.width / 2.8,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/walp2.jpeg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              namazMakalaList[index].title,
                              style: const TextStyle(
                                fontFamily: "Inter",
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff000000),
                                height: 1,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              namazMakalaList[index].desc,
                              style: const TextStyle(
                                fontFamily: "Inter",
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff000000),
                                height: 1.5,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),

                        Container(
                          margin: EdgeInsets.only(right: 15),
                          child: Transform.rotate(
                            angle: -45 * pi / 180,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_right_alt),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
