import React from 'react';
import ReactDOM from 'react-dom';

import {
  BrowserRouter as Router,
  Switch,
  Route
} from 'react-router-dom';

import "tailwindcss/tailwind.css";

import Home from './pages/Home';

import TailwindExample from './TailwindExample';

ReactDOM.render((
  <Router>
    <Switch>
      <Route path="/tailwind-example"><TailwindExample /></Route>
      <Route exact path="/"><Home /></Route>
    </Switch>
  </Router>
), document.getElementById('react-wrapper'))
