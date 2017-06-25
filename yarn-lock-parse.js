/* [yarn-lockfile](https://www.npmjs.com/package/yarn-lockfile) */
// const fs = require('fs')
const lockfile = require('yarn-lockfile')

/* let file = fs.readFileSync('yarn.lock', 'utf8') */
/* let json = lockfile.parse(file) */
/* let string = JSON.stringify(json) */
/* console.info(string); */
/* process.stdout.write(string) */
/* console.log(lockfile.parse(file)) */

/* console.log(JSON.parse(lockfile.parse(file))) */

process.stdin.resume();
process.stdin.setEncoding('utf8');

process.stdin.on('data', function(chunk){
  let json = lockfile.parse(chunk)
  let string = JSON.stringify(json)
  process.stdout.write(string)
});

process.stdin.on('end', function(){
});

