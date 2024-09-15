// String manipulations 
void main() {
  // String concatenation
  String firstName = 'John';
  String lastName = 'Doe';
  String fullName = firstName + ' ' + lastName;
  print('Full Name: $fullName');

  // String interpolation
  int age = 30;
  String message = 'Hello, my name is $fullName and I am $age years old.';
  print(message);

  // Substring extraction
  String subString = fullName.substring(0, 4);
  print('Substring: $subString');

  // Case conversion
  String upperCase = fullName.toUpperCase();
  String lowerCase = fullName.toLowerCase();
  print('Uppercase: $upperCase');
  print('Lowercase: $lowerCase');

  // Reverse a string
  String reversed = reverseString(fullName);
  print('Reversed: $reversed');

  // Count length
  int length = fullName.length;
  print('Length: $length');
}

String reverseString(String input) {
  return input.split('').reversed.join('');
}

// Collections
void main() {
  // Lists
  List<String> fruits = ['Apple', 'Banana', 'Mango'];
  fruits.add('Orange');
  fruits.remove('Banana');
  print('List of fruits:');
  for (var fruit in fruits) {
    print(fruit);
  }

  // Sets
  Set<String> uniqueFruits = {'Apple', 'Banana', 'Mango'};
  uniqueFruits.add('Orange');
  uniqueFruits.add('Apple'); // Duplicate, won't be added
  uniqueFruits.remove('Banana');
  print('\nSet of unique fruits:');
  for (var fruit in uniqueFruits) {
    print(fruit);
  }

  // Maps
  Map<String, int> fruitPrices = {
    'Apple': 2,
    'Banana': 1,
    'Mango': 3
  };
  fruitPrices['Orange'] = 4;
  fruitPrices.remove('Banana');
  print('\nMap of fruit prices:');
  fruitPrices.forEach((fruit, price) {
    print('$fruit: \$${price}');
  });
}

// File handling
import 'dart:io';

void main() async {
  // File paths
  String inputFilePath = 'input.txt';
  String outputFilePath = 'output.txt';

  try {
    // Read content from the input file
    String content = await readFile(inputFilePath);
    print('Content of $inputFilePath:');
    print(content);

    // Write new data to the output file
    String newData = 'This is the new data to be written to the file.';
    await writeFile(outputFilePath, newData);
    print('New data written to $outputFilePath.');
  } catch (e) {
    print('An error occurred: $e');
  }
}

Future<String> readFile(String path) async {
  try {
    final file = File(path);
    return await file.readAsString();
  } catch (e) {
    throw Exception('Error reading file: $e');
  }
}

Future<void> writeFile(String path, String data) async {
  try {
    final file = File(path);
    await file.writeAsString(data);
  } catch (e) {
    throw Exception('Error writing file: $e');
  }
}

// Date and Time
Date and Time:

import 'package:intl/intl.dart';

void main() {
  // Current date and time
  DateTime now = DateTime.now();
  print('Current date and time: $now');

  // Formatting date
  String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
  print('Formatted date: $formattedDate');

  // Parsing date from string
  String dateString = '2024-09-10 12:30:00';
  DateTime parsedDate = DateTime.parse(dateString);
  print('Parsed date: $parsedDate');

  // Adding and subtracting days
  DateTime futureDate = now.add(Duration(days: 10));
  DateTime pastDate = now.subtract(Duration(days: 10));
  print('Date 10 days from now: $futureDate');
  print('Date 10 days ago: $pastDate');

  // Calculating difference between two dates
  Duration difference = futureDate.difference(pastDate);
  print('Difference between $futureDate and $pastDate is ${difference.inDays} days');
}

// Application that combines the above utilities

import 'dart:io';
import 'dart:convert';
import 'dart:collection';

void main() {
  // Initialize a list to store user inputs and their timestamps
  List<Map<String, String>> entries = [];

  // Function to get user input and perform string manipulation
  void getUserInput() {
    print('Enter a string:');
    String? input = stdin.readLineSync();

    if (input != null && input.isNotEmpty) {
      // Perform string manipulation (e.g., convert to uppercase)
      String manipulatedString = input.toUpperCase();

      // Get the current date and time
      String timestamp = DateTime.now().toIso8601String();

      // Store the result in the collection
      entries.add({'input': manipulatedString, 'timestamp': timestamp});

      print('String manipulated and stored: $manipulatedString at $timestamp');
    } else {
      print('No input provided.');
    }
  }

  // Function to save the data to a file
  void saveToFile() {
    File file = File('user_entries.json');
    String jsonContent = jsonEncode(entries);
    file.writeAsStringSync(jsonContent);
    print('Data saved to user_entries.json');
  }

  // Main loop to get user input and save data
  while (true) {
    getUserInput();

    print('Do you want to add another entry? (yes/no)');
    String? continueInput = stdin.readLineSync();

    if (continueInput == null || continueInput.toLowerCase() != 'yes') {
      break;
    }
  }

  // Save the collected data to a file
  saveToFile();
}


