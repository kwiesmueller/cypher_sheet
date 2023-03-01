import 'package:flutter/material.dart';
import 'package:cypher_sheet/components/icon.dart';
import 'package:cypher_sheet/components/icons.dart';

class AppView extends StatefulWidget {
  const AppView({super.key, required this.views});

  final List<ViewConfig> views;

  @override
  State<AppView> createState() => _AppViewState();
}

class ViewConfig {
  final String name;
  final AppIcons icon;
  final Widget view;

  ViewConfig(this.name, this.icon, this.view);
}

class _AppViewState extends State<AppView>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(
        length: widget.views.length,
        vsync: this,
        initialIndex: (widget.views.length - 1) ~/ 2.0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        child: TabBarView(
            controller: _tabController,
            children: widget.views.map((view) => view.view).toList()),
      ),
      extendBody: true,
      primary: true,
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              blurRadius: 40,
              spreadRadius: 1,
              color: Colors.black,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ConstrainedBox(
            constraints: BoxConstraints.loose(const Size.fromHeight(62)),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.views
                    .asMap()
                    .entries
                    .map(
                      (e) => ToolbarIconButton(
                        AppIcon(
                          e.value.icon,
                          size: 34,
                        ),
                        e.value.name,
                        () {
                          _tabController.index = e.key;
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ToolbarIconButton extends StatelessWidget {
  const ToolbarIconButton(this.icon, this.text, this.onPressed, {super.key});

  final Widget icon;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: onPressed,
              icon: icon,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.labelSmall,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
