import 'package:drive_app/customclasses/folder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../colors.dart';
import '../constaints.dart';

class FolderGrid extends StatefulWidget {
  List<FolderClass> myFolderList;
  FolderGrid({this.myFolderList});
  @override
  _FolderGridState createState() => _FolderGridState();
}

class _FolderGridState extends State<FolderGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 19,
          childAspectRatio: 148 / 107,
          mainAxisSpacing: 19),
      itemCount: widget.myFolderList.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: widget.myFolderList[index].folder_image.indexOf("blue") != -1
                ? bluefolder
                : (widget.myFolderList[index].folder_image.indexOf("red") != -1
                    ? redfolder
                    : (widget.myFolderList[index].folder_image
                                .indexOf("yellow") !=
                            -1
                        ? yellowfolder
                        : greenfolder)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(imagePath +
                        widget.myFolderList[index].folder_image +
                        '_alt.svg'),
                    SvgPicture.asset(
                      imagePath + 'dot_alt.svg',
                      color: widget.myFolderList[index].folder_image
                                  .indexOf("blue") !=
                              -1
                          ? blueFolderTextColor
                          : (widget.myFolderList[index].folder_image
                                      .indexOf("red") !=
                                  -1
                              ? redFolderTextColor
                              : (widget.myFolderList[index].folder_image
                                          .indexOf("yellow") !=
                                      -1
                                  ? yellowFolderTextColor
                                  : greenFolderTextColor)),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  widget.myFolderList[index].title,
                  style: TextStyle(
                      fontFamily: 'GilroyMedium',
                      fontSize: 15,
                      color: widget.myFolderList[index].folder_image
                                  .indexOf("blue") !=
                              -1
                          ? blueFolderTextColor
                          : (widget.myFolderList[index].folder_image
                                      .indexOf("red") !=
                                  -1
                              ? redFolderTextColor
                              : (widget.myFolderList[index].folder_image
                                          .indexOf("yellow") !=
                                      -1
                                  ? yellowFolderTextColor
                                  : greenFolderTextColor))),
                ),
                Text(
                  widget.myFolderList[index].subtitle,
                  style: TextStyle(
                      fontFamily: 'GilroyRegular',
                      fontSize: 10,
                      color: widget.myFolderList[index].folder_image
                                  .indexOf("blue") !=
                              -1
                          ? blueFolderTextColor
                          : (widget.myFolderList[index].folder_image
                                      .indexOf("red") !=
                                  -1
                              ? redFolderTextColor
                              : (widget.myFolderList[index].folder_image
                                          .indexOf("yellow") !=
                                      -1
                                  ? yellowFolderTextColor
                                  : greenFolderTextColor))),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
