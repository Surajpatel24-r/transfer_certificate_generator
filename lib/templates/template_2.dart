import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class TemplatePharmacy {
  final category = "Pharmacy";
  late String savePath;
  String tcNo = '';
  String name = '';
  String fName = '';
  String mName = '';
  String gender = '';
  String DOB = '';
  String courseAndBranch = '';
  String semStudentAdmitted = '';
  String semStudentWasLeaving = '';
  String rollNo = '';
  String result = '';
  String reason = '';
  String conduct = '';
  String dateStudentLeave = '';
  TemplatePharmacy(
    this.tcNo,
    this.name,
    this.fName,
    this.mName,
    this.gender,
    this.DOB,
    this.courseAndBranch,
    this.semStudentAdmitted,
    this.semStudentWasLeaving,
    this.rollNo,
    this.result,
    this.reason,
    this.conduct,
    this.dateStudentLeave,
  ) {
    // createPdf();
  }

  Future<List<int>> choukseyLogo() async {
    final ByteData data =
        await rootBundle.load("assets/images/chouksey_logo.jpg");
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }

  Future<List<int>> InriaSans() async {
    final ByteData data =
        await rootBundle.load("assets/fonts/InriaSans/InriaSans-Regular.ttf");
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }

  Future<List<int>> InriaSansBold() async {
    final ByteData data =
        await rootBundle.load("assets/fonts/InriaSans/InriaSans-Bold.ttf");
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }

  Future<void> createPdf(String path, String file_name) async {
    final pdf = PdfDocument();
    pdf.pageSettings.size = PdfPageSize.a4;
    pdf.pageSettings.margins.top = 10;
    pdf.pageSettings.margins.right = 10;
    pdf.pageSettings.margins.left = 10;
    pdf.pageSettings.margins.bottom = 0;
    final page = pdf.pages.add();

    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(34, 27, 112), width: 20),
        bounds: Rect.fromLTWH(0, 0, page.getClientSize().width,
            (page.getClientSize().height - 40)));

    page.graphics.drawImage(
      PdfBitmap(await choukseyLogo()),
      const Rect.fromLTWH(20, 12, 70, 70),
    );

    // Email
    page.graphics.drawString('Email : info@cecbilaspur.ac.in',
        PdfTrueTypeFont(await InriaSansBold(), 12),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(220, 805, 500, 250));

    page.graphics.drawString('SCHOOL OF PHARMACY',
        PdfStandardFont(PdfFontFamily.helvetica, 26, style: PdfFontStyle.bold),
        brush: PdfSolidBrush(PdfColor(255, 0, 0, 255)),
        bounds: const Rect.fromLTWH(160, 11, 600, 100));

    page.graphics.drawString('CHOUKSEY ENGINEERING COLLEGE, BILASPUR',
        PdfTrueTypeFont(await InriaSansBold(), 17),
        brush: PdfSolidBrush(PdfColor(0, 0, 0, 255)),
        bounds: const Rect.fromLTWH(140, 40, 600, 100));

    page.graphics.drawString(
        'NH-49, Masturi Road, Lalkhadan, Bilaspur Chattishgarh 495004',
        PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(130, 55, 600, 100));

    page.graphics.drawString(
        'Affiliated to Chhattishgarh Swami Vivekanand Technical University, Bhilai',
        PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(110, 70, 600, 100));

    page.graphics.drawString(
        '(An ISO 2001:2008 Certified Institute | Approved by AICTE)',
        PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(135, 85, 600, 100));

    page.graphics.drawLine(PdfPens.black, Offset(10, 100), Offset(570, 100));

    page.graphics.drawString('TRANSFER & CONDUCT CERTIFICATE',
        PdfTrueTypeFont(await InriaSansBold(), 16),
        brush: PdfSolidBrush(PdfColor(255, 0, 0)),
        bounds: const Rect.fromLTWH(174, 105, 280, 100));

    page.graphics.drawString('TC No.', PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(30, 142, 280, 100));

    page.graphics.drawString("$tcNo", PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(255, 0, 0)),
        bounds: const Rect.fromLTWH(90, 142, 280, 100));
