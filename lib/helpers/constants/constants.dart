/// This is the base address of the node server.
///
/// During development, anyone using this should
/// paste their own IPv4 address here.
// String nodeServerBaseUrl = 'http://192.168.0.106:3000';

Map<int, String> errorMessages = {
  400: "Bad Request",
  401: "Unauthorized request",
  403: "Forbidden request",
  404: "Not found",
  500: "Internal Server Error",
};

// Satvik iPhone Hotspot:
// String nodeServerBaseUrl = 'http://172.20.10.2:3000';
//Heroku:
// String nodeServerBaseUrl = 'https://tedx-dtu-concept.herokuapp.com';

//Satvik Home:
// String nodeServerBaseUrl = 'http://192.168.1.37:3000';

String nodeServerBaseUrl = "https://api.tedxdtu.in";
// String nodeServerBaseUrl = "https://tedxdtu.in";

//Saarthak Shivang PG:
// String nodeServerBaseUrl = 'http://192.168.1.8:3000';

//Sagar's pg:
// String nodeServerBaseUrl = 'http://192.168.1.64:3000';
