import 'package:flutter/material.dart';
import 'package:placement_app/core/constants/color_constants.dart';
import 'package:placement_app/core/utils/app_utils.dart';
import 'package:placement_app/presentation/company/application_recived_screen/controller/application_recived_controller.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../global_widget/simple_text_feild.dart';

class ApplicationRecived extends StatefulWidget {
  const ApplicationRecived({super.key});

  @override
  State<ApplicationRecived> createState() => _ApplicationRecivedState();
}

class _ApplicationRecivedState extends State<ApplicationRecived> {
  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() async {
    Provider.of<ApplicationRecivedController>(context, listen: false)
        .fetchStudentApplication(context);
  }

  var dateController = TextEditingController();
  var locController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: Icon(Icons.menu),
        title: Text("Company Dashboard"),
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Consumer<ApplicationRecivedController>(
              builder: (context, controller, _) {
            return controller.isLoading
                ? Center(child: CircularProgressIndicator())
                : controller.studentApplicationModel.data == null ||
                        controller.studentApplicationModel.data!.isEmpty
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
                            controller.studentApplicationModel.data?.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Name"),
                                      Text("Date"),
                                      Text(
                                        "Status",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          ":${controller.studentApplicationModel.data?[index].student}"),
                                      Text(
                                          ":${controller.studentApplicationModel.data?[index].appliedDate.toString()}",
                                          overflow: TextOverflow.ellipsis),
                                      Text(
                                        ":${controller.studentApplicationModel.data?[index].status}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              subtitle: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MaterialButton(
                                    onPressed: () {
                                      if (controller.studentApplicationModel
                                              .data?[index].status ==
                                          "APPROVED") {
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (BuildContext context) {
                                            return SingleChildScrollView(
                                              physics:
                                                  const AlwaysScrollableScrollPhysics(),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Center(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 15,
                                                                  right: 15,
                                                                  top: 10,
                                                                  bottom: 10),
                                                          child: TextFormFieldRefactor(
                                                              hintText:
                                                                  'Date:yyyy/mm/dd',
                                                              textEditingController:
                                                                  dateController)),
                                                      Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 15,
                                                                  right: 15,
                                                                  top: 10,
                                                                  bottom: 10),
                                                          child: TextFormFieldRefactor(
                                                              hintText:
                                                                  'Place Of Interview',
                                                              textEditingController:
                                                                  locController)),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                                      Center(
                                                          child: MaterialButton(
                                                        onPressed: () {
                                                          Provider.of<ApplicationRecivedController>(
                                                                  context,
                                                                  listen: false)
                                                              .scheduleInterview(
                                                                  context,
                                                                  dateController
                                                                      .text,
                                                                  locController
                                                                      .text,
                                                                  controller
                                                                      .studentApplicationModel
                                                                      .data?[
                                                                          index]
                                                                      .id);
                                                          dateController
                                                              .clear();
                                                          locController.clear();
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Center(
                                                          child: Text(
                                                            "Done",
                                                            style: TextStyle(
                                                                color:
                                                                    ColorTheme
                                                                        .white),
                                                          ),
                                                        ),
                                                        color: Colors.blueGrey,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                      )),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      } else {
                                        AppUtils.oneTimeSnackBar(
                                            "Status Must be Approved To Schedule Interview",
                                            context: context);
                                      }
                                    },
                                    child: Center(
                                      child: Text(
                                        "Schedule Interview",
                                        style:
                                            TextStyle(color: ColorTheme.white),
                                      ),
                                    ),
                                    color: Colors.blueGrey,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
          }),
        ),
      ),
    );
  }
}
