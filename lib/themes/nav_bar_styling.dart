import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

/// Copied from the default style class NavBarStyling for the persistent_bottom_nav_bar
/// Check the official page: https://pub.dev/packages/persistent_bottom_nav_bar_v2

class NavBarStyling extends StatefulWidget {
  const NavBarStyling({
    required this.navBarConfig,
    this.navBarDecoration = const NavBarDecoration(),
    this.itemAnimationProperties = const ItemAnimation(),
    super.key,
  });

  final NavBarConfig navBarConfig;
  final NavBarDecoration navBarDecoration;

  /// This controls the animation properties of the items of the NavBar.
  final ItemAnimation itemAnimationProperties;

  @override
  State<NavBarStyling> createState() => _NavBarStylingState();
}

class _NavBarStylingState extends State<NavBarStyling>
    with TickerProviderStateMixin {
  late List<AnimationController> _animationControllerList;
  late List<Animation<Offset>> _animationList;
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.navBarConfig.selectedIndex;
    _animationControllerList = List<AnimationController>.empty(growable: true);
    _animationList = List<Animation<Offset>>.empty(growable: true);

    for (int i = 0; i < widget.navBarConfig.items.length; ++i) {
      _animationControllerList.add(
        AnimationController(
          duration: widget.itemAnimationProperties.duration,
          vsync: this,
        ),
      );
      _animationList.add(
        Tween(
          begin: Offset(0, widget.navBarConfig.navBarHeight),
          end: Offset.zero,
        )
            .chain(CurveTween(curve: widget.itemAnimationProperties.curve))
            .animate(_animationControllerList[i]),
      );
    }

    /* Class not found... 
    _ambiguate(WidgetsBinding.instance)!.addPostFrameCallback((_) {
      _animationControllerList[_selectedIndex].forward();
    });
    */
  }

  Widget _buildItem(ItemConfig item, bool isSelected, int itemIndex) =>
      AnimatedBuilder(
        animation: _animationList[itemIndex],
        builder: (context, child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: IconTheme(
                data: IconThemeData(
                    size: item.iconSize,
                    color: isSelected
                        ? Theme.of(context)
                            .colorScheme
                            .primary //item.activeForegroundColor
                        : Theme.of(context)
                            .colorScheme
                            .onInverseSurface //item.inactiveForegroundColor,
                    ),
                child: isSelected ? item.icon : item.inactiveIcon,
              ),
            ),
            if (item.title != null)
              AnimatedOpacity(
                opacity: isSelected ? 1.0 : 0.0,
                duration: widget.itemAnimationProperties.duration,
                child: Transform.translate(
                  offset: _animationList[itemIndex].value,
                  child: FittedBox(
                    // Title text
                    child: Text(
                      item.title!,
                      style: item.textStyle.apply(
                          color: isSelected
                              ? Theme.of(context)
                                  .colorScheme
                                  .primary //item.activeForegroundColor
                              : Theme.of(context)
                                  .colorScheme
                                  .onInverseSurface //item.inactiveForegroundColor,
                          ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      );

  @override
  void dispose() {
    for (var controller in _animationControllerList) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.navBarConfig.selectedIndex != _selectedIndex) {
      _animationControllerList[_selectedIndex].reverse();
      _selectedIndex = widget.navBarConfig.selectedIndex;
      _animationControllerList[_selectedIndex].forward();
    }
    return DecoratedNavBar(
      decoration: widget.navBarDecoration,
      // ignore: deprecated_member_use
      filter: widget.navBarConfig.items[_selectedIndex].filter,
      // ignore: deprecated_member_use
      opacity: widget.navBarConfig.items[_selectedIndex].opacity,
      height: widget.navBarConfig.navBarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.navBarConfig.items.map((item) {
          final int index = widget.navBarConfig.items.indexOf(item);
          return Expanded(
            child: InkWell(
              onTap: () {
                widget.navBarConfig.onItemSelected(index);
              },
              child: _buildItem(
                item,
                widget.navBarConfig.selectedIndex == index,
                index,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
