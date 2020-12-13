import 'package:HMS/widget/NiceButton.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'CardWidget.dart';
class CardHistoryWidget extends StatelessWidget {
  final String titleOfCardApp;
  final List<String> bodyOfCardApp;
  final DateTime dateOfReservation;
  CardHistoryWidget(
      {this.titleOfCardApp, this.bodyOfCardApp,this.dateOfReservation});
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
                    margin: EdgeInsets.only(left: 5,right: 5),
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
                    margin: EdgeInsets.only(left: 5,right: 5),
                    color: Color.fromRGBO(68, 204, 255, 1),
                    child: Text(
                      DateFormat.yMMMd().format(dateOfReservation).toString(),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [...bodyOfCardApp.map((x) {
                  return Text(
                    x,
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 20,
                    ),
                  );
                }).toList(),Text("Time : "+DateFormat.Hm().format(dateOfReservation),style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 20,
                    ),)]

              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
