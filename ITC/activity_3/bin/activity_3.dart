import 'dart:async';
import 'dart:io';

void main() async {  
  final file = File('bin/data.txt');
  print('== Reading data from data txt');
  var data = await file.readAsString();
  var dataList = data.split(',');
  print('\x1B[32mData\x1B[0m: ${dataList}');
  int total = 0;
  for(var i in dataList) {          
    total += int.parse(i); 
  }
  print('== Calculating Total');
  print('\x1B[32mTotal\x1B[0m: ${total}');
  var resultFile = File('bin/result.txt');
  if (await resultFile.exists()) {
    var sink = resultFile.openWrite();
    print('== Writing result to Result Txt');
    sink.writeln('Total: $total');
    await sink.close();
  } else {
    await resultFile.writeAsString('Total: $total');
  }
}
