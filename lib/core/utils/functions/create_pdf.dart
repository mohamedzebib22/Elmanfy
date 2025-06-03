import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class CreatePdf {
  static Future<void> generatePdf(
      
     {required List<QueryDocumentSnapshot<Object?>> deptList,required String customerName}) async {
    final pdf = pw.Document();
    final fontData = await rootBundle.load('assets/fonts/Cairo-Regular.ttf');
    final arabicFont = pw.Font.ttf(fontData);

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Directionality(
            textDirection: pw.TextDirection.rtl,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                  pw.Text(
                  'الديون المدفوعة',
                  style: pw.TextStyle(fontSize: 24, font: arabicFont),
                ),
                pw.Text(
                  'اسم العميل /$customerName',
                  style: pw.TextStyle(fontSize: 24, font: arabicFont),
                ),
                ]),
                
                pw.SizedBox(height: 20),
                pw.TableHelper.fromTextArray(
                  headers: [
                    'المنتج',
                    'السعر',
                    'العدد',
                    'الإجمالي',
                    'تاريخ الدفع'
                  ],
                  data: deptList.map((item) {
                    return [
                      item['itemName'],
                      item['itemPrice'].toString(),
                      item['quantity'].toString(),
                      item['totalPrice'].toString(),
                      item['paidDate'].toString().split('.')[0],
                    ];
                  }).toList(),
                  cellStyle: pw.TextStyle(font: arabicFont, fontSize: 10),
                  headerStyle: pw.TextStyle(
                      font: arabicFont, fontWeight: pw.FontWeight.bold),
                  cellAlignment: pw.Alignment.centerRight,
                ),
              ],
            ),
          );
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }
}
