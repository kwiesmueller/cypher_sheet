import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/extensions/shared_object.dart';
import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/state/providers/import.dart';
import 'package:cypher_sheet/views/character_sheet/abilities.dart';
import 'package:cypher_sheet/views/character_sheet/cyphers.dart';
import 'package:cypher_sheet/views/character_sheet/database.dart';
import 'package:cypher_sheet/views/character_sheet/equipment.dart';
import 'package:cypher_sheet/views/character_sheet/notes.dart';
import 'package:cypher_sheet/views/character_sheet/skills.dart';
import 'package:cypher_sheet/views/character_sheet/stats.dart';
import 'package:cypher_sheet/views/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:cypher_sheet/components/icon.dart';
import 'package:cypher_sheet/components/icons.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterSheetView extends StatelessWidget {
  const CharacterSheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: const CharacterSheet(
        views: characterSheetViews,
      ),
    );
  }
}

const characterSheetViews = [
  CharacterSheetTab("Database", AppIcons.database, DatabaseView()),
  CharacterSheetTab(
    "Skills",
    AppIcons.skills,
    SkillsView(),
    handlesImports: [
      SharedObject_Object.skill,
    ],
  ),
  CharacterSheetTab(
    "Abilities",
    AppIcons.abilities,
    AbilitiesView(),
    handlesImports: [
      SharedObject_Object.ability,
    ],
  ),
  CharacterSheetTab("Stats", AppIcons.stats, StatsView()),
  CharacterSheetTab(
    "Cyphers",
    AppIcons.cypher,
    CyphersView(),
    handlesImports: [
      SharedObject_Object.cypher,
      SharedObject_Object.artifact,
    ],
  ),
  CharacterSheetTab(
    "Equipment",
    AppIcons.equipment,
    EquipmentView(),
    handlesImports: [
      SharedObject_Object.item,
    ],
  ),
  CharacterSheetTab(
    "Notes",
    AppIcons.notes,
    NotesView(),
    handlesImports: [
      SharedObject_Object.note,
    ],
  ),
];

class CharacterSheet extends ConsumerStatefulWidget {
  const CharacterSheet({super.key, required this.views});

  final List<CharacterSheetTab> views;

  @override
  ConsumerState<CharacterSheet> createState() => _CharacterSheetState();
}

class CharacterSheetTab {
  final String name;
  final AppIcons icon;
  final Widget view;
  final List<SharedObject_Object> handlesImports;

  const CharacterSheetTab(this.name, this.icon, this.view,
      {this.handlesImports = const []});
}

class _CharacterSheetState extends ConsumerState<CharacterSheet>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final TabController _tabController;
  late final ProviderSubscription<SharedObject> _importSubscription;
  @override
  void initState() {
    super.initState();

    _tabController = TabController(
        length: widget.views.length,
        vsync: this,
        initialIndex: (widget.views.length - 1) ~/ 2.0);

    _importSubscription = ref.listenManual(
      importObjectProvider,
      (previous, next) {
        if (next.uuid.isNotEmpty) {
          SchedulerBinding.instance.addPostFrameCallback(
            (timeStamp) {
              showImportDialog(next);
            },
          );
        }
      },
    );

    final currentImport = _importSubscription.read();
    if (currentImport.uuid.isNotEmpty) {
      SchedulerBinding.instance.addPostFrameCallback(
        (timeStamp) {
          showImportDialog(currentImport);
        },
      );
    }
  }

  void showImportDialog(SharedObject import) {
    showAppDialog(
      context,
      import.importDialog(
        onCancel: onImportClosed,
        onSuccess: onImportSuccess(import),
      ),
    );
  }

  void onImportClosed() {
    ref.read(importObjectProvider.notifier).state = SharedObject();
    ref.read(importActiveProvider.notifier).state = false;
    closeDialog(context);
  }

  Function() onImportSuccess(SharedObject import) => () {
        _tabController.index =
            findTabIndexForSharedObject(import.whichObject());
        ref.read(importObjectProvider.notifier).state = SharedObject();
        ref.read(importActiveProvider.notifier).state = false;
      };

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AppScaffold(
      body: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        child: TabBarView(
            controller: _tabController,
            children: widget.views.map((view) => view.view).toList()),
      ),
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

  int findTabIndexForSharedObject(SharedObject_Object obj) {
    final foundIndex = characterSheetViews
        .indexWhere((element) => element.handlesImports.contains(obj));
    if (foundIndex >= 0) {
      return foundIndex;
    }
    // return the middle view if we can't find a matching one
    return (characterSheetViews.length - 1) ~/ 2.0;
  }
}
