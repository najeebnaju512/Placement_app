import 'package:flutter/material.dart';
import 'package:placement_app/core/constants/color_constants.dart';
import 'package:placement_app/presentation/tpo/manage_company_screen/controller/manage_company_controller.dart';
import 'package:placement_app/presentation/tpo/manage_company_screen/view/widget/manage_company_card.dart';
import 'package:provider/provider.dart';

class TPOManageCompanyScreen extends StatelessWidget {
  const TPOManageCompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Company"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: FutureBuilder(
          future:
              Provider.of<TPOManageCompanyController>(context, listen: false)
                  .fetchCompanyList(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Consumer<TPOManageCompanyController>(
                builder: (context, tcControl, child) {
                  return tcControl.tpoManageCompanyModel.data == null ||
                          tcControl.tpoManageCompanyModel.data!.isEmpty
                      ? Center(
                          child: Text(
                            'No Data Found',
                            style: TextStyle(
                                color: ColorTheme.red,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.all(10),
                          child: ListView.builder(
                              itemCount:
                                  tcControl.tpoManageCompanyModel.data?.length,
                              itemBuilder: (context, index) {
                                return ManageCompanyCard(
                                  size: size,
                                  name:
                                      "${tcControl.tpoManageCompanyModel.data?[index].name}",
                                  headquarters:
                                      '${tcControl.tpoManageCompanyModel.data?[index].headquarters}',
                                  industry:
                                      '${tcControl.tpoManageCompanyModel.data?[index].industry}',
                                  logo:
                                      "${tcControl.tpoManageCompanyModel.data?[index].logo.toString()}",
                                );
                              }));
                },
              );
            }
          },
        ));
  }
}
