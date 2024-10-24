import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:weather/cubit/weather_cubit.dart';
import 'package:weather/models/weather_model..dart';

class SwapWeather extends StatelessWidget {
  SwapWeather({super.key});
  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemCount: 4,
      itemWidth: 360.0,
      itemHeight: 720,
      layout: SwiperLayout.TINDER,
      itemBuilder: (context, index) {
        return  Padding(
          padding:const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
            crossAxisAlignment:CrossAxisAlignment.center,
            children: [
              Text(weathers[index].cityName,style:const TextStyle(fontSize:25 ,fontWeight:FontWeight.bold)),
              Container(
                width:300,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                child: Container(
                  width:295,
                  height: 295,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.purple[400],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(weathers[index].status,style:TextStyle(color:Colors.blue[400],fontSize: 23,fontWeight: FontWeight.bold)),
                      Text(weathers[index].date,
                              style: TextStyle(
                                  color: Colors.blue[300],
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              child:
                                  Image.network(weathers[index].icon),
                            ),
                            const SizedBox(width: 10),
                            Text(weathers[index].avgTemp.toString(),
                                    style: TextStyle(
                                        color: Colors.blue[600],
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  )
                ),
              ),
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 105,
                    height: 105,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                    ),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.purple[100],
                      ),
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Min",style:TextStyle(color:Colors.blue[400],fontSize: 23,fontWeight: FontWeight.bold)),
                          Text(weathers[index].minTemp.toString(),
                                  style: TextStyle(
                                      color: Colors.blue[300],
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                          ]
                      ),
                  )
                  ),
                  Container(
                      width: 105,
                      height: 105,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                      child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.purple[300],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Max",style:TextStyle(color:Colors.blue[400],fontSize: 23,fontWeight: FontWeight.bold)),
                              Text(weathers[index].maxTemp.toString(),
                                      style: TextStyle(
                                          color: Colors.blue[300],
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                              ]
                          ),
                      ),
                  ),
                ],
              ),
            ],
          )
        );
      },
    );
  }
}
