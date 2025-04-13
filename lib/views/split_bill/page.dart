import 'package:flutter/material.dart';
import '../../layout.dart';
import './widget/recipient.dart';
import '../../colors.dart';

class SplitBillPage extends StatefulWidget {
  const SplitBillPage({super.key});

  @override
  State<SplitBillPage> createState() => _SplitBillPageState();
}

class _SplitBillPageState extends State<SplitBillPage> {
  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Split Bill',
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            spacing: 10,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    for (var i = 0; i < 5; i++)
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Recipient(),
                      ),
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: OutlinedButton(
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.all(15),
                          backgroundColor: Colors.white,
                          foregroundColor: CustomColors.Blue500,
                          side: const BorderSide(
                            color: CustomColors.Blue200,
                            width: 1,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        onPressed: () {
                          // Handle save action
                        },

                        child: Icon(
                          Icons.add_circle_outline,
                          color: CustomColors.Blue500,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              DefaultTabController(
                initialIndex: 1,
                length: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      padding: EdgeInsets.fromLTRB(30, 13, 30, 13),
                      indicator: BoxDecoration(
                        color: CustomColors.Blue200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      tabs: [
                        Container(
                          padding: EdgeInsets.fromLTRB(30, 13, 30, 13),
                          child: Text(
                            'Custom Split',
                            style: TextStyle(color: CustomColors.Blue500),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(30, 13, 30, 13),
                          child: Text(
                            'Equal Split',
                            style: TextStyle(color: CustomColors.Blue500),
                          ),
                        ),
                      ],
                      labelColor: CustomColors.Blue500,
                      dividerHeight: 0,
                    ),
                    Container(
                      height: 300,
                      child: TabBarView(
                        children: [
                          Center(child: Text("Isi Tab 1")),
                          Center(child: Text("Isi Tab 2")),
                        ],
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
