import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LifecycleStatesScreen extends StatefulWidget {
  const LifecycleStatesScreen({super.key});

  @override
  State<LifecycleStatesScreen> createState() => _LifecycleStatesScreenState();
}

class _LifecycleStatesScreenState extends State<LifecycleStatesScreen> {
  /// Called exactly once when the state object is inserted into the widget tree.
  /// Ideal place to initialize data, set up listeners, animation controllers etc.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('🟡 initState() called');
  }

  /// Called immediately after initState(), and also whenever dependencies (like InheritedWidgets) change.
  /// Useful when your widget depends on inherited context.
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('🟠 didChangeDependencies() called');
  }

  /// Called every time Flutter needs to render the UI.
  /// Can be called many times, e.g., when `setState()` is called.
  @override
  Widget build(BuildContext context) {
    print('🟣 build() called');
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Lifecycle Demo')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Trigger a rebuild
            setState(() {
              print('⚪ setState() called');
            });
          },
          child: Text('Click to setState'),
        ),
      ),
    );
  }

/// Called whenever the widget configuration changes.
/// For example, when the parent widget passes in new properties.
    @override
  void didUpdateWidget(covariant LifecycleStatesScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('🔴 didUpdateWidget() called');
  }

  /// Called before `dispose()`, when this State object is removed from the tree.
  /// Useful for cleaning up focus, animations, etc. Can be called multiple times.
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('⚫ deactivate() called');
  }

/// Called just before the State object is removed permanently.
/// Dispose any controllers, subscriptions, etc., to prevent memory leaks.
   @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('🔚 dispose() called');
  }

  /// Only used during development. Called when hot reload is performed.
  @override
  void reassemble() {
    super.reassemble();
    print('🛠 reassemble() called (Hot Reload)');
  }
}
