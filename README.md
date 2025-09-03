# Flutter Widgets Reference

A comprehensive Flutter application showcasing 92+ essential widgets across 10 categories with interactive examples and multiple property demonstrations.

## 📱 Overview

This app serves as a complete reference guide for Flutter developers, featuring real-world examples of widgets organized by functionality. Each widget includes multiple examples demonstrating different properties, configurations, and use cases.

## 🏗️ Widget Categories

### 1. **Basic Widgets** (12 widgets)
- Text, Icon, Image, Container, Padding, Center, Column, Row, Stack, Positioned, SizedBox, Scaffold, AppBar

### 2. **Layout Widgets** (13 widgets)
- Flex, Expanded, Flexible, Wrap, Flow, Table, IndexedStack, Align, FractionallySizedBox, AspectRatio, IntrinsicHeight, IntrinsicWidth, OverflowBox

### 3. **Input & Interaction** (14 widgets)
- TextField, TextFormField, Checkbox, Radio, Switch, Slider, RangeSlider, DropdownButton, PopupMenuButton, IconButton, ElevatedButton, TextButton, OutlinedButton, FloatingActionButton

### 4. **Navigation** (7 widgets)
- Navigator, PageView, TabBar, TabBarView, BottomNavigationBar, Drawer, AppBar

### 5. **Scrolling** (7 widgets)
- ListView, GridView, SingleChildScrollView, CustomScrollView, SliverAppBar, SliverList, SliverGrid

### 6. **Styling** (7 widgets)
- Theme, Card, Divider, VerticalDivider, Spacer, Opacity, ClipRRect

### 7. **Animation** (9 widgets)
- AnimatedContainer, AnimatedOpacity, Hero, AnimatedBuilder, TweenAnimationBuilder, AnimatedCrossFade, AnimatedSwitcher, AnimatedPositioned, AnimatedDefaultTextStyle

### 8. **Cupertino (iOS)** (6 widgets)
- CupertinoButton, CupertinoTextField, CupertinoSwitch, CupertinoSlider, CupertinoNavigationBar, CupertinoTabBar

### 9. **State Management** (7 widgets)
- StatefulWidget, StatelessWidget, InheritedWidget, ValueListenableBuilder, StreamBuilder, FutureBuilder, Provider

### 10. **Utility** (10 widgets)
- SafeArea, MediaQuery, LayoutBuilder, OrientationBuilder, GestureDetector, Dismissible, DragTarget, Draggable, Tooltip, Placeholder

## 🚀 Features

- **92+ Interactive Widgets**: Complete with live examples and property demonstrations
- **Categorized Organization**: Widgets grouped by functionality for easy navigation
- **Multiple Examples**: Each widget shows various configurations and use cases
- **Material & Cupertino**: Support for both Android (Material) and iOS (Cupertino) design systems
- **Color-Coded Navigation**: Each category has its own theme color for visual distinction
- **Responsive Design**: Optimized for different screen sizes and orientations
- **Clean Architecture**: Modular page structure for easy maintenance and expansion

## 📂 Project Structure

```
lib/
├── main.dart                    # App entry point
├── pages/
│   ├── home_page.dart          # Main navigation with category grid
│   ├── basic_widgets_page.dart
│   ├── layout_widgets_page.dart
│   ├── input_widgets_page.dart
│   ├── navigation_widgets_page.dart
│   ├── scrolling_widgets_page.dart
│   ├── styling_widgets_page.dart
│   ├── animation_widgets_page.dart
│   ├── cupertino_widgets_page.dart
│   ├── state_widgets_page.dart
│   └── utility_widgets_page.dart
```

## 🎨 Design Highlights

- **Material Design 3**: Modern UI following Google's latest design principles
- **Color-Coded Categories**: Each widget category has a unique color theme
- **Card-Based Layout**: Clean, organized presentation of widgets
- **Interactive Examples**: All widgets are functional with live demonstrations
- **Consistent Structure**: Standardized `_buildWidgetSection` pattern across all pages

## 🛠️ Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio / VS Code
- iOS Simulator / Android Emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/falconictech/flutter_widgets_reference.git
   cd flutter_widgets_reference
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Build for Production

**Android APK:**
```bash
flutter build apk --release
```

**iOS IPA:**
```bash
flutter build ios --release
```

**Web:**
```bash
flutter build web
```

## 📱 Screenshots

The app features:
- Grid-based home navigation with 10 color-coded categories
- Individual category pages with organized widget demonstrations
- Interactive examples showing real widget functionality
- Clean, modern Material Design interface

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. **Fork the repository**
2. **Create a feature branch** (`git checkout -b feature/new-widget`)
3. **Add your widget examples** following the existing pattern
4. **Commit your changes** (`git commit -am 'Add new widget examples'`)
5. **Push to the branch** (`git push origin feature/new-widget`)
6. **Create a Pull Request**

### Adding New Widgets

To add a new widget:
1. Choose the appropriate category page
2. Use the `_buildWidgetSection` helper method
3. Provide multiple examples showing different properties
4. Follow the existing code structure and naming conventions

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🏆 Acknowledgments

- Flutter team for the amazing framework
- Material Design team for design guidelines
- Contributors and the Flutter community

## 📞 Support

For questions, suggestions, or issues:
- Create an issue on GitHub
- Reach out to the maintainers
- Check Flutter documentation for widget details

---

**Happy Fluttering! 🚀**
