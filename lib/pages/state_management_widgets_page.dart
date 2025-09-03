import 'package:flutter/material.dart';

class StateManagementWidgetsPage extends StatefulWidget {
  const StateManagementWidgetsPage({super.key});

  @override
  State<StateManagementWidgetsPage> createState() => _StateManagementWidgetsPageState();
}

class _StateManagementWidgetsPageState extends State<StateManagementWidgetsPage> {
  int _counter = 0;
  ValueNotifier<int> _valueNotifier = ValueNotifier<int>(0);

  @override
  void dispose() {
    _valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Management Widgets'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildWidgetSection(
            'StatefulWidget',
            'A widget that can change its state',
            [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.indigo.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Text(
                      'Counter: $_counter',
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _counter++;
                            });
                          },
                          child: const Text('Increment'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _counter--;
                            });
                          },
                          child: const Text('Decrement'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _counter = 0;
                            });
                          },
                          child: const Text('Reset'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          _buildWidgetSection(
            'StatelessWidget',
            'A widget that describes part of the user interface',
            [
              const _StatelessExample(
                title: 'Static Content',
                subtitle: 'This content never changes',
              ),
            ],
          ),
          _buildWidgetSection(
            'InheritedWidget',
            'Provides data down the widget tree efficiently',
            [
              _InheritedExample(
                data: 'Inherited Data: ${DateTime.now().second}',
                child: const _InheritedChild(),
              ),
            ],
          ),
          _buildWidgetSection(
            'ValueListenableBuilder',
            'Rebuilds when a ValueNotifier changes',
            [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.indigo.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    ValueListenableBuilder<int>(
                      valueListenable: _valueNotifier,
                      builder: (context, value, child) {
                        return Text(
                          'Value: $value',
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        _valueNotifier.value++;
                      },
                      child: const Text('Increment ValueNotifier'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          _buildWidgetSection(
            'StreamBuilder',
            'Builds widgets based on stream data',
            [
              StreamBuilder<int>(
                stream: Stream.periodic(
                  const Duration(seconds: 1),
                  (count) => count,
                ),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Stream value: ${snapshot.data}',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
          _buildWidgetSection(
            'FutureBuilder',
            'Builds widgets based on future data',
            [
              FutureBuilder<String>(
                future: _fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        snapshot.data!,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    );
                  } else {
                    return const Text('No data');
                  }
                },
              ),
            ],
          ),
          _buildWidgetSection(
            'setState() Method',
            'Updates the state and triggers a rebuild',
            [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'setState() is used in the counter example above.\nIt tells Flutter to rebuild the widget with new state.',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
          _buildWidgetSection(
            'Provider Pattern (Concept)',
            'External package for state management',
            [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Provider is a popular package for state management.',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text('To use Provider, add it to pubspec.yaml:'),
                    SizedBox(height: 4),
                    Text(
                      'dependencies:\n  provider: ^6.0.0',
                      style: TextStyle(
                        fontFamily: 'monospace',
                        backgroundColor: Colors.black12,
                      ),
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

  Future<String> _fetchData() async {
    await Future.delayed(const Duration(seconds: 2));
    return 'Data loaded successfully!';
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
                color: Colors.indigo,
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

class _StatelessExample extends StatelessWidget {
  const _StatelessExample({
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(subtitle),
        ],
      ),
    );
  }
}

class _InheritedExample extends InheritedWidget {
  const _InheritedExample({
    required this.data,
    required Widget child,
  }) : super(child: child);

  final String data;

  static _InheritedExample? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_InheritedExample>();
  }

  @override
  bool updateShouldNotify(_InheritedExample oldWidget) {
    return data != oldWidget.data;
  }
}

class _InheritedChild extends StatelessWidget {
  const _InheritedChild();

  @override
  Widget build(BuildContext context) {
    final inheritedData = _InheritedExample.of(context);
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.purple.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        inheritedData?.data ?? 'No inherited data',
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
