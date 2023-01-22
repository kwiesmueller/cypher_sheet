import 'dart:developer';
import 'dart:io';

import 'package:cypher_sheet/components/box.dart';
import 'package:cypher_sheet/components/dialog.dart';
import 'package:cypher_sheet/components/text.dart';
import 'package:cypher_sheet/proto/character.pb.dart';
import 'package:cypher_sheet/state/providers/character.dart';
import 'package:cypher_sheet/state/storage/file.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart';

class ShareCharacter extends ConsumerWidget {
  const ShareCharacter({super.key, required this.uuid});

  final String uuid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppText(
          "Share Character",
          style: Theme.of(context).textTheme.bodyLarge,
          align: TextAlign.left,
        ),
        const SizedBox(height: 28.0),
        FutureBuilder(
          future: readLatestCharacterRevisionRaw(uuid),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return AppBox(
                  child: QrImage(
                data: snapshot.data!,
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                errorStateBuilder: (context, error) {
                  log("failed to create QR code", error: error);
                  if (error is InputTooLongException) {
                    return AppText(
                      "Character too big for QR code",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: Colors.black),
                    );
                  }
                  return Text(
                    error.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: Colors.black),
                  );
                },
              ));
            }
            if (snapshot.hasError) {
              return Text(
                snapshot.error.toString(),
                style: Theme.of(context).textTheme.labelMedium,
              );
            }
            return const CircularProgressIndicator();
          },
        ),
        const SizedBox(height: 28.0),
        AppBox(
          onTap: () async {
            final revision = await readLatestCharacterRevision(uuid);
            final revisionRaw = revision.writeToBuffer();
            Share.shareXFiles([XFile.fromData(revisionRaw)]);
          },
          child: const AppText(
            "Share Latest Revision",
            maxLines: 2,
          ),
        ),
        const SizedBox(height: 28.0),
        AppBox(
          onTap: () async {
            final revision = await readLatestCharacterRevision(uuid);
            final revisionRaw = revision.writeToBuffer();
            log(revisionRaw.toString());
            log(revision.toDebugString());
          },
          child: const AppText(
            "Log Latest Revision",
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}

class ImportCharacter extends ConsumerWidget {
  const ImportCharacter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppText(
          "Import Character",
          style: Theme.of(context).textTheme.bodyLarge,
          align: TextAlign.left,
        ),
        const SizedBox(height: 28.0),
        if (Platform.isAndroid || Platform.isIOS)
          AppBox(
            onTap: () {
              showAppDialog(
                  context,
                  MobileScanner(
                      allowDuplicates: false,
                      onDetect: (barcode, args) {
                        if (barcode.rawValue == null) {
                          debugPrint('Failed to scan Barcode');
                        } else {
                          // incredibly hacky code to convert a stringed proto
                          // back to a proto
                          // this is for debugging and should not go to prod
                          try {
                            String code = barcode.rawValue!;
                            debugPrint('QR found! $code');
                            if (!code.startsWith("[")) {
                              return;
                            }
                            if (!code.endsWith("]")) {
                              return;
                            }
                            code = code.substring(1, code.length - 1);

                            final bytes = Uint8List.fromList(code
                                .split(", ")
                                .map((e) => int.parse(e))
                                .toList());
                            final Character character =
                                Character.fromBuffer(bytes);
                            writeLatestCharacterRevision(character);
                            ref.invalidate(characterListProvider);
                            closeDialog(context);
                            closeDialog(context);
                            closeDialog(context);
                          } catch (err) {
                            debugPrint(err.toString());
                          }
                        }
                      }));
            },
            child: const AppText("Scan QR Code"),
          ),
        const SizedBox(height: 16.0),
        AppBox(
          onTap: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles();

            if (result != null) {
              File file = File(result.files.single.path!);
              final character = Character.fromBuffer(file.readAsBytesSync());
              final newRevision = await writeLatestCharacterRevision(character);
              log("loaded new revision $newRevision from file");
              ref.invalidate(characterListProvider);
              // ignore: use_build_context_synchronously
              if (!context.mounted) return;
              closeDialog(context);
              closeDialog(context);
            }
          },
          child: const AppText("Import Revision File"),
        ),
      ],
    );
  }
}
