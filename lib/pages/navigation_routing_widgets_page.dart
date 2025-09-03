import 'package:flutter/material.dart';

class NavigationRoutingWidgetsPage extends StatefulWidget {
  const NavigationRoutingWidgetsPage({super.key});

  @override
  State<NavigationRoutingWidgetsPage> createState() => _NavigationRoutingWidgetsPageState();
}

class _NavigationRoutingWidgetsPageState extends State<NavigationRoutingWidgetsPage>
    with SingleTickerProviderStateMixin {
  int _currentPageIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation & Routing Widgets'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              child: Text(
                'Drawer Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildWidgetSection(
            'Navigator Widget',
            'Manages a stack of Route objects',
            [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const _SamplePage(title: 'New Page'),
                    ),
                  );
                },
                child: const Text('Navigate to New Page'),
              ),
            ],
          ),
          _buildWidgetSection(
            'MaterialPageRoute Widget',
            'A modal route that replaces the entire screen',
            [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const _SamplePage(title: 'Material Page Route'),
                    ),
                  );
                },
                child: const Text('Material Page Route'),
              ),
            ],
          ),
          _buildWidgetSection(
            'PageView Widget',
            'A widget that works like a page view',
            [
              SizedBox(
                height: 200,
                child: PageView(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(child: Text('Page 1')),
                    ),
                    Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(child: Text('Page 2')),
                    ),
                    Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(child: Text('Page 3')),
                    ),
                  ],
                ),
              ),
            ],
          ),
          _buildWidgetSection(
            'TabBar & TabBarView Widgets',
            'Creates a material design tab bar and tab views',
            [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    TabBar(
                      controller: _tabController,
                      labelColor: Colors.purple,
                      tabs: const [
                        Tab(icon: Icon(Icons.home), text: 'Home'),
                        Tab(icon: Icon(Icons.star), text: 'Favorites'),
                        Tab(icon: Icon(Icons.person), text: 'Profile'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          Container(
                            color: Colors.red.withOpacity(0.1),
                            child: const Center(child: Text('Home Tab Content')),
                          ),
                          Container(
                            color: Colors.green.withOpacity(0.1),
                            child: const Center(child: Text('Favorites Tab Content')),
                          ),
                          Container(
                            color: Colors.blue.withOpacity(0.1),
                            child: const Center(child: Text('Profile Tab Content')),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          _buildWidgetSection(
            'BottomNavigationBar Widget',
            'A bottom navigation bar (shown at bottom of screen)',
            [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'BottomNavigationBar is displayed at the bottom of this screen.\nTap the icons to see it in action!',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
          _buildWidgetSection(
            'Drawer Widget',
            'A material design drawer (shown at left)',
            [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Drawer is accessible from the app bar.\nTap the hamburger menu to open it!',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        onTap: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
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
                color: Colors.purple,
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

class _SamplePage extends StatelessWidget {
  const _SamplePage({required this.title});
  
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'This is $title',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
