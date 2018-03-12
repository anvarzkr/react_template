import React, { Component } from 'react';
import MainLayout from './components/layouts/MainLayout';
import { Switch, Route } from 'react-router-dom';
import 'bootstrap';

class App extends Component {

  constructor(props) {
    super(props);
    this.state = {};
  }

  render() {
    return (
      <div>
        <MainLayout/>
      </div>
    );
  }

}

export default App;
