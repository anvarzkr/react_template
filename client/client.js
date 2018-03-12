import React, { Component } from 'react';
import { render } from 'react-dom';
import { BrowserRouter, Switch, Route} from 'react-router-dom';
import App from '../src/App';
import 'bootstrap';

class MainApp extends Component {

    render() {
      return (
        <div>
          <BrowserRouter>
            <App/>
          </BrowserRouter>
        </div>
      );
    }

}
render (<MainApp/>, window.document.getElementById('app'))
