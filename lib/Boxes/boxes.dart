

import 'package:hive/hive.dart';
import '../Models/history_model.dart';

class Boxes{

  static Box<history_model> getData()=> Hive.box<history_model>('denomination_history');

}