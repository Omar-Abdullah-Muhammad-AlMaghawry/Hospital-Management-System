

import 'package:flutter/material.dart'  ;

// void main() {
//   runApp(Statistics ());
// }

class Statistics extends StatefulWidget {
  // final  int MaxRate;
  final maxRateStar = 5;
  // final function (int) OnRatingSelected ;

  // Statistics( this.OnRatingSelected , [this.MaxRate = 5]);
  @override
  _Statistics createState() => _Statistics();
}


class _Statistics  extends State<Statistics> {
  int currentRate =0;

  Widget rate(int index ){
    if(currentRate < 5){
      return Icon(Icons.star, color: Colors.amber,);
    }
    else {  return Icon(Icons.star_border_outlined); }
  }

  Widget rateBody (){
    final  stars = List<Widget>.generate(this.widget.maxRateStar, (index)
    {
      return GestureDetector(
          child: rate(index ),
          onTap :(){
            setState(() {
              currentRate = currentRate + 1;
            });
          }
        //  this.widget.Rate(MaxRate);
      );
    }
    );

    return Row(  children :stars , mainAxisAlignment : MainAxisAlignment.center) ;
  }
  @override
  Widget build(BuildContext context) {

    return rateBody ();

  }
}
