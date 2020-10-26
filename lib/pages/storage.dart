import 'package:drive_app/customclasses/group.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../colors.dart';
import '../constaints.dart';

class StorageScreen extends StatefulWidget {
  @override
  _StorageScreenState createState() => _StorageScreenState();
}

class _StorageScreenState extends State<StorageScreen> {
  List<GroupClass> myGroup = [
    GroupClass(
        color: blueTextColor,
        progressWith: .2,
        title: 'Design Files',
        subtitle: '38.66 GB'),
    GroupClass(
        color: yellowColor,
        progressWith: .15,
        title: 'Images',
        subtitle: '24.80 GB'),
    GroupClass(
        color: greenColor,
        progressWith: .1,
        title: 'Videos',
        subtitle: '12.60 GB'),
    GroupClass(
        color: smartButtonText,
        progressWith: .22,
        title: 'Documents',
        subtitle: '06.57 GB'),
    GroupClass(
        color: orangeColor,
        progressWith: .05,
        title: 'Others',
        subtitle: '2.01 GB')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                Text('Storage Details',
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
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: Column(
                  children: [
                    PieChart(
                      PieChartData(
                          pieTouchData:
                              PieTouchData(touchCallback: (pieTouchResponse) {
                            setState(() {});
                          }),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          sectionsSpace: 0,
                          centerSpaceRadius: 40,
                          sections: showingSections()),
                    ),
                    Text('Available',
                        style: TextStyle(
                            color: blueTextColor,
                            fontSize: 20,
                            fontFamily: 'GilroyRegular')),
                    SizedBox(
                      height: 10,
                    ),
                    Text('43.36 GB',
                        style: TextStyle(
                            color: blueTextColor,
                            fontSize: 24,
                            fontFamily: 'GilroyBold')),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Total 128 GB',
                        style: TextStyle(
                            color: blueTextColor,
                            fontSize: 20,
                            fontFamily: 'GilroyRegular')),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, int index) {
                          return Column(
                            children: [
                              index < myGroup.length
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Wrap(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: Container(
                                                width: 10,
                                                height: 10,
                                                decoration: BoxDecoration(
                                                    color: myGroup[index].color,
                                                    shape: BoxShape.circle),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(myGroup[index].title,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'GilroyMedium',
                                                        fontSize: 18,
                                                        color: blueTextColor)),
                                                Text(myGroup[index].subtitle,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'GilroyMedium',
                                                        fontSize: 12,
                                                        color: blueTextColor
                                                            .withOpacity(.6)))
                                              ],
                                            )
                                          ],
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.32,
                                          height: 4,
                                          decoration: BoxDecoration(
                                              color: bluefolder,
                                              borderRadius:
                                                  BorderRadius.circular(2)),
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      myGroup[index]
                                                          .progressWith,
                                                  height: 4,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          myGroup[index].color,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2)),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  : Text('Export Details',
                                      style: TextStyle(
                                          fontFamily: 'GilroyMedium',
                                          fontSize: 16,
                                          color: blueTextColor)),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          );
                        },
                        itemCount: myGroup.length + 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<PieChartSectionData> showingSections() {
  return List.generate(4, (i) {
    final double radius = 60;
    switch (i) {
      case 0:
        return PieChartSectionData(
          color: greenColor,
          value: 10,
          showTitle: false,
          radius: radius,
        );

      case 1:
        return PieChartSectionData(
          color: smartButtonText,
          value: 40,
          showTitle: false,
          radius: radius,
        );
      case 2:
        return PieChartSectionData(
          color: blueTextColor,
          value: 30,
          showTitle: false,
          radius: radius,
        );
      case 3:
        return PieChartSectionData(
          color: yellowColor,
          value: 10,
          showTitle: false,
          radius: radius,
        );
      default:
        return null;
    }
  });
}
