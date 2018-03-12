const SERVER_URL = "http://api.darqube.com"; // Main server
const API_VERSION = "v1";

var CONNECTION_PARAMS = Object.freeze({
  SERVER_URL: SERVER_URL,
  API_VERSION: API_VERSION,
  API_URL: SERVER_URL + '/' + API_VERSION
});

module.exports = CONNECTION_PARAMS;
