import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/events/widgets/single_event_widget.dart';
import 'package:tedx_dtu_app/global/widgets/tedx_loading_spinner.dart';
import 'package:intl/intl.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);
  static const routeName = '/test';

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  // String time=DateFormat('kk:mm,dd-mm-yyyy').format(eventTime);

  var data = [
    {
      "current_speaker_index": 1,
      "dateTime": "2021-11-19T01:18:02Z",
      "eventType": "upcoming",
      "galleryImageUrls": [
        "http://dummyimage.com/179x100.png/dddddd/000000",
        "http://dummyimage.com/222x100.png/dddddd/000000",
        "http://dummyimage.com/210x100.png/ff4444/ffffff",
        "http://dummyimage.com/220x100.png/dddddd/000000",
        "http://dummyimage.com/153x100.png/cc0000/ffffff"
      ],
      "requiresTicket": true,
      "themeDetails": {
        "title": "Perestroika",
        "details": "Rabies",
        "imageUrl": "http://dummyimage.com/106x100.png/dddddd/000000"
      },
      "venue": "Kalimati",
      "streamingUrl": "https://reuters.com/proin/at/turpis/a/pede/posuere.aspx",
      "speakers_list": [
        {
          "name": "Billi Edling",
          "imageUrl": "http://dummyimage.com/173x100.png/ff4444/ffffff",
          "bio": "Separation of muscle (nontraumatic), upper arm",
          "topic":
              "vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id",
          "achievements": [
            "Open bite of unsp great toe without damage to nail, sequela",
            "Unsp fracture of shaft of unsp tibia, init for clos fx",
            "Occup of 3-whl mv injured in clsn w 2/3-whl mv nontraf, init"
          ],
          "resources": [
            "http://last.fm/volutpat/sapien/arcu.html",
            "http://issuu.com/in/leo/maecenas/pulvinar/lobortis/est/phasellus.aspx",
            "https://rakuten.co.jp/rhoncus/dui/vel/sem/sed/sagittis/nam.jsp"
          ]
        },
        {
          "name": "Effie Demke",
          "imageUrl": "http://dummyimage.com/200x100.png/ff4444/ffffff",
          "bio": "Unspecified focal chorioretinal inflammation",
          "topic":
              "cras mi pede malesuada in imperdiet et commodo vulputate justo in",
          "achievements": [
            "Unspecified open wound of left buttock, subsequent encounter",
            "Hodgkin lymphoma, unsp, lymph nodes of head, face, and neck",
            "Inj unsp musc/fasc/tend at shldr/up arm, left arm, init"
          ],
          "resources": [
            "http://weebly.com/habitasse/platea.png",
            "http://networksolutions.com/convallis/eget/eleifend/luctus.html",
            "https://desdev.cn/sit/amet/eros/suspendisse/accumsan/tortor/quis.xml"
          ]
        },
        {
          "name": "Flori Ebsworth",
          "imageUrl": "http://dummyimage.com/175x100.png/dddddd/000000",
          "bio":
              "Laceration of deep palmar arch of left hand, subsequent encounter",
          "topic":
              "pretium iaculis diam erat fermentum justo nec condimentum neque sapien",
          "achievements": [
            "Dvtrcli of both small and lg int w perf and abscs w/o bleed",
            "Contusion of unspecified upper arm, sequela",
            "Chronic gout due to renal impairment, unsp ankle and foot"
          ],
          "resources": [
            "http://disqus.com/ipsum/primis/in/faucibus/orci/luctus.js",
            "http://fotki.com/et/commodo/vulputate/justo/in/blandit/ultrices.html",
            "http://github.com/turpis/elementum/ligula/vehicula/consequat/morbi.html"
          ]
        },
        {
          "name": "Betsy Brownlow",
          "imageUrl": "http://dummyimage.com/104x100.png/dddddd/000000",
          "bio":
              "Displaced intraarticular fracture of left calcaneus, initial encounter for open fracture",
          "topic":
              "luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse",
          "achievements": [
            "Corros unsp degree of unsp mult fngr (nail), inc thumb, init",
            "Oth disrd of amniotic fluid and membrns, third tri, oth",
            "Strain of musc/fasc/tend at forearm level, right arm"
          ],
          "resources": [
            "https://wikimedia.org/tellus/nulla/ut.json",
            "https://acquirethisname.com/cum/sociis/natoque/penatibus/et.jsp",
            "https://issuu.com/nulla.jsp"
          ]
        }
      ]
    },
    {
      "current_speaker_index": 2,
      "dateTime": "2021-09-13T02:59:37Z",
      "eventType": "story",
      "galleryImageUrls": [
        "http://dummyimage.com/196x100.png/5fa2dd/ffffff",
        "http://dummyimage.com/203x100.png/dddddd/000000",
        "http://dummyimage.com/146x100.png/dddddd/000000",
        "http://dummyimage.com/119x100.png/5fa2dd/ffffff",
        "http://dummyimage.com/213x100.png/dddddd/000000"
      ],
      "requiresTicket": false,
      "themeDetails": {
        "title": "They Gave Him A Gun",
        "details": "Toxic effect of copper and its compounds, accidental, init",
        "imageUrl": "http://dummyimage.com/222x100.png/5fa2dd/ffffff"
      },
      "venue": "Rumat Heib",
      "streamingUrl":
          "http://wunderground.com/augue/quam/sollicitudin/vitae/consectetuer/eget/rutrum.aspx",
      "speakers_list": [
        {
          "name": "Tod Ivashin",
          "imageUrl": "http://dummyimage.com/173x100.png/5fa2dd/ffffff",
          "bio":
              "Other fracture of shaft of radius, right arm, initial encounter for open fracture type I or II",
          "topic":
              "erat volutpat in congue etiam justo etiam pretium iaculis justo in hac",
          "achievements": [
            "Lac w fb of r bk wl of thorax w/o penet thor cavity, subs",
            "Unspecified open wound of thumb with damage to nail",
            "Undrdose of pertussis vaccine, inc combin w pertuss, init"
          ],
          "resources": [
            "https://upenn.edu/curabitur/gravida/nisi/at/nibh.xml",
            "http://google.co.jp/mi/nulla.html",
            "https://princeton.edu/donec.jpg"
          ]
        },
        {
          "name": "Shepard Sellek",
          "imageUrl": "http://dummyimage.com/185x100.png/cc0000/ffffff",
          "bio":
              "Brown-Sequard syndrome at T11-T12 level of thoracic spinal cord",
          "topic":
              "sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci",
          "achievements": [
            "Presence of other cardiac implants and grafts",
            "Fracture oth prt scapula, right shoulder, init for opn fx",
            "Salter-Harris Type I physeal fracture of r calcaneus, 7thK"
          ],
          "resources": [
            "https://privacy.gov.au/aliquam/sit/amet/diam/in/magna/bibendum.aspx",
            "https://nyu.edu/ligula/pellentesque/ultrices/phasellus.xml",
            "http://bigcartel.com/lacinia/nisi/venenatis/tristique/fusce/congue.jpg"
          ]
        },
        {
          "name": "Jori Durno",
          "imageUrl": "http://dummyimage.com/194x100.png/cc0000/ffffff",
          "bio": "Furuncle of abdominal wall",
          "topic":
              "vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl",
          "achievements": [
            "Other superficial bite of unspecified forearm, init encntr",
            "Nondisp commnt fx shaft of rad, unsp arm, 7thH",
            "Contact with nail gun"
          ],
          "resources": [
            "https://networksolutions.com/vulputate/nonummy.aspx",
            "http://amazon.com/cras/in.jpg",
            "http://tamu.edu/pede/posuere/nonummy.jpg"
          ]
        },
        {
          "name": "Rafaela Franz",
          "imageUrl": "http://dummyimage.com/151x100.png/ff4444/ffffff",
          "bio":
              "Bucket-handle tear of lateral meniscus, current injury, left knee",
          "topic":
              "rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam",
          "achievements": [
            "Legal intervnt w firearm disch, suspect injured, init",
            "Sltr-haris Type III physeal fx unspecified calcaneus, 7thP",
            "Traum hemor cereb, w LOC of 6 hours to 24 hours, subs"
          ],
          "resources": [
            "http://theglobeandmail.com/eget/rutrum.jsp",
            "http://yelp.com/sit/amet/consectetuer/adipiscing/elit.js",
            "https://usda.gov/pede/ullamcorper.aspx"
          ]
        },
        {
          "name": "Fenelia Di Ruggiero",
          "imageUrl": "http://dummyimage.com/160x100.png/ff4444/ffffff",
          "bio":
              "Toxic effect of other insecticides, accidental (unintentional)",
          "topic":
              "vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae",
          "achievements": [
            "Congenital vertical talus deformity, left foot",
            "Boat as the place of occurrence of the external cause",
            "Unsp mtrcy rider injured in clsn w nonmtr vehicle in traf"
          ],
          "resources": [
            "http://xing.com/in/leo/maecenas/pulvinar/lobortis/est/phasellus.xml",
            "http://harvard.edu/nulla/tempus/vivamus/in/felis.html",
            "http://cnet.com/aliquet/ultrices/erat.html"
          ]
        }
      ]
    },
    {
      "current_speaker_index": 3,
      "dateTime": "2022-01-13T20:48:51Z",
      "eventType": "past",
      "galleryImageUrls": [
        "http://dummyimage.com/196x100.png/5fa2dd/ffffff",
        "http://dummyimage.com/220x100.png/5fa2dd/ffffff",
        "http://dummyimage.com/201x100.png/ff4444/ffffff",
        "http://dummyimage.com/140x100.png/5fa2dd/ffffff",
        "http://dummyimage.com/113x100.png/5fa2dd/ffffff"
      ],
      "requiresTicket": true,
      "themeDetails": {
        "title": "Man Who Cried, The",
        "details":
            "Burn of first degree of unspecified ankle, initial encounter",
        "imageUrl": "http://dummyimage.com/129x100.png/5fa2dd/ffffff"
      },
      "venue": "Seso",
      "streamingUrl": "http://list-manage.com/integer/pede.png",
      "speakers_list": [
        {
          "name": "Wilow Test",
          "imageUrl": "http://dummyimage.com/192x100.png/5fa2dd/ffffff",
          "bio":
              "Unspecified fracture of unspecified lower leg, initial encounter for open fracture type I or II",
          "topic":
              "fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet",
          "achievements": [
            "Fistula, right ankle",
            "Injury of musculocutaneous nerve, unsp arm, subs encntr",
            "Nondisp fx of lateral condyle of unsp humer, 7thG"
          ],
          "resources": [
            "https://sohu.com/ac.json",
            "https://boston.com/sit/amet/diam/in/magna/bibendum/imperdiet.json",
            "https://networksolutions.com/porttitor/lacus/at.js"
          ]
        },
        {
          "name": "Bren Belchamp",
          "imageUrl": "http://dummyimage.com/155x100.png/5fa2dd/ffffff",
          "bio":
              "Pre-existing hypertensive heart disease complicating the puerperium",
          "topic":
              "elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non",
          "achievements": [
            "Drown due to fall off (nonpowered) inflatable craft",
            "Major laceration of right pulmonary blood vessels, sequela",
            "Adverse effect of mixed bact vaccines w/o a pertuss, subs"
          ],
          "resources": [
            "http://slate.com/in/eleifend/quam/a/odio/in/hac.aspx",
            "https://youtu.be/felis/sed/lacus/morbi/sem/mauris/laoreet.aspx",
            "http://wired.com/ut.jsp"
          ]
        },
        {
          "name": "Tris Slay",
          "imageUrl": "http://dummyimage.com/116x100.png/cc0000/ffffff",
          "bio":
              "Contusion of left lesser toe(s) without damage to nail, initial encounter",
          "topic":
              "donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit",
          "achievements": [
            "Intentional self-harm by drown in natural water, init",
            "Disp fx of less trochanter of l femr, 7thB",
            "External constriction of part of throat, initial encounter"
          ],
          "resources": [
            "http://freewebs.com/adipiscing/elit/proin/risus/praesent/lectus.xml",
            "http://imageshack.us/nunc/proin/at/turpis/a.jpg",
            "https://dot.gov/rhoncus/aliquet/pulvinar/sed/nisl/nunc.html"
          ]
        }
      ]
    },
    {
      "current_speaker_index": 4,
      "dateTime": "2021-12-04T04:19:46Z",
      "eventType": "upcoming",
      "galleryImageUrls": [
        "http://dummyimage.com/167x100.png/dddddd/000000",
        "http://dummyimage.com/224x100.png/5fa2dd/ffffff",
        "http://dummyimage.com/232x100.png/ff4444/ffffff",
        "http://dummyimage.com/130x100.png/cc0000/ffffff",
        "http://dummyimage.com/214x100.png/cc0000/ffffff"
      ],
      "requiresTicket": true,
      "themeDetails": {
        "title": "White Material",
        "details": "Other superficial bite of unspecified thumb",
        "imageUrl": "http://dummyimage.com/171x100.png/ff4444/ffffff"
      },
      "venue": "Banjar Dharmasemedi",
      "streamingUrl": "https://ebay.com/facilisi/cras/non/velit/nec/nisi.jsp",
      "speakers_list": [
        {
          "name": "Caesar Barley",
          "imageUrl": "http://dummyimage.com/214x100.png/5fa2dd/ffffff",
          "bio":
              "Brown-Sequard syndrome at C8 level of cervical spinal cord, sequela",
          "topic":
              "ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus at diam nam tristique tortor",
          "achievements": [
            "Other specified injuries of right lower leg, init encntr",
            "Sudden visual loss, left eye",
            "Unspecified injury of unspecified part of colon, subs encntr"
          ],
          "resources": [
            "https://whitehouse.gov/in/est.jpg",
            "https://amazonaws.com/primis/in/faucibus/orci.html",
            "https://vkontakte.ru/sapien/cursus.html"
          ]
        },
        {
          "name": "Stoddard Simonsson",
          "imageUrl": "http://dummyimage.com/238x100.png/dddddd/000000",
          "bio":
              "Fracture of unspecified phalanx of right index finger, subsequent encounter for fracture with routine healing",
          "topic":
              "ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut",
          "achievements": [
            "Cntct w oth power power hand tools and household mach, sqla",
            "Unsp fx shaft of r rad, 7thF",
            "Other urogenital candidiasis"
          ],
          "resources": [
            "http://hostgator.com/dolor/morbi.jpg",
            "http://slideshare.net/vel/est.json",
            "https://cafepress.com/in/lectus/pellentesque/at/nulla.xml"
          ]
        },
        {
          "name": "Brenn Koenraad",
          "imageUrl": "http://dummyimage.com/243x100.png/5fa2dd/ffffff",
          "bio":
              "Nondisplaced fracture of medial condyle of right tibia, subsequent encounter for closed fracture with routine healing",
          "topic":
              "nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede",
          "achievements": [
            "Mech compl of esophageal anti-reflux device, sequela",
            "16 weeks gestation of pregnancy",
            "Unsp superfic inj unsp external genital organs, male, init"
          ],
          "resources": [
            "http://studiopress.com/curae/mauris/viverra/diam.jsp",
            "https://digg.com/molestie/hendrerit/at/vulputate/vitae.xml",
            "http://desdev.cn/morbi/ut/odio/cras/mi/pede.jsp"
          ]
        },
        {
          "name": "Shoshanna Trail",
          "imageUrl": "http://dummyimage.com/114x100.png/cc0000/ffffff",
          "bio":
              "Nontraumatic subarachnoid hemorrhage from left posterior communicating artery",
          "topic":
              "varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget",
          "achievements": [
            "Disp fx of olecran pro w/o intartic extn right ulna, init",
            "Passenger of military vehicle injured in traf, sequela",
            "Injury of digital nerve of left little finger, init encntr"
          ],
          "resources": [
            "https://livejournal.com/lobortis/est/phasellus/sit/amet.html",
            "https://ucsd.edu/lobortis.aspx",
            "http://networksolutions.com/vitae/nisl/aenean.aspx"
          ]
        },
        {
          "name": "Beckie Danielli",
          "imageUrl": "http://dummyimage.com/228x100.png/cc0000/ffffff",
          "bio":
              "Contusion of other urinary and pelvic organ, subsequent encounter",
          "topic":
              "aliquam non mauris morbi non lectus aliquam sit amet diam in",
          "achievements": [
            "Disp fx of med condyle of r femr, 7thE",
            "Unsp mtrcy rider inj in clsn w nonmtr vehicle in traf, init",
            "Effect of heat and light, unspecified, subsequent encounter"
          ],
          "resources": [
            "https://friendfeed.com/nunc/proin/at/turpis/a/pede.aspx",
            "https://issuu.com/vitae/nisi/nam/ultrices/libero/non.jsp",
            "https://typepad.com/id/ligula/suspendisse/ornare/consequat/lectus.png"
          ]
        }
      ]
    },
    {
      "current_speaker_index": 5,
      "dateTime": "2021-05-12T18:48:27Z",
      "eventType": "live",
      "galleryImageUrls": [
        "http://dummyimage.com/115x100.png/cc0000/ffffff",
        "http://dummyimage.com/102x100.png/cc0000/ffffff",
        "http://dummyimage.com/125x100.png/cc0000/ffffff",
        "http://dummyimage.com/226x100.png/5fa2dd/ffffff",
        "http://dummyimage.com/223x100.png/5fa2dd/ffffff"
      ],
      "requiresTicket": true,
      "themeDetails": {
        "title": "Body Snatcher, The",
        "details": "Foreign body granuloma of soft tissue, NEC, unsp lower leg",
        "imageUrl": "http://dummyimage.com/183x100.png/ff4444/ffffff"
      },
      "venue": "Sélibabi",
      "streamingUrl": "http://tamu.edu/lacus.aspx",
      "speakers_list": [
        {
          "name": "Francyne Fielder",
          "imageUrl": "http://dummyimage.com/171x100.png/5fa2dd/ffffff",
          "bio":
              "Salter-Harris Type II physeal fracture of lower end of humerus, unspecified arm, subsequent encounter for fracture with delayed healing",
          "topic":
              "consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis",
          "achievements": [
            "Restlessness and agitation",
            "Benign neoplasm of vertebral column",
            "Reiter's disease, left elbow"
          ],
          "resources": [
            "http://tinyurl.com/elementum/in/hac/habitasse/platea/dictumst.png",
            "https://blogs.com/nulla/nisl/nunc/nisl/duis.aspx",
            "http://ed.gov/lobortis/sapien/sapien.html"
          ]
        },
        {
          "name": "Michael Kausche",
          "imageUrl": "http://dummyimage.com/122x100.png/cc0000/ffffff",
          "bio":
              "Galeazzi's fracture of left radius, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with delayed healing",
          "topic":
              "sapien placerat ante nulla justo aliquam quis turpis eget elit sodales",
          "achievements": [
            "Lgl intervnt w unsp firearm disch, law enforc offl inj, subs",
            "Displacement of cystostomy catheter",
            "Cysts of left eye, unspecified eyelid"
          ],
          "resources": [
            "https://cocolog-nifty.com/phasellus/sit/amet.html",
            "http://php.net/molestie/lorem/quisque.aspx",
            "http://furl.net/tincidunt/eget/tempus.jpg"
          ]
        },
        {
          "name": "Carr Stiegers",
          "imageUrl": "http://dummyimage.com/154x100.png/dddddd/000000",
          "bio": "Displaced comminuted fracture of shaft of left tibia",
          "topic":
              "proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices",
          "achievements": [
            "Pedl cyc pasngr inj in clsn w nonmtr vehicle nontraf, init",
            "Human metapneumovirus as the cause of diseases classd elswhr",
            "Occ of rail trn/veh inj in clsn w mtr veh nontraf, sequela"
          ],
          "resources": [
            "http://spiegel.de/elementum/pellentesque/quisque/porta.js",
            "https://google.ca/neque.png",
            "http://imgur.com/felis/sed/interdum.jpg"
          ]
        }
      ]
    },
    {
      "current_speaker_index": 6,
      "dateTime": "2021-02-24T08:34:03Z",
      "eventType": "upcoming",
      "galleryImageUrls": [
        "http://dummyimage.com/140x100.png/cc0000/ffffff",
        "http://dummyimage.com/238x100.png/ff4444/ffffff",
        "http://dummyimage.com/138x100.png/5fa2dd/ffffff",
        "http://dummyimage.com/223x100.png/5fa2dd/ffffff",
        "http://dummyimage.com/124x100.png/dddddd/000000"
      ],
      "requiresTicket": true,
      "themeDetails": {
        "title": "Little Romance, A",
        "details": "Traumatic arthropathy, unspecified ankle and foot",
        "imageUrl": "http://dummyimage.com/210x100.png/dddddd/000000"
      },
      "venue": "Estribeiro",
      "streamingUrl": "https://netvibes.com/eget.png",
      "speakers_list": [
        {
          "name": "Mab Devinn",
          "imageUrl": "http://dummyimage.com/179x100.png/dddddd/000000",
          "bio": "Other obstructive defects of renal pelvis and ureter",
          "topic":
              "odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis",
          "achievements": [
            "Laceration without foreign body of left breast, subs encntr",
            "Suprvsn of pregnancy w grand multiparity, third trimester",
            "Disp fx of posterior process of left talus, init for clos fx"
          ],
          "resources": [
            "http://google.es/amet/consectetuer/adipiscing/elit/proin.png",
            "https://wunderground.com/metus/sapien/ut/nunc/vestibulum/ante/ipsum.xml",
            "http://wisc.edu/duis/consequat/dui/nec.html"
          ]
        },
        {
          "name": "Liesa Eayres",
          "imageUrl": "http://dummyimage.com/123x100.png/5fa2dd/ffffff",
          "bio": "Corrosion of unspecified degree of right thigh",
          "topic":
              "fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue",
          "achievements": [
            "Chronic viral hepatitis",
            "Nondisp commnt fx unsp patella, 7thR",
            "Spontaneous rupture of flexor tendons, right lower leg"
          ],
          "resources": [
            "https://thetimes.co.uk/ullamcorper.jpg",
            "https://nytimes.com/sodales/sed/tincidunt/eu/felis/fusce.json",
            "http://skyrock.com/ut/massa/quis/augue/luctus/tincidunt/nulla.html"
          ]
        },
        {
          "name": "Maegan Marriott",
          "imageUrl": "http://dummyimage.com/126x100.png/dddddd/000000",
          "bio":
              "Person on outside of pick-up truck or van injured in collision with other nonmotor vehicle in traffic accident, initial encounter",
          "topic":
              "viverra eget congue eget semper rutrum nulla nunc purus phasellus in",
          "achievements": [
            "Person on outside of sp off-rd mv injured in traf",
            "Oth extrartic fx low end l rad, 7thE",
            "Corrosion of unsp eye and adnexa, part unsp, init encntr"
          ],
          "resources": [
            "https://canalblog.com/non/quam/nec/dui/luctus.html",
            "http://squidoo.com/a/ipsum/integer/a/nibh/in/quis.xml",
            "http://linkedin.com/ac/enim/in.jsp"
          ]
        }
      ]
    },
    {
      "current_speaker_index": 7,
      "dateTime": "2021-11-08T22:33:51Z",
      "eventType": "story",
      "galleryImageUrls": [
        "http://dummyimage.com/163x100.png/ff4444/ffffff",
        "http://dummyimage.com/171x100.png/cc0000/ffffff",
        "http://dummyimage.com/216x100.png/5fa2dd/ffffff",
        "http://dummyimage.com/146x100.png/cc0000/ffffff",
        "http://dummyimage.com/228x100.png/dddddd/000000"
      ],
      "requiresTicket": false,
      "themeDetails": {
        "title": "Power",
        "details": "Breakdown (mechanical) of heart valve prosthesis, subs",
        "imageUrl": "http://dummyimage.com/221x100.png/ff4444/ffffff"
      },
      "venue": "Bonoua",
      "streamingUrl": "https://opensource.org/imperdiet.html",
      "speakers_list": [
        {
          "name": "Jarvis Allicock",
          "imageUrl": "http://dummyimage.com/193x100.png/5fa2dd/ffffff",
          "bio": "Major contusion of left kidney",
          "topic":
              "nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede",
          "achievements": [
            "Hit by falling object due to accident to canoe or kayak",
            "Unsp injury of heart with hemopericardium, subs encntr",
            "Corrosion of first degree of right ankle"
          ],
          "resources": [
            "https://elpais.com/platea/dictumst/morbi/vestibulum/velit/id/pretium.aspx",
            "https://disqus.com/congue/vivamus/metus/arcu/adipiscing.aspx",
            "https://salon.com/in/sapien/iaculis.xml"
          ]
        },
        {
          "name": "Izzy Bonsall",
          "imageUrl": "http://dummyimage.com/104x100.png/5fa2dd/ffffff",
          "bio": "Choroidal degeneration",
          "topic":
              "sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus",
          "achievements": [
            "Mech compl of surgically created AV shunt, sequela",
            "Breakdown (mechanical) of breast prosthesis and implant",
            "Unsp soft tissue disord related to use/pressure, left thigh"
          ],
          "resources": [
            "http://mtv.com/luctus/et/ultrices/posuere/cubilia/curae/nulla.png",
            "https://microsoft.com/ultrices/libero/non/mattis.js",
            "https://mail.ru/erat/id/mauris.png"
          ]
        },
        {
          "name": "Vinny Lossman",
          "imageUrl": "http://dummyimage.com/189x100.png/5fa2dd/ffffff",
          "bio": "Struck by turtle, subsequent encounter",
          "topic":
              "est phasellus sit amet erat nulla tempus vivamus in felis eu sapien",
          "achievements": [
            "Maternal care for oth isoimmun, first trimester, fetus 1",
            "Chronic apical periodontitis",
            "Displ transverse fx shaft of l fibula, 7thE"
          ],
          "resources": [
            "https://blogs.com/semper/est/quam/pharetra/magna/ac.json",
            "http://baidu.com/elementum/eu/interdum/eu/tincidunt/in.jpg",
            "http://csmonitor.com/eget/nunc.html"
          ]
        }
      ]
    },
    {
      "current_speaker_index": 8,
      "dateTime": "2021-10-08T07:25:17Z",
      "eventType": "live",
      "galleryImageUrls": [
        "http://dummyimage.com/191x100.png/cc0000/ffffff",
        "http://dummyimage.com/122x100.png/cc0000/ffffff",
        "http://dummyimage.com/139x100.png/cc0000/ffffff",
        "http://dummyimage.com/196x100.png/ff4444/ffffff",
        "http://dummyimage.com/180x100.png/cc0000/ffffff"
      ],
      "requiresTicket": false,
      "themeDetails": {
        "title": "Slim Carter",
        "details": "Disseminated superficial actinic porokeratosis (DSAP)",
        "imageUrl": "http://dummyimage.com/119x100.png/5fa2dd/ffffff"
      },
      "venue": "Mentougou",
      "streamingUrl": "http://toplist.cz/curae/nulla/dapibus.aspx",
      "speakers_list": [
        {
          "name": "Joana Dulinty",
          "imageUrl": "http://dummyimage.com/144x100.png/dddddd/000000",
          "bio": "Unspecified superficial injury of left ankle",
          "topic":
              "diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci",
          "achievements": [
            "Maternal care for prolapse of gravid uterus",
            "Giant cell arteritis with polymyalgia rheumatica",
            "Granuloma of right lacrimal passage"
          ],
          "resources": [
            "https://netvibes.com/et/ultrices/posuere/cubilia/curae.aspx",
            "http://cbslocal.com/nec/euismod/scelerisque/quam.aspx",
            "https://miitbeian.gov.cn/pede/justo.xml"
          ]
        },
        {
          "name": "Nate Vasquez",
          "imageUrl": "http://dummyimage.com/123x100.png/cc0000/ffffff",
          "bio": "Other chondrocalcinosis, left hand",
          "topic":
              "maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus",
          "achievements": [
            "Chronic venous htn w ulcer and inflammation of r low extrem",
            "Nondisp subtrochnt fx unsp femr, 7thQ",
            "Pressure ulcer of right ankle, stage 3"
          ],
          "resources": [
            "https://ted.com/venenatis/non/sodales/sed.jsp",
            "http://wired.com/auctor/sed/tristique/in/tempus/sit/amet.html",
            "https://last.fm/ut/dolor/morbi/vel/lectus/in/quam.js"
          ]
        },
        {
          "name": "Garrott Beckingham",
          "imageUrl": "http://dummyimage.com/156x100.png/cc0000/ffffff",
          "bio": "Displaced midcervical fracture of right femur",
          "topic":
              "elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum",
          "achievements": [
            "Oth spon disruption of lateral collat ligament of right knee",
            "Corrosions of other internal organs, initial encounter",
            "Subluxation of proximal interphaln joint of r little finger"
          ],
          "resources": [
            "https://is.gd/dui/nec/nisi/volutpat/eleifend/donec/ut.png",
            "http://mysql.com/odio/in.json",
            "http://virginia.edu/non/ligula.xml"
          ]
        },
        {
          "name": "Moses Pecey",
          "imageUrl": "http://dummyimage.com/221x100.png/cc0000/ffffff",
          "bio":
              "Burn of unspecified degree of nose (septum), subsequent encounter",
          "topic":
              "est phasellus sit amet erat nulla tempus vivamus in felis eu",
          "achievements": [
            "Iridoschisis, bilateral",
            "Vitreous membranes and strands",
            "Benzodiazepines"
          ],
          "resources": [
            "http://twitter.com/varius/ut/blandit/non.json",
            "https://simplemachines.org/interdum/mauris/ullamcorper.js",
            "https://de.vu/non/interdum/in.xml"
          ]
        },
        {
          "name": "Barret Trounce",
          "imageUrl": "http://dummyimage.com/109x100.png/5fa2dd/ffffff",
          "bio":
              "Intraventricular (nontraumatic) hemorrhage, grade 2, of newborn",
          "topic":
              "vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis",
          "achievements": [
            "Puncture wound w foreign body of unsp upper arm, subs encntr",
            "Laceration of unsp msl/tnd at ank/ft level, unsp foot, init",
            "Open restoration margins of tooth"
          ],
          "resources": [
            "http://hexun.com/in/eleifend/quam.xml",
            "https://eventbrite.com/elit/proin/risus/praesent/lectus.jpg",
            "http://yahoo.com/tempus/vel/pede/morbi/porttitor/lorem.jsp"
          ]
        }
      ]
    },
    {
      "current_speaker_index": 9,
      "dateTime": "2021-10-20T03:24:45Z",
      "eventType": "story",
      "requiresTicket": false,
      "themeDetails": {
        "title": "Sea of Grass, The",
        "details":
            "Adhes due to fb acc left in body following heart cath, subs",
        "imageUrl": "http://dummyimage.com/168x100.png/5fa2dd/ffffff"
      },
      "venue": "Xinzhuang",
      "streamingUrl":
          "http://usda.gov/faucibus/orci/luctus/et/ultrices/posuere.jsp",
      "speakers_list": [
        {
          "name": "Kale Farriar",
          "imageUrl": "http://dummyimage.com/145x100.png/cc0000/ffffff",
          "bio":
              "Other physeal fracture of lower end of radius, right arm, subsequent encounter for fracture with malunion",
          "topic":
              "at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem",
          "achievements": [
            "Unsp inj musc/tend the rotator cuff of l shoulder, sequela",
            "Full-term prem ROM, onset labor within 24 hours of rupture",
            "Partial loss of teeth due to other specified cause, class I"
          ],
          "resources": [
            "https://smh.com.au/et/magnis/dis/parturient/montes/nascetur.jpg",
            "https://netlog.com/posuere/cubilia/curae/donec/pharetra.xml",
            "https://purevolume.com/est.xml"
          ]
        },
        {
          "name": "Elisha Gautrey",
          "imageUrl": "http://dummyimage.com/176x100.png/cc0000/ffffff",
          "bio": "Simultaneous visual perception without fusion",
          "topic":
              "sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum",
          "achievements": [
            "Oth nondisp fx of 2nd cervcal vert, subs for fx w routn heal",
            "Unspecified juvenile rheumatoid arthritis, unspecified hand",
            "Collapsed vert, NEC, sacr/sacrocygl rgn, 7thG"
          ],
          "resources": [
            "http://ted.com/in/sagittis/dui/vel/nisl/duis.xml",
            "http://pcworld.com/convallis/nulla/neque/libero/convallis/eget.png",
            "https://freewebs.com/amet.html"
          ]
        },
        {
          "name": "Austin Duffil",
          "imageUrl": "http://dummyimage.com/203x100.png/ff4444/ffffff",
          "bio":
              "Injury of unspecified nerve at ankle and foot level, left leg, sequela",
          "topic":
              "iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id",
          "achievements": [
            "Other specified bursopathies, left knee",
            "Other spondylosis, occipito-atlanto-axial region",
            "Chronic venous htn w ulcer and inflammation of l low extrem"
          ],
          "resources": [
            "https://narod.ru/felis/eu/sapien/cursus/vestibulum/proin.xml",
            "https://mac.com/semper/porta/volutpat/quam/pede/lobortis.json",
            "https://mac.com/amet/cursus/id.xml"
          ]
        }
      ]
    },
    {
      "current_speaker_index": 10,
      "dateTime": "2021-08-29T06:06:39Z",
      "eventType": "live",
      "galleryImageUrls": [
        "http://dummyimage.com/212x100.png/dddddd/000000",
        "http://dummyimage.com/162x100.png/dddddd/000000",
        "http://dummyimage.com/158x100.png/5fa2dd/ffffff",
        "http://dummyimage.com/201x100.png/5fa2dd/ffffff",
        "http://dummyimage.com/221x100.png/ff4444/ffffff"
      ],
      "requiresTicket": true,
      "themeDetails": {
        "title": "Fantastic Planet, The (Planète sauvage, La)",
        "details": "Other sprain of left elbow",
        "imageUrl": "http://dummyimage.com/116x100.png/5fa2dd/ffffff"
      },
      "venue": "Taikang",
      "streamingUrl":
          "https://columbia.edu/leo/odio/condimentum/id/luctus/nec/molestie.png",
      "speakers_list": [
        {
          "name": "Ingunna Littlewood",
          "imageUrl": "http://dummyimage.com/121x100.png/5fa2dd/ffffff",
          "bio":
              "Laceration of flexor muscle, fascia and tendon of right thumb at forearm level, subsequent encounter",
          "topic":
              "id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi",
          "achievements": [
            "Legal intervnt w injury by rubr bulet, bystand injured",
            "Unsp inj long flxr musc/fasc/tend r thm at wrs/hnd lv, init",
            "Subluxation of MCP joint of right index finger, subs"
          ],
          "resources": [
            "http://columbia.edu/dui/luctus/rutrum.json",
            "https://hp.com/in/felis.jsp",
            "https://ft.com/luctus.jsp"
          ]
        },
        {
          "name": "Janela Siemantel",
          "imageUrl": "http://dummyimage.com/192x100.png/dddddd/000000",
          "bio":
              "Unspecified fracture of shaft of right fibula, subsequent encounter for open fracture type I or II with delayed healing",
          "topic":
              "dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras",
          "achievements": [
            "Laceration of bladder, subsequent encounter",
            "Malignant neoplasm of branchial cleft",
            "Bent bone of right radius, subs for clos fx w routn heal"
          ],
          "resources": [
            "http://cbsnews.com/dis.js",
            "http://oaic.gov.au/pede.aspx",
            "https://edublogs.org/id/luctus/nec.jpg"
          ]
        },
        {
          "name": "Blondy Abrahams",
          "imageUrl": "http://dummyimage.com/102x100.png/ff4444/ffffff",
          "bio":
              "Poisoning by, adverse effect of and underdosing of antithyroid drugs",
          "topic": "non quam nec dui luctus rutrum nulla tellus in sagittis",
          "achievements": [
            "Laceration with foreign body of vagina and vulva, sequela",
            "Contus/lac cereb, w LOC w death d/t brain inj bf consc, init",
            "Sublux of MC (bone), proximal end of right hand, subs"
          ],
          "resources": [
            "http://tripadvisor.com/pede/libero/quis.html",
            "http://dion.ne.jp/dolor.js",
            "https://umich.edu/semper/interdum/mauris.xml"
          ]
        }
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //     body: StreamBuilder(
    //   stream: FirebaseFirestore.instance.collection('events').snapshots(),
    //   builder: (ctx,
    //       AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> eventsSnapshot) {
    //     if (eventsSnapshot.connectionState == ConnectionState.waiting) {
    //       return const Center(child: CircularProgressIndicator());
    //     }
    //     final eventsData = eventsSnapshot.data!.docs;
    //     return ListView.builder(
    //       itemBuilder: (ctx, index) {
    //         return Text(
    //           eventsData[index].data()['dateTime'].runtimeType.toString(),
    //           style: TextStyle(
    //             color: Colors.white,
    //           ),
    //         );
    //       },
    //       itemCount: eventsData.length,
    //     );
    //   },
    // ));
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('push dummy data'),
          onPressed: () {
            for (var dataPoint in data) {
              FirebaseFirestore.instance.collection('events').add(dataPoint);
            }
          },
        ),
      ),
    );
  }
}
