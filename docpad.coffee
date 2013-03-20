# Import
balUtil = require('bal-util')
feedr = new (require('feedr')).Feedr
createsend = require('createsend')
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
		image: "https://fbcdn-sphotos-h-a.akamaihd.net/hphotos-ak-ash3/534164_10100736092491635_376734153_n.jpg"
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

# Spreadsheet
spreadsheetConnection = null
spreadsheetInfo = null
spreadsheetRows = null

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
		spreadsheetKey: process.env.GOOGLE_SPREADSHEET_KEY

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
			title: "Startup Hostel: The home for the doers of the world"

			# The website description (for SEO)
			description: """
				Startup Hostel is an all year round work retreat in paradise for the doers of the world; you keep your costs down low, work on what you want, learn from amazing people, in amazing locaitons.
				"""

			# The website keywords (for SEO) separated by commas
			keywords: """
				startup, startups, hostel, hostels, hackathon, work retreat, retreat, hackers, entreprenuers, coworking, incubator
				"""

			# The website's styles
			styles: [
				# 'http://raw.github.com/iamceege/tooltipster/2.1.3/css/tooltipster.css'
				'/vendor/normalize.css'
				'/vendor/h5bp.css'
				'/styles/style.css'
			]

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
		# Prepare our spreadsheet
		extendTemplateData: (opts,next) ->
			# Prepare
			docpad = @docpad
			tasks = new balUtil.Group(next)
			users = []
			sales = 0

			# Find User or Create
			addUser = (newUser) ->
				for user in users
					checks = ['name','email','skype','twitter','facebook','website']
					for check in checks
						if user[check] and user[check] is newUser[check]
							for own key,value of newUser
								user[key] or= value or null
							return user
				users.push(newUser)
				return newUser

			# Spreadsheet Connection
			tasks.push (next) ->
				return next()  if spreadsheetConnection?
				spreadsheetConnection = new (require('google-spreadsheet'))(process.env.GOOGLE_SPREADSHEET_KEY)
				return spreadsheetConnection.setAuth(process.env.GOOGLE_USERNAME, process.env.GOOGLE_PASSWORD, next)

			# Spreadsheet Info
			tasks.push (next) ->
				return next()  if spreadsheetInfo?
				spreadsheetConnection.getInfo (err,info) ->
					return next(err)  if err
					spreadsheetInfo = info
					return next()

			# Spreadsheet Rows
			tasks.push (next) ->
				return next() if spreadsheetRows?
				spreadsheetInfo.worksheets[0].getRows (err,rows) ->
					return next(err)  if err
					spreadsheetRows = rows
					return next()

			# Speadsheet Users
			tasks.push ->
				for row in spreadsheetRows
					# Apply user information
					user = {}
					user.name = row.name or row.title or row.twitterusername or row.skypeusername or null
					user.email = row.email or null
					user.bio = row.bio or null
					user.confirmed = String(row.confirmed).toLowerCase() in ['yes','true']
					user.skype = row.skypeusername or null
					user.twitter = row.twitterusername or null
					user.facebook = (row.facebookurl or '').replace(/^.+com\//,'').replace(/\//g,'') or null
					user.website = row.websiteurl or null
					addUser(user)

			# Campaign Monitor Users
			tasks.push (next) ->
				createsendConnection.listActive process.env.CM_LIST_ID, null, (err,data) ->
					return next(err)  if err
					for result in data.Results
						# Apply user information
						user = {}
						user.name = result.Name or null
						user.email = result.EmailAddress
						user.skype = null
						user.twitter = null
						for customField in result.CustomFields
							customFieldKey = customField.Key.toLowerCase()
							user[customFieldKey] or= customField.Value or null
						addUser(user)
					return next()

			# Twitter Users
			tasks.push (next) ->
				feedr.readFeed "http://api.twitter.com/1/statuses/followers.json?screen_name=StartupHostel&cursor=-1", (err,data) ->
					return next(err)  if err
					return next(data.errors[0].message)  if data?.errors?[0]?.message

					# Users
					for twitterUser in (data.users or [])
						# Apply user information
						user = {}
						user.name = twitterUser.name
						user.bio = twitterUser.description or null
						user.twitter = twitterUser.screen_name
						user.twitterID = twitterUser.id
						user.website = twitterUser.url or "http://twitter.com/#{twitterUser.screen_name}"
						user.avatar = twitterUser.profile_image_url or null
						addUser(user)

					# Done
					return next()

			# Facebook Users
			tasks.push (next) ->
				# Users
				# https://neosmart-stream.de/facebook/how-to-create-a-facebook-access-token/
				facebookGroupId = process.env.FACEBOOK_GROUP_ID
				facebookAccessToken = process.env.FACEBOOK_ACCESS_TOKEN
				facebookFields = "about address bio email accounts gender name id religion username".replace(/\s/g,'%2C')
				feedr.readFeed "https://graph.facebook.com/#{facebookGroupId}/members?fields=#{facebookFields}&method=GET&format=json&callback=cb&access_token=#{facebookAccessToken}", (err,data) ->
					return next(err)  if err

					# Users
					for facebookUser in data.data
						# Apply user information
						user = {}
						user.name = facebookUser.name or null
						user.bio = facebookUser.bio or null
						user.gender = facebookUser.gender or null
						user.email = (facebookUser.email or '').replace('\u0040','@') or null
						user.facebook = facebookUser.username
						user.facebookID = facebookUser.id
						addUser(user)

					# Done
					return next()

			# Normalize Fields
			tasks.push (next) ->
				# Prepare
				userTasks = new balUtil.Group (err) ->
					return next(err)  if err
					docpad.log 'info', "Fetched #{users.length} users"
					opts.templateData.sales = sales
					opts.templateData.users = users
					return next()

				# Users
				balUtil.each users, (user,index) ->  userTasks.push (next) ->
					# Basics
					user = users[index]
					user.text or= user.name + (if user.bio then ": #{user.bio}" else '')
					user.website or= (if user.twitter then "http://twitter.com/#{user.twitter}") or (if user.facebook then "https://www.facebook.com/#{user.facebook}") or null
					user.avatar or= null

					# Sales
					sales++  if user.confirmed

					# Avatar
					avatarTasks = new balUtil.Group(next)

					# Avatar: Facebook
					avatarTasks.push (next) ->
						return next()  if user.avatar or !user.facebook
						user.avatar or= "http://graph.facebook.com/#{user.facebook}/picture"
						return next()

					# Avatar: Twitter
					avatarTasks.push (next) ->
						return next()  if user.avatar or !user.twitter
						feedr.readFeed "http://api.twitter.com/1/users/lookup.json?screen_name=#{user.twitter}", (err,twitterUser) ->
							return next(err)  if err
							user.avatar or= twitterUser.profile_image_url or null
							return next()

					# Avatar: Email
					avatarTasks.push (next) ->
						return next()  if user.avatar or !user.email
						emailhash = require('crypto').createHash('md5').update(user.email).digest("hex")
						user.avatar or= "http://www.gravatar.com/avatar/#{emailhash}"
						return next()

					# Avatar: run
					avatarTasks.run('sync')

				# Run
				userTasks.run()

			# Run
			return tasks.run('sync')

		# Server Extend
		# Used to add our own custom routes to the server before the docpad routes are added
		serverExtend: (opts) ->
			# Extract the server from the options
			{server} = opts
			docpad = @docpad

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

# Export
module.exports = docpadConfig