import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/database/students/database_students.dart';
import '../../../core/widgets/content_item_widget.dart';
import '../../../core/widgets/dismissible_background_widget.dart';
import '../../../core/widgets/icon_button_widget.dart';
import '../../../core/widgets/text_button_widget.dart';
import 'controller/courses_controller.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final coursesController = Modular.get<CoursesController>();

  TextEditingController searchController = TextEditingController();

  bool isSearch = false;

  Timer? _debounce;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF1A040),
        toolbarHeight: 70,
        leading: IconButtonWidget(
          iconData: Icons.arrow_back_sharp,
          color: Colors.transparent,
          onTap: () => Navigator.of(context).pop(),
        ),
        centerTitle: false,
        // title: TextField(
        //   controller: searchController,
        //   textInputAction: TextInputAction.search,
        //   onChanged: (v) {
        //     if (_debounce?.isActive ?? false) _debounce!.cancel();
        //     _debounce = Timer(const Duration(milliseconds: 1000), () {
        //       // _getSearchList(searchController.text).then((value) {
        //       //   if (value != null) {
        //       //     if (!value) {
        //       //       ScaffoldMessenger.of(context).showSnackBar(
        //       //         const SnackBar(content: Text('Not Found!')),
        //       //       );
        //       //     }
        //       //   }
        //       // });
        //       setState(() {
        //         isSearch = true;
        //       });
        //     });
        //   },
        //   onSubmitted: (str) {
        //     if (str.isEmpty) {
        //       ScaffoldMessenger.of(context).showSnackBar(
        //         const SnackBar(content: Text('Type something to search')),
        //       );
        //       return;
        //     } else {
        //       // _getSearchList(searchController.text).then((value) {
        //       //   if (value != null) {
        //       //     if (!value) {
        //       //       ScaffoldMessenger.of(context).showSnackBar(
        //       //         const SnackBar(content: Text('Not Found!')),
        //       //       );
        //       //     }
        //       //   }
        //       // });
        //     }
        //   },
        //   decoration: InputDecoration(
        //     suffixIcon: InkWell(
        //         onTap: () {
        //           if (searchController.text.isEmpty) {
        //             ScaffoldMessenger.of(context).showSnackBar(
        //               const SnackBar(content: Text('Type something to search')),
        //             );
        //             return;
        //           }
        //         },
        //         child: const Icon(
        //           Icons.search,
        //           color: Colors.black,
        //         )),
        //     hintText: 'Search',
        //     contentPadding: EdgeInsets.all(10),
        //     border:
        //         OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        //     focusedBorder:
        //         OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        //     enabledBorder:
        //         OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        //   ),
        // ),
        actions: [
          IconButtonWidget(
            color: Theme.of(context).primaryColor,
            onTap: () => Modular.to.pushNamed('/students/studentsAdd'),
            iconData: Icons.add_sharp,
          ),
        ],
      ),
      body: Observer(builder: (context) {
        return coursesController.coursesModelList.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/no_data.png'),
                    // MyBoxWidget(
                    //   height: 5,
                    // ),
                    const Text('No Courses'),
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: coursesController.coursesModelList.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            background: DismissibleBackgroundWidget(
                                alignment: Alignment.centerRight,
                                icon: Icons.edit,
                                backgroundColor:
                                    Theme.of(context).primaryColor),
                            secondaryBackground: DismissibleBackgroundWidget(
                              alignment: Alignment.centerLeft,
                              icon: Icons.delete_outline_sharp,
                              backgroundColor: Colors.red,
                              iconColor: Colors.white,
                            ),
                            confirmDismiss: (DismissDirection direction) async {
                              if (direction == DismissDirection.startToEnd) {
                                return await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Confirm"),
                                      content: const Text(
                                          "Are you sure you wish to edit this item?"),
                                      actions: <Widget>[
                                        TextBtnWidget(
                                          name: ' Edit ',
                                          isStretch: false,
                                          onTap: () {
                                            // context
                                            //     .to(EditPage(
                                            //         ContentObject.fromMap(
                                            //             _studentModelList[index])))
                                            //     .then((value) {
                                            //   if (value != null) {
                                            //     if (value == true) {
                                            //       setState(() {});
                                            //       _getList();
                                            //     }
                                            //   }
                                            //   return context.back(false);
                                            // });
                                          },
                                        ),
                                        TextBtnWidget(
                                          name: 'Cancel',
                                          btnColor: Colors.white,
                                          // onTap: () => context.back(false),
                                          onTap: () {},
                                          isStretch: false,
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else if (direction ==
                                  DismissDirection.endToStart) {
                                return await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Confirm"),
                                      content: const Text(
                                          "Are you sure you wish to delete this item?"),
                                      actions: <Widget>[
                                        TextBtnWidget(
                                          name: 'Delete',
                                          nameColor: Colors.white,
                                          btnColor: Colors.red,
                                          onTap: () {
                                            // DatabaseServices()
                                            //     .deleteItem(_studentModelList[index]['id'],
                                            //         tableContent)
                                            //     .then((value) {
                                            //   if (value != null) {
                                            //     context.back(true);
                                            //   }
                                            // });
                                          },
                                          isStretch: false,
                                        ),
                                        TextBtnWidget(
                                          name: 'Cancel',
                                          btnColor: Colors.white,
                                          onTap: () {},
                                          isStretch: false,
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                              return null;
                            },
                            onDismissed: (direction) {
                              if (direction == DismissDirection.startToEnd) {
                              } else if (direction ==
                                  DismissDirection.endToStart) {
                                //Todo
                                // _getList();
                              }
                            },
                            key: Key(index.toString()),
                            child: ContentItemWidget(
                              name: coursesController
                                  .coursesModelList[index].name,
                              body: '',
                              photo: '',
                            ),
                          );
                        }),
                  ],
                ),
              );
      }),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
