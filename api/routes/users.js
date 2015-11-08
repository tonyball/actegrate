var express = require('express');
var bcrypt = require('bcrypt-nodejs');
var fs = require('fs');

var router = express.Router();

var mongoose = require('mongoose');
var User = require('../models/User.js');

/* GET users listing. */
router.get('/', function (req, res, next) {
  User.find(function (err, users){
  	if(err) return next(err);
  	res.json(users);
  });
});

/* GET /users/username */
router.get('/:username', function (req, res, next){
	User.findOne({username: req.params.username}, function (err, user){
		if(err) return next(err);
		res.json(user);
	});
});

/* GET /users/username for login */
router.post('/login', function (req, res, next){
	User.findOne({username: req.body.username}, function (err, user){
		if(err) return next(err);
		if (user != null){
			hased = user.password;
			bcrypt.compare(req.body.password, hased, function(err, result) {
				if (result == true){
					res.json(user);
				} else {
					res.send('p')
				}
			});
		} else {
			res.send('u')
		}

	});
});

/* POST /users */
router.post('/register', function (req, res, next){
	bcrypt.hash(req.body.password, null, null, function(err, hash) {
		req.body.password = hash
    	User.create(req.body, function (err, user){
			if (err) return next(err);
			res.json(user);
		});
	});
});

//image decoding funciton
function decodeBase64Image(dataString) {
  var matches = dataString.match(/^data:([A-Za-z-+\/]+);base64,(.+)$/),
    response = {};

  if (matches.length !== 3) {
    return new Error('Invalid input string');
  }

  response.type = matches[1];
  response.data = new Buffer(matches[2], 'base64');

  return response;
}


/* POST /image user file */
router.post('/avatar', function (req, res, next){
	var imageBuffer = decodeBase64Image(req.body.file);
	fs.writeFile('/Users/iTOUCH/actegrate/app/images/avatars/'+req.body.name, imageBuffer.data , 'utf-8', function (err) {
		if (err) 
		  throw err;
		res.end();
	});
});

/* PUT /users/:username */
router.put('/:username', function (req, res, next){
	User.findOneAndUpdate({username: req.params.username}, req.body, function (err, post){
		if(err) return next(err);
		res.json(post);
	});
});

/* DELETE /users/:username */
router.delete('/:username', function (req, res, next){
	User.findOneAndRemove({username: req.params.username}, req.body, function (err, post){
		if (err) return next(err);
		res.json(post);
	});
});

module.exports = router;
