import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:widgets_test/controllers/report_data_controller.dart';
import 'package:widgets_test/theme/color.dart';
import 'package:widgets_test/widgets/custom_dropdown_menu.dart';
import 'package:widgets_test/widgets/date_picker.dart';

class ReportData extends StatefulWidget {
  const ReportData({super.key});

  @override
  State<ReportData> createState() => _ReportDataState();
}

class _ReportDataState extends State<ReportData> {
  @override
  Widget build(BuildContext context) {
    final reportDataController = Provider.of<ReportDataController>(context);
    List<String> options = ["option1", "options2"];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Expanded(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: AppColor.whitePrimary),
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "รายงาน",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border_outlined,
                        size: 22.0,
                      ))
                ],
              ),
              SizedBox(
                height: 20.0,
              ),

              //Export Buttons
              Row(
                children: [
                  Row(
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12.0),
                                    topLeft: Radius.circular(12.0),
                                    topRight: Radius.zero,
                                    bottomRight: Radius.zero))),
                        child: Row(
                          spacing: 8.0,
                          children: [
                            Icon(
                              FontAwesomeIcons.fileExcel,
                              size: 18.0,
                            ),
                            Text(
                              "Export excel",
                              style: Theme.of(context).textTheme.labelLarge,
                            )
                          ],
                        ),
                        onPressed: () {},
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(12.0),
                                    bottomRight: Radius.circular(12.0),
                                    topLeft: Radius.zero,
                                    bottomLeft: Radius.zero))),
                        child: Row(
                          spacing: 8.0,
                          children: [
                            Icon(
                              FontAwesomeIcons.filePdf,
                              size: 18.0,
                            ),
                            Text(
                              "Export PDF",
                              style: Theme.of(context).textTheme.labelLarge,
                            )
                          ],
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: 10.0,
                      ),

                      // Dropdown Menus
                      Row(
                        spacing: 10.0,
                        children: [
                          CustomDropdownMenu(
                              width: 146.0,
                              hintText: "Acting Type",
                              menuEntry: options),
                          CustomDropdownMenu(
                              width: 180.0,
                              hintText: "Installation Site",
                              menuEntry: options),
                        ],
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Column(
                spacing: 10.0,
                children: [
                  DatePicker(
                    hintText: "Start Date:",
                    resultDate: reportDataController.startDate,
                    setTime: reportDataController.setStartDate,
                  ),
                  DatePicker(
                    hintText: "End Date:",
                    resultDate: reportDataController.endDate,
                    setTime: reportDataController.setEndDate,
                  )
                ],
              ),

              // Date & Time Picker
            ],
          ),
        ),
      ),
    );
  }
}
