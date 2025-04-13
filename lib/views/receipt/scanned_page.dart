import '../../colors.dart';
import 'package:flutter/material.dart';
import '../../components/button.dart';
import './edit_bill_page.dart';
import './widget/horizontal_line.dart';
import 'widget/value_text.dart';
import '../../layout.dart';
import '../split_bill/page.dart';

TableRow buildCustomTableRow(String qty, String name, String price) {
  return TableRow(
    children: [
      Padding(padding: const EdgeInsets.all(10), child: Text(qty)),
      Padding(padding: const EdgeInsets.all(10), child: Text(name)),
      Padding(padding: const EdgeInsets.all(10), child: Text(price)),
    ],
  );
}

class ListBill extends StatelessWidget {
  const ListBill({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      // border: TableBorder.all(),
      columnWidths: const <int, TableColumnWidth>{
        0: IntrinsicColumnWidth(),
        1: FlexColumnWidth(),
        2: IntrinsicColumnWidth(),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        for (var i = 0; i < 5; i++)
          buildCustomTableRow("1x", "Mie Gacoan Lvl 1", "Rp10.000"),
      ],
    );
  }
}

class ScannedReceipt extends StatefulWidget {
  const ScannedReceipt({super.key});

  @override
  ScannedPageState createState() => ScannedPageState();
}

// A screen that allows users to take a picture using a given camera.
class ScannedPageState extends State<ScannedReceipt> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Bill',
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                decoration: BoxDecoration(
                  color: CustomColors.Blue50,
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Column(
                  spacing: 10,
                  children: [
                    HorizontalLine(),
                    HorizontalLine(),
                    SizedBox(height: 16),
                    SizedBox(
                      width: 250,
                      child: TextField(
                        controller: TextEditingController(
                          text: "Scanned Receipt",
                        ),
                        textAlign: TextAlign.center,
                        // decoration: const InputDecoration(
                        //   hintText: 'Enter your bill name',
                        // ),
                      ),
                    ),
                    SizedBox(height: 16),
                    HorizontalLine(),
                    HorizontalLine(),
                    SizedBox(height: 16),
                    Container(
                      child: ListBill(),
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    ),
                    HorizontalLine(),
                    ValueText(title: 'Total', value: 'Rp10.000'),
                    HorizontalLine(),
                    Column(
                      children: [
                        ValueText(title: 'Cash', value: 'Rp1.000'),
                        ValueText(title: 'Change', value: 'Rp2.000'),
                      ],
                    ),
                    HorizontalLine(),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(40, 0, 40, 40),
                child: Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: ButtonCustom(
                        label: 'Edit Bill',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditBillPage(),
                            ),
                          );
                        },
                        type: ButtonType.secondary,
                        icon: Icon(Icons.edit, color: CustomColors.Blue500),
                      ),
                    ),
                    Expanded(
                      child: ButtonCustom(
                        label: 'Confirm Bill',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SplitBillPage(),
                            ),
                          );
                        },
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
}
