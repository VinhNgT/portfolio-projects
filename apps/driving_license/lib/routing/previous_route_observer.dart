import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'previous_route_observer.g.dart';

/// A custom route observer that keeps track of the previous route.
class PreviousRouteObserver extends AutoRouterObserver {
  PreviousRouteObserverRef ref;

  /// Constructs a [PreviousRouteObserver] with the given [ref].
  PreviousRouteObserver(this.ref);

  /// The name of the previous route.
  String? get name => previousRoute?.settings.name;

  Route? previousRoute;

  @override
  void didPop(Route route, Route? previousRoute) {
    this.previousRoute = route;
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    this.previousRoute = previousRoute;
  }
}

@Riverpod(keepAlive: true)
PreviousRouteObserver previousRouteObserver(PreviousRouteObserverRef ref) {
  return PreviousRouteObserver(ref);
}
