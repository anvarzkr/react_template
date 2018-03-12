import Connection from '../../Connection';
import axios from 'axios';

export class Api {

  static method(params, callback) {
    console.log("method", params);

    if (params == undefined)
      return;

    const url = Connection.API_URL + '/method';

    axios({
      url: url,
      method: 'get',
      params: params,
    }).then(function(response) {
      callback(response);
    });

  }
}
