import Index from 'kids-math/routes/index';
import App from 'kids-math/app';

module("Acceptances - Index", {
  setup: function(){
    App.reset();
  }
});

test("index renders", function(){
  expect(1);

  visit('/').then(function(){
    ok(exists("h2:contains('Hello Julius')"));

  });
});
