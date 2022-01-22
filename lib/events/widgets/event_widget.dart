import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/global/widgets/image_error_widget.dart';
import 'package:tuple/tuple.dart';

/// Creates an event widget which shows a title, followed by details,
/// an action button on bottom-right, implements a gesture detector for the
/// whole widget, an optional trailing widget shown at top right.
///
/// Basic usage with [LiveIndicatorPainter]
///
/// EventWidget(
///
///          title: 'Test',
///          details: ['some detail'],
///          trailing: CustomPaint(
///            painter: LiveIndicatorPainter(),
///          ),
///        );
class EventWidget extends StatelessWidget {
  /// [gradientColor] is the primary color in the gradient over the image,
  /// starting from left.
  ///
  /// Defaults to Red (0xffE62B1E).
  ///
  /// [height] and [width] are optional and size the widget accordingly.
  ///
  /// Default to 180 and 400 respectively.
  const EventWidget({
    required this.title,
    required this.details,
    this.actionWidgetFunction,
    this.actionWidget,
    this.actionButton,
    this.imageProvider,
    this.cardFunction,
    this.shadowColor,
    this.shadowRadius,
    this.loadingIndicator,
    this.trailing,
    Tuple2<double, double>? actionWidgetOffset,
    bool? showActionWidget,
    Color? fontColor,
    Color? gradientColor,
    double? height,
    double? width,
    Key? key,
  })  : widgetHeight = height ?? 180,
        widgetWidth = width ?? 400,
        color = gradientColor ?? const Color(0xffE62B1E),
        fontColor = fontColor ?? Colors.white,
        showActionWidget = showActionWidget ?? true,
        actionWidgetOffset =
            actionWidgetOffset ?? const Tuple2<double, double>(18, 8),
        super(key: key);

  /// Height of the widget, defaults to 180.
  final double widgetHeight;

  /// Width of the widget, defaults to 400.
  final double widgetWidth;

  /// The title that will be shown at top left.
  final String title;

  /// The details, shown below [title].
  final List<String> details;

  /// The primary gradient color for the [title] and [details].
  ///
  /// Defaults to Red (0xffE62B1E).
  final Color color;

  /// actionButton is preferably a Button ([IconButton], [ElevatedButton])
  /// shown at the bottom right of the [EventWidget].

  /// Whether to show the action widget at the bottom right.
  ///
  /// Defaults to true.
  final bool showActionWidget;

  /// If no [actionButton] is passed, it defaults to an [ElevatedButton] and
  /// the parameters [actionWidget] and [actionWidgetFunction] define the behaviour
  /// of the default [ElevatedButton].
  final Widget? actionButton;

  /// [actionWidget] is passed to the child of the default [ElevatedButton].
  final Widget? actionWidget;

  /// [actionWidgetFunction] is the function which is triggered when
  /// [actionWidget] is clicked.
  final Function? actionWidgetFunction;

  /// [imageProvider] is the image that is to be used as the background of the
  /// [EventWidget].
  ///
  /// Defaults to a placeholder image, fetched from placeholder.com
  final ImageProvider? imageProvider;

  /// [cardFunction] is the function, triggered when the [EventWidget] is tapped.
  final Function? cardFunction;

  /// [shadowRadius] define the shadow of the [EventWidget].
  final double? shadowRadius;

  /// The color of the shadow around the container.
  ///
  /// Defaults to [EventWidget.color].
  final Color? shadowColor;

  /// [loadingIndicator] is the widget shown while the image is being loaded.
  final Widget? loadingIndicator;

  /// [Widget] shown at top right of the [EventWidget].
  ///
  /// for example: A live indicator.
  final Widget? trailing;

  /// [Color] for all the text in [EventWidget].
  ///
  /// Defaults to [Colors.white].
  final Color fontColor;

  /// Sets the position of [actionWidget] according to the values passed,
  /// relative to bottom right.
  ///
  /// First value corresponds to left offset, second value to the bottom offset.
  final Tuple2<double, double> actionWidgetOffset;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: widgetHeight,
      width: widgetWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? color,
            blurRadius: shadowRadius ?? 0,
          )
        ],
      ),
      child: GestureDetector(
        onTap: () {
          if (cardFunction != null) {
            cardFunction!();
          }
        },
        child: Stack(
          children: [
            Container(
              height: widgetHeight,
              width: widgetWidth,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.transparent,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                child: Image(
                  image: imageProvider ??
                      const NetworkImage(
                        'https://enterprisersproject.com/sites/default/files/styles/google_discover/public/images/ted_talk_2019.png?itok=CPz0Ef4S',
                      ),
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
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.white,
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    color,
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 8,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: fontColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: widgetHeight * 0.08),
                  ...details.map((detail) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Text(
                        detail,
                        style: TextStyle(
                          color: fontColor,
                          fontSize: 14,
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
            // Action Widget, shown at bottom right.
            if (showActionWidget == true)
              Positioned(
                bottom: actionWidgetOffset.item2,
                right: actionWidgetOffset.item1,
                child: actionButton ??
                    ElevatedButton(
                      child: actionWidget,
                      style: ElevatedButton.styleFrom(
                        primary: color,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        if (actionWidgetFunction != null) {
                          actionWidgetFunction!();
                        }
                      },
                    ),
              ),
            if (trailing != null)
              Positioned(
                top: 18,
                right: 18,
                child: trailing!,
              ),
          ],
        ),
      ),
    );
  }
}
