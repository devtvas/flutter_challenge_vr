import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_soft/app/modules/courses/courses_module.dart';

import '../../../core/style/app_style.dart';
import '../../students/presenter/students_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> itemCount = [
    "Students",
    "Courses",
    "Configuration",
    "Profile",
    "Other",
    "Wallet"
  ];
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //1
                Container(
                  decoration: BoxDecoration(
                    color: AppStyle.primary,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 18),
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Olá,',
                                        style: TextStyle(
                                            color: AppStyle.txtWhite,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 25)),
                                    Text('bom dia!',
                                        style: TextStyle(
                                            color: AppStyle.txtWhite,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 20)),
                                  ]),
                              CircleAvatar(
                                backgroundColor: Colors.white.withOpacity(0.5),
                                child: Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                ),
                              )
                            ]),
                        SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          autofocus: true,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: Icon(Icons.search, color: Colors.grey),
                            hintText: 'Search course ...',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide.none),
                            contentPadding: EdgeInsets.zero,
                            hintStyle:
                                TextStyle(color: Colors.grey), // KEY PROP
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //2
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Explore categorias',
                              style: TextStyle(
                                  color: AppStyle.txtBlack,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24)),
                          Text('ver todos',
                              style: TextStyle(
                                  color: AppStyle.txtPrimary,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14)),
                        ]),
                  ),
                ),
                //3
                Container(
                  // color: Colors.green,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                    ),
                    itemCount: itemCount.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: onTap(index),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: Container(
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 2.0,
                                    spreadRadius: 0.0,
                                    offset: Offset(2.0,
                                        2.0), // shadow direction: bottom right
                                  )
                                ],
                              ),
                              child: Container(
                                width: 100,
                                height: 50,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                        image: AssetImage(
                                            'assets/images/no_data.png')),
                                    Text(itemCount[index])
                                  ],
                                ),
                              ) // child widget, replace with your own
                              ),
                          // child: Container(
                          //   decoration: BoxDecoration(
                          //     color: AppStyle.primary,

                          //     borderRadius: BorderRadius.circular(15),
                          //   ),
                          //   child: Center(child: Text("index: $index")),
                          // ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onTap(int value) {
    switch (value) {
      case 0:
        return () => Modular.to.navigate('/students-module');
      case 1:
        return () => Modular.to.navigate('/students-module');
      default:
        return () => Modular.to.navigate('/');
    }
  }
}
