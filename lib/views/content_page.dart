import 'package:flutter/material.dart';
import 'package:flutter_getx/controllers/data_controller.dart';
import 'package:flutter_getx/routes/routes_name.dart';
import 'package:get/get.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({Key? key}) : super(key: key);

  void loadingData(DataController _controller) {
    Future.delayed(Duration(seconds: 2), () {
      print('we are waiting for 20 secodns');
      _controller.isLoading = false;
    });
  }

  Widget build(BuildContext context) {
    DataController _controller = Get.put(DataController());

    loadingData(_controller);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    int _currentIndex = 0;

    

    return Obx(() {
      if (_controller.isLoading == true) {
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      } else {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFc5e5f3),
          ),
          body: Container(
            // padding: const EdgeInsets.only(top: 70),
            color: Color(0xFFc5e5f3),
            child: Column(
              children: [
                //james smith
                Container(
                  width: width,
                  height: 100,
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFebf8fd),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage("img/background.jpg"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${_controller.dataList[1].name}",
                              style: TextStyle(
                                  color: Color(0xFF3b3f42),
                                  fontSize: 18,
                                  decoration: TextDecoration.none),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Top Level",
                              style: TextStyle(
                                  color: Color(0xFFfdebb2),
                                  fontSize: 12,
                                  decoration: TextDecoration.none),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xFFf3fafc)),
                          child: Center(
                            child: Icon(
                              Icons.notifications,
                              color: Color(0xFF69c5df),
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                //popular contest
                Container(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Row(
                    children: [
                      Text(
                        "Popular Contest",
                        style: TextStyle(
                            color: Color(0xFF1f2326),
                            fontSize: 20,
                            decoration: TextDecoration.none),
                      ),
                      Expanded(child: Container()),
                      Text(
                        "Show all",
                        style: TextStyle(
                            color: Color(0xFFcfd5b3),
                            fontSize: 15,
                            decoration: TextDecoration.none),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFfdc33c)),
                        child: GestureDetector(),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //list
                Container(
                  height: 220,
                  child: PageView.builder(
                      controller: PageController(viewportFraction: 0.88),
                      itemCount: _controller.dataList.length,
                      itemBuilder: (_, i) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              RouteNames.getDetailPage(),
                              arguments: _controller.dataList[i]
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            height: 220,
                            width: MediaQuery.of(context).size.width - 20,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: i.isEven
                                    ? Color(0xFF69c5df)
                                    : Color(0xFF9294cc)),
                            child: Column(
                              children: [
                                Container(
                                    child: Row(
                                  children: [
                                    Text(
                                      "${_controller.dataList[i].title}",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                    Expanded(child: Container())
                                  ],
                                )),
                                SizedBox(height: 10),
                                Container(
                                  width: width,
                                  child: Text(
                                    "${_controller.dataList[i].text}",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Divider(
                                  thickness: 1.0,
                                ),
                                Row(children: [
                                  for (int i = 0; i < 4; i++)
                                    Container(
                                      width: 50,
                                      height: 50,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "${_controller.dataList[i].img}"),
                                                fit: BoxFit.cover)),
                                      ),
                                    )
                                ]),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 30,
                ),
                //recent contests
                Container(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Row(
                    children: [
                      Text(
                        "Recent Contests",
                        style: TextStyle(
                            color: Color(0xFF1f2326),
                            fontSize: 20,
                            decoration: TextDecoration.none),
                      ),
                      Expanded(child: Container()),
                      Text(
                        "Show all",
                        style: TextStyle(
                            color: Color(0xFFcfd5b3),
                            fontSize: 15,
                            decoration: TextDecoration.none),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFfdc33c)),
                        child: GestureDetector(),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: _controller.dataList.length,
                            itemBuilder: (_, i) {
                              return Container(
                                width: width,
                                height: 100,
                                margin: const EdgeInsets.only(
                                    left: 25, right: 25, bottom: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xFFebf8fd),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 40,
                                        backgroundImage:
                                            AssetImage("${_controller.dataList[i].img}"),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 170,
                                            child: Text(
                                              "${_controller.dataList[i].name}",
                                              style: TextStyle(
                                                  color: Color(0xFF3b3f42),
                                                  fontSize: 18,
                                                  decoration:
                                                      TextDecoration.none),
                                            ),
                                          )
                                        ],
                                      ),
                                      Expanded(child: Container()),
                                      Container(
                                        width: 40,
                                        height: 40,
                                        child: Text(
                                          "${_controller.dataList[i].time}",
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              decoration: TextDecoration.none,
                                              color: Color(0xFFb2b8bb)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }))),
              ],
            ),
          ),
        );
      }
    });
  }
}