// From
    page.graphics.drawString(
        '01.   Name of the Student', PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(30, 180, 280, 100));

    page.graphics.drawString(
        ':   $name', PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(297, 180, 280, 100));

    page.graphics.drawString(
        "02.  Father's Name", PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(30, 204, 280, 100));

    page.graphics.drawString(
        ':   $fName', PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(297, 204, 600, 100));

    page.graphics.drawString(
        "02.  Mother's Name", PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(30, 228, 280, 100));

    page.graphics.drawString(
        ':   $mName', PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(297, 228, 280, 100));

    page.graphics.drawString(
        "04.  Gender", PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(30, 252, 280, 100));

    page.graphics.drawString(
        ':   $gender', PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(297, 252, 280, 100));

    page.graphics.drawString("05.  Date of Birth as per record",
        PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(30, 276, 280, 100));

    page.graphics.drawString(':   $DOB', PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(297, 276, 280, 100));

    page.graphics.drawString("06.", PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(30, 300, 200, 100));

    page.graphics.drawString(
        "Course and Branch to which the student was admitted",
        PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(54, 300, 200, 100));

    page.graphics.drawString(':', PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(297, 300, 200, 100));

    page.graphics.drawString(
        '$courseAndBranch', PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(311, 300, 200, 100));

    page.graphics.drawString("07.", PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(30, 344, 200, 100));

    page.graphics.drawString("Semester to which the student was admitted",
        PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(54, 344, 200, 100));

    page.graphics.drawString(
        ':    $semStudentAdmitted', PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(297, 344, 200, 100));

    page.graphics.drawString("08.", PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(30, 384, 200, 100));

    page.graphics.drawString(
        "Semester to which the student was studying at the timing of leaving",
        PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(54, 384, 200, 100));

    page.graphics.drawString(
      ':    $semStudentWasLeaving',
      PdfTrueTypeFont(await InriaSans(), 14),
      brush: PdfSolidBrush(PdfColor(0, 0, 0)),
      bounds: const Rect.fromLTWH(297, 384, 200, 100),
    );

    page.graphics.drawString("09.", PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(30, 440, 200, 100));

    page.graphics.drawString("University Roll.No./ Enrollment No.",
        PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(54, 440, 200, 100));

    page.graphics.drawString(
        ':   $rollNo', PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(297, 440, 200, 100));

    page.graphics.drawString(
        "10.  Result", PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(30, 486, 200, 100));

    page.graphics.drawString(
        ':   $result', PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(297, 486, 200, 100));

    page.graphics.drawString("11.", PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(30, 526, 200, 100));

    page.graphics.drawString("Reason for which the student left the institute",
        PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(54, 526, 200, 100));

    page.graphics.drawString(
      ':   $reason',
      PdfTrueTypeFont(await InriaSans(), 14),
      brush: PdfSolidBrush(PdfColor(0, 0, 0)),
      bounds: const Rect.fromLTWH(297, 526, 200, 100),
    );

    page.graphics.drawString(
        "12.  Conduct", PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(30, 580, 200, 100));

    page.graphics.drawString(
        ':   $conduct', PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(297, 580, 200, 100));

    page.graphics.drawString("13.", PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(30, 620, 200, 100));

    page.graphics.drawString("Date on which the student left the institute",
        PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(54, 620, 200, 100));

    page.graphics.drawString(
        ':    $dateStudentLeave', PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(297, 620, 200, 100));

    page.graphics.drawString(
        "Principal", PdfTrueTypeFont(await InriaSansBold(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(440, 690, 500, 600));

    page.graphics.drawString("Note: No separate Conduct Certificate is issued",
        PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(30, 730, 500, 600));

    var code = DateFormat('dd-MM-yyyy').format(DateTime.now());

    page.graphics.drawString(
        "Date : " + code, PdfTrueTypeFont(await InriaSans(), 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(30, 750, 500, 600));

    File("$path/$file_name$code.pdf").writeAsBytes(await pdf.save());
    Timer(Duration(seconds: 2), () {
      OpenFile.open("$path/$file_name$code.pdf");
    });
  }
}
