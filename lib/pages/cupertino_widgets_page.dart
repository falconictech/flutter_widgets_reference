import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoWidgetsPage extends StatefulWidget {
  const CupertinoWidgetsPage({super.key});

  @override
  State<CupertinoWidgetsPage> createState() => _CupertinoWidgetsPageState();
}

class _CupertinoWidgetsPageState extends State<CupertinoWidgetsPage> {
  int _selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cupertino (iOS-style) Widgets'),
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildWidgetSection(
            'CupertinoButton Widget',
            'An iOS-style button',
            [
              Column(
                children: [
                  CupertinoButton(
                    color: CupertinoColors.activeBlue,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Blue button pressed!')),
                      );
                    },
                    child: const Text('Blue Filled Button'),
                  ),
                  const SizedBox(height: 8),
                  CupertinoButton(
                    color: CupertinoColors.destructiveRed,
                    onPressed: () {},
                    child: const Text('Red Filled Button'),
                  ),
                  const SizedBox(height: 8),
                  CupertinoButton(
                    onPressed: () {},
                    child: const Text('Borderless Button'),
                  ),
                  const SizedBox(height: 8),
                  CupertinoButton.filled(
                    onPressed: () {},
                    child: const Text('Default Filled Button'),
                  ),
                  const SizedBox(height: 8),
                  CupertinoButton(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    color: CupertinoColors.activeGreen,
                    onPressed: () {},
                    child: const Text('Custom Padding'),
                  ),
                  const SizedBox(height: 8),
                  CupertinoButton(
                    onPressed: null, // Disabled
                    child: const Text('Disabled Button'),
                  ),
                ],
              ),
            ],
          ),
          _buildWidgetSection(
            'CupertinoAlertDialog Widget',
            'An iOS-style alert dialog',
            [
              CupertinoButton(
                color: CupertinoColors.activeBlue,
                onPressed: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title: const Text('Alert'),
                      content: const Text('This is a Cupertino alert dialog.'),
                      actions: [
                        CupertinoDialogAction(
                          child: const Text('Cancel'),
                          onPressed: () => Navigator.pop(context),
                        ),
                        CupertinoDialogAction(
                          isDefaultAction: true,
                          child: const Text('OK'),
                          onPressed: () => Navigator.pop(context),
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
            'CupertinoNavigationBar Widget',
            'An iOS-style navigation bar',
            [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const CupertinoNavigationBar(
                  middle: Text('iOS Navigation Bar'),
                  leading: Icon(CupertinoIcons.back),
                  trailing: Icon(CupertinoIcons.settings),
                ),
              ),
            ],
          ),
          _buildWidgetSection(
            'CupertinoTabBar Widget',
            'An iOS-style tab bar',
            [
              Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: CupertinoTabBar(
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.search),
                      label: 'Search',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.person),
                      label: 'Profile',
                    ),
                  ],
                  onTap: (index) {
                    // Handle tab selection
                  },
                ),
              ),
            ],
          ),
          _buildWidgetSection(
            'CupertinoActivityIndicator Widget',
            'An iOS-style activity indicator (loading spinner)',
            [
              const Row(
                children: [
                  CupertinoActivityIndicator(),
                  SizedBox(width: 16),
                  CupertinoActivityIndicator(
                    radius: 20,
                  ),
                  SizedBox(width: 16),
                  CupertinoActivityIndicator(
                    radius: 15,
                    color: CupertinoColors.activeBlue,
                  ),
                ],
              ),
            ],
          ),
          _buildWidgetSection(
            'CupertinoPicker Widget',
            'An iOS-style picker wheel',
            [
              SizedBox(
                height: 200,
                child: CupertinoPicker(
                  itemExtent: 40,
                  onSelectedItemChanged: (index) {
                    setState(() {
                      _selectedValue = index;
                    });
                  },
                  children: List.generate(
                    10,
                    (index) => Center(
                      child: Text(
                        'Option ${index + 1}',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
              Text('Selected: Option ${_selectedValue + 1}'),
            ],
          ),
          _buildWidgetSection(
            'CupertinoSwitch Widget',
            'An iOS-style switch',
            [
              Row(
                children: [
                  CupertinoSwitch(
                    value: true,
                    onChanged: (value) {},
                  ),
                  const SizedBox(width: 16),
                  CupertinoSwitch(
                    value: false,
                    onChanged: (value) {},
                  ),
                ],
              ),
            ],
          ),
          _buildWidgetSection(
            'CupertinoSlider Widget',
            'An iOS-style slider',
            [
              CupertinoSlider(
                value: 0.5,
                onChanged: (value) {},
              ),
            ],
          ),
          _buildWidgetSection(
            'CupertinoTextField Widget',
            'An iOS-style text field',
            [
              Column(
                children: [
                  CupertinoTextField(
                    placeholder: 'Basic text field',
                    padding: const EdgeInsets.all(12),
                  ),
                  const SizedBox(height: 16),
                  CupertinoTextField(
                    placeholder: 'With prefix icon',
                    prefix: const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(CupertinoIcons.person, color: CupertinoColors.systemGrey),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: CupertinoColors.lightBackgroundGray),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(12),
                  ),
                  const SizedBox(height: 16),
                  CupertinoTextField(
                    placeholder: 'Password field',
                    obscureText: true,
                    prefix: const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(CupertinoIcons.lock, color: CupertinoColors.systemGrey),
                    ),
                    suffix: const Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Icon(CupertinoIcons.eye, color: CupertinoColors.systemGrey),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: CupertinoColors.lightBackgroundGray),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(12),
                  ),
                  const SizedBox(height: 16),
                  CupertinoTextField(
                    placeholder: 'Search field',
                    prefix: const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(CupertinoIcons.search, color: CupertinoColors.systemGrey),
                    ),
                    suffix: const Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Icon(CupertinoIcons.clear, color: CupertinoColors.systemGrey),
                    ),
                    decoration: BoxDecoration(
                      color: CupertinoColors.systemGrey6,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(12),
                  ),
                  const SizedBox(height: 16),
                  CupertinoTextField(
                    placeholder: 'Multi-line text field',
                    maxLines: 3,
                    decoration: BoxDecoration(
                      border: Border.all(color: CupertinoColors.lightBackgroundGray),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(12),
                  ),
                ],
              ),
            ],
          ),
          _buildWidgetSection(
            'CupertinoActionSheet Widget',
            'An iOS-style action sheet',
            [
              CupertinoButton(
                color: CupertinoColors.activeBlue,
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) => CupertinoActionSheet(
                      title: const Text('Choose an action'),
                      message: const Text('Select one of the options below'),
                      actions: [
                        CupertinoActionSheetAction(
                          child: const Text('Option 1'),
                          onPressed: () => Navigator.pop(context),
                        ),
                        CupertinoActionSheetAction(
                          child: const Text('Option 2'),
                          onPressed: () => Navigator.pop(context),
                        ),
                        CupertinoActionSheetAction(
                          isDestructiveAction: true,
                          child: const Text('Delete'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                      cancelButton: CupertinoActionSheetAction(
                        child: const Text('Cancel'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  );
                },
                child: const Text('Show Action Sheet'),
              ),
            ],
          ),
          _buildWidgetSection(
            'CupertinoIcons',
            'iOS-style icons',
            [
              const Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  Icon(CupertinoIcons.home, size: 30),
                  Icon(CupertinoIcons.heart, size: 30),
                  Icon(CupertinoIcons.star, size: 30),
                  Icon(CupertinoIcons.settings, size: 30),
                  Icon(CupertinoIcons.search, size: 30),
                  Icon(CupertinoIcons.person, size: 30),
                  Icon(CupertinoIcons.mail, size: 30),
                  Icon(CupertinoIcons.phone, size: 30),
                ],
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
                color: Colors.grey,
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
