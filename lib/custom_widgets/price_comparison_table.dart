import 'package:flutter/material.dart';

class PriceComparisonTable extends StatelessWidget {
  const PriceComparisonTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Material(
        elevation: 10.0,
        child: Table(
          border: TableBorder.symmetric(),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            _buildTableHeader(),
            _buildTableRow(
                'Booking Amount ', '₹ 4,50,000', '₹ 4,50,000', '₹ 6,00,000'),
            _buildTableRow(
                'Size ', '30 x 40 sq.ft.', '30 x 50 sq.ft.', '60 x 40 sq.ft.'),
            _buildTableRow(
                'Instalment 1 to 6', '₹ 1,50,000', '₹ 1,87,500', '₹ 3,00,000',
                backgroundColor: Colors.blue[100]),
            _buildTableRow(
                ' Instalment 7 to 9', '₹ 2,00,000', '₹ 2,50,000', '₹ 4,00,000'),
            _buildTableRow(
                'Instalment 10 to 14', '₹ 2,10,000', '₹ 2,85,000', '₹ 4,80,000',
                backgroundColor: Colors.blue[100]),
            _buildTableRow('Total ', '₹ 30 Lacs', '₹ 37.50 Lacs', '₹ 60 Lacs'),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableHeader() {
    return TableRow(
      decoration: BoxDecoration(color: Colors.blue[200]),
      children: [
        TableCell(
          child: Container(
            width: 40,
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            child: const Text(
              'Type',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        // SizedBox(
        //   width: 30.0,
        // ),
        TableCell(
          child: Container(
            width: 40,
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            child: const Text(
              'Basic ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        // SizedBox(
        //   width: 30.0,
        // ),
        TableCell(
          child: Container(
            width: 40,
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            child: const Text(
              'Standard',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        // SizedBox(
        //   width: 10.0,
        // ),
        TableCell(
          child: Container(
            width: 40,
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            child: const Text(
              'Premium',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  TableRow _buildTableRow(
      String factor, String text, String s30x50, String s60x40,
      {Color? backgroundColor}) {
    return TableRow(
      decoration: BoxDecoration(
          color: backgroundColor,
          border: const Border.symmetric(
            horizontal: BorderSide(
              color: Colors.black,
              width: 0.6,
            ),
          )),
      children: [
        TableCell(
          child: Container(
            width: 40.0,
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            child: Text(
              factor,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        // SizedBox(
        //   width: 40.0,
        // ),
        TableCell(
          child: Container(
            width: 40.0,
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            child: Text(text,
                style: const TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
          ),
        ),
        // SizedBox(
        //   width: 40.0,
        // ),
        TableCell(
          child: Container(
            width: 40.0,
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            child: Text(s30x50,
                style: const TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
          ),
        ),
        // SizedBox(
        //   width: 40.0,
        // ),
        TableCell(
          child: Container(
            width: 40.0,
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            child: Text(s60x40,
                style: const TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
          ),
        ),
      ],
    );
  }
}
