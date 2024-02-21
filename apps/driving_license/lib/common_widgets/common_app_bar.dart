import 'package:auto_route/auto_route.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/constants/widget_sizes.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

enum AppBarRightPadding {
  iconButton(kGap_4),
  normalButton(kGap_12);

  const AppBarRightPadding(this.gap);
  final Gap gap;
}

class CommonAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? leading;
  final List<Widget> actions;
  final AppBarRightPadding rightPadding;
  final Color? backgroundColor;
  final ScrollController? scaffoldBodyScrollController;

  const CommonAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions = const [],
    this.rightPadding = AppBarRightPadding.iconButton,
    this.backgroundColor,
    this.scaffoldBodyScrollController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasNewScrollController =
        useHasNewScrollController(scaffoldBodyScrollController);

    // Prioritize backgroundColor if it's provided, otherwise use
    // scaffoldBodyScrollController to calculate the color
    final appBarColor = backgroundColor ??
        useAppBarScrolledUnderBackgroundColor(
          scaffoldBodyScrollController,
        );

    return AnimatedContainer(
      // We should only animate the color change if we are changing to
      // a different scroll controller
      duration: hasNewScrollController ? Durations.short4 : Duration.zero,
      color: appBarColor,
      child: AppBar(
        backgroundColor: Colors.transparent,
        title: title,
        leading: Align(
          alignment: Alignment.centerRight,
          child: leading ?? getImplyLeadingButton(context),
        ),
        leadingWidth: kSize_48 + kSize_4,
        actions: [
          kGap_12,
          ...actions,
          rightPadding.gap,
        ],
      ),
    );
  }

  @override
  final Size preferredSize = const Size.fromHeight(kAppBarHeight);
}

/// Deprecated, keeping for historical purposes when Flutter team decides to add
/// AppBar color transition animation when MaterialState.scrolledUnder
class AppBarBackgroundColor extends MaterialStateColor {
  final BuildContext context;
  AppBarBackgroundColor(this.context)
      : super(context.materialScheme.surface.value);

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.scrolledUnder)) {
      return context.materialScheme.surfaceContainerLow;
    }
    return context.materialScheme.surface;
  }
}

extension CommonAppBarX on CommonAppBar {
  bool useHasNewScrollController(ScrollController? scrollController) {
    final oldScrollController = usePrevious(scrollController);
    return oldScrollController != scrollController;
  }

  Color useAppBarScrolledUnderBackgroundColor(
    ScrollController? scaffoldBodyScrollController,
  ) {
    final context = useContext();
    final appBarSurfaceColor = context.materialScheme.surface;
    final appBarScrolledUnderColor = context.materialScheme.surfaceContainerLow;

    if (scaffoldBodyScrollController == null) {
      return appBarSurfaceColor;
    }

    return useListenableSelector(scaffoldBodyScrollController, () {
      /// If the scroll controller has not been attached to a scroll view yet,
      /// return the default color
      if (!scaffoldBodyScrollController.hasClients) {
        return appBarSurfaceColor;
      }

      final newColor = Color.lerp(
        appBarSurfaceColor,
        appBarScrolledUnderColor,
        (scaffoldBodyScrollController.offset / (context.appBarHeight / 4))
            .clamp(0, 1),
      )!;

      return newColor;
    });
  }

  // This is based on AppBar implementation in the Flutter SDK
  Widget? getImplyLeadingButton(BuildContext context) {
    final hasDrawer = Scaffold.maybeOf(context)?.hasDrawer ?? false;
    final parentRoute = ModalRoute.of(context);
    final useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;

    if (hasDrawer) {
      return const _DrawerButton();
    }

    if (parentRoute?.impliesAppBarDismissal ?? false) {
      return useCloseButton ? const _CloseButton() : const _BackButton();
    }

    return null;
  }
}

class _DrawerButton extends StatelessWidget {
  const _DrawerButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Symbols.menu),
      onPressed: () => Scaffold.of(context).openDrawer,
    );
  }
}

class _CloseButton extends StatelessWidget {
  const _CloseButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Symbols.close),
      onPressed: () async => context.popRoute(),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        switch (context.theme.platform) {
          // If we have to pay apple tax
          (TargetPlatform.iOS || TargetPlatform.macOS) =>
            Symbols.arrow_back_ios_new,

          // If we have to pay google tax
          _ => Symbols.arrow_back
        },
      ),
      onPressed: () async => context.popRoute(),
    );
  }
}
