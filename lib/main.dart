import 'package:flutter/material.dart';
import 'package:resume_builder_jcf10/utils/route_utils.dart';
import 'package:resume_builder_jcf10/views/screens/carrier_objective_page.dart';
import 'package:resume_builder_jcf10/views/screens/contact_info_page.dart';
import 'package:resume_builder_jcf10/views/screens/education_page.dart';
import 'package:resume_builder_jcf10/views/screens/home_page.dart';
import 'package:resume_builder_jcf10/views/screens/pdf_page.dart';
import 'package:resume_builder_jcf10/views/screens/personal_details_page.dart';
import 'package:resume_builder_jcf10/views/screens/resume_workspace.dart';
import 'package:resume_builder_jcf10/views/screens/technical_skills_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.red,
      ),
      routes: {
        MyRoutes.home: (context) => const HomePage(),
        MyRoutes.workspace: (context) => const ResumeWorkspace(),
        MyRoutes.pdfPage: (context) => const PdfPage(),
        MyRoutes.buildOptions[0].route: (context) => const ContactInfoPage(),
        MyRoutes.buildOptions[1].route: (context) => const CarrierObjectivePage(),
        MyRoutes.buildOptions[2].route: (context) => const PersonalDetailsPage(),
        MyRoutes.buildOptions[3].route: (context) => const EducationPage(),
        MyRoutes.buildOptions[4].route: (context) => const TechnicalSkillsPage(),
      },
    );
  }
}
