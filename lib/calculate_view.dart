import 'package:calculator/calculate_button.dart';
import 'package:flutter/material.dart';

class CalculateView extends StatefulWidget {
  const CalculateView({super.key});

  @override
  State<CalculateView> createState() => _CalculateViewState();
}

class _CalculateViewState extends State<CalculateView> {
  String resultText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: const Text(
          'Calculator',
          style: TextStyle(
            fontSize: 24,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Text(
              resultText,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculateButton(
                  text: '7',
                  onBTNClick: onDigitClick,
                ),
                CalculateButton(
                  text: '8',
                  onBTNClick: onDigitClick,
                ),
                CalculateButton(
                  text: '9',
                  onBTNClick: onDigitClick,
                ),
                CalculateButton(
                  text: '/',
                  onBTNClick: onOpratorClick,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculateButton(
                  text: '4',
                  onBTNClick: onDigitClick,
                ),
                CalculateButton(
                  text: '5',
                  onBTNClick: onDigitClick,
                ),
                CalculateButton(
                  text: '6',
                  onBTNClick: onDigitClick,
                ),
                CalculateButton(
                  text: '*',
                  onBTNClick: onOpratorClick,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculateButton(
                  text: '1',
                  onBTNClick: onDigitClick,
                ),
                CalculateButton(
                  text: '2',
                  onBTNClick: onDigitClick,
                ),
                CalculateButton(
                  text: '3',
                  onBTNClick: onDigitClick,
                ),
                CalculateButton(
                  text: '-',
                  onBTNClick: onOpratorClick,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculateButton(
                  text: '.',
                  onBTNClick: onDigitClick,
                ),
                CalculateButton(
                  text: '0',
                  onBTNClick: onDigitClick,
                ),
                CalculateButton(
                  text: '=',
                  onBTNClick: onEqualClick,
                ),
                CalculateButton(
                  text: '+',
                  onBTNClick: onOpratorClick,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onDigitClick(String btnText) {
    // ignore: avoid_print
    print(' Clicked $btnText');

    resultText += btnText;
    setState(() {});
  }

  String savedNumber = '';
  String savedOprator = '';

  onEqualClick(String btnText) {
    var result = calculate(savedNumber, savedOprator, resultText);
    resultText = result;
    savedNumber = '';
    savedOprator = '';
    setState(() {});
  }

  void onOpratorClick(String btnText) {
    if (savedNumber.isEmpty) {
      savedNumber = resultText;
      savedOprator = btnText;
      resultText = '';
    } else {
      String numNumber = resultText;
      savedNumber = calculate(savedNumber, savedOprator, numNumber);
      savedOprator = btnText;
      resultText = '';
    }
    setState(() {});
  }

  String calculate(String lhs, String oprator, String rsh) {
    double n1 = double.parse(lhs);
    double n2 = double.parse(rsh);

    double result = 0;

    if (oprator == '+') {
      result = (n1 + n2);
    } else if (oprator == '-') {
      result = (n1 - n2);
    } else if (oprator == '*') {
      result = (n1 * n2);
    } else if (oprator == '/') {
      result = (n1 / n2);
    }
    return result.toString();
  }
}
