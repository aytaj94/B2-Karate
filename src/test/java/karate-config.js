function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    hello_world_api_url: 'https://sandbox.api.service.nhs.uk/hello-world/hello/world',
    minion_base_url: 'http://18.206.236.92:8000/api',
    all_minions: '/minionns', // you can store the path variable here and use if needed.
    docuport_base_url: 'https://beta.docuport.app'

  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}