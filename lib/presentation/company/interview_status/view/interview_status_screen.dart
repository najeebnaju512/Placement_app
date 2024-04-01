import 'package:flutter/material.dart';
import 'package:placement_app/presentation/company/interview_status/controller/interview_status_controller.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/color_constants.dart';

class InterviewStatusScreen extends StatelessWidget {
  const InterviewStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scheduled Interviews"),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: Provider.of<InterviewStatusController>(context, listen: false)
              .fetchData(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Consumer<InterviewStatusController>(
                  builder: (context, isControl, child) {
                return isControl.interviewStatusModel.data == null ||
                        isControl.interviewStatusModel.data!.isEmpty
                    ? Center(
                        child: Text(
                          "No Data Found",
                          style: TextStyle(
                              color: ColorTheme.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    : ListView.builder(
                        itemCount: isControl.interviewStatusModel.data?.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${isControl.interviewStatusModel.data?[index].application}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${isControl.interviewStatusModel.data?[index].company}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "${isControl.interviewStatusModel.data?[index].dateTime}"),
                                  Text(
                                      "${isControl.interviewStatusModel.data?[index].location}")
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
