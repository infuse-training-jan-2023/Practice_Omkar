const moment = require("moment")
console.log("Hello Programmer");
const format1 = "DD-MM-YYYY HH:mm:ss"
const format2 = "DD-MM-YYYY"
var date1 = new Date();
let dateTime1 = moment(date1).format(format1);
let dateTime2 = moment(date1).format(format2);
console.log(dateTime1)
console.log(dateTime2)