/* [yarn-lockfile](https://www.npmjs.com/package/yarn-lockfile) */

const fs = require('fs')
const lockfile = require('yarn-lockfile')
let file = fs.readFileSync('yarn.lock', 'utf8')
console.log(lockfile.parse(file))
