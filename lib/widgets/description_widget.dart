import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:audiobookshelf_flutter/model/libraries/meta_data.dart';

/// A widget that intelligently renders descriptions, supporting both HTML and plain text
class DescriptionWidget extends StatelessWidget {
  final Metadata metadata;
  final TextStyle? textStyle;
  final int? maxLines;
  final TextOverflow? overflow;

  const DescriptionWidget({
    super.key,
    required this.metadata,
    this.textStyle,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    final description = metadata.description;
    if (description == null || description.isEmpty) {
      return const SizedBox.shrink();
    }

    final effectiveFormat = metadata.effectiveDescriptionFormat;

    if (effectiveFormat == 'html') {
      return Html(
        data: description,
        style: {
          "body": Style(
            margin: Margins.zero,
            padding: HtmlPaddings.zero,
            fontSize: textStyle?.fontSize != null
                ? FontSize(textStyle!.fontSize!)
                : FontSize(14),
            color: textStyle?.color ?? Theme.of(context).colorScheme.onSurface,
            fontFamily: textStyle?.fontFamily,
            fontWeight: textStyle?.fontWeight,
            lineHeight: textStyle?.height != null
                ? LineHeight(textStyle!.height!)
                : const LineHeight(1.4),
          ),
          "p": Style(
            margin: Margins.only(bottom: 8),
          ),
          "a": Style(
            color: Theme.of(context).colorScheme.primary,
            textDecoration: TextDecoration.underline,
          ),
          "strong": Style(
            fontWeight: FontWeight.bold,
          ),
          "em": Style(
            fontStyle: FontStyle.italic,
          ),
          "ul": Style(
            margin: Margins.only(left: 16, bottom: 8),
          ),
          "ol": Style(
            margin: Margins.only(left: 16, bottom: 8),
          ),
          "li": Style(
            margin: Margins.only(bottom: 4),
          ),
        },
        onLinkTap: (url, attributes, element) {
          // Handle link taps if needed
          if (url != null) {
            // You can implement link handling here
            debugPrint('Link tapped: $url');
          }
        },
      );
    } else {
      // Plain text
      return Text(
        description,
        style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
        maxLines: maxLines,
        overflow: overflow,
      );
    }
  }
}

/// A simplified version for just displaying description text
class SimpleDescriptionWidget extends StatelessWidget {
  final String? description;
  final TextStyle? textStyle;
  final int? maxLines;
  final TextOverflow? overflow;

  const SimpleDescriptionWidget({
    super.key,
    this.description,
    this.textStyle,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    if (description == null || description!.isEmpty) {
      return const SizedBox.shrink();
    }

    // Check if it contains HTML tags
    final containsHtml = description!.contains(RegExp(r'<[^>]+>'));

    if (containsHtml) {
      return Html(
        data: description!,
        style: {
          "body": Style(
            margin: Margins.zero,
            padding: HtmlPaddings.zero,
            fontSize: textStyle?.fontSize != null
                ? FontSize(textStyle!.fontSize!)
                : FontSize(14),
            color: textStyle?.color ?? Theme.of(context).colorScheme.onSurface,
            fontFamily: textStyle?.fontFamily,
            fontWeight: textStyle?.fontWeight,
            lineHeight: textStyle?.height != null
                ? LineHeight(textStyle!.height!)
                : const LineHeight(1.4),
          ),
          "p": Style(
            margin: Margins.only(bottom: 8),
          ),
          "a": Style(
            color: Theme.of(context).colorScheme.primary,
            textDecoration: TextDecoration.underline,
          ),
          "strong": Style(
            fontWeight: FontWeight.bold,
          ),
          "em": Style(
            fontStyle: FontStyle.italic,
          ),
        },
        onLinkTap: (url, attributes, element) {
          if (url != null) {
            debugPrint('Link tapped: $url');
          }
        },
      );
    } else {
      return Text(
        description!,
        style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
        maxLines: maxLines,
        overflow: overflow,
      );
    }
  }
}
