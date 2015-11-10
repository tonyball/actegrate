var express = require('express');

var router = express.Router();


/* GET home page. */
router.get('/', function(req, res, next) {
    res.sendFile('../dist/index.html');
});

router.get('/main', function(req, res, next) {
    res.redirect('/#/main');
});

router.get('/profile/:username', function(req, res, next) {
    res.redirect('/#/profile'+req.params.username);
});

router.get('/settings', function(req, res, next) {
    res.redirect('/#/settings');
});

module.exports = router;
