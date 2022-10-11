import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:tedx_dtu_app/events/models/live_event.dart';
import 'package:tedx_dtu_app/events/widgets/live_indicator_widget.dart';
import 'package:tedx_dtu_app/global/widgets/custom_image_widget.dart';
import 'package:tedx_dtu_app/global/widgets/image_error_widget.dart';
import 'package:tedx_dtu_app/home/screens/home_screen.dart';

/// Creates a [TedStoryWidget] to be used on [HomeScreen]. It is actually a
/// general purpose widget that can be used to display any data. In the future
/// it will be used to display [LiveEvent] on the home screen as well.
class TedStoryWidget extends StatelessWidget {
  const TedStoryWidget({
    bool? isHighlighted,
    double? borderRadius,
    Color? backgroundColor,
    Color? fontColor,
    Key? key,
    required this.leadingText,
    this.onPressed,
    required this.dateTime,
    required this.width,
    required this.imageUrl,
    this.loadingIndicator,
    this.showLiveText = false,
  })  : fontColor = fontColor ?? Colors.white,
        backgroundColor = backgroundColor ?? Colors.black,
        // width = width,
        borderRadius = borderRadius ?? 20,
        isHighlighted = isHighlighted ?? false,
        assert(isHighlighted == true || showLiveText == false,
            'Non highlighted widget cannot show live text'),
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

  /// Function executed on clicking on the widget.
  final Function? onPressed;

  /// Date of the event.
  final DateTime dateTime;

  final double width;
  // final double height;

  final double borderRadius;

  final String imageUrl;

  final Widget? loadingIndicator;

  final bool isHighlighted;

  final bool showLiveText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          print('Okay');
          onPressed!();
        }
      },
      child: Container(
        height: width * 16 / 9,
        width: width,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
          boxShadow: isHighlighted
              ? [
                  BoxShadow(
                    color: Theme.of(context).primaryColor,
                    blurRadius: 8,
                  )
                ]
              : null,
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
                child: CustomImageWidget(
                  url: imageUrl,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              verticalDirection: VerticalDirection.up,
              children: [
                Container(
                  width: width,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
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
                        DateFormat('EEE, dd MMM yyyy').format(dateTime),
                        style: TextStyle(
                          color: isHighlighted ? Colors.white : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 8,
                    ),
                    child: AutoSizeText(
                      leadingText,
                      maxFontSize: 18,
                      maxLines: 3,
                      style: TextStyle(
                        color: fontColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                // if (isHighlighted == true)
                //   const Padding(
                //     padding: EdgeInsets.only(
                //       bottom: 0,
                //       top: 8.0,
                //       left: 12,
                //       right: 12,
                //     ),
                //     child: Text(
                //       'Live',
                //       style: TextStyle(fontSize: 14),
                //     ),
                //   ),
              ],
            ),
            if (isHighlighted == true)
              Positioned(
                top: 5,
                right: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LiveIndicatorWidget(
                    3,
                    showText: showLiveText,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
