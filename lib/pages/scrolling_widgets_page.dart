import 'package:flutter/material.dart';

class ScrollingWidgetsPage extends StatelessWidget {
  const ScrollingWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scrolling Widgets'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildWidgetSection(
            'ListView Widget',
            'A scrollable list of widgets arranged linearly',
            [
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.teal,
                          child: Text('${index + 1}'),
                        ),
                        title: Text('List Item ${index + 1}'),
                        subtitle: Text('Subtitle for item ${index + 1}'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          _buildWidgetSection(
            'GridView Widget',
            'A 2D array of widgets that can scroll',
            [
              SizedBox(
                height: 300,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.teal.withOpacity(0.3),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.grid_view,
                              color: Colors.teal,
                              size: 30,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${index + 1}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          _buildWidgetSection(
            'CustomScrollView Widget',
            'A scrollview that creates custom scroll effects using slivers',
            [
              SizedBox(
                height: 300,
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      expandedHeight: 80,
                      pinned: true,
                      backgroundColor: Colors.teal,
                      flexibleSpace: const FlexibleSpaceBar(
                        title: Text(
                          'Sliver App Bar',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Card(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            child: ListTile(
                              title: Text('Sliver List Item ${index + 1}'),
                              leading: const Icon(Icons.list),
                            ),
                          );
                        },
                        childCount: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          _buildWidgetSection(
            'SliverList Widget',
            'A sliver that places multiple box children in a linear array',
            [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'SliverList is used within CustomScrollView above.\nIt creates a scrollable list of items.',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
          _buildWidgetSection(
            'SliverGrid Widget',
            'A sliver that places multiple box children in a 2D arrangement',
            [
              SizedBox(
                height: 200,
                child: CustomScrollView(
                  slivers: [
                    SliverGrid(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.teal.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text('${index + 1}'),
                            ),
                          );
                        },
                        childCount: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          _buildWidgetSection(
            'NestedScrollView Widget',
            'A scrolling view inside another scrolling view',
            [
              SizedBox(
                height: 300,
                child: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        expandedHeight: 80,
                        floating: true,
                        pinned: true,
                        backgroundColor: Colors.teal.withOpacity(0.8),
                        flexibleSpace: const FlexibleSpaceBar(
                          title: Text(
                            'Nested Header',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ];
                  },
                  body: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: ListTile(
                          title: Text('Nested Item ${index + 1}'),
                          subtitle: const Text('This is inside NestedScrollView'),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          _buildWidgetSection(
            'Scrollbar Widget',
            'A material design scrollbar',
            [
              SizedBox(
                height: 150,
                child: Scrollbar(
                  thumbVisibility: true,
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 50,
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.teal.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text('Scrollbar Item ${index + 1}'),
                        ),
                      );
                    },
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
                color: Colors.teal,
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
