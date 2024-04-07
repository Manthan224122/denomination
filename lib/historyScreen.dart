


import 'package:denomination/Models/history_model.dart';
import 'package:denomination/Resource/Colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'Boxes/boxes.dart';

class historyScreen extends StatefulWidget {
  const historyScreen({super.key});

  @override
  State<historyScreen> createState() => _historyScreenState();
}

class _historyScreenState extends State<historyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        title: Text('History'),
      ),
      body: ValueListenableBuilder<Box<history_model>>(
        valueListenable: Boxes.getData().listenable(),
        builder: (context,box,_){
          var data=box.values.toList().cast<history_model>();
          return ListView.builder(
            itemCount: box.length,
              itemBuilder: (context,index){
                return Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  child: Card(
                    color: appcolors.primaryColor,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data[index].category,style: TextStyle(fontSize: 10,color: Colors.white),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('₹${data[index].numberResult}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:data[index].category=='General' ? Colors.blue : data[index].category=='Expence' ? Colors.red : Colors.green),),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(data[index].date,style: TextStyle(fontSize: 10,color: Colors.blueGrey[700]),),
                                  Text(data[index].time,style: TextStyle(fontSize: 10,color: Colors.blueGrey[700]),),
                                ],
                              ),
                            ],
                          ),
                          Text(data[index].remark,style: TextStyle(fontSize: 10,color: Colors.blueGrey),),
                        ],
                      ),
                    ),
                  ),
                );
              }
          );
        },
      ),
    );
  }
}
