import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:doc_widget/src/styles/colors.dart';
import 'package:doc_widget/src/styles/spaces.dart';

class SnippetCopy extends StatelessWidget {
  SnippetCopy(this.snippet);
  final String snippet;

  final GlobalKey _toolTipKey = GlobalKey();

  void _deactivateTooltip() {
    final dynamic tooltip = _toolTipKey.currentState;
    tooltip.deactivate();
  }

  void _activeTooltip() {
    final dynamic tooltip = _toolTipKey.currentState;
    tooltip.ensureTooltipVisible();
  }

  void _showTooltip() {
    _activeTooltip();
    Future.delayed(const Duration(seconds: 1), _deactivateTooltip);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Clipboard.setData(ClipboardData(text: snippet));
        _showTooltip();
      },
      child: Padding(
        padding: const EdgeInsets.all(Spacing.x2),
        child: Align(
          alignment: Alignment.topRight,
          child: Tooltip(
            key: _toolTipKey,
            message: 'Copy',
            child: const Padding(
              padding: EdgeInsets.all(Spacing.x4),
              child: Icon(
                Icons.copy_all_outlined,
                color: ColorsDoc.neutral300,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
