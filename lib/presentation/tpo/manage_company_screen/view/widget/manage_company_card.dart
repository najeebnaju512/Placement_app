import 'package:flutter/material.dart';
import 'package:placement_app/config/app_config.dart';

class ManageCompanyCard extends StatelessWidget {
  ManageCompanyCard(
      {super.key,
      required this.size,
      required this.name,
      required this.headquarters,
      required this.industry,
      required this.logo});

  final Size size;
  final String name;
  final String headquarters;
  final String industry;
  final String logo;

  @override
  Widget build(BuildContext context) {
    var imgUrl = "${AppConfig.mediaurl}${logo}";
    return Container(
      height: size.width*.3,
      padding: EdgeInsets.only(bottom: size.height * .01),
      // margin: EdgeInsets.only(left: size.width * .1, right: size.width * .1),
      child: Card(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
          child: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("$name"),
                      Text("$headquarters"),
                      Text("$industry")
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: size.width * .15,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(size.width * .15)),
                        child: Image(
                          image: NetworkImage("$imgUrl"),
                          width: size.width * .15,
                          height: size.width * .15,
                          fit: BoxFit.contain,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
