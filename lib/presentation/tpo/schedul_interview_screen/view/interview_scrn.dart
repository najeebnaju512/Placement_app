import 'package:flutter/material.dart';
import 'package:placement_app/presentation/tpo/schedul_interview_screen/controller/interview_controller.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/color_constants.dart';

class InterviewScheduleScreen extends StatelessWidget {
  const InterviewScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Interview Schedule"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
          future: Provider.of<InterviewScheduleController>(context,listen: false).fetchDetails(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Consumer<InterviewScheduleController>(
                  builder: (context, control, child) {
                return control.interviewScheduleModel.data == null ||
                    control.interviewScheduleModel.data!.isEmpty ?
                Center(
                  child: Text(
                    "No Data Found",
                    style: TextStyle(
                        color: ColorTheme.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ):ListView.builder(
                    itemCount: control.interviewScheduleModel.data?.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                            left: size.width * .05,
                            right: size.width * .05,
                            bottom: 20),
                        child: Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text("Name"),
                                      Text("Applied For"),
                                      Text("Phone"),
                                      Text('Email'),
                                      Text('Company'),
                                      Text('Requirement'),
                                      Text('Salary'),
                                      Text('Last date'),
                                      Text("Location"),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("Applied Data"),
                                      Text(
                                        "Status",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            ":${control.interviewScheduleModel.data?[index].application?.student?.firstName} ${control.interviewScheduleModel.data?[index].application?.student?.lastName}"),
                                        Text(
                                            ":${control.interviewScheduleModel.data?[index].application?.job?.position}"),
                                        Text(
                                            ":${control.interviewScheduleModel.data?[index].application?.student?.phoneNo}"),
                                        Text(
                                            ":${control.interviewScheduleModel.data?[index].application?.student?.emailAddress}"),
                                        Text(
                                            ":${control.interviewScheduleModel.data?[index].company?.name}"),
                                        Text(
                                            ":${control.interviewScheduleModel.data?[index].application?.job?.requirements}",
                                            overflow: TextOverflow.ellipsis),
                                        Text(
                                            ":${control.interviewScheduleModel.data?[index].application?.job?.salary}"),
                                        Text(
                                            ":${control.interviewScheduleModel.data?[index].application?.job?.deadline}"),
                                        Text(
                                            ":${control.interviewScheduleModel.data?[index].application?.job?.location}"),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                            ":${control.interviewScheduleModel.data?[index].application?.appliedDate}"),
                                        Text(
                                          ":${control.interviewScheduleModel.data?[index].application?.status}",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Divider(),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "Interview :-",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Date & Time",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Location",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(""),
                                        Text(
                                          ":${control.interviewScheduleModel.data?[index].dateTime}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          ":${control.interviewScheduleModel.data?[index].location}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              });
            }
          }),
    );
  }
}
