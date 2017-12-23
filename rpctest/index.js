var bitcoin = require('bitcoin');

console.log('testing bitcoin rpc')

var client = new bitcoin.Client({
  host: 'localhost',
  port: 18332,
  user: 'user',
  pass: 'password'
});

client.getDifficulty(function(err, difficulty) {
  if (err) {
    return console.error(err);
  }

  console.log('Difficulty: ' + difficulty);
});
