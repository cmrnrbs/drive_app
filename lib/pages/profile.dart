import 'package:drive_app/customwidgets/FolderGrid.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../customclasses/folder.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../constaints.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFCFC),
      body: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 60.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      imagePath + 'left_arrow_alt.svg',
                    )),
                Text('My Profile',
                    style: TextStyle(
                      fontFamily: 'GilroySemiBold',
                      fontSize: 16,
                      color: blueTextColor,
                    )),
                SvgPicture.asset(
                  imagePath + 'dot_horizontal_alt.svg',
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 209,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 40,
                        height: 20,
                        child: Center(
                          child: Text('PRO',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  height: 1.3,
                                  fontFamily: 'GilroyMedium')),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: pinkColor),
                      ),
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(
                          imagePath + 'avatar_alt.svg',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Neelesh Chaudhary',
                            style: TextStyle(
                                color: blueTextColor,
                                fontSize: 18,
                                fontFamily: 'GilroyBold')),
                        SizedBox(
                          height: 10,
                        ),
                        Text('UI / UX Designer',
                            style: TextStyle(
                                color: blueTextColor,
                                fontSize: 16,
                                fontFamily: 'GilroyRegular')),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare pretium placerat ut platea.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: blueTextColor.withOpacity(.6),
                              fontSize: 14,
                              fontFamily: 'GilroyRegular'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('My Folders',
                    style: TextStyle(
                      fontFamily: 'GilroySemiBold',
                      fontSize: 16,
                      color: blueTextColor,
                    )),
                Wrap(
                  children: [
                    SvgPicture.asset(
                      imagePath + 'plus_alt.svg',
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    SvgPicture.asset(
                      imagePath + 'set_alt.svg',
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    SvgPicture.asset(
                      imagePath + 'right_alt.svg',
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 300,
              child: FolderGrid(
                myFolderList: myFolderList,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Recent Uploads',
                    style: TextStyle(
                      fontFamily: 'GilroySemiBold',
                      fontSize: 16,
                      color: blueTextColor,
                    )),
                SvgPicture.asset(
                  imagePath + 'sort_alt.svg',
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      child: Center(
                        child: SvgPicture.asset(
                          imagePath + 'word_alt.svg',
                        ),
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: bluefolder),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 42,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Projects.docx',
                            style: TextStyle(
                                fontFamily: 'GilroyMedium',
                                fontSize: 15,
                                color: blueTextColor),
                          ),
                          Text(
                            'Novemaber 22.2020',
                            style: TextStyle(
                                fontFamily: 'GilroyRegular',
                                fontSize: 10,
                                color: blueTextColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Text('300kb',
                    style: TextStyle(
                        fontFamily: 'GilroyRegular',
                        fontSize: 10,
                        color: blueTextColor.withOpacity(.6)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
