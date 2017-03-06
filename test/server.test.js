const test = require('tape');
const fs = require('fs');
const path = require('path');
const server = require('../src/server.js');

test('Check if server is running', t => {
  server.start(err => {
    t.error(err);
    server.stop();
    t.end();
  });
});

test('Check successful route & handling to index.html', function(t) {
  var options = {
    method: 'GET',
    url: '/'
  };
  server.inject(options, (res) => {
    t.equal(res.statusCode, 200, 'status code is 200');
    // add a test to check html content
    t.end();
  });
});

test('Check failing route & handling', function(t) {
  var options = {
    method: 'GET',
    url: '/hamburger',
  };
  server.inject(options, (res) => {
    t.equal(res.statusCode, 404, 'status code is 404');
    // add a test to check html content
    t.end();
  });
});