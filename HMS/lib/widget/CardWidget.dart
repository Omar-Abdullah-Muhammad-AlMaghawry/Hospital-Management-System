import 'package:HMS/widget/patient_home/NiceButton.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardWidget extends StatelessWidget {
  final String titleOfCardApp;
  final List<String> bodyOfCardApp;
  // final int vaildButtons;
  final String dateOfReservation;
  final ValueKey key;
  CardWidget(
      {this.key,
      this.titleOfCardApp,
      this.bodyOfCardApp,
      this.dateOfReservation});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10, top: 10, left: 5, right: 60),
      child: Card(
        color: Color.fromRGBO(153, 238, 255, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Color.fromRGBO(68, 204, 255, 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    // Color.fromRGBO(153, 238, 255, 1),
                    margin: EdgeInsets.only(left: 5, right: 5),
                    color: Color.fromRGBO(68, 204, 255, 1),
                    child: Text(
                      titleOfCardApp,
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    // Color.fromRGBO(153, 238, 255, 1),
                    margin: EdgeInsets.only(left: 5, right: 5),
                    color: Color.fromRGBO(68, 204, 255, 1),
                    child: Text(
                      dateOfReservation,
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Container(
                color: Color.fromRGBO(153, 238, 255, 1),
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisSize: MainAxisSize.min, // Use children total size
                      children: [
                        // ListView.builder(
                        //     itemCount: bodyOfCardApp.length ?? 0,
                        //     itemBuilder: (ctx, index) {
                        //       return Text(
                        //         bodyOfCardApp[index] ?? '',
                        //         style: TextStyle(
                        //           color: Theme.of(context)
                        //               .accentTextTheme
                        //               .headline1
                        //               .color,
                        //           fontSize: 20,
                        //         ),
                        //       );
                        //     }),
                      ]),
                ),
              ),
            ),
            // child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       ...bodyOfCardApp.map((x) {
            //         return Text(
            //           x,
            //           style: TextStyle(
            //             color: Color.fromRGBO(0, 0, 0, 1),
            //             fontSize: 20,
            //           ),
            //         );
            //       }).toList(),
            //       Text(
            //         "Time : " + dateOfReservation,
            //         style: TextStyle(
            //           color: Color.fromRGBO(0, 0, 0, 1),
            //           fontSize: 20,
            //         ),
            //       )
            //     ]),
            //   ),
            // )))
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // mainAxisSize: MainAxisSize.min,
              children: [
                //   NiceButton(
                //     nameOfButton: "Change U",
                //     fontOfSize: 10,
                //   ),
                //   NiceButton(
                //       nameOfButton: "Cancel the Reservation", fontOfSize: 10)
                //
                RaisedButton(
                  child: Text(
                    "Change U",
                  ),
                  onPressed: null,
                  color: Theme.of(context).primaryColor,
                ),
                RaisedButton(
                  child: Text("Cancel the Reservation"),
                  onPressed: null,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
