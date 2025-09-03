import 'package:flutter/material.dart';

class AnimationMotionWidgetsPage extends StatefulWidget {
  const AnimationMotionWidgetsPage({super.key});

  @override
  State<AnimationMotionWidgetsPage> createState() => _AnimationMotionWidgetsPageState();
}

class _AnimationMotionWidgetsPageState extends State<AnimationMotionWidgetsPage>
    with TickerProviderStateMixin {
  bool _isExpanded = false;
  bool _isVisible = true;
  bool _showFirst = true;
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late AnimationController _rotationController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    
    _fadeController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _scaleController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _rotationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_fadeController);
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    );
    _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_rotationController);
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeInOut));

    // Start some animations
    _fadeController.repeat(reverse: true);
    _rotationController.repeat();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    _rotationController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation & Motion Widgets'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildWidgetSection(
            'AnimatedContainer Widget',
            'Animates changes to container properties',
            [
              Column(
                children: [
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    width: _isExpanded ? 200 : 100,
                    height: _isExpanded ? 200 : 100,
                    decoration: BoxDecoration(
                      color: _isExpanded ? Colors.red : Colors.blue,
                      borderRadius: BorderRadius.circular(_isExpanded ? 20 : 50),
                    ),
                    child: Center(
                      child: Text(
                        _isExpanded ? 'Large' : 'Small',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                    child: Text(_isExpanded ? 'Shrink' : 'Expand'),
                  ),
                ],
              ),
            ],
          ),
          _buildWidgetSection(
            'AnimatedOpacity Widget',
            'Animates the opacity of its child',
            [
              Column(
                children: [
                  AnimatedOpacity(
                    opacity: _isVisible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Container(
                      width: 150,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          'Fade Me!',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isVisible = !_isVisible;
                      });
                    },
                    child: Text(_isVisible ? 'Hide' : 'Show'),
                  ),
                ],
              ),
            ],
          ),
          _buildWidgetSection(
            'AnimatedCrossFade Widget',
            'Cross-fades between two children',
            [
              Column(
                children: [
                  AnimatedCrossFade(
                    firstChild: Container(
                      width: 200,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          'First Widget',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    secondChild: Container(
                      width: 200,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          'Second Widget',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    crossFadeState: _showFirst 
                        ? CrossFadeState.showFirst 
                        : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 500),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _showFirst = !_showFirst;
                      });
                    },
                    child: const Text('Switch'),
                  ),
                ],
              ),
            ],
          ),
          _buildWidgetSection(
            'AnimatedSwitcher Widget',
            'Animates between different children',
            [
              Column(
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: _showFirst
                          ? Container(
                              key: const ValueKey(1),
                              decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.favorite,
                                  size: 80,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : Container(
                              key: const ValueKey(2),
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.star,
                                  size: 80,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _showFirst = !_showFirst;
                      });
                    },
                    child: const Text('Switch Icon'),
                  ),
                ],
              ),
            ],
          ),
          _buildWidgetSection(
            'Hero Widget',
            'Creates a hero animation between routes',
            [
              Hero(
                tag: 'hero-example',
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const _HeroDetailPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        'Tap Me!',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          _buildWidgetSection(
            'FadeTransition Widget',
            'Animates the opacity of its child',
            [
              FadeTransition(
                opacity: _fadeAnimation,
                child: Container(
                  width: 150,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      'Fading...',
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
          _buildWidgetSection(
            'ScaleTransition Widget',
            'Animates the scale of its child',
            [
              Column(
                children: [
                  ScaleTransition(
                    scale: _scaleAnimation,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (_scaleController.isCompleted) {
                        _scaleController.reverse();
                      } else {
                        _scaleController.forward();
                      }
                    },
                    child: const Text('Animate Scale'),
                  ),
                ],
              ),
            ],
          ),
          _buildWidgetSection(
            'RotationTransition Widget',
            'Animates the rotation of its child',
            [
              RotationTransition(
                turns: _rotationAnimation,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.refresh,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ],
          ),
          _buildWidgetSection(
            'SlideTransition Widget',
            'Animates the position of its child',
            [
              Column(
                children: [
                  ClipRect(
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: Container(
                        width: 200,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            'Sliding!',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (_slideController.isCompleted) {
                        _slideController.reverse();
                      } else {
                        _slideController.forward();
                      }
                    },
                    child: const Text('Animate Slide'),
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
                color: Colors.red,
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

class _HeroDetailPage extends StatelessWidget {
  const _HeroDetailPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Detail'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Hero(
          tag: 'hero-example',
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.7),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                'Hero Animation!',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
