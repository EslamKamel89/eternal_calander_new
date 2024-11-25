import 'package:eternal_calander_new/core/extensions/context-extensions.dart';
import 'package:flutter/material.dart';

class DataSelector extends StatefulWidget {
  const DataSelector({super.key});

  @override
  DataSelectorState createState() => DataSelectorState();
}

enum DataProcessingOption { before, after }

class DataSelectorState extends State<DataSelector> {
  DataProcessingOption? _selectedOption = DataProcessingOption.after;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Select type of data:',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: context.primaryColor),
          ),
          const SizedBox(height: 15.0),
          Row(
            children: [
              Expanded(
                child: RadioListTile<DataProcessingOption>(
                  title: Text('After\nProcessing',
                      style: TextStyle(
                        color: _selectedOption == DataProcessingOption.after ? context.primaryColor : null,
                        fontWeight: _selectedOption == DataProcessingOption.after ? FontWeight.bold : null,
                      )),
                  value: DataProcessingOption.after,
                  selectedTileColor: context.secondaryHeaderColor,
                  activeColor: context.secondaryHeaderColor,
                  groupValue: _selectedOption,
                  onChanged: (DataProcessingOption? value) {
                    setState(() {
                      _selectedOption = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTile<DataProcessingOption>(
                  title: Text('Before\nProcessing',
                      style: TextStyle(
                        color: _selectedOption == DataProcessingOption.before ? context.primaryColor : null,
                        fontWeight: _selectedOption == DataProcessingOption.before ? FontWeight.bold : null,
                      )),
                  value: DataProcessingOption.before,
                  selectedTileColor: context.secondaryHeaderColor,
                  activeColor: context.secondaryHeaderColor,
                  groupValue: _selectedOption,
                  onChanged: (DataProcessingOption? value) {
                    setState(() {
                      _selectedOption = value;
                    });
                  },
                ),
              ),
            ],
          ),
          // const SizedBox(height: 32.0),
          // ElevatedButton(
          //   onPressed: () {
          //     if (_selectedOption != null) {
          //       _showSelectedOption(context, _selectedOption!);
          //     }
          //   },
          //   child: const Text('Submit'),
          // ),
        ],
      ),
    );
  }
}
