import 'dart:io';
import 'dart:convert';

void readUserProfile(var name) {
  var fileName = name.replaceAll(' ', '_').toLowerCase();
  var filePath = "bin/user_data/$fileName.json";
  
  try {
    String jsonString = File(filePath).readAsStringSync();
    var jsonData = jsonDecode(jsonString);
    print('\n');
    print('\x1B[32mName\x1B[0m: ${jsonData['name']}');
    print('\x1B[32mAget\x1B[0m: ${jsonData['age']}');
    print('\x1B[32mBirth Place\x1B[0m: ${jsonData['birthplace']}');
    print('\x1B[32mBiography\x1B[0m: ${jsonData['biography']}');
    print('\x1B[32mMotto\x1B[0m: ${jsonData['motto']}');
  } catch (e) {
    if (e is FileSystemException) {
      print("User profile not found.");
    } else {
      print("Error reading user profile: $e");
    }
  }
}
void userList() {
  try {
    final file = File('bin/userList.txt');
    var lines = file.readAsLinesSync();
    print("\x1B[32mStudent File List\x1B[0m:");
    for (var line in lines) {
      print(line);
    }
    print('\n');
  } catch (e) {
    print("Error reading user list: $e");
  }
}

void main() {
  print('\n');
  userList();
  print("Enter a File Name: ");
  var name = stdin.readLineSync();
  readUserProfile(name);
}
