import 'package:drive_app/customwidgets/FolderGrid.dart';
import 'package:drive_app/pages/settings.dart';
import 'package:drive_app/pages/storage.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constaints.dart';
import '../customclasses/folder.dart';
import '../customclasses/menu.dart';
import '../pages/profile.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class HomeScreen extends StatefulWidget {
  BuildContext mycontext;
  HomeScreen({this.mycontext});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  List<MenuClass> myMenuList = [
    MenuClass(title: 'Home', isSelected: true),
    MenuClass(title: 'Profile', isSelected: false),
    MenuClass(title: 'Storage', isSelected: false),
    MenuClass(title: 'Shared', isSelected: false),
    MenuClass(title: 'Stats', isSelected: false),
    MenuClass(title: 'Settings', isSelected: false),
    MenuClass(title: 'Help', isSelected: false)
  ];

  bool isOpen = false;

  Animation<double> animation;
  AnimationController animationController;

  List<FolderClass> myFolderList = [
    FolderClass(
        folder_image: 'blue_folder',
        title: 'Mobile Apps',
        subtitle: 'December 20.2020'),
    FolderClass(
        folder_image: 'yellow_folder',
        title: 'SVG Icons',
        subtitle: 'December 14.2020'),
    FolderClass(
        folder_image: 'red_folder',
        title: 'Prototypes',
        subtitle: 'Novemaber 22.2020'),
    FolderClass(
        folder_image: 'green_folder',
        title: 'Avatars',
        subtitle: 'Novemaber 10.2020'),
    FolderClass(
        folder_image: 'blue_folder',
        title: 'Design',
        subtitle: 'December 20.2020'),
    FolderClass(
        folder_image: 'yellow_folder',
        title: 'Portfolio',
        subtitle: 'December 14.2020'),
    FolderClass(
        folder_image: 'red_folder',
        title: 'References',
        subtitle: 'Novemaber 22.2020'),
    FolderClass(
        folder_image: 'green_folder',
        title: 'Clients',
        subtitle: 'Novemaber 10.2020'),
    FolderClass(
        folder_image: 'blue_folder',
        title: 'Mobile Apps',
        subtitle: 'December 20.2020'),
    FolderClass(
        folder_image: 'yellow_folder',
        title: 'SVG Icons',
        subtitle: 'December 14.2020'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController =
        AnimationController(vsync:this,duration: const Duration(milliseconds: 300));
    animation = Tween<double>(
            begin: -1 * MediaQuery.of(widget.mycontext).size.width, end: 0)
        .animate(animationController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((AnimationStatus status) {
            if (status == AnimationStatus.completed ||
                status == AnimationStatus.reverse) {
              setState(() {
                if (!isOpen)
                  isOpen = true;
                else
                  isOpen = false;
              });
            }
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: !isOpen
          ? Padding(
              padding: const EdgeInsets.only(right: 10, bottom: 60.0),
              child: Container(
                width: 60,
                height: 60,
                child: Center(
                    child: SvgPicture.asset(
                  imagePath + 'plus_alt.svg',
                  color: Colors.white,
                )),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: blueTextColor),
              ),
            )
          : SizedBox(),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 60),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Your Dribbbox',
                        style: TextStyle(
                            fontFamily: 'GilroySemiBold',
                            fontSize: 24,
                            color: blueTextColor)),
                    InkWell(
                        onTap: () {
                          animationController.forward();
                        },
                        child: SvgPicture.asset(
                          imagePath + 'menu_alt.svg',
                        ))
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIconConstraints: BoxConstraints(maxWidth: 26),
                            prefixIcon: Wrap(
                              children: [
                                SvgPicture.asset(
                                  imagePath + 'search_alt.svg',
                                  width: 16,
                                ),
                                SizedBox(
                                  width: 10,
                                )
                              ],
                            ),
                            hintText: 'Search Folder',
                            hintStyle: TextStyle(
                                fontFamily: 'GilroyMedium',
                                fontSize: 16,
                                color: blueTextColor)),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFEEF2FE), width: 1),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text('Recent',
                            style: TextStyle(
                                fontFamily: 'GilroySemiBold',
                                fontSize: 15,
                                color: blueTextColor)),
                        SizedBox(
                          width: 5,
                        ),
                        SvgPicture.asset(imagePath + 'down_alt.svg'),
                      ],
                    ),
                    Wrap(
                      children: [
                        SvgPicture.asset(imagePath + 'list_alt.svg'),
                        SizedBox(
                          width: 20,
                        ),
                        SvgPicture.asset(imagePath + 'grid_alt.svg'),
                      ],
                    )
                  ],
                ),
                Expanded(
                  child: FolderGrid(
                    myFolderList: myFolderList,
                  ),
                )
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(animation.value, 0),
            child: Container(
              color: sideMenuBg,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 107,
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              imagePath + 'avatar_alt.svg',
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 45,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Neelesh',
                                    style: TextStyle(
                                        fontFamily: 'AvenirNextMedium',
                                        color: footerText,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('Seattle,Washington',
                                      style: TextStyle(
                                        fontFamily: 'AvenirNextMedium',
                                        color: footerText,
                                        fontSize: 11,
                                      ))
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(60))),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30, top: 60),
                      child: InkWell(
                          onTap: () {
                            animationController.reverse();
                          },
                          child: SvgPicture.asset(
                            imagePath + 'close_alt.svg',
                          )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.46,
                      child: ListView.builder(
                        itemBuilder: (context, int index) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  if (myMenuList[index].title.toLowerCase() ==
                                      "profile") {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProfileScreen()));
                                  } else if (myMenuList[index]
                                          .title
                                          .toLowerCase() ==
                                      "storage") {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                StorageScreen()));
                                  } else if (myMenuList[index]
                                          .title
                                          .toLowerCase() ==
                                      "settings") {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SettingsScreen()));
                                  }
                                },
                                child: Row(
                                  children: [
                                    myMenuList[index].isSelected
                                        ? Container(
                                            width: 4,
                                            height: 33,
                                            color: smartButtonText,
                                          )
                                        : SizedBox(),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      myMenuList[index].title,
                                      style: TextStyle(
                                          fontFamily: 'GilroyMedium',
                                          fontSize: 16,
                                          color: footerText,
                                          fontWeight:
                                              myMenuList[index].isSelected
                                                  ? FontWeight.bold
                                                  : FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          );
                        },
                        itemCount: myMenuList.length,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, bottom: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                imagePath + 'logout_alt.svg',
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Logout',
                                  style: TextStyle(
                                    fontFamily: 'GilroyBold',
                                    color: footerText,
                                    height: 1.3,
                                    fontSize: 16,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          Text('Version 2.0.1',
                              style: TextStyle(
                                fontFamily: 'GilroyMedium',
                                fontSize: 11,
                              ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
