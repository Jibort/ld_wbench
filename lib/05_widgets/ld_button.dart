// Butó base per a l'aplicació Sabina.
// CreatedAt: 2025/01/19 dg. JIQ

// ignore_for_file: must_be_immutable, avoid_renaming_method_parameters, avoid_init_to_null, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ld_wbench/02_tools/index.dart';
import 'package:ld_wbench/05_widgets/index.dart';

/// LdButton: Un botó estilitzat per al projecte, basat en LdWidget.
/// S'integra amb el tema definit i pot ser primari, secundari o de perill.
/// LdButton: Un botó estilitzat per al projecte, basat en LdWidget.
/// S'integra amb el tema definit i pot ser primari, secundari o de perill.
class LdButton extends LdWidget {
  final VoidCallback? onPressed;
  final String? imageKey; // 🔥 Ara podem passar una imatge (LdImage)
  final bool isPrimary;
  final bool isDanger;
  final bool isDisabled;

  LdButton({
    super.key,
    required super.id,
    required this.onPressed,
    required super.pLabel,
    this.imageKey, // 🔥 Pot haver-hi una icona o no
    this.isPrimary = true,
    this.isDanger = false,
    this.isDisabled = false, 
  });


  @override
  Widget buildContent(BuildContext context) {
    final theme = Theme.of(context);

    return GetBuilder<LdImageController>(
      builder: (_) {
        Image? icon = imageKey != null ? LdImageController.instance.getStoredImage(imageKey!) : null;

        if (icon == null) {
          Debug.info("LdButton.buildContent() - ⚠️ Encara no hi ha icona disponible per a $imageKey. Renderitzant sense icona.");
        }

        return ElevatedButton(
          onPressed: isDisabled ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: isDisabled ? theme.colorScheme.surface.withValues(alpha: 0.5) :
                            isDanger ? Colors.redAccent :
                            isPrimary ? theme.colorScheme.primary :
                            theme.colorScheme.secondary,
            foregroundColor: isDisabled ? Colors.grey :
                            isDanger || isPrimary ? theme.colorScheme.onPrimary :
                            theme.colorScheme.onSecondary,
            padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                icon,
                SizedBox(width: 8.0),
              ] else
                SizedBox(width: 20, height: 20), // 🔥 Espai reservat per la icona per evitar moviments visuals
              Text(label, style: TextStyle(fontSize: 16)),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    // El widget no requereix alliberar recursos de forma explícita.
  }
}

