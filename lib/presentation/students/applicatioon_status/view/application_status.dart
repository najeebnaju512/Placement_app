import 'package:flutter/material.dart';
import 'package:placement_app/presentation/students/applicatioon_status/controller/application_status_controller.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/color_constants.dart';

class ApplicationStatus extends StatelessWidget {
  const ApplicationStatus({super.key});


  fethcApplication(BuildContext context) {
    Provider.of<ApplicationStatusController>(context, listen: false)
        .fetchData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Applied Jobs"),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: fethcApplication(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return Consumer<ApplicationStatusController>(
                    builder: (context, aControl, child) {
                  return aControl.applicationStatusModel.data == null ||
                          aControl.applicationStatusModel.data!.isEmpty
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
                          itemCount:
                              aControl.applicationStatusModel.data?.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "Job Id : ${aControl.applicationStatusModel.data?[index].job}"),
                                    Text(
                                      "Name : ${aControl.applicationStatusModel.data?[index].student}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Status : ${aControl.applicationStatusModel.data?[index].status}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                    Text(
                                        "Applied On : ${aControl.applicationStatusModel.data?[index].appliedDate}")
                                  ],
                                ),
                              ),
                            );
                          });
                });
              }
            }));
  }
}
