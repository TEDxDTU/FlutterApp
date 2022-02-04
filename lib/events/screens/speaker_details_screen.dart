import 'package:any_link_preview/any_link_preview.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/helpers/extensions/padding_widget_list_extension.dart';
import 'package:url_launcher/url_launcher.dart';

class SpeakerDetailsScreen extends StatelessWidget {
  const SpeakerDetailsScreen({Key? key}) : super(key: key);
  static const routeName = '/speaker-details';

  static const BorderRadius redSpeakerInfoBorderRadius = BorderRadius.only(
    topLeft: Radius.circular(30),
    bottomRight: Radius.circular(70),
  );
  static const whiteSpeakerDetailsBorderRadius = BorderRadius.only(
    topLeft: Radius.circular(90),
    bottomRight: Radius.circular(90),
  );

  void _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      try {
        await launch(url);
      } catch (err) {
        throw 'Could not launch $url. Error: $err';
      }
    }
  }

  Column _buildHeadingAndData(BuildContext context, String heading, String data,
      double width, double height) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: SelectableText(
            heading,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: SelectableText(
            data,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontWeight: FontWeight.normal,
                ),
          ),
        ),
        const SizedBox(height: 15),
      ].padded(
        padding: EdgeInsets.only(left: width * 0.1, right: height * 0.03),
      ),
    );
  }

  List<Widget> _generateUrlPreviewWidgets(List<String> urls) {
    List<Widget> result = [];
    for (var url in urls) {
      final Widget widget = Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 5,
          margin: EdgeInsets.zero,
          color: Colors.white,
          child: AnyLinkPreview(
            link: url,
            backgroundColor: Colors.white,
            displayDirection: UIDirection.UIDirectionHorizontal,
            errorWidget: GestureDetector(
              // splashColor: Colors.black,
              // style: TextButton.styleFrom(
              //   backgroundColor: Colors.white,
              //   padding: EdgeInsets.symmetric(horizontal: 5),
              //   primary: Colors.black,
              // ),

              onTap: () => _launchURL(url),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  url,
                  style: const TextStyle(color: Colors.blue),
                ),
              ),
            ),
            removeElevation: true,
          ));
      result.add(
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
          child: widget,
        ),
      );
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    //TODO: Get speakerId from Modal Route and fetch data from Firebase
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;

    double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Speaker Info'),
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  // height: 155,
                  constraints: const BoxConstraints(
                    minHeight: 155,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: redSpeakerInfoBorderRadius,
                  ),
                  child: ClipRRect(
                    borderRadius: redSpeakerInfoBorderRadius,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: height * 0.28,
                        top: height * 0.04,
                        bottom: 10,
                        right: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            routeArgs['name'] as String,
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: height * 0.027,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ...(routeArgs['achievements'] as List<String>)
                              .sublist(0, 2)
                              .map((e) => AutoSizeText(
                                    '• $e',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: height * 0.022,
                                    ),
                                    maxLines: 2,
                                  ))
                              .toList()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          // borderRadius: BorderRadius.only(
                          //   bottomRight: Radius.circular(100),
                          // ),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(100),
                          ),
                          child: Container(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Container(
                        width: double.infinity,
                        // color: Colors.white,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: whiteSpeakerDetailsBorderRadius,
                        ),
                        child: ClipRRect(
                          borderRadius: whiteSpeakerDetailsBorderRadius,
                          child: Padding(
                            padding: EdgeInsets.only(top: height * 0.05),
                            child: ListView(
                              // physics: const BouncingScrollPhysics(),
                              children: [
                                if ((routeArgs['achievements'] as List).length >
                                    2)
                                  _buildHeadingAndData(
                                    context,
                                    'About the speaker',
                                    (routeArgs['achievements'] as List<String>)
                                        .sublist(2)
                                        .join('\n'),
                                    width,
                                    height,
                                  ),
                                _buildHeadingAndData(
                                    context,
                                    'Topic of Discussion',
                                    routeArgs['topic'] as String,
                                    width,
                                    height),

                                _buildHeadingAndData(
                                  context,
                                  'Speaker\'s History',
                                  (routeArgs['achievements'] as List<String>)
                                      .join('\n'),
                                  width,
                                  height,
                                ),
                                // ].padded(
                                //   padding: EdgeInsets.only(
                                //       left: width * 0.1, right: height * 0.03),
                                // ),
                                const SizedBox(
                                  height: 15,
                                ),
                                ..._generateUrlPreviewWidgets(
                                  (routeArgs['resources'] as List<String>),
                                ),
                                const SizedBox(height: 50),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: kBottomNavigationBarHeight + 50),
            ],
          ),
          Positioned(
            left: 0,
            top: height * 0.025,
            child: Container(
              margin: EdgeInsets.only(
                left: 20,
                top: height * 0.025,
                // bottom: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.7),
                    offset: const Offset(0, 2),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.network(
                  routeArgs['imageUrl'] as String,
                  height: height * 0.22,
                  width: height * 0.22,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
