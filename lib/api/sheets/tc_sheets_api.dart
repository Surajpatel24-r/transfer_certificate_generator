import 'package:transfer_certificate_generator/models/user.dart';
import 'package:gsheets/gsheets.dart';

class TcSheetApi {
  static const _credentials =
      ""; //r''' <Enter your Google Cloud Credential Account json file> ''';
  static final _spreadsheetId = ""; // Enter your Google Sheet file link;
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _engineeringSheet;
  static Worksheet? _pharmacySheet;
  static Worksheet? _commerceSheet;

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _engineeringSheet =
          await _getWorkSheet(spreadsheet, title: 'EngineeringDatas');

      final firstRow = UserFields.getFields();
      _engineeringSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print('Init Error: $e');
    }
  }

  static Future init2() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _pharmacySheet = await _getWorkSheet(spreadsheet, title: 'PharmacyDatas');

      final firstRow = UserFields.getFields();
      _pharmacySheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print('Init Error: $e');
    }
  }

  static Future init3() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _commerceSheet = await _getWorkSheet(spreadsheet, title: 'CommerceDatas');

      final firstRow = UserFields.getFields();
      _commerceSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print('Init Error: $e');
    }
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_engineeringSheet == null) return;

    _engineeringSheet!.values.map.appendRows(rowList);
  }

  static Future insert2(List<Map<String, dynamic>> rowList) async {
    if (_pharmacySheet == null) return;

    _pharmacySheet!.values.map.appendRows(rowList);
  }

  static Future insert3(List<Map<String, dynamic>> rowList) async {
    if (_commerceSheet == null) return;

    _commerceSheet!.values.map.appendRows(rowList);
  }
}
