# Import
TaskGroup = require('taskgroup')
createsend = require('createsend')
feedr = null
createsendConnection = new createsend(process.env.CM_KEY)

###
twit = require('twit')
twitConnection = new twit(
	consumer_key: process.env.TWITTER_CONSUMER_KEY
	consumer_secret: process.env.TWITTER_CONSUMER_SECRET
	access_token: process.env.TWITTER_ACCESS_TOKEN
	access_token_secret: process.env.TWITTER_ACCESS_TOKEN_SECRET
)
###

# Background
backgrounds =
	bora:
		image: "http://fc08.deviantart.net/fs36/f/2008/285/6/c/Bora_Bora_N_8_by_EatBones.jpg"
		web: "http://eatbones.deviantart.com/art/Bora-Bora-N-8-100487992"
	sych:
		image: "http://upload.wikimedia.org/wikipedia/commons/f/f6/Anse_Source_d'Argent_2-La_Digue.jpg"
		web: "http://commons.wikimedia.org/wiki/File:Anse_Source_d'Argent_2-La_Digue.jpg"
	pool3:
		web: "http://panviman-group.deviantart.com/art/Panviman-Pool-Access-w-lightings-337696940"
		image: "http://fc02.deviantart.net/fs71/f/2012/319/0/d/panviman_pool_access_w_lightings_by_panviman_group-d5l20mk.jpg"
	us:
		web: "https://www.facebook.com/photo.php?fbid=10150606184340670&set=a.10150606180140670.380974.620410669&type=3&src=https%3A%2F%2Ffbcdn-sphotos-d-a.akamaihd.net%2Fhphotos-ak-prn1%2F538452_10150606184340670_1928444854_n.jpg&size=960%2C640"
		image: "https://fbcdn-sphotos-d-a.akamaihd.net/hphotos-ak-prn1/538452_10150606184340670_1928444854_n.jpg"
	us2:
		web: "https://www.facebook.com/photo.php?fbid=10100736092491635&set=a.10100736090530565.2700291.9410692&type=3&src=https%3A%2F%2Ffbcdn-sphotos-h-a.akamaihd.net%2Fhphotos-ak-ash3%2F534164_10100736092491635_376734153_n.jpg&size=720%2C480"
		image: "https://raw.githubusercontent.com/bevry/designs/master/startup-hostel/wallpapers/phil.jpg"
		opacity: 0.85 # 0.7
	us4:
		web: "https://www.facebook.com/photo.php?fbid=10100736169517275&set=a.10100736090530565.2700291.9410692&type=3&src=https%3A%2F%2Ffbcdn-sphotos-d-a.akamaihd.net%2Fhphotos-ak-prn1%2F553251_10100736169517275_2026680824_n.jpg&size=720%2C480"
		image: "https://fbcdn-sphotos-d-a.akamaihd.net/hphotos-ak-prn1/553251_10100736169517275_2026680824_n.jpg"
		opacity: 0.6
	us5:
		web: "https://www.facebook.com/photo.php?fbid=10150899616004689&set=t.206700536&type=3&src=https%3A%2F%2Ffbcdn-sphotos-a-a.akamaihd.net%2Fhphotos-ak-ash4%2F472302_10150899616004689_1788708535_o.jpg&smallsrc=https%3A%2F%2Ffbcdn-sphotos-a-a.akamaihd.net%2Fhphotos-ak-ash3%2F539327_10150899616004689_1788708535_n.jpg&size=2048%2C1536"
		image: "https://fbcdn-sphotos-a-a.akamaihd.net/hphotos-ak-ash4/472302_10150899616004689_1788708535_o.jpg"
		opacity: 0.8
	us6:
		web: "https://www.facebook.com/photo.php?fbid=525284605348&set=pb.206700536.-2207520000.1363247052&type=3&src=https%3A%2F%2Ffbcdn-sphotos-c-a.akamaihd.net%2Fhphotos-ak-snc7%2F412669_525284605348_1284671781_o.jpg&smallsrc=https%3A%2F%2Ffbcdn-sphotos-c-a.akamaihd.net%2Fhphotos-ak-snc7%2F399005_525284605348_1284671781_n.jpg&size=2048%2C1536"
		image: "https://fbcdn-sphotos-c-a.akamaihd.net/hphotos-ak-snc7/412669_525284605348_1284671781_o.jpg?dl=1"
