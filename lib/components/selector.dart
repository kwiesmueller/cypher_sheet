import 'package:cypher_sheet/components/icon.dart';
import 'package:cypher_sheet/extensions/note.dart';
import 'package:cypher_sheet/extensions/pool.dart';
import 'package:cypher_sheet/extensions/skill.dart';
import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:flutter/material.dart';

class PoolTypeSelector extends StatelessWidget {
  const PoolTypeSelector(
      {super.key,
      required this.activeType,
      required this.type,
      required this.onSelect});

  final PoolType activeType;
  final PoolType type;
  final Function(PoolType) onSelect;

  static const iconSize = 24.0;

  @override
  Widget build(BuildContext context) {
    return SVGBox(
      active: type == activeType,
      icon: type.toIcon(),
      size: iconSize,
      onTap: () {
        onSelect(type);
      },
    );
  }
}

class SkillLevelSelector extends StatelessWidget {
  const SkillLevelSelector(
      {super.key,
      required this.activeLevel,
      required this.type,
      required this.onSelect});

  final SkillLevel activeLevel;
  final SkillLevel type;
  final Function(SkillLevel) onSelect;

  static const iconSize = 24.0;

  @override
  Widget build(BuildContext context) {
    return SVGBox(
      active: type == activeLevel,
      icon: type.toIcon(),
      size: iconSize,
      onTap: () {
        onSelect(type);
      },
    );
  }
}

class NoteTypeSelector extends StatelessWidget {
  const NoteTypeSelector(
      {super.key,
      required this.activeType,
      required this.type,
      required this.onSelect});

  final NoteType activeType;
  final NoteType type;
  final Function(NoteType) onSelect;

  static const iconSize = 24.0;

  @override
  Widget build(BuildContext context) {
    return SVGBox(
      active: type == activeType,
      icon: type.toIcon(),
      size: iconSize,
      onTap: () {
        onSelect(type);
      },
    );
  }
}
