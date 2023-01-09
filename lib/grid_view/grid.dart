import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class gridView extends StatefulWidget {
  const gridView({Key? key}) : super(key: key);

  @override
  State<gridView> createState() => _gridViewState();
}

class _gridViewState extends State<gridView> {
  List View = [
    {
      'img': "assets/grid/luffy.jpg",
      'name': "Monkey D.Luffy",
      'exten': 1,
      'hight': 1,
    },
    {
      'img': "assets/grid/zoro.jpg",
      'name': "Roronoa Zoro",
      'exten': 1,
      'hight': 1,
    },
    {
      'img': "assets/grid/sanji.jpg",
      'name': "Black Foot Sanji",
      'exten': 1,
      'hight': 1.2,
    },
    {
      'img': "assets/grid/chopper.png",
      'name': "Tony Tony Chopper",
      'exten': 1,
      'hight': 1.5,
    },
    {
      'img': "assets/grid/brook.jpg",
      'name': "Ghost King Brook",
      'exten': 1,
      'hight': 1,
    },
    {
      'img': "assets/grid/franky.jpg",
      'name': "Franky",
      'exten': 1,
      'hight': 1.2,
    },
    {
      'img': "assets/grid/usoop.jpg",
      'name': "Soge King Usoop",
      'exten': 1,
      'hight': 1.4,
    },
    {
      'img': "assets/grid/jimbe.png",
      'name': "Jinbe",
      'exten': 1,
      'hight': 1.1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Staggered RecyclerView"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff122950), Color(0xff4c7fce)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                StaggeredGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  children: [
                    ...View.map(
                          (e) => StaggeredGridTile.count(
                          crossAxisCellCount: e['exten'],
                          mainAxisCellCount: e['hight'],
                          child: Container(

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  child: Image.asset(e['img']),
                                ),
                                Text(e['name'],style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
                              ],
                            ),
                          )),
                    ).toList(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
