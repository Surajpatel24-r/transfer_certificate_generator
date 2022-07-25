import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class TemplateCommerce {
  String templateName = "Engineering";

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
  TemplateCommerce(
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
      this.dateStudentLeave) {
    // createPdf();
  }

  Future<void> createPdf() async {
    final pdf = PdfDocument();
    pdf.pageSettings.size = PdfPageSize.a4;
    pdf.pageSettings.margins.top = 10;
    pdf.pageSettings.margins.right = 10;
    pdf.pageSettings.margins.left = 10;
    pdf.pageSettings.margins.bottom = 0;
    final page = pdf.pages.add();

    Uint8List choukseyLogo =
        File("assets/images/chouksey_logo.jpg").readAsBytesSync();

    Uint8List InriaSans =
        File('assets/fonts/InriaSans/InriaSans-Regular.ttf').readAsBytesSync();

    Uint8List InriaSansBold =
        File('assets/fonts/InriaSans/InriaSans-Bold.ttf').readAsBytesSync();

    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(34, 27, 112), width: 20),
        bounds: Rect.fromLTWH(0, 0, page.getClientSize().width,
            (page.getClientSize().height - 40)));

    page.graphics.drawImage(
      PdfBitmap(choukseyLogo),
      const Rect.fromLTWH(20, 12, 70, 70),
    );

    // Email
    page.graphics.drawString(
        'Prajai1801@gmail.com', PdfTrueTypeFont(InriaSansBold, 12),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(230, 805, 500, 250));

    page.graphics.drawString('CHOUKSEY COLLEGE OF SCIENCE AND COMMERCE',
        PdfTrueTypeFont(InriaSansBold, 22),
        brush: PdfSolidBrush(PdfColor(0, 0, 0, 255)),
        bounds: const Rect.fromLTWH(100, 12, 600, 100));

    page.graphics.drawString(
        'NH-49, Masturi Road, Lalkhadan, Bilaspur Chattishgarh 495504',
        PdfTrueTypeFont(InriaSans, 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(130, 32, 600, 100));

    page.graphics.drawString(
        'Affilated to Chhattishgarh Swami Vivekanand Technical University, Bhilai',
        PdfTrueTypeFont(InriaSans, 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(110, 48, 600, 100));

    page.graphics.drawString(
        '(As ISO 2001-2008 Certified Insitute | Approved by AICTE)',
        PdfTrueTypeFont(InriaSans, 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(135, 64, 600, 100));

    page.graphics.drawLine(PdfPens.black, Offset(10, 85), Offset(560, 85));

    page.graphics.drawString(
        'TRANSFER & CONDUCT CERTIFICATE', PdfTrueTypeFont(InriaSansBold, 16),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(174, 90, 280, 100));

    page.graphics.drawString('TC No.', PdfTrueTypeFont(InriaSans, 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(30, 142, 280, 100));

    page.graphics.drawString(
        '01.   Name Of the Student', PdfTrueTypeFont(InriaSans, 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(30, 180, 280, 100));

    page.graphics.drawString(':   $name', PdfTrueTypeFont(InriaSans, 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(297, 180, 280, 100));

    page.graphics.drawString(
        "02.  Father's Name", PdfTrueTypeFont(InriaSans, 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(30, 204, 280, 100));

    page.graphics.drawString(':   $fName', PdfTrueTypeFont(InriaSans, 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(297, 204, 600, 100));

    page.graphics.drawString(
        "02.  Mother's Name", PdfTrueTypeFont(InriaSans, 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(30, 228, 280, 100));

    page.graphics.drawString(':   $mName', PdfTrueTypeFont(InriaSans, 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(297, 228, 280, 100));

    page.graphics.drawString("04.  Gender", PdfTrueTypeFont(InriaSans, 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(30, 252, 280, 100));

    page.graphics.drawString(':   $gender', PdfTrueTypeFont(InriaSans, 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(297, 252, 280, 100));

    page.graphics.drawString(
        "05.  Date of birth as per recored", PdfTrueTypeFont(InriaSans, 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(30, 276, 280, 100));

    page.graphics.drawString(':   $DOB', PdfTrueTypeFont(InriaSans, 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(297, 276, 280, 100));

    page.graphics.drawString(
        "06.  Course and Branch to which the student was admitted",
        PdfTrueTypeFont(InriaSans, 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(30, 300, 200, 100));

    page.graphics.drawString(
        ':    $courseAndBranch', PdfTrueTypeFont(InriaSans, 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(297, 300, 200, 100));

    page.graphics.drawString("07.  Semester to which the student was admitted",
        PdfTrueTypeFont(InriaSans, 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(30, 344, 200, 100));

    page.graphics.drawString(
        ':    $semStudentAdmitted', PdfTrueTypeFont(InriaSans, 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(297, 344, 200, 100));

    page.graphics.drawString(
        "08.  Semester to which the student was studying at the timing of leaving",
        PdfTrueTypeFont(InriaSans, 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(30, 384, 200, 100));

    page.graphics.drawString(
      ':    $semStudentWasLeaving',
      PdfTrueTypeFont(InriaSans, 14),
      brush: PdfSolidBrush(PdfColor(0, 0, 0)),
      bounds: const Rect.fromLTWH(297, 384, 200, 100),
    );

    page.graphics.drawString("09.  University Roll No/ Enrollment No",
        PdfTrueTypeFont(InriaSans, 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(30, 440, 200, 100));

    page.graphics.drawString(':   $rollNo', PdfTrueTypeFont(InriaSans, 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(297, 440, 200, 100));

    page.graphics.drawString("10.  Result", PdfTrueTypeFont(InriaSans, 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(30, 486, 200, 100));

    page.graphics.drawString(':   $result', PdfTrueTypeFont(InriaSans, 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(297, 486, 200, 100));

    page.graphics.drawString(
        "11.  Reason for which the student left the instite",
        PdfTrueTypeFont(InriaSans, 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(30, 526, 200, 100));

    page.graphics.drawString(
      ':   $reason',
      PdfTrueTypeFont(InriaSans, 14),
      brush: PdfSolidBrush(PdfColor(0, 0, 0)),
      bounds: const Rect.fromLTWH(297, 526, 200, 100),
    );

    page.graphics.drawString("12.  Coduct", PdfTrueTypeFont(InriaSans, 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(30, 580, 200, 100));

    page.graphics.drawString(':   $conduct', PdfTrueTypeFont(InriaSans, 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(297, 580, 200, 100));

    page.graphics.drawString(
        "13.  Date on which the student left the institute",
        PdfTrueTypeFont(InriaSans, 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(30, 620, 200, 100));

    page.graphics.drawString(
        ':    $dateStudentLeave', PdfTrueTypeFont(InriaSans, 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(297, 620, 200, 100));

    page.graphics.drawString("Principal", PdfTrueTypeFont(InriaSansBold, 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(440, 690, 500, 600));

    page.graphics.drawString(
        "Note: No seperated Conducted Certificate is issued",
        PdfTrueTypeFont(InriaSans, 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(30, 730, 500, 600));

    page.graphics.drawString(
        "Date : " + DateTime.now().toString(), PdfTrueTypeFont(InriaSans, 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(30, 750, 500, 600));

    File("/home/welsh/op.pdf").writeAsBytes(await pdf.save());
  }
}
