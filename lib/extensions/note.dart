import 'package:cypher_sheet/components/icons.dart';
import 'package:cypher_sheet/proto/character.pb.dart';

extension NoteTypeHelper on NoteType {
  AppIcons toIcon() {
    switch (this) {
      case NoteType.misc:
        return AppIcons.other;
      case NoteType.location:
        return AppIcons.location;
      case NoteType.character:
        return AppIcons.character;
      case NoteType.item:
        return AppIcons.item;
      case NoteType.quest:
        return AppIcons.quest;
      default:
        assert(false);
        return AppIcons.other;
    }
  }
}

extension Label on NoteType {
  String toLabel() {
    final name = toString();
    if (name.isEmpty) {
      return "<unknown>";
    }
    return name[0].toUpperCase() + name.substring(1);
  }
}

extension ShareHelper on Note {
  SharedObject share() {
    return SharedObject(
      uuid: uuid,
      name: title,
      note: this,
    );
  }
}
