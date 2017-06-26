(function(module) {
	"use strict";

	var async = module.parent.require('async');
	var nconf = module.parent.require('nconf');
	var validator = module.parent.require('validator');
	var fs = require('fs');
	var path = require('path');
	var db = module.parent.require('./database');
	var categories = module.parent.require('./categories');
	var user = module.parent.require('./user');
	var plugins = module.parent.require('./plugins');
	var topics = module.parent.require('./topics');
	var posts = module.parent.require('./posts');
	var groups = module.parent.require('./groups');
	var translator = module.parent.require('../public/src/modules/translator');
	var templates = module.parent.require('templates.js');
	var websockets = module.parent.require('./socket.io');
	var settings = module.parent.require('./settings');
	var socketAdmin = module.parent.require('./socket.io/admin');
	var defaultSettings = { title: 'Recent Topics', opacity: '1.0', textShadow: 'none', enableCarousel: 1, enableCarouselPagination: 1 };
	var app;


	var Widget = {};

	Widget.init = function(params, callback) {
		app = params.app;
		const router = params.router,
					hostMiddleware = params.middleware,
					hostControllers = params.controllers;

		router.get('/admin/plugins/ccmtHP_features', hostMiddleware.admin.buildHeader, Widget.renderAdminPage);
		router.get('/api/admin/plugins/ccmtHP_features', Widget.renderAdminPage);
		callback();

		Widget.settings = new settings('ccmtHP_features', '1.0.0', defaultSettings);
		socketAdmin.settings.syncCcmtHP_features = function () {
			Widget.settings.sync();
		};

	};

	Widget.renderAdminPage = function(req,res,next){
		res.render('admin/ccmtHP_features', {});
	}

	Widget.addAdminNavigation = function(header, callback) {
		header.plugins.push({
			route: '/plugins/ccmtHP_features',
			icon: 'fa-tint',
			name: 'ccmtHP_features'
		});

		callback(null, header);
	};

	Widget.defineWidgets=function(widgets,callback){
		widgets = widgets.concat([
			{
			widget: 'ccmtHP_features',
			name: 'ccmtHP_features',
			description: 'a series of feature buttons widgets for homepage',
			content: 'admin/ccmtHP_features'
			}
		]);

		callback(null, widgets);
	}

	Widget.renderCcmtHP_features=function(widget,callback){
		widget.data.templateData={
			ico1:Widget.settings.get('ico1'),
			tit1:Widget.settings.get('tit1'),
			url1:'http://forum.supersu.com/'+Widget.settings.get('url1'),

			ico2:Widget.settings.get('ico2'),
			tit2:Widget.settings.get('tit2'),
			url2:'http://forum.supersu.com/'+Widget.settings.get('url2'),

			ico3:Widget.settings.get('ico3'),
			tit3:Widget.settings.get('tit3'),
			url3:'http://forum.supersu.com/'+Widget.settings.get('url3'),

			ico4:Widget.settings.get('ico4'),
			tit4:Widget.settings.get('tit4'),
			url4:'http://forum.supersu.com/'+Widget.settings.get('url4'),

			ico5:Widget.settings.get('ico5'),
			tit5:Widget.settings.get('tit5'),
			url5:'http://forum.supersu.com/'+Widget.settings.get('url5'),

			ico6:Widget.settings.get('ico6'),
			tit6:Widget.settings.get('tit6'),
			url6:'http://forum.supersu.com/'+Widget.settings.get('url6'),

			ico7:Widget.settings.get('ico7'),
			tit7:Widget.settings.get('tit7'),
			url7:'http://forum.supersu.com/'+Widget.settings.get('url7'),

			ico8:Widget.settings.get('ico8'),
			tit8:Widget.settings.get('tit8'),
			url8:'http://forum.supersu.com/'+Widget.settings.get('url8'),
		}
		app.render('widgets/ccmtHP_features',{templateData:widget.data.templateData},callback);
	}

	module.exports = Widget;
}(module));
