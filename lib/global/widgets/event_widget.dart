import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/global/widgets/image_error_widget.dart';

class EventWidget extends StatelessWidget {
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
    Color? gradientColor,
    double? height,
    double? width,
    Key? key,
  })  : widgetHeight = height ?? 180,
        widgetWidth = width ?? 400,
        color = gradientColor ?? const Color(0xffE62B1E),
        super(key: key);

  final double widgetHeight;
  final double widgetWidth;
  final String title;
  final List<String> details;
  final Color color;
  final Function? actionWidgetFunction;
  final Widget? actionWidget;
  final Widget? actionButton;
  final ImageProvider? imageProvider;
  final Function? cardFunction;
  final Color? shadowColor;
  final double? shadowRadius;
  final Widget? loadingIndicator;

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
                        'https://via.placeholder.com/4000x1800.png',
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
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(height: widgetHeight * 0.08),
                  ...details.map((detail) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Text(
                        detail,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
            Positioned(
              bottom: 8,
              right: 18,
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
          ],
        ),
      ),
    );
  }
}
