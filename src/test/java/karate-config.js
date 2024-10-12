function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myVarName: 'someValue',
    baseUrl: 'https://reqres.in' // added baseUrl
  }
  if (env == 'dev') {
    // customize for dev environment
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize for e2e environment
  }
  return config;
}