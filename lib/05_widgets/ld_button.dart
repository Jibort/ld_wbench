// Butó base per a l'aplicació Sabina.
// CreatedAt: 2025/01/19 dg. JIQ

// ignore_for_file: must_be_immutable, avoid_renaming_method_parameters, avoid_init_to_null, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ld_wbench/02_tools/index.dart';
import 'package:ld_wbench/05_widgets/index.dart';
import 'package:ld_wbench/06_theme/app_theme.dart';

/// LdButton: Un botó estilitzat per al projecte, basat en LdWidget.
/// S'integra amb el tema definit i pot ser primari, secundari o de perill.
/// LdButton: Un botó estilitzat per al projecte, basat en LdWidget.
/// S'integra amb el tema definit i pot ser primari, secundari o de perill.
class LdButton extends LdWidget {
  final VoidCallback? onPressed;
  final String? ikey; 
  final String? asset; // 🔥 Ara podem passar una imatge (LdImage)
  final IconData? iconData; // 🔥 O una icona (IconData)
  final bool isPrimary;
  final bool isDanger;
  final bool isDisabled;

  LdButton({
    super.key,
    required super.id,
    required this.onPressed,
    required super.pLabel,
    this.ikey,
    this.asset, // 🔥 Pot haver-hi un asset o no
    this.iconData, // 🔥 Pot haver-hi una icona o no
    this.isPrimary = true,
    this.isDanger = false,
    this.isDisabled = false, 
  });

  @override
  Widget buildContent(BuildContext context) {
    // Debug.info(("LdButton.buildContent() - Construint botó amb id: $id");

    return GetBuilder<LdImageController>(
      id: id,  // 🔥 Assignem l'ID únic al GetBuilder
      builder: (controller) {
        // Debug.info(("LdButton.buildContent() - Construint botó amb imageKey: $asset");

        if (ikey == null) {
          // Debug.info(("LdButton.buildContent() - ⚠️ No s'ha proporcionat cap clau d'imatge.");
          return _buildButton(context, null);
        }

        Image? img = controller.getStoredImage(ikey!);
        if (img == null) {
          // Debug.info(("LdButton.buildContent() - ⚠️ La icona encara no està disponible: $asset");

          // 🔥 Ara només actualitzem aquest botó quan la imatge estigui carregada
          controller.loadImage(
            ikey!,
            pTargetId: id,
            pAsset: asset,
            pIcon: iconData,
            pWidth: defIconWidth,
            pHeight: defIconHeight,
          );

          return _buildButton(context, null); // Retornem el botó sense icona inicialment
        }

        // Debug.info(("LdButton.buildContent() - ✅ Icona carregada per $asset");
        return _buildButton(context, img);
      },
    );
  }

  /// 🔥 Mètode privat per encapsular la creació del botó
  Widget _buildButton(BuildContext context, Image? icon) {
    final theme = Theme.of(context);
    final bgColor = isDisabled ? theme.colorScheme.surface.withValues(alpha: 0.5) :
                        isDanger ? Colors.redAccent :
                        isPrimary ? theme.colorScheme.primary :
                        theme.colorScheme.secondary;
    final fgColor = isDisabled ? Colors.grey :
                        isDanger || isPrimary ? theme.colorScheme.onPrimary :
                        theme.colorScheme.onSecondary;

    return ElevatedButton(
      onPressed: isDisabled ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: fgColor,
        padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            ColorFiltered(
              colorFilter: ColorFilter.mode(fgColor, BlendMode.srcIn),
              child: icon,
            ),
            SizedBox(width: 8.0),
          ],
          Text(label, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // El widget no requereix alliberar recursos de forma explícita.
  }
}

