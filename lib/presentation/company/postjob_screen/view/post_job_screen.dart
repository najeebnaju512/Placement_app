import 'package:flutter/material.dart';
import 'package:placement_app/presentation/company/postjob_screen/controller/post_job_controller.dart';
import 'package:provider/provider.dart';

class PostJobScreen extends StatefulWidget {
  const PostJobScreen({super.key});

  @override
  State<PostJobScreen> createState() => _PostJobScreenState();
}

class _PostJobScreenState extends State<PostJobScreen> {
  TextEditingController positionController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController requirementController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController deadlineController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post job"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          children: [
            SizedBox(height: 10),
            Text("Position"),
            TextField(
              controller: positionController,
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
            ),
            SizedBox(height: 10),
            Text("Description"),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
              maxLines: 4,
            ),
            SizedBox(height: 10),
            Text(" Skill Requirement"),
            TextField(
                controller: requirementController,
                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
            SizedBox(height: 10),
            Text("Location"),
            TextField(
                controller: locationController,
                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
            SizedBox(height: 10),
            Text("Salary"),
            TextField(
                controller: salaryController,
                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
            SizedBox(height: 10),
            Text("Application Deadline"),
            TextField(
                controller: deadlineController,
                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
            SizedBox(height: 17),
            Center(
              child: MaterialButton(
                  color: Colors.blueGrey,
                  shape: StadiumBorder(),
                  onPressed: () {
                    Provider.of<PostJobController>(context, listen: false).onPostJob(
                      positionController.text,
                      descriptionController.text,
                      requirementController.text,
                      locationController.text,
                      salaryController.text,
                      deadlineController.text,
                      context,
                    );
                     positionController.clear();
                      descriptionController.clear();
                      requirementController.clear();
                      locationController.clear();
                      salaryController.clear();
                      deadlineController.clear();
                  },
                  child: Text(
                    "DONE",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
