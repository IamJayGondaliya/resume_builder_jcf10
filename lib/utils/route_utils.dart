import 'package:resume_builder_jcf10/utils/icon_utils.dart';

class BuildOption {
  final String icon;
  final String name;
  final String route;

  BuildOption({
    required this.icon,
    required this.name,
    required this.route,
  });
}

class MyRoutes {
  static String home = '/';
  static String workspace = 'resume_workspace';
  static String pdfPage = 'pdf_page';

  //Build Options Route List
  static List<BuildOption> buildOptions = [
    BuildOption(
      icon: iconPath + "contact_detail.png",
      name: "Contact Info",
      route: "contact_info",
    ),
    BuildOption(
      icon: iconPath + "briefcase.png",
      name: "Carrier Objective",
      route: "carrier_objective",
    ),
    BuildOption(
      icon: iconPath + "account.png",
      name: "Personal Details",
      route: "personal_details",
    ),
    BuildOption(
      icon: iconPath + "graduation-cap.png",
      name: "Education Page",
      route: 'education_page',
    ),
    BuildOption(
      icon: iconPath + "certificate.png",
      name: "Technical Skills",
      route: 'technical_skills',
    ),
  ];
}
