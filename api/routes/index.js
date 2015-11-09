var express = require('express');

var router = express.Router();


/* GET home page. */
router.get('/', function(req, res, next) {
    res.sendFile('/Users/iTOUCH/actegrate/.tmp/index.html');
});

module.exports = router;
