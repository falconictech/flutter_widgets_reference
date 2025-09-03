import 'package:flutter/material.dart';

class StylingThemingWidgetsPage extends StatefulWidget {
  const StylingThemingWidgetsPage({super.key});

  @override
  State<StylingThemingWidgetsPage> createState() => _StylingThemingWidgetsPageState();
}

class _StylingThemingWidgetsPageState extends State<StylingThemingWidgetsPage> {
  double _opacity = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Styling & Theming Widgets'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildWidgetSection(
            'Theme Widget',
            'Applies a theme to descendant widgets',
            [
              Theme(
                data: Theme.of(context).copyWith(
                  elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    const Text('This section has a custom theme'),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Themed Button'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          _buildWidgetSection(
            'MediaQuery Widget',
            'Provides information about the current media (screen size, etc.)',
            [
              Builder(
                builder: (context) {
                  final mediaQuery = MediaQuery.of(context);
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.pink.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Screen width: ${mediaQuery.size.width.toInt()}'),
                        Text('Screen height: ${mediaQuery.size.height.toInt()}'),
                        Text('Device pixel ratio: ${mediaQuery.devicePixelRatio}'),
                        Text('Platform brightness: ${mediaQuery.platformBrightness}'),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
          _buildWidgetSection(
            'ColorFiltered Widget',
            'Applies a color filter to its child',
            [
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.star,
                      size: 80,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(width: 16),
                  ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Colors.pink,
                      BlendMode.modulate,
                    ),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.star,
                        size: 80,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ],
              ),
              const Text('Original vs Color Filtered'),
            ],
          ),
          _buildWidgetSection(
            'Opacity Widget',
            'Makes its child partially transparent',
            [
              Column(
                children: [
                  Slider(
                    value: _opacity,
                    onChanged: (value) {
                      setState(() {
                        _opacity = value;
                      });
                    },
                  ),
                  Text('Opacity: ${_opacity.toStringAsFixed(2)}'),
                  const SizedBox(height: 16),
                  Opacity(
                    opacity: _opacity,
                    child: Container(
                      width: 200,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          'Opacity Example',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          _buildWidgetSection(
            'ClipRRect Widget',
            'Clips its child using a rounded rectangle',
            [
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.pink,
                    child: const Center(
                      child: Text(
                        'No Clip',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.pink,
                      child: const Center(
                        child: Text(
                          'Clipped',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          _buildWidgetSection(
            'ClipOval Widget',
            'Clips its child using an oval',
            [
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.pink,
                    child: const Center(
                      child: Text(
                        'Square',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ClipOval(
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.pink,
                      child: const Center(
                        child: Text(
                          'Oval',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          _buildWidgetSection(
            'DecoratedBox Widget',
            'A widget that paints a decoration',
            [
              Column(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.pink, Colors.purple],
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const SizedBox(
                      width: 200,
                      height: 80,
                      child: Center(
                        child: Text(
                          'Gradient Background',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.pink,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const SizedBox(
                      width: 200,
                      height: 80,
                      child: Center(
                        child: Text(
                          'Border Decoration',
                          style: TextStyle(
                            color: Colors.pink,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      border: const Border(
                        left: BorderSide(color: Colors.blue, width: 4),
                        bottom: BorderSide(color: Colors.blue, width: 2),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const SizedBox(
                      width: 200,
                      height: 80,
                      child: Center(
                        child: Text(
                          'Custom Border Sides',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: const RadialGradient(
                        colors: [Colors.yellow, Colors.orange, Colors.red],
                      ),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.orange.withOpacity(0.5),
                          blurRadius: 15,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: const SizedBox(
                      width: 120,
                      height: 120,
                      child: Center(
                        child: Text(
                          'Radial\nGradient',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
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
                color: Colors.pink,
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
