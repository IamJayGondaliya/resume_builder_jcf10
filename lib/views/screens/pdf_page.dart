import 'dart:io';

import 'package:flutter/material.dart';
import 'package:resume_builder_jcf10/modals/globals.dart';
import 'package:resume_builder_jcf10/utils/theme_utils.dart';
import 'package:resume_builder_jcf10/views/component/back_button.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfPage extends StatefulWidget {
  const PdfPage({Key? key}) : super(key: key);

  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  pw.Document pdf = pw.Document();

  generatePdf() async {
    var image = await networkImage("https://i.pinimg.com/474x/8d/2e/03/8d2e0351c530f93217c09846ea5a82a3.jpg");

    pdf.addPage(
      pw.Page(
        margin: pw.EdgeInsets.zero,
        build: (pw.Context context) => pw.Container(
          height: double.infinity,
          width: double.infinity,
          alignment: pw.Alignment.center,
          decoration: pw.BoxDecoration(
            image: pw.DecorationImage(
              image: image,
            ),
          ),
          child: pw.Column(
            mainAxisSize: pw.MainAxisSize.min,
            children: [
              pw.Container(
                height: 250,
                width: 250,
                decoration: pw.BoxDecoration(
                  shape: pw.BoxShape.circle,
                  image: pw.DecorationImage(
                    image: pw.MemoryImage(
                      File(Global.image!.path).readAsBytesSync(),
                    ),
                  ),
                ),
              ),
              pw.SizedBox(
                height: 20,
              ),
              pw.SizedBox(
                width: 300,
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      "Name :",
                      style: pw.TextStyle(
                        fontSize: 28,
                        color: PdfColors.red,
                      ),
                    ),
                    pw.Text(
                      Global.name!,
                      style: pw.TextStyle(
                        fontSize: 28,
                        color: PdfColors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    generatePdf();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const MyBackButton(),
        backgroundColor: Colors.red,
        title: Text(
          "Pdf Page",
          style: appBarTitleStyle,
        ),
        centerTitle: true,
      ),
      body: PdfPreview(
        build: (format) => pdf.save(),
      ),
    );
  }
}
