import 'package:flutter/material.dart';

class InputInteractionWidgetsPage extends StatefulWidget {
  const InputInteractionWidgetsPage({super.key});

  @override
  State<InputInteractionWidgetsPage> createState() => _InputInteractionWidgetsPageState();
}

class _InputInteractionWidgetsPageState extends State<InputInteractionWidgetsPage> {
  bool _checkboxValue = false;
  bool _switchValue = false;
  String _radioValue = 'Option 1';
  double _sliderValue = 50.0;
  String _dropdownValue = 'Option 1';
  String _textFieldValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input & Interaction Widgets'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildWidgetSection(
            'ElevatedButton Widget',
            'A material design elevated button',
            [
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('ElevatedButton pressed!')),
                  );
                },
                child: const Text('ElevatedButton'),
              ),
              const SizedBox(height: 8),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.star),
                label: const Text('With Icon'),
              ),
            ],
          ),
          _buildWidgetSection(
            'TextButton Widget',
            'A material design text button',
            [
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('TextButton pressed!')),
                  );
                },
                child: const Text('TextButton'),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.favorite),
                label: const Text('With Icon'),
              ),
            ],
          ),
          _buildWidgetSection(
            'OutlinedButton Widget',
            'A material design outlined button',
            [
              OutlinedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('OutlinedButton pressed!')),
                  );
                },
                child: const Text('OutlinedButton'),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.settings),
                label: const Text('With Icon'),
              ),
            ],
          ),
          _buildWidgetSection(
            'IconButton Widget',
            'A button that displays an icon',
            [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Home pressed!')),
                      );
                    },
                    icon: const Icon(Icons.home),
                    iconSize: 30,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite),
                    iconSize: 30,
                    color: Colors.red,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.share),
                    iconSize: 30,
                    color: Colors.blue,
                  ),
                ],
              ),
            ],
          ),
          _buildWidgetSection(
            'FloatingActionButton Widget',
            'A circular material button that hovers over content',
            [
              Row(
                children: [
                  FloatingActionButton(
                    mini: true,
                    onPressed: () {},
                    child: const Icon(Icons.add),
                  ),
                  const SizedBox(width: 16),
                  FloatingActionButton(
                    onPressed: () {},
                    child: const Icon(Icons.edit),
                  ),
                  const SizedBox(width: 16),
                  FloatingActionButton.extended(
                    onPressed: () {},
                    icon: const Icon(Icons.save),
                    label: const Text('Save'),
                  ),
                ],
              ),
            ],
          ),
          _buildWidgetSection(
            'GestureDetector Widget',
            'Detects gestures like taps, drags, etc.',
            [
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Container tapped!')),
                  );
                },
                onDoubleTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Container double tapped!')),
                  );
                },
                child: Container(
                  width: 200,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.3),
                    border: Border.all(color: Colors.orange),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text('Tap or Double Tap Me!'),
                  ),
                ),
              ),
            ],
          ),
          _buildWidgetSection(
            'InkWell Widget',
            'A rectangular area that responds to touch with ripple effect',
            [
              InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('InkWell tapped!')),
                  );
                },
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text('Tap for Ripple Effect'),
                  ),
                ),
              ),
            ],
          ),
          _buildWidgetSection(
            'TextField Widget',
            'A text input field',
            [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Enter text',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.text_fields),
                ),
                onChanged: (value) {
                  setState(() {
                    _textFieldValue = value;
                  });
                },
              ),
              const SizedBox(height: 8),
              Text('Current value: $_textFieldValue'),
            ],
          ),
          _buildWidgetSection(
            'DropdownButton Widget',
            'A button that shows a dropdown list when tapped',
            [
              DropdownButton<String>(
                value: _dropdownValue,
                items: const [
                  DropdownMenuItem(value: 'Option 1', child: Text('Option 1')),
                  DropdownMenuItem(value: 'Option 2', child: Text('Option 2')),
                  DropdownMenuItem(value: 'Option 3', child: Text('Option 3')),
                ],
                onChanged: (value) {
                  setState(() {
                    _dropdownValue = value!;
                  });
                },
              ),
            ],
          ),
          _buildWidgetSection(
            'Checkbox Widget',
            'A material design checkbox',
            [
              Row(
                children: [
                  Checkbox(
                    value: _checkboxValue,
                    onChanged: (value) {
                      setState(() {
                        _checkboxValue = value!;
                      });
                    },
                  ),
                  Text('Checkbox is ${_checkboxValue ? 'checked' : 'unchecked'}'),
                ],
              ),
            ],
          ),
          _buildWidgetSection(
            'Radio Widget',
            'A material design radio button',
            [
              Column(
                children: [
                  RadioListTile<String>(
                    title: const Text('Option 1'),
                    value: 'Option 1',
                    groupValue: _radioValue,
                    onChanged: (value) {
                      setState(() {
                        _radioValue = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Option 2'),
                    value: 'Option 2',
                    groupValue: _radioValue,
                    onChanged: (value) {
                      setState(() {
                        _radioValue = value!;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          _buildWidgetSection(
            'Switch Widget',
            'A material design switch',
            [
              Row(
                children: [
                  Switch(
                    value: _switchValue,
                    onChanged: (value) {
                      setState(() {
                        _switchValue = value;
                      });
                    },
                  ),
                  Text('Switch is ${_switchValue ? 'ON' : 'OFF'}'),
                ],
              ),
            ],
          ),
          _buildWidgetSection(
            'Slider Widget',
            'A material design slider',
            [
              Column(
                children: [
                  Slider(
                    value: _sliderValue,
                    min: 0,
                    max: 100,
                    divisions: 10,
                    label: _sliderValue.round().toString(),
                    onChanged: (value) {
                      setState(() {
                        _sliderValue = value;
                      });
                    },
                  ),
                  Text('Value: ${_sliderValue.round()}'),
                ],
              ),
            ],
          ),
          _buildWidgetSection(
            'Form Widget',
            'A container for grouping form fields',
            [
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Form submitted!')),
                        );
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWidgetSection(String title, String description, List<Widget> examples) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 12),
            ...examples.map((widget) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: widget,
            )),
          ],
        ),
      ),
    );
  }
}
