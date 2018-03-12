import React from 'react';
import { Switch, Route } from 'react-router-dom';
import Index from '../index/Index';
import Forbidden from '../Forbidden';

const MainLayout = () => (
  <div id="content">
    <Switch>
      <Route exact path="/" component={Index}/>
      <Route exact path="/403" component={Forbidden}/>
    </Switch>
  </div>
);

export default MainLayout;
