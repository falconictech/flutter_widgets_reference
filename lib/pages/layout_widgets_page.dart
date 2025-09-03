import 'package:flutter/material.dart';

class LayoutWidgetsPage extends StatelessWidget {
  const LayoutWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout Widgets'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildWidgetSection(
            'Center Widget',
            'Centers its child within itself',
            [
              Container(
                height: 100,
                width: double.infinity,
                color: Colors.grey.withOpacity(0.3),
                child: const Center(
                  child: Text(
                    'Centered Text',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          _buildWidgetSection(
            'Padding Widget',
            'Adds padding around its child',
            [
              Container(
                color: Colors.blue.withOpacity(0.1),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('Padding on all sides'),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                color: Colors.green.withOpacity(0.1),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Text('Symmetric padding'),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                color: Colors.orange.withOpacity(0.1),
                child: const Padding(
                  padding: EdgeInsets.only(left: 40, top: 20),
                  child: Text('Custom padding'),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                color: Colors.purple.withOpacity(0.1),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 30, 5),
                  child: Text('LTRB padding (10, 20, 30, 5)'),
                ),
              ),
            ],
          ),
          _buildWidgetSection(
            'Align Widget',
            'Aligns its child within itself',
            [
              Container(
                height: 100,
                width: double.infinity,
                color: Colors.grey.withOpacity(0.3),
                child: const Align(
                  alignment: Alignment.topRight,
                  child: Text('Top Right'),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                height: 100,
                width: double.infinity,
                color: Colors.blue.withOpacity(0.1),
                child: const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('Bottom Left'),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                height: 100,
                width: double.infinity,
                color: Colors.green.withOpacity(0.1),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text('Center'),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                height: 100,
                width: double.infinity,
                color: Colors.orange.withOpacity(0.1),
                child: const Align(
                  alignment: Alignment(0.5, -0.5), // Custom alignment
                  child: Text('Custom (0.5, -0.5)'),
                ),
              ),
            ],
          ),
          _buildWidgetSection(
            'Expanded Widget',
            'Expands to fill available space in Row/Column',
            [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,
                    child: const Center(child: Text('Fixed')),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      color: Colors.green,
                      child: const Center(child: Text('Expanded')),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.blue,
                    child: const Center(child: Text('Fixed')),
                  ),
                ],
              ),
            ],
          ),
          _buildWidgetSection(
            'SizedBox Widget',
            'Creates a box with specific dimensions',
            [
              const Column(
                children: [
                  Text('Text 1'),
                  SizedBox(height: 20), // Vertical spacing
                  Text('Text 2'),
                ],
              ),
            ],
          ),
          _buildWidgetSection(
            'Wrap Widget',
            'Displays children in multiple horizontal or vertical runs',
            [
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: List.generate(
                  10,
                  (index) => Chip(
                    label: Text('Chip $index'),
                    backgroundColor: Colors.blue.withOpacity(0.3),
                  ),
                ),
              ),
            ],
          ),
          _buildWidgetSection(
            'ListView Widget',
            'A scrollable list of widgets',
            [
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Text('${index + 1}'),
                      ),
                      title: Text('List Item ${index + 1}'),
                      subtitle: Text('Subtitle for item ${index + 1}'),
                    );
                  },
                ),
              ),
            ],
          ),
          _buildWidgetSection(
            'GridView Widget',
            'A 2D array of widgets',
            [
              SizedBox(
                height: 200,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text('${index + 1}'),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          _buildWidgetSection(
            'SingleChildScrollView Widget',
            'Makes a single child scrollable',
            [
              SizedBox(
                height: 150,
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                      10,
                      (index) => Container(
                        width: double.infinity,
                        height: 50,
                        margin: const EdgeInsets.only(bottom: 8),
                        color: Colors.green.withOpacity(0.3),
                        child: Center(child: Text('Scrollable Item ${index + 1}')),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          _buildWidgetSection(
            'Flexible Widget',
            'Controls how a child flexes in Row/Column',
            [
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: 50,
                      color: Colors.red.withOpacity(0.5),
                      child: const Center(child: Text('Flex 1')),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      height: 50,
                      color: Colors.green.withOpacity(0.5),
                      child: const Center(child: Text('Flex 2')),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: 50,
                      color: Colors.blue.withOpacity(0.5),
                      child: const Center(child: Text('Flex 1')),
                    ),
                  ),
                ],
              ),
            ],
          ),
          _buildWidgetSection(
            'FractionallySizedBox Widget',
            'Sizes its child to a fraction of available space',
            [
              Container(
                height: 100,
                color: Colors.grey.withOpacity(0.3),
                child: FractionallySizedBox(
                  widthFactor: 0.7,
                  heightFactor: 0.5,
                  child: Container(
                    color: Colors.green.withOpacity(0.7),
                    child: const Center(child: Text('70% width, 50% height')),
                  ),
                ),
              ),
            ],
          ),
          _buildWidgetSection(
            'ConstrainedBox Widget',
            'Imposes constraints on its child',
            [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 200,
                  minHeight: 50,
                  maxWidth: 300,
                  maxHeight: 100,
                ),
                child: Container(
                  color: Colors.green.withOpacity(0.3),
                  child: const Center(child: Text('Constrained Box')),
                ),
              ),
            ],
          ),
          _buildWidgetSection(
            'AspectRatio Widget',
            'Maintains a specific aspect ratio for its child',
            [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  color: Colors.green.withOpacity(0.3),
                  child: const Center(child: Text('16:9 Aspect Ratio')),
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
                color: Colors.green,
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
