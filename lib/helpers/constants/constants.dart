/// This is the base address of the node server.
///
/// During development, anyone using this should
/// paste their own IPv4 address here.
String nodeServerBaseUrl = 'http://192.168.0.106:3000';

Map<int, String> errorMessages = {
  400: "Bad Request",
  401: "Unauthorized request",
  403: "Forbidden request",
  404: "Not found",
  500: "Internal Server Error",
};
