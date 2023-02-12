import 'package:flutter/material.dart';

class AppScrollView extends StatelessWidget {
  const AppScrollView({
    super.key,
    required this.slivers,
    this.appBar,
    this.customPadding,
  });

  final Widget? appBar;
  final List<Widget> slivers;
  final EdgeInsetsGeometry? customPadding;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: true,
      scrollBehavior: const ScrollBehavior().copyWith(scrollbars: false),
      slivers: [
        if (appBar != null) appBar!,
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Padding(
                  padding: customPadding ??
                      const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: slivers[index]);
            },
            childCount: slivers.length,
            addAutomaticKeepAlives: true,
          ),
        ),
        const SliverToBoxAdapter(
            child: SizedBox(
          height: 100,
          width: 1,
        )),
      ],
    );
  }
}
