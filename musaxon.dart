import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(
          0xffa9f8f8), // Light blue background color for the entire screen
      body: Container(
        margin: EdgeInsets.all(
            0), // Margin is set to 0 so the container stretches to the edge
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.yellow, // Sariq rangli chegara
            width: 2, // Ingichka sariq chegara
          ),
        ),
        child: Column(
          children: [
            // Display (with rounded corners on all sides)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.only(top: 60, bottom: 60),
              width: MediaQuery.of(context).size.width * 0.9,
              height: 40, // Make the display thinner
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                    Radius.circular(0)), // No border for the display
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '06rftgbynhuijmk,', // Display expression here
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight:
                        FontWeight.bold, // Bold font for the display text
                  ),
                ),
              ),
            ),

            // Buttons (4 x 4 grid)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0), // Adjust button spacing
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // 4 columns
                    crossAxisSpacing: 40, // Smaller space between buttons
                    mainAxisSpacing: 40, // Smaller space between buttons
                    childAspectRatio: 2,
                  ),
                  itemCount: 16, // 16 buttons (including empty one)
                  itemBuilder: (context, index) {
                    // Button labels (added an empty space ' ' button)
                    List<String> buttons = [
                      '1',
                      '2',
                      '3',
                      'C',
                      '4',
                      '5',
                      '6',
                      '+',
                      '7',
                      '8',
                      '9',
                      '-',
                      ' ', // Empty space
                      '0',
                      '.',
                      '='
                    ];

                    String buttonLabel = buttons[index];

                    // If the button is empty, use a SizedBox to make it invisible
                    if (buttonLabel == ' ') {
                      return SizedBox
                          .shrink(); // Makes the button invisible but maintains the layout
                    }

                    // Get button color
                    Color buttonColor = _getButtonColor(buttonLabel);
                    Color textColor = _getTextColor(buttonLabel);

                    return ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color(0xfff1f4f4), // Buttons are white
                        ),
                        foregroundColor: MaterialStateProperty.all(
                          textColor, // Button text color
                        ),
                        padding: MaterialStateProperty.all(EdgeInsets.all(
                            5)), // Smaller padding for smaller buttons
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                            side: BorderSide(
                              color: Color(0xfff4837a), // No border
                              width: 0, // No border width
                            ),
                          ),
                        ),
                        elevation: MaterialStateProperty.all(5),
                      ),
                      child: Text(
                        buttonLabel,
                        style: TextStyle(
                          fontSize:
                              18, // Adjusted font size for smaller buttons
                          color: textColor, // Text color
                          fontWeight: FontWeight.bold, // Make the text bold
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Get button color based on label
  Color _getButtonColor(String button) {
    if (button == 'C' ||
        button == '+' ||
        button == '-' ||
        button == '=' ||
        button == '.') {
      return Colors.red; // 'C', '+', '-', '=', '.' buttons are red
    } else {
      return Colors.white70; // Other buttons are light white
    }
  }

  // Get button text color based on label
  Color _getTextColor(String button) {
    if (button == 'C' ||
        button == '+' ||
        button == '-' ||
        button == '=' ||
        button == '.') {
      return Colors.red;
    } else {
      return Colors.black;
    }
  }
}
