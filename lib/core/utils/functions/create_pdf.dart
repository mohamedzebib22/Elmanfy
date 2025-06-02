// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// void generatePdf(List<QueryDocumentSnapshot<Object?>> deptList) async {
//   final pdf = pw.Document();

//   pdf.addPage(
//     pw.Page(
//       pageFormat: PdfPageFormat.a4,
//       build: (pw.Context context) {
//         return pw.Column(
//           children: [
//             pw.Text('الديون المدفوعة', style: pw.TextStyle(fontSize: 24)),
//             pw.SizedBox(height: 20),
//             pw.Table.fromTextArray(
//               headers: ['المنتج', 'السعر', 'العدد', 'الإجمالي', 'تاريخ الدفع'],
//               data: deptList.map((item) {
//                 return [
//                   item['itemName'],
//                   item['itemPrice'].toString(),
//                   item['quantity'].toString(),
//                   item['totalPrice'].toString(),
//                   item['paidDate'].toString().split('.')[0],
//                 ];
//               }).toList(),
//               cellStyle: pw.TextStyle(fontSize: 10),
//               headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
//               cellAlignment: pw.Alignment.centerRight,
//             )
//           ],
//         );
//       },
//     ),
//   );

//   await Printing.layoutPdf(
//     onLayout: (PdfPageFormat format) async => pdf.save(),
//   );
// }
