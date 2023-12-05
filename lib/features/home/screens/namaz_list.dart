import 'package:flutter/material.dart';
import 'package:ruhani_app/constants/app_color.dart';
import 'package:ruhani_app/features/home/models/namaz.dart';

class NamazList extends StatefulWidget {
  const NamazList({Key? key}) : super(key: key);

  @override
  State<NamazList> createState() => _NamazListState();
}

class _NamazListState extends State<NamazList> {
  List<Namaz> namazList = [
    Namaz(
        image: 'assets/images/tan.png',
        title: 'Таң (Фаджр)',
        desc: '2 рәкәт сүннет, 2 рәкәт парыз'),
    Namaz(
        image: 'assets/images/besin.png',
        title: 'Бесін (Зухр)',
        desc: '4 рәкәт сүннет, 4 рәкәт парыз, 2 рәкәт сүннет'),
    Namaz(
        image: 'assets/images/ekinti.png',
        title: 'Екінті (Аср)',
        desc: '4 рәкәт парыз'),
    Namaz(
        image: 'assets/images/sham.png',
        title: 'Шам (Магриб)',
        desc: '3 рәкәт парыз, 2 рәкәт сүннет'),
    Namaz(
        image: 'assets/images/kuptan.png',
        title: 'Құптан (Иша',
        desc: '4 рәкәт парыз, 2 рәкәт сүннет'),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0, bottom: 10.0, top: 10.0),
        child: CustomScrollView(
          scrollDirection: Axis.horizontal,
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 3.5,
                          width: MediaQuery.of(context).size.width / 2,
                          child: OutlinedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.whiteColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            onPressed: () {},
                            child: Column(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                      height: double.maxFinite,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            namazList[index].image,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  overflow: TextOverflow.visible,
                                  softWrap: true,
                                  maxLines: 1,
                                  namazList[index].title,
                                  style: const TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff000000),
                                    height: 24 / 20,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  namazList[index].desc,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.thirdColor,
                                    height: 12 / 10,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                childCount: namazList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
