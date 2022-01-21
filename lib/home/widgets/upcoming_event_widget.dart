import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tedx_dtu_app/global/widgets/image_error_widget.dart';

class UpcomingEventWidget extends StatelessWidget {
  const UpcomingEventWidget({
    required this.leadingText,
    required this.dateTime,
    required this.imageProvider,
    this.onPressed,
    this.loadingIndicator,
    double? width,
    double? borderRadius,
    Color? backgroundColor,
    Color? fontColor,
    Key? key,
  })  : fontColor = fontColor ?? Colors.white,
        backgroundColor = backgroundColor ?? Colors.black,
        width = width ?? 140,
        borderRadius = borderRadius ?? 20,
        super(key: key);

  /// Text to be shown at top left of the widget.
  final String leadingText;

  /// Default fontColor for all the text.
  ///
  /// Defaults to [Colors.white].
  final Color fontColor;

  /// The color of the widget.
  ///
  /// Defaults to [Colors.black].
  final Color? backgroundColor;

  /// Function executed on pressing the icon on bottom right.
  final Function? onPressed;

  /// Date of the event.
  final DateTime dateTime;

  final double width;

  final double borderRadius;

  final ImageProvider imageProvider;

  final Widget? loadingIndicator;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: width,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
      ),
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  borderRadius,
                ),
              ),
              child: Image(
                image: imageProvider,
                fit: BoxFit.cover,
                errorBuilder: (context, exception, stackTrace) {
                  return const ImageErrorWidget();
                },
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return Center(
                    child:
                        loadingIndicator ?? const CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius),
              ),
              color: Colors.white,
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.center,
                colors: [
                  Theme.of(context).primaryColor,
                  Colors.transparent,
                ],
              ),
            ),
          ),
          // vertical direction of the column is set to up, the order of
          // children is reversed.
          Column(
            verticalDirection: VerticalDirection.up,
            children: [
              Container(
                width: width,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(borderRadius),
                    bottomRight: Radius.circular(borderRadius),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat('EEE, dd MMM').format(dateTime),
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    leadingText,
                    style: TextStyle(
                      color: fontColor,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
