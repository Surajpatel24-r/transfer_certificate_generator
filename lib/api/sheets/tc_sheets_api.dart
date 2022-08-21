import 'package:transfer_certificate_generator/models/user.dart';
import 'package:gsheets/gsheets.dart';

class TcSheetApi {
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "transfercertificatedatas",
  "private_key_id": "d29763e3c8ae8ba4a1e26389cddfc4d3e372bd7b",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQD6ru68TE+BSsIT\nE+GvIcyddCbwGF/h1dxI5El+vv9raCVmEJymyoz1wJpOVrnTZ6SRhpCjCBsuvqwA\n0pXQsA/oINZCjZl9Go7VAISYoHluPc170dpv40FU1+3QXZ28udPoYAmtXZqO/Gpn\nB0YVmTI3P9f6WLG8ALku2hHe7nGq3U32TQq8RBd8w93RQe83eevHXjkAdBetEb7H\nZ60zuY7enBdE+xqT9Vi9KQbr0qz1CpWKI/GLoLAAbqRucbmptHuCPmBouGEY7mM9\n+pN4u06puLOZblh3QuKa24Spud4WnYAGxDOGoBMsRi+obdFuOXToG2TPj2Y7Ji2Y\ntEO+MXL/AgMBAAECggEAEjUSceq4+5MKdYhEJAw4aFc/XMDodeaqkUDDdck5k/uE\ne91JA3RCuLa8fmQeKxSkB03Ww4CbONHwfD7PUtD21s1Lwpm2RDfhl+bpuowtRayH\neC7NxsKixB7Kzw99nW+BzKbtDQJ3b1s1/zWwCXGPDCQ+85ftkNIcoSKFmcOHzfkQ\nG6lzP9ipQHQpzWFKYQ4ZNTgV2A0KPGAzHQKDomh+s6OmDKqS71uBC+S8an0Jyk2t\nV3GX+XqRPxmSCkJEY0JkbsZAPS1aTLm5mCAtl5a4/KqFKZp1MZW9Hw4PrSEIJvxU\nw6DCl95aFJnKXuH2xFZdX3GgFRRoQGwi2WmQNelZgQKBgQD/NktFkHw2y8cBCuoV\nvteVnbIgbKl0bOq8y2ETJFvqA5OevEfpGHECM3EPFMdv8AGaVQwoqE/xMgMTvBP4\n/LWs1iz1UbF7BfvtOSWUAP6k4yxn3DEJwDYQQwDP2nQaX5BwRoIGBEs5qMBs3VaP\nMVChIwjnJKF92IxmSo+NJdNpGQKBgQD7dQ8qpAqB+dbg/oozsrFGEKXoYboqRgt/\nxKae9VQeZQSB+4szh6XgQEPIjdKlLRPBtV2EUAhRAJuxMKDx24c2uvuHTV5EniHh\nDVd8rwHnHo+juBjM/eJL2MJACi3RDUpiyre7dV+ASvOH0AVQhxEtz3PA205tgOmh\nJQg6tfiH1wKBgQCzb3sQ1/tdk3zBsOjQjTOKUCuzPHMQFpwcTWpdSQ0OxaD+1CZD\nLxoVkBGHpvZqL3cRCYbY9y3tyVn8gBoSz6r0cEl/2gZNFvH/4lQXcXOYftjz1Q7t\naiUY3eMuQMus10/4gLpefJpfWdShNiXr26JzCOzzhv+8OYrNSNMRTG0N0QKBgGJT\n3PFkogM/SgpDHpGmr3Fhcy7SgDSlnTuCD1GbRyB3ifK2BTHKOk/dcWQMKTGT1eTq\nYb4qeYYLQdZg2J6apF3/cfnvhAw69a6GRA6qdIkGx05S38fRA1t7UEIweMgFdW/6\nKyxvcj+9j0stSda6ajpKo83nM9zYCwOLcpNasuuTAoGALvbcsX/uLPV4PvPP20Db\njQDa0mbEdNnQ2EclCYI9GCG61QbfpIcGMuZzm6t2EPSoP1CPje463VrkF369NQ+y\nJ7vapftcIS15ExlRk+XtC8+Ibs4dw7tNd9YTbkModAymzLI3yYxXKq/tC/g3qKE4\nv1w1BCMQvNPi/ChqKbZZ7Ic=\n-----END PRIVATE KEY-----\n",
  "client_email": "transfercertificatedatas@transfercertificatedatas.iam.gserviceaccount.com",
  "client_id": "100440100157965325079",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/transfercertificatedatas%40transfercertificatedatas.iam.gserviceaccount.com"
}

''';
  static final _spreadsheetId = '1j1T4unvPN4DCnxogdudR-8JbcJDuQPEifuQ2-KKIfyM';
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