backgroundSelection = 'us2'

# DocPad Configuration
docpadConfig =

	# =================================
	# Standard Configuration

	regenerateEvery: 1000*60*30  # 30 minutes


	# =================================
	# Template Data

	templateData:

		background: backgrounds[backgroundSelection].image
		opacity: backgrounds[backgroundSelection].opacity

		# Specify some site properties
		site:
			# The production url of our website
			url: "http://startuphostel.org"

			# Here are some old site urls that you would like to redirect from
			oldUrls: [
				'www.startuphostel.com',
				'startuphostel.herokuapp.com'
			]

			# The default title of our website
			title: "Startup Hostel: The home in paradise for the doers of the world"

			# The website description (for SEO)
			description: """
				Startup Hostel is an all year round work retreat for the doers of the world; you keep costs down low, work on what you want, learn from amazing people, in amazing locaitons.
				"""

			# The website keywords (for SEO) separated by commas
			keywords: """
				startup, startups, hostel, hostels, hackathon, work retreat, retreat, hackers, entreprenuers, coworking, incubator
				"""

			# The website's scripts
			scripts: [
				# 'http://code.jquery.com/jquery-1.9.1.min.js'
				# 'http://raw.github.com/iamceege/tooltipster/2.1.3/js/jquery.tooltipster.min.js'
				'/scripts/script.js'
			]

			# Services
			services:
				facebookLikeButton:
					applicationId: '266367676718271'
				twitterTweetButton: 'StartupHostel'
				twitterFollowButton: 'StartupHostel'
				gauges: '51427e6f108d7b293d0000d4'
				googleAnalytics: 'UA-35505181-3'


		# -----------------------------
		# Helper Functions

		# Get the prepared site/document title
		# Often we would like to specify particular formatting to our page's title
		# we can apply that formatting here
		getPreparedTitle: ->
			# if we have a document title, then we should use that and suffix the site's title onto it
			if @document.title
				"#{@document.title} | #{@site.title}"
			# if our document does not have it's own title, then we should just use the site's title
			else
				@site.title

		# Get the prepared site/document description
		getPreparedDescription: ->
			# if we have a document description, then we should use that, otherwise use the site's description
			@document.description or @site.description

		# Get the prepared site/document keywords
		getPreparedKeywords: ->
			# Merge the document keywords with the site keywords
			@site.keywords.concat(@document.keywords or []).join(', ')


	# =================================
	# DocPad Events

	# Here we can define handlers for events that DocPad fires
	# You can find a full listing of events on the DocPad Wiki
	events:

		# Extend Template Data
		# Fetch the users and inject our styles
		extendTemplateData: (opts,next) ->
			# Prepare
			docpad = @docpad
			sales = 0
			gsheets = null
			spreadsheet = null
			worksheets = null
			worksheet = null
			rows = null

			# Import
			feedr ?= require('feedr').create({log: docpad.log})

			# Tasks
			tasks = new TaskGroup().done(next).on('item.run', (item) ->
				console.log "Running #{item.getConfig().name}"
			)

			# Styles
			# We do it in .style rather than .site.styles as docpad only does a shallow extend
			opts.templateData.styles = [
				# 'http://raw.github.com/iamceege/tooltipster/2.1.3/css/tooltipster.css'
				'/vendor/normalize.css'
				'/vendor/h5bp.css'
				'/styles/style.css?timestamp='+((new Date()).getTime())
			]


			# =========================
			# Users

			# Store
			users = []

			# Class
			class User
				attributes: null

				constructor: (values) ->
					@attributes =
						name: null
						email: null
						skype: null
						github: null
						twitter: null
						twitterID: null  # id number
						facebook: null
						facebookID: null  # id number
						gender: null
						website: null
						bio: null
						confirmed: null
						avatar: null  # url
						spreadsheetUser: null
					@set(values)
					@

				toJSON: ->
					return @attributes

				set: (key,value,opts={}) ->
					# Set
					if key
						# Single
						if typeof key is 'string'
							# Check
							if value
								# Adjust
								switch key
									when 'facebook','github','twitter'
										value = value.replace(/^.+com\//,'').replace(/\//g,'').replace(/\@/g, '') or null
									when 'email'
										value = value.replace('\u0040','@')
									when 'confirmed'
										value = if String(value).toLowerCase() in ['yes','true'] then 'TRUE' else false

								# Apply
								if opts.safe
									@attributes[key] or= value or null
								else
									@attributes[key] = value or null

						# Multiple
						else
							# Apply each
							for own _key,_value of key
								@set(_key, _value, value or opts or null)

					# Chain
					@

				get: (key) ->
					# Prepare
					value = null

					# Apply
					switch key
						when 'hash'
							# hash for user identification
							# don't save this as this may change
							username = @get('username')
							if username
								value = require('crypto').createHash('md5').update(
									username
								).digest('hex')

						when 'username'
							value = @attributes.username or @get('email') or @get('name')

						when 'name'
							value = @attributes.name or @get('skype') or @get('twitter') or @get('facebook') or @get('github')

						when 'emailHash'
							# user for gravatars
							email = @get('email')
							if email
								value = require('crypto').createHash('md5').update(
									email
								).digest('hex')

						when 'text'
							name = @get('name')
							if name
								bio = @get('bio')
								value = name + (if bio then ": #{bio}" else '')

						when 'twitterURL'
							twitter = @get('twitter')
							if twitter
								value = "http://twitter.com/#{twitter}"

						when 'facebookURL'
							facebook = @get('facebook')
							if facebook
								value = "https://www.facebook.com/#{facebook}"

						when 'website'
							value = @attributes.website or @get('twitterURL') or @get('facebookURL')

						else
							if typeof @attributes[key] is 'undefined'
								docpad.log 'warn', 'Tried to access an unknown attribute:', key
							value = @attributes[key]

					# Return
					return value or null

				save: (next) ->
					# Check
					return next()  unless rows

					# Prepare
					keys = 'name email bio confirmed avatar skype twitter github facebook website'.split(' ')

					# Handle
					row = @get('spreadsheetUser')
					if row
						# Apply
						changed = false
						for key in keys
							if (oldValue = row.data[key] or '') isnt (newValue = @attributes[key] or '')
								row.data[key] = newValue
								console.log 'CHANGED:', row.title, key, {newValue, oldValue}
								changed = true

						# Update
						if changed
							rows.save row, (err, row) ->
								return next(err)  if err
								console.log 'SAVED:', row.title
								return next()

						# Same
						else
							console.log 'same:', row.title
							return next()

					# Add
					else
						# Apply
						data = {}
						for key in keys
							data[key] = @attributes[key] or ''

						# Create
						rows.create data, (err, row) =>
							return next(err)  if err
							console.log 'ADDED:', row.title
							@set('spreadsheetUser', row)
							return next()

					# Chain
					@

			# Create user
			createUser = (data) ->
				if data instanceof User
					user = data
				else
					user = new User(data)
				return user

			# Find user
			findUser = (findUser) ->
				findUser = createUser(findUser)
				for user in users
					checks = 'name email skype twitter facebook github website avatar'.split(' ')
					for check in checks
						if user.attributes[check] and (user.attributes[check] is findUser.attributes[check])
							return user
				return null

			# Add user
			addUser = (newUser) ->
				# Find
				newUser = createUser(newUser)
				foundUser = findUser(newUser)
				if foundUser
					# Merge
					foundUser.set(newUser.toJSON(), {safe:true})

					# Return
					return foundUser
				else
					# Add
					users.push(newUser)

					# Return
					return newUser


			# =========================
			# Sources

			tasks.addTask 'Spreadsheet Connection', (next) ->
				return next()  if gsheets? or !(process.env.GOOGLE_SPREADSHEET_KEY and process.env.GOOGLE_USERNAME and process.env.GOOGLE_PASSWORD)
				authData =
					email: process.env.GOOGLE_USERNAME
					password: process.env.GOOGLE_PASSWORD

				# Sheets
				gsheets = require('google-sheets')
				gsheets.auth authData, (err) ->
					return next(err)  if err

					# Spreadsheet
					gsheets.getSpreadsheet process.env.GOOGLE_SPREADSHEET_KEY, (err, _spreadsheet) ->
						return next(err)  if err
						spreadsheet = _spreadsheet

						# Worksheets
						spreadsheet.getWorksheets (err, _worksheets) ->
							return next(err)  if err
							worksheets = _worksheets

							# Check
							if worksheets.length is 0
								err = new Error('No worksheets!')
								console.log 'spreadsheet:', spreadsheet
								return next(err)

							# Rows
							worksheet = worksheets[0]
							return next()

			tasks.addTask 'Speadsheet Users', (next) ->
				return next()  if !worksheet
				worksheet.getRows (err, _rows) ->
					return next(err)  if err
					rows = _rows
					rows.forEach (row) ->
						# Prepare
						data = row.data

						# Apply user information
						user = addUser(
							name: data.name
							email: data.email
							bio: data.bio
							confirmed: data.confirmed
							avatar: data.avatar or data.avatarurl
							skype: data.skype or data.skypeusername
							twitter: data.twitter or data.twitterusername
							github: data.github or data.githubusername
							facebook: data.facebook or data.facebookurl
							website: data.website or data.websiteurl
							spreadsheetUser: row
						)
					return next()

			tasks.addTask 'Campaign Monitor Users', (next) ->
				return next()  if !process.env.CM_LIST_ID
				createsendConnection.listActive process.env.CM_LIST_ID, null, (err,data) ->
					return next(err)  if err
					for cmUser in data.Results
						# Apply user information
						user = createUser(
							name: cmUser.Name
							email: cmUser.EmailAddress
							cmUser: cmUser
						)

						# Merge in custom fields
						for customField in cmUser.CustomFields
							customFieldKey = customField.Key.toLowerCase()
							user.set(customFieldKey, customField.Value, {safe:true})

						# Add user
						addUser(user)
					return next()

			###
			# Twitter Users
			tasks.addTask (next) ->
				feedOptions =
					url: "http://api.twitter.com/1/statuses/followers.json?screen_name=StartupHostel&cursor=-1"
					parse: 'json'
				feedr.readFeed feedOptions, (err,data) ->
					return next(err)  if err
					return next(data.errors[0].message)  if data?.errors?[0]?.message

					# Users
					for twitterUser in (data.users or [])
						# Apply user information
						user = addUser(
							name: twitterUser.name
							bio: twitterUser.description
							twitter: twitterUser.screen_name
							twitterID: twitterUser.id
							website: twitterUser.url
							avatar: twitterUser.profile_image_url
							twitterUser: twitterUser
						)

					# Done
					return next()
			###

			# https://neosmart-stream.de/facebook/how-to-create-a-facebook-access-token/
			tasks.addTask 'Facebook Users', (next) ->
				return next()  if !(process.env.FACEBOOK_GROUP_ID and process.env.FACEBOOK_ACCESS_TOKEN)
				facebookGroupId = process.env.FACEBOOK_GROUP_ID
				facebookAccessToken = process.env.FACEBOOK_ACCESS_TOKEN
				facebookFields = "about address bio email accounts gender name id religion username".replace(/\s/g,'%2C')
				feedOptions =
					url: "https://graph.facebook.com/#{facebookGroupId}/members?fields=#{facebookFields}&method=GET&format=json&callback=cb&access_token=#{facebookAccessToken}"
					parse: 'json'
				feedr.readFeed feedOptions, (err,data) ->
					return next(err)  if err or !data.data

					# Users
					for facebookUser in data.data
						# Apply user information
						user = addUser(
							name: facebookUser.name
							bio: facebookUser.bio
							gender: facebookUser.gender
							email: facebookUser.email
							facebook: facebookUser.username
							facebookID: facebookUser.id
							facebookUser: facebookUser
						)

					# Done
					return next()

			tasks.addTask 'Normalize Fields', (next) ->
				# Prepare
				usersTasks = new TaskGroup(concurrency:0).done (err) ->
					return next(err)  if err
					docpad.log 'info', "Fetched #{users.length} users"
					opts.templateData.sales = sales
					opts.templateData.users = users
					return next()

				# Users
				users.forEach (user,index) ->  usersTasks.addTask (next) ->
					# Note users that have no username
					unless user.get('username')
						console.log 'warn', "User has no username:", user, index

					# Sales
					sales++  if user.get('confirmed')

					# User Tasks
					userTasks = new TaskGroup().done(next)

					# User Tasks: Avatar: Facebook
					userTasks.addTask (complete) ->
						return complete()  if user.get('avatar') or !(facebook = user.get('facebook'))
						user.set('avatar', "http://graph.facebook.com/#{facebook}/picture")
						return complete()

					# User Tasks: Avatar: Twitter
					userTasks.addTask (complete) ->
						return complete()  if user.get('avatar') or !(twitter = user.get('twitter'))
						feedOptions =
							url: "http://api.twitter.com/1/users/lookup.json?screen_name=#{twitter}"
							parse: 'json'
						feedr.readFeed feedOptions, (err,twitterUser) ->
							return complete(err)  if err
							user.set('avatar', twitterUser.profile_image_url)
							return complete()

					# User Tasks: Avatar: Email
					userTasks.addTask (complete) ->
						return complete()  if user.get('avatar') or !(emailHash = user.get('emailHash'))
						user.set('avatar', "http://www.gravatar.com/avatar/#{emailHash}.jpg")
						return complete()

					# User Tasks: Save
					userTasks.addTask (complete) ->
						user.save(complete)

					# User Tasks: run
					userTasks.run()

				# Run
				usersTasks.run()

			# Run
			return tasks.run()

		# Generate After
		generateAfter: (opts,next) ->
			# Prepare
			docpad = @docpad
			config = docpad.getConfig()

			# Fetch
			stylesheet = docpad.getFileAtPath('styles/style')
			source = stylesheet.get('contentRendered')

			# Optimise
			new (require('enhance-css'))(
				rootPath: config.outPath
			).process source, (err,data) ->
				return next(err)  if err
				result = data.embedded.plain
				require('fs').writeFile stylesheet.get('outPath'), result, (err) ->
					return next(err)  if err
					stylesheet.set('contentRendered',result)
					return next()

			# Done
			true

		# Server Extend
		# Used to add our own custom routes to the server before the docpad routes are added
		serverExtend: (opts) ->
			# Extract the server from the options
			{server} = opts
			docpad = @docpad
			codeSuccess = 200
			codeBadRequest = 400
			codeRedirectPermanent = 301
			codeRedirectTemporary = 302

			# As we are now running in an event,
			# ensure we are using the latest copy of the docpad configuraiton
			# and fetch our urls from it
			latestConfig = docpad.getConfig()
			oldUrls = latestConfig.templateData.site.oldUrls or []
			newUrl = latestConfig.templateData.site.url

			# Redirect any requests accessing one of our sites oldUrls to the new site url
			server.use (req,res,next) ->
				if req.headers.host in oldUrls
					res.redirect(newUrl+req.url, 301)
				else
					next()

			# Common Redirects
			redirects =
					'/survey': '/list'
					'/compare': '/list'
					'/list': 'https://docs.google.com/spreadsheet/ccc?key=0AqMqiLy7C3PhdC1pR2Q0dm9Ec0lwcnF0aFBQWVhwa3c'
					'/wiki': 'https://github.com/bevry/startup-hostel/wiki/_pages'
					'/github': 'https://github.com/bevry/startup-hostel'
			server.use (req,res,next) ->
				target = redirects[req.url]
				if target
					res.redirect(codeRedirectPermanent, target)
				else
					next()

			# Done
			return

# Export
module.exports = docpadConfig
