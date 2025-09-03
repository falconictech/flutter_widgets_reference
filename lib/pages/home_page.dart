import 'package:flutter/material.dart';
import 'basic_widgets_page.dart';
import 'layout_widgets_page.dart';
import 'input_interaction_widgets_page.dart';
import 'navigation_routing_widgets_page.dart';
import 'scrolling_widgets_page.dart';
import 'styling_theming_widgets_page.dart';
import 'animation_motion_widgets_page.dart';
import 'cupertino_widgets_page.dart';
import 'state_management_widgets_page.dart';
import 'utility_misc_widgets_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Widgets Reference'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Explore Flutter Widgets',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Select a category to explore different Flutter widgets with examples and usage.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.2,
                children: [
                  _buildCategoryCard(
                    context,
                    'Basic Widgets',
                    Icons.widgets,
                    Colors.blue,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BasicWidgetsPage()),
                    ),
                  ),
                  _buildCategoryCard(
                    context,
                    'Layout Widgets',
                    Icons.view_quilt,
                    Colors.green,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LayoutWidgetsPage()),
                    ),
                  ),
                  _buildCategoryCard(
                    context,
                    'Input & Interaction',
                    Icons.touch_app,
                    Colors.orange,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const InputInteractionWidgetsPage()),
                    ),
                  ),
                  _buildCategoryCard(
                    context,
                    'Navigation & Routing',
                    Icons.navigation,
                    Colors.purple,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NavigationRoutingWidgetsPage()),
                    ),
                  ),
                  _buildCategoryCard(
                    context,
                    'Scrolling Widgets',
                    Icons.view_list,
                    Colors.teal,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ScrollingWidgetsPage()),
                    ),
                  ),
                  _buildCategoryCard(
                    context,
                    'Styling & Theming',
                    Icons.palette,
                    Colors.pink,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const StylingThemingWidgetsPage()),
                    ),
                  ),
                  _buildCategoryCard(
                    context,
                    'Animation & Motion',
                    Icons.animation,
                    Colors.red,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AnimationMotionWidgetsPage()),
                    ),
                  ),
                  _buildCategoryCard(
                    context,
                    'Cupertino Widgets',
                    Icons.phone_iphone,
                    Colors.grey,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CupertinoWidgetsPage()),
                    ),
                  ),
                  _buildCategoryCard(
                    context,
                    'State Management',
                    Icons.settings,
                    Colors.indigo,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const StateManagementWidgetsPage()),
                    ),
                  ),
                  _buildCategoryCard(
                    context,
                    'Utility & Misc',
                    Icons.extension,
                    Colors.brown,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const UtilityMiscWidgetsPage()),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color.withOpacity(0.1),
                color.withOpacity(0.05),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: color,
              ),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: color.withOpacity(0.8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
