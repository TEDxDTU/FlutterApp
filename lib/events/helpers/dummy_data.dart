import 'package:tedx_dtu_app/events/models/event.dart';

List<UpcomingEvent> upcomingEvents = [
  UpcomingEvent(
    title: 'Ikigai',
    description: 'The Japanese secret to a long and happy life',
    imageUrl:
        'https://imageio.forbes.com/blogs-images/chrismyers/files/2018/02/ikigai-1.png?format=png&width=1200&fit=bounds',
    venue: 'OAT, DTU',
    date: DateTime(2022, 1, 1, 12, 0, 0),
    id: '1',
    price: 300,
  ),
  //Dummy list of upcoming events
  UpcomingEvent(
    title: 'Entrepreneurship',
    description: 'The best way to start your own business',
    imageUrl:
        'https://cdn.shopify.com/s/files/1/0070/7032/files/what-is-an-entrepreneur.png?format=jpg&quality=90&v=1615334422&width=1024',
    venue: 'BR Ambedkar Auditorium, DTU',
    date: DateTime(2022, 2, 3, 11, 20, 0),
    id: '2',
    price: 400,
  ),
  UpcomingEvent(
    title: 'AI',
    description: 'Artifical Intelligence',
    imageUrl:
        'https://img.etimg.com/thumb/msid-80075391,width-1200,height-900,imgsize-262056,resizemode-8,quality-100/tech/information-tech/you-i-ai-how-artificial-intelligence-touches-almost-every-aspect-of-our-lives.jpg',
    venue: 'BR Ambedkar Auditorium, DTU',
    date: DateTime(2022, 2, 4, 11, 20, 0),
    id: '3',
    price: 400,
  ),
  UpcomingEvent(
    title: 'Blockchain',
    description: 'Publicly available,secure data',
    imageUrl:
        'https://cdn.builtin.com/sites/www.builtin.com/files/styles/blog_medium/public/blockchain-companies.jpg',
    venue: 'BR Ambedkar Auditorium, DTU',
    date: DateTime(2022, 2, 5, 11, 20, 0),
    id: '4',
    price: 400,
  ),
  UpcomingEvent(
    title: 'Cloud Computing',
    description: 'The future of technology',
    imageUrl:
        'https://www.datamation.com/wp-content/uploads/2021/08/cloud-6515064_1920.jpg',
    venue: 'BR Ambedkar Auditorium, DTU',
    date: DateTime(2022, 2, 6, 11, 20, 0),
    id: '5',
    price: 400,
  ),
  UpcomingEvent(
    title: 'Cyber Security',
    description: 'Security in a modern world',
    imageUrl:
        'https://www.york.ac.uk/media/study/courses/postgraduate/computerscience/cyber%20security%20banner.jpg',
    venue: 'BR Ambedkar Auditorium, DTU',
    date: DateTime(2022, 2, 7, 11, 20, 0),
    id: '6',
    price: 400,
  ),
];

List<PastEvent> pastEvents = [
  // dummy list of past events
  PastEvent(
    title: 'Ikigai',
    description: 'The Japanese secret to a long and happy life',
    imageUrl:
        'https://imageio.forbes.com/blogs-images/chrismyers/files/2018/02/ikigai-1.png?format=png&width=1200&fit=bounds',
    venue: 'OAT, DTU',
    date: DateTime(2020, 1, 1, 12, 0, 0),
    id: '1',
  ),
  PastEvent(
    title: 'Entrepreneurship',
    description: 'The best way to start your own business',
    imageUrl:
        'https://cdn.shopify.com/s/files/1/0070/7032/files/what-is-an-entrepreneur.png?format=jpg&quality=90&v=1615334422&width=1024',
    venue: 'BR Ambedkar Auditorium, DTU',
    date: DateTime(2020, 2, 3, 11, 20, 0),
    id: '2',
  ),
  PastEvent(
    title: 'AI',
    description: 'Artifical Intelligence',
    imageUrl:
        'https://img.etimg.com/thumb/msid-80075391,width-1200,height-900,imgsize-262056,resizemode-8,quality-100/tech/information-tech/you-i-ai-how-artificial-intelligence-touches-almost-every-aspect-of-our-lives.jpg',
    venue: 'BR Ambedkar Auditorium, DTU',
    date: DateTime(2020, 2, 4, 11, 20, 0),
    id: '3',
  ),
  PastEvent(
    title: 'Blockchain',
    description: 'Publicly available,secure data',
    imageUrl:
        'https://cdn.builtin.com/sites/www.builtin.com/files/styles/blog_medium/public/blockchain-companies.jpg',
    venue: 'BR Ambedkar Auditorium, DTU',
    date: DateTime(2020, 2, 5, 11, 20, 0),
    id: '4',
  ),
  PastEvent(
    title: 'Cloud Computing',
    description: 'The future of technology',
    imageUrl:
        'https://www.datamation.com/wp-content/uploads/2021/08/cloud-6515064_1920.jpg',
    venue: 'BR Ambedkar Auditorium, DTU',
    date: DateTime(2020, 2, 6, 11, 20, 0),
    id: '5',
  ),
  PastEvent(
    title: 'Cyber Security',
    description: 'Security in a modern world',
    imageUrl:
        'https://www.york.ac.uk/media/study/courses/postgraduate/computerscience/cyber%20security%20banner.jpg',
    venue: 'BR Ambedkar Auditorium, DTU',
    date: DateTime(2020, 2, 7, 11, 20, 0),
    id: '6',
  ),
];
