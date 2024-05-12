import 'dart:io';

class Stack {
  List<String> _notes = [];

  void addNote(String note) {
    _notes.add(note);
  }

  String pop() {
    if (isEmpty()) {
      throw Exception('No Notch left');
    }
    return _notes.removeLast();
  }

  bool isEmpty() {
    return _notes.isEmpty;
  }

  void displayNotes() {
    if(_notes.length != 0){
      print("Notch:");
      _notes.forEach((note) => print("- $note"));
    }else{
      print("No Notch");
    }
  }
}

void main() {
  var noteStack = Stack();
  while (true) {
    print("1. Add Notch");
    print("2. Remove Notch");
    print("3. Display Notch");
    print("4. Exit");
    stdout.write("Enter your choice: ");
    var choice = int.tryParse(stdin.readLineSync() ?? '');
    
    switch (choice) {
      case 1:
        stdout.write("Enter your Notch: ");
        var note = stdin.readLineSync();
        if (note != null && note.isNotEmpty) {
          noteStack.addNote(note);
          print("Note added.");
        } else {
          print("Notch cannot be empty.");
        }
        break;
      case 2:
        try {
          var removedNote = noteStack.pop();
          print("Notch removed: $removedNote");
        } catch (e) {
          print("Error: ${e.toString()}");
        }
        break;
      case 3:
        noteStack.displayNotes();
        break;
      case 4:
        print("Exiting program.");
        return;
      default:
        print("Invalid choice. Please enter a number between 1 and 4.");
    }
    print(""); // Empty line for readability
  }
}
