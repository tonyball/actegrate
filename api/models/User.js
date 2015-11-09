var mongoose = require('mongoose');

var UserSchema = new mongoose.Schema({

	username: {type:String, lowercase: true, unique: true, trim:true},
	password: String,
	firstname: String,
	lastname: String,
	email: {address:String, show:Boolean},
	school: String,
	role: Boolean,
	gender: String,
	birthdate: Date,
	tel: String,
	education_level: String,
	bio: String,
	location: String,
	avatar: {type:String, default:"User.png"},
	courses: Array,
	activities: Array,
	cards: Array,
	points: Array,
	created_date: {type:Date, default: Date.now()},
	fb_link: String,
	fb_id: String,
	fb_token: String,
	fb_email: String,
	fb_name: String,
	tw_link: String,
	tw_id: String,
	tw_token: String,
	tw_displayName: String,
	tw_username: String,
	gg_link: String,
	gg_id: String,
	gg_token: String,
	gg_email: String,
	gg_name: String,
	ig_link: String
	
});

module.exports = mongoose.model('User', UserSchema);