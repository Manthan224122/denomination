import 'package:denomination/Models/history_model.dart';
import 'package:denomination/Resource/Colors/app_colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:hive/hive.dart';
import 'package:number_to_words_english/number_to_words_english.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


import 'Boxes/boxes.dart';
import 'Resource/Utiles/editText.dart';
import 'Resource/Utiles/functions.dart';
import 'Resource/Utiles/toasts.dart';
import 'historyScreen.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {

  TextEditingController oneController = TextEditingController();
  TextEditingController twoController = TextEditingController();
  TextEditingController fiveController = TextEditingController();
  TextEditingController tenController = TextEditingController();
  TextEditingController twentyController = TextEditingController();
  TextEditingController fiftyController = TextEditingController();
  TextEditingController oneHundredController = TextEditingController();
  TextEditingController twoHundredController = TextEditingController();
  TextEditingController fiveHundredController = TextEditingController();
  TextEditingController twoThousandController = TextEditingController();

  TextEditingController remarkController = TextEditingController();

  FocusNode oneFocusNode = FocusNode();
  FocusNode twoFocusNode = FocusNode();
  FocusNode fiveFocusNode = FocusNode();
  FocusNode tenFocusNode = FocusNode();
  FocusNode twentyFocusNode = FocusNode();
  FocusNode fiftyFocusNode = FocusNode();
  FocusNode oneHundredFocusNode = FocusNode();
  FocusNode twoHundredFocusNode = FocusNode();
  FocusNode fiveHundredFocusNode = FocusNode();
  FocusNode twoThousandFocusNode = FocusNode();

  FocusNode remarkFocusNode = FocusNode();


  int totalResult=0;

  int oneResult=0;
  int twoResult=0;
  int fiveResult=0;
  int tenResult=0;
  int twentyResult=0;
  int fiftyResult=0;
  int oneHundredResult=0;
  int twoHundredResult=0;
  int fiveHundredResult=0;
  int twoThousandResult=0;

  var statusItem = ['General','Income','Expence'];
  var statusDropdownValue;


  @override
  void initState() {
    super.initState();
    oneController.addListener(_updateResult);
    twoController.addListener(_updateResult);
    fiveController.addListener(_updateResult);
    tenController.addListener(_updateResult);
    twentyController.addListener(_updateResult);
    fiftyController.addListener(_updateResult);
    oneHundredController.addListener(_updateResult);
    twoHundredController.addListener(_updateResult);
    fiveHundredController.addListener(_updateResult);
    twoThousandController.addListener(_updateResult);
  }

  void _updateResult() {
    setState(() {
      oneResult = int.tryParse(oneController.text) ?? 0;
      twoResult = int.tryParse(twoController.text) ?? 0;
      fiveResult = int.tryParse(fiveController.text) ?? 0;
      tenResult = int.tryParse(tenController.text) ?? 0;
      twentyResult = int.tryParse(twentyController.text) ?? 0;
      fiftyResult = int.tryParse(fiftyController.text) ?? 0;
      oneHundredResult = int.tryParse(oneHundredController.text) ?? 0;
      twoHundredResult = int.tryParse(twoHundredController.text) ?? 0;
      fiveHundredResult = int.tryParse(fiveHundredController.text) ?? 0;
      twoThousandResult = int.tryParse(twoThousandController.text) ?? 0;

      oneResult = oneResult*1;
      twoResult = twoResult*2;
      fiveResult = fiveResult*5;
      tenResult = tenResult*10;
      twentyResult = twentyResult*20;
      fiftyResult = fiftyResult*50;
      oneHundredResult = oneHundredResult*100;
      twoHundredResult = twoHundredResult*200;
      fiveHundredResult = fiveHundredResult*500;
      twoThousandResult = twoThousandResult*2000;

      totalResult = _calculateTotalResult();

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 150.0,
            backgroundColor: appcolors.primaryColor,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(left: 10),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${totalResult==0 ? 'Denomination' : 'Total Amount\n₹${totalResult}'}', textScaleFactor: 0.8,),
                  Text('${totalResult==0 ? '' : '${NumberToWordsEnglish.convert(totalResult)} only/-'}',style: TextStyle(fontSize: 10,color: Colors.white),),
                ],
              ),
              background: Image.asset('assets/images/currency_banner.jpg', fit: BoxFit.cover,),
            ),
            actions: [
              PopupMenuButton(
                  iconColor: Colors.white,
                  color: Colors.black,
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem<int>(
                        value: 0,
                        child: Row(
                          children: [
                            Icon(Icons.history,color: Colors.blueAccent,size: 18,),
                            SizedBox(width: 5,),
                            Text("History",style: TextStyle(color: Colors.white,fontSize: 12),),
                          ],
                        ),
                      ),
                    ];
                  },
                  onSelected: (value) async {
                    if (value == 0) {
                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => historyScreen()));
                    }
                  }
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [

                getContainer(2000,twoThousandController,twoThousandFocusNode,twoThousandResult),

                getContainer(500,fiveHundredController,fiveHundredFocusNode,fiveHundredResult),

                getContainer(200,twoHundredController,twoHundredFocusNode,twoHundredResult),

                getContainer(100,oneHundredController,oneHundredFocusNode,oneHundredResult),

                getContainer(50,fiftyController,fiftyFocusNode,fiftyResult),

                getContainer(20,twentyController,twentyFocusNode,twentyResult),

                getContainer(10,tenController,tenFocusNode,tenResult),

                getContainer(5,fiveController,fiveFocusNode,fiveResult),

                getContainer(2,twoController,twoFocusNode,twoResult),

                getContainer(1,oneController,oneFocusNode,oneResult),


              ],
            ),
          ),
        ],
      ),

      floatingActionButton: totalResult==0 ? Container() : SpeedDial(
          icon: Icons.offline_bolt_rounded,
          foregroundColor: Colors.black38,
          backgroundColor: Colors.blueAccent,
          children: [
            SpeedDialChild(
              child: const Icon(Icons.refresh,color: Colors.white),
              label: 'Clear',
              labelStyle: TextStyle(color: Colors.white),
              labelBackgroundColor: Colors.black54,
              backgroundColor: Colors.black54,
              onTap: () {
                totalResult=0;

                oneController.clear();
                twoController.clear();
                fiveController.clear();
                tenController.clear();
                twentyController.clear();
                fiftyController.clear();
                oneHundredController.clear();
                twoHundredController.clear();
                fiveHundredController.clear();
                twoThousandController.clear();

                oneFocusNode.unfocus();
                twoFocusNode.unfocus();
                fiveFocusNode.unfocus();
                tenFocusNode.unfocus();
                twentyFocusNode.unfocus();
                fiftyFocusNode.unfocus();
                oneHundredFocusNode.unfocus();
                twoHundredFocusNode.unfocus();
                fiveHundredFocusNode.unfocus();
                twoThousandFocusNode.unfocus();

                setState(() {});
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.save_alt,color: Colors.white),
              label: 'Save',
              labelStyle: TextStyle(color: Colors.white),
              labelBackgroundColor: Colors.black54,
              backgroundColor: Colors.black54,
              onTap: () {
                Alert(
                  context: context,
                  style: AlertStyle(
                    backgroundColor: Colors.black,
                    descStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                    descPadding: EdgeInsets.all(5),
                    isOverlayTapDismiss: false,
                  ),
                  closeFunction: (){
                    remarkController.clear();
                    statusDropdownValue=null;
                    Navigator.pop(context);
                    setState(() {});
                  },
                  content: StatefulBuilder(
                      builder: (context,setState){
                        return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            children: [

                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5,bottom: 2),
                                    child: Text('Category',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.white),),
                                  ),
                                  Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        color: Color(0xffC5C5C5),
                                        width: 0.5,
                                      ),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        isExpanded: true,
                                        hint: Text('Select Category',style: TextStyle(fontSize: 12,color: Colors.white),),
                                        iconStyleData: IconStyleData(
                                          icon: Padding(
                                            padding: const EdgeInsets.only(right: 16),
                                            child: Icon(Icons.keyboard_arrow_down),
                                          ),
                                        ),
                                        dropdownStyleData: DropdownStyleData(
                                          elevation: 1,
                                          maxHeight: MediaQuery.of(context).size.height/2,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: appcolors.primaryColor,
                                          ),
                                        ),
                                        buttonStyleData: ButtonStyleData(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: appcolors.primaryColor,
                                          ),
                                        ),
                                        items: statusItem.map((item01) {
                                          return DropdownMenuItem(
                                            value: item01,
                                            child: Container(width: MediaQuery.of(context).size.width/2,child: Text('${item01}',style: TextStyle(fontSize: 12,color: Colors.white),maxLines: 1,overflow: TextOverflow.ellipsis,)),
                                          );
                                        }).toList(),
                                        onChanged: (newVal01) {
                                          setState(() {
                                            statusDropdownValue = newVal01;
                                            print('dddddddd----$statusDropdownValue');
                                          });
                                        },
                                        value: statusDropdownValue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 10,),

                              editTextSimple(
                                cHeight: 45,
                                controllers: remarkController,
                                focusNode: remarkFocusNode,
                                hint: 'Fill your remark',
                                keyboardTypes: TextInputType.text,
                                maxlength: 50,
                              ),


                            ],
                          ),
                        );}
                  ),
                  buttons: [
                    DialogButton(
                      child: Text("Save", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white, fontSize: 16),),
                      onPressed: () async {
                        if (statusDropdownValue==null || remarkController.text.isEmpty == true) {
                          toasts().redToastLong('Proper Fill the Details');
                        }else{

                        final data=history_model(category: statusDropdownValue, numberResult: totalResult.toString(), englishResult: NumberToWordsEnglish.convert(totalResult).toString(), remark: remarkController.text.toString(), date: getCurrentDate(), time: getCurrentTime());
                        final box = Boxes.getData();
                        box.add(data);
                        data.save();
                        statusDropdownValue=null;
                        remarkController.clear();

                        totalResult=0;

                        oneController.clear();
                        twoController.clear();
                        fiveController.clear();
                        tenController.clear();
                        twentyController.clear();
                        fiftyController.clear();
                        oneHundredController.clear();
                        twoHundredController.clear();
                        fiveHundredController.clear();
                        twoThousandController.clear();

                        oneFocusNode.unfocus();
                        twoFocusNode.unfocus();
                        fiveFocusNode.unfocus();
                        tenFocusNode.unfocus();
                        twentyFocusNode.unfocus();
                        fiftyFocusNode.unfocus();
                        oneHundredFocusNode.unfocus();
                        twoHundredFocusNode.unfocus();
                        fiveHundredFocusNode.unfocus();
                        twoThousandFocusNode.unfocus();

                        setState(() {});

                        Navigator.pop(context);
                        }
                      },
                    ),
                  ],
                ).show();
              },
            ),

          ]),
    );
  }

  Widget getContainer(int multipledBy, TextEditingController controllers, FocusNode focusNode,int result) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              padding: EdgeInsets.all(10),
              child: Text('₹$multipledBy X', style: TextStyle(fontSize: 20, color: Colors.white),),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: editTextSimple(
                cWidth: 100,
                controllers: controllers,
                focusNode: focusNode,
                hint: '',
                keyboardTypes: TextInputType.number,
                maxlength: 6,),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text('= ₹ ${result}', style: TextStyle(fontSize: 20, color: Colors.white),)), // Display result
            ),
          ],
        ),
      ),
    );
  }

  int _calculateTotalResult() {
    return oneResult + twoResult + fiveResult + tenResult + twentyResult +
        fiftyResult + oneHundredResult + twoHundredResult +
        fiveHundredResult + twoThousandResult;
  }
}

