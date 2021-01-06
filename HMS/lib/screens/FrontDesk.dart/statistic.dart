

import 'package:flutter/material.dart'  ;

void main() {
  runApp(Statistics ());
}

class Statistics extends StatefulWidget {
  // final  int MaxRate;
  final MaxRateStar = 5;
  // final function (int) OnRatingSelected ;

  // Statistics( this.OnRatingSelected , [this.MaxRate = 5]);
  @override
  _Statistics createState() => _Statistics();
}


class _Statistics  extends State<Statistics> {
  int CurrentRate =0;

  Widget Rate(int index ){
    if(CurrentRate < 5){
      return Icon(Icons.star, color: Colors.amber,);
    }
    else {  return Icon(Icons.star_border_outlined); }
  }

  Widget RateBody (){
    final  stars = List<Widget>.generate(this.widget.MaxRateStar, (index)
    {
      return GestureDetector(
          child: Rate(index ),
          onTap :(){
            setState(() {
              CurrentRate = CurrentRate + 1;
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

    return RateBody ();

  }
}
