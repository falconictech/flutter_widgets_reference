import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BasicWidgetsPage extends StatelessWidget {
  const BasicWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Widgets'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildWidgetSection(
            'Text Widget',
            'Displays text with various styling options',
            [
              const Text('Simple Text'),
              const Text(
                'Styled Text',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const Text(
                'Text with decoration',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          _buildWidgetSection(
            'Row Widget',
            'Arranges children horizontally',
            [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,
                    child: const Center(child: Text('1')),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.green,
                    child: const Center(child: Text('2')),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.blue,
                    child: const Center(child: Text('3')),
                  ),
                ],
              ),
            ],
          ),
          _buildWidgetSection(
            'Column Widget',
            'Arranges children vertically',
            [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 30,
                    color: Colors.red,
                    child: const Center(child: Text('Top')),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 100,
                    height: 30,
                    color: Colors.green,
                    child: const Center(child: Text('Middle')),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 100,
                    height: 30,
                    color: Colors.blue,
                    child: const Center(child: Text('Bottom')),
                  ),
                ],
              ),
            ],
          ),
          _buildWidgetSection(
            'Container Widget',
            'A box model widget with decoration, margin, padding',
            [
              Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.3),
                  border: Border.all(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(8),
                child: const Center(
                  child: Text('Container with decoration'),
                ),
              ),
            ],
          ),
          _buildWidgetSection(
            'Stack Widget',
            'Overlays children on top of each other',
            [
              SizedBox(
                width: 200,
                height: 150,
                child: Stack(
                  children: [
                    Container(
                      width: 200,
                      height: 150,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Container(
                        width: 80,
                        height: 80,
                        color: Colors.red.withOpacity(0.7),
                        child: const Center(child: Text('Back')),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 50,
                      child: Container(
                        width: 80,
                        height: 80,
                        color: Colors.blue.withOpacity(0.7),
                        child: const Center(child: Text('Front')),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          _buildWidgetSection(
            'Icon Widget',
            'Displays material design icons',
            [
              const Row(
                children: [
                  Icon(Icons.home, size: 30, color: Colors.blue),
                  SizedBox(width: 10),
                  Icon(Icons.favorite, size: 30, color: Colors.red),
                  SizedBox(width: 10),
                  Icon(Icons.star, size: 30, color: Colors.orange),
                  SizedBox(width: 10),
                  Icon(Icons.settings, size: 30, color: Colors.grey),
                ],
              ),
            ],
          ),
          _buildWidgetSection(
            'Image Widget',
            'Displays images from various sources',
            [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Icon(
                    Icons.image,
                    size: 50,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          _buildWidgetSection(
            'Placeholder Widget',
            'A temporary widget that shows a box',
            [
              const SizedBox(
                width: 200,
                height: 100,
                child: Placeholder(
                  color: Colors.blue,
                  strokeWidth: 2,
                ),
              ),
            ],
          ),
          _buildWidgetSection(
            'MaterialApp Widget',
            'Root widget for Material Design apps',
            [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'MaterialApp is the root widget of this app!\nIt provides theme, navigation, and localization.',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
          _buildWidgetSection(
            'CupertinoApp Widget',
            'Root widget for iOS-style apps',
            [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'CupertinoApp provides iOS-style theming and navigation.\nUsed as an alternative to MaterialApp.',
                  style: TextStyle(fontStyle: FontStyle.italic),
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
                color: Colors.blue,
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
