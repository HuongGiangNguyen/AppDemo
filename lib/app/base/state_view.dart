import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import 'controller.dart';

abstract class ViewState<Page extends View, Con extends Controller>
    extends State<Page> with WidgetsBindingObserver {
  final GlobalKey<State<StatefulWidget>> globalKey =
      GlobalKey<State<StatefulWidget>>();
  final Con controller = Get.find();

  /// Implement the [Widget] you want to be displayed on [View]

  ViewState() {
    print('${this.runtimeType}');
  }

  /// Should be used when need to perform some action on [initState] life cycle. [Controller] is injected on parameters.
  /// [super.initViewState] should be called before the actions you need to perform.
  ///
  /// ```dart
  /// void initViewState(CounterController controller) {
  ///   super.initViewState(controller);
  ///   controller.initializeCounter();
  /// }
  /// ```
  @mustCallSuper
  void initViewState(Con controller) {
    print('Initializing state of $runtimeType');
  }

  /// Should be used when need to perform some action on [didChangeDependencies] life cycle. [Controller] is injected on parameters.
  /// [super.initViewState] should be called before the actions you need to perform. Like [didChangeDependencies], you can safely perform
  /// actions that depends on [BuildContext] here.
  ///
  /// ```dart
  /// void didChangeViewDependencies(CounterController controller) {
  ///   super.didChangeViewDependencies(controller);
  ///   controller.updateCounterOnDependencies();
  /// }
  /// ```
  @mustCallSuper
  void didChangeViewDependencies(Con controller) {
    print('didChangeDependencies triggered on $runtimeType');
  }

  @override
  @mustCallSuper
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (mounted) {
      switch (state) {
        case AppLifecycleState.inactive:
          print('AppLifecycleState.inactive');
          onInActive();
          break;
        case AppLifecycleState.paused:
          print('AppLifecycleState.paused');
          onPaused();
          break;
        case AppLifecycleState.resumed:
          print('AppLifecycleState.resumed');
          onResumed();
          break;
        case AppLifecycleState.detached:
          print('AppLifecycleState.detached');
          onDetached();
          break;
      }
    }
  }

  /// Called when the application is in an inactive state and is not receiving user input.
  /// On iOS, this state corresponds to an app or the Flutter host view running in
  /// the foreground inactive state. Apps transition to this state when in a phone call,
  /// responding to a TouchID request, when entering the app switcher or the control center,
  /// or when the UIViewController hosting the Flutter app is transitioning.
  /// On Android, this corresponds to an app or the Flutter host view running in
  /// the foreground inactive state. Apps transition to this state when another
  /// activity is focused, such as a split-screen app, a phone call, a
  /// picture-in-picture app, a system dialog, or another window.
  ///
  /// Apps in this state should assume that they may be [onPaused] at any time.
  /// ```dart
  ///     class MyController extends Controller {
  ///       @override
  ///       void onInActive() => print('App is in the background.');
  ///     }
  /// ```
  void onInActive() {}

  /// Called when the application is not currently visible to the user, not responding to user input, and running in the background.
  /// When the application is in this state, the engine will not call the [Window.onBeginFrame] and [Window.onDrawFrame] callbacks.
  /// Android apps in this state should assume that they may enter the [detached] state at any time.
  /// ```dart
  ///     class MyController extends Controller {
  ///       @override
  ///       void onPaused() => print('App is paused.');
  ///     }
  /// ```
  void onPaused() {}

  /// Called when the application is visible and is responding to the user i.e. in the foreground and running.
  /// ```dart
  ///     class MyController extends Controller {
  ///       @override
  ///       void onResumed() => print('App is resumed.');
  ///     }
  /// ```
  void onResumed() {}

  /// Called before the application is detached.
  /// When the application is in this state, the engine still runing but not attached to any view.
  ///
  /// ```dart
  ///     class MyController extends Controller {
  ///       @override
  ///       void onDetached() => print('App is about to detach.');
  ///     }
  /// ```
  void onDetached() {}

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    initViewState(controller);
    controller.listenConnectivityStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: buildPage(context), onWillPop: willPopCallBack);
  }

  @protected
  Widget buildPage(BuildContext context);

  Future<bool> willPopCallBack() async {
    return true;
  }

  @override
  @mustCallSuper
  void dispose() {
    print('Disposing $runtimeType.');
    controller.cancelConnectivitySubscription();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}

abstract class View extends StatefulWidget {
  @override
  final Key key;

  View({this.key}) : super(key: key);
}
