import 'package:flutter/material.dart';
import 'package:resume_builder_jcf10/modals/globals.dart';
import 'package:resume_builder_jcf10/utils/route_utils.dart';
import 'package:resume_builder_jcf10/utils/theme_utils.dart';

class ResumeWorkspace extends StatefulWidget {
  const ResumeWorkspace({Key? key}) : super(key: key);

  @override
  State<ResumeWorkspace> createState() => _ResumeWorkspaceState();
}

class _ResumeWorkspaceState extends State<ResumeWorkspace> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Resume Workspace",
          style: appBarTitleStyle,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(MyRoutes.pdfPage);
            },
            icon: const Icon(
              Icons.picture_as_pdf,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: s.width,
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                "Build Options",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: SingleChildScrollView(
                child: Column(
                  children: MyRoutes.buildOptions
                      .map(
                        (e) => Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                              e.icon,
                              height: 40,
                              color: Colors.red.shade300,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              e.name,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(e.route).then((value) => setState(() {}));
                              },
                              icon: const Icon(Icons.arrow_forward_ios),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
