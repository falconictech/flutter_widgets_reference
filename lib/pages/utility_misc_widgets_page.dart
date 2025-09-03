import 'package:flutter/material.dart';

class UtilityMiscWidgetsPage extends StatefulWidget {
  const UtilityMiscWidgetsPage({super.key});

  @override
  State<UtilityMiscWidgetsPage> createState() => _UtilityMiscWidgetsPageState();
}

class _UtilityMiscWidgetsPageState extends State<UtilityMiscWidgetsPage> {
  int _currentStep = 0;
  bool _isExpanded = false;

  final List<DataRow> _dataRows = [
    const DataRow(cells: [
      DataCell(Text('John')),
      DataCell(Text('25')),
      DataCell(Text('Engineer')),
    ]),
    const DataRow(cells: [
      DataCell(Text('Jane')),
      DataCell(Text('30')),
      DataCell(Text('Designer')),
    ]),
    const DataRow(cells: [
      DataCell(Text('Bob')),
      DataCell(Text('35')),
      DataCell(Text('Manager')),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Utility & Misc Widgets'),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildWidgetSection(
            'Divider Widget',
            'A thin horizontal line with padding on either side',
            [
              const Column(
                children: [
                  Text('Content above divider'),
                  Divider(thickness: 2, color: Colors.brown),
                  Text('Content below divider'),
                  Divider(thickness: 1, color: Colors.grey),
                  Text('Another section'),
                ],
              ),
            ],
          ),
          _buildWidgetSection(
            'Card Widget',
            'A material design card with rounded corners and shadow',
            [
              const Card(
                elevation: 2,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Basic Card',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text('This is a basic card with default elevation.'),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 8,
                color: Colors.brown.withOpacity(0.1),
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Card with custom color and high elevation (8)'),
                ),
              ),
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(color: Colors.brown, width: 2),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Card with custom shape and border'),
                ),
              ),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.purple, Colors.pink],
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Card with Image Header',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('Card content with clipped behavior'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          _buildWidgetSection(
            'Tooltip Widget',
            'Displays a tooltip when long-pressed',
            [
              Row(
                children: [
                  Tooltip(
                    message: 'This is a tooltip!',
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.help_outline),
                    ),
                  ),
                  const Tooltip(
                    message: 'Tooltip on text',
                    child: Text('Hover or long press me'),
                  ),
                ],
              ),
            ],
          ),
          _buildWidgetSection(
            'SnackBar Widget',
            'Shows brief messages at the bottom of the screen',
            [
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('This is a SnackBar!'),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {},
                      ),
                      duration: const Duration(seconds: 3),
                    ),
                  );
                },
                child: const Text('Show SnackBar'),
              ),
            ],
          ),
          _buildWidgetSection(
            'AlertDialog Widget',
            'A material design alert dialog',
            [
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Alert Dialog'),
                      content: const Text('This is an alert dialog with some content.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text('Show Alert Dialog'),
              ),
            ],
          ),
          _buildWidgetSection(
            'ExpansionTile Widget',
            'A tile that can be expanded to show additional content',
            [
              ExpansionTile(
                title: const Text('Expansion Tile'),
                subtitle: const Text('Tap to expand'),
                leading: const Icon(Icons.expand_more),
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: const Text('This content is revealed when expanded!'),
                  ),
                  const ListTile(
                    title: Text('Item 1'),
                    leading: Icon(Icons.star),
                  ),
                  const ListTile(
                    title: Text('Item 2'),
                    leading: Icon(Icons.favorite),
                  ),
                ],
              ),
            ],
          ),
          _buildWidgetSection(
            'DataTable Widget',
            'A material design data table',
            [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Age')),
                    DataColumn(label: Text('Role')),
                  ],
                  rows: _dataRows,
                ),
              ),
            ],
          ),
          _buildWidgetSection(
            'Stepper Widget',
            'A widget that displays progress through a sequence of steps',
            [
              Stepper(
                currentStep: _currentStep,
                onStepTapped: (step) {
                  setState(() {
                    _currentStep = step;
                  });
                },
                controlsBuilder: (context, details) {
                  return Row(
                    children: [
                      if (details.stepIndex < 2)
                        ElevatedButton(
                          onPressed: details.onStepContinue,
                          child: const Text('Next'),
                        ),
                      const SizedBox(width: 8),
                      if (details.stepIndex > 0)
                        TextButton(
                          onPressed: details.onStepCancel,
                          child: const Text('Back'),
                        ),
                    ],
                  );
                },
                onStepContinue: () {
                  if (_currentStep < 2) {
                    setState(() {
                      _currentStep++;
                    });
                  }
                },
                onStepCancel: () {
                  if (_currentStep > 0) {
                    setState(() {
                      _currentStep--;
                    });
                  }
                },
                steps: const [
                  Step(
                    title: Text('Step 1'),
                    content: Text('This is the first step'),
                    isActive: true,
                  ),
                  Step(
                    title: Text('Step 2'),
                    content: Text('This is the second step'),
                  ),
                  Step(
                    title: Text('Step 3'),
                    content: Text('This is the final step'),
                  ),
                ],
              ),
            ],
          ),
          _buildWidgetSection(
            'ProgressIndicator Widgets',
            'Linear and circular progress indicators',
            [
              Column(
                children: [
                  const Text('Linear Progress Indicators'),
                  const SizedBox(height: 8),
                  const LinearProgressIndicator(value: 0.3),
                  const SizedBox(height: 8),
                  const LinearProgressIndicator(value: 0.7),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: 0.5,
                    backgroundColor: Colors.grey[300],
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                  ),
                  const SizedBox(height: 8),
                  const LinearProgressIndicator(), // Indeterminate
                  const SizedBox(height: 24),
                  const Text('Circular Progress Indicators'),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const CircularProgressIndicator(value: 0.3),
                      const CircularProgressIndicator(value: 0.7),
                      CircularProgressIndicator(
                        value: 0.5,
                        backgroundColor: Colors.grey[300],
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                        strokeWidth: 6,
                      ),
                      CircularProgressIndicator(
                        backgroundColor: Colors.grey[300],
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.brown),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: CircularProgressIndicator(
                          value: 0.75,
                          strokeWidth: 8,
                          backgroundColor: Colors.grey[300],
                          valueColor: const AlwaysStoppedAnimation<Color>(Colors.orange),
                        ),
                      ),
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: CircularProgressIndicator(
                          value: 0.6,
                          strokeWidth: 4,
                          backgroundColor: Colors.grey[300],
                          valueColor: const AlwaysStoppedAnimation<Color>(Colors.purple),
                        ),
                      ),
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: CircularProgressIndicator(
                          value: 0.9,
                          strokeWidth: 10,
                          backgroundColor: Colors.grey[300],
                          valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          _buildWidgetSection(
            'Chip Widget',
            'A material design chip',
            [
              Wrap(
                spacing: 8,
                children: [
                  const Chip(
                    label: Text('Basic Chip'),
                    avatar: Icon(Icons.person),
                  ),
                  Chip(
                    label: const Text('Deletable Chip'),
                    onDeleted: () {},
                    deleteIcon: const Icon(Icons.close),
                  ),
                  ActionChip(
                    label: const Text('Action Chip'),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Action chip pressed!')),
                      );
                    },
                  ),
                  FilterChip(
                    label: const Text('Filter Chip'),
                    selected: _isExpanded,
                    onSelected: (selected) {
                      setState(() {
                        _isExpanded = selected;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          _buildWidgetSection(
            'Banner Widget',
            'Displays a diagonal message across a corner',
            [
              SizedBox(
                width: 200,
                height: 150,
                child: Banner(
                  message: 'SALE',
                  location: BannerLocation.topEnd,
                  color: Colors.red,
                  child: Container(
                    color: Colors.brown.withOpacity(0.1),
                    child: const Center(
                      child: Text('Product Image'),
                    ),
                  ),
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
                color: Colors.brown,
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
