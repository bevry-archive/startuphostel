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
		opacity: 0.7
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

# The DocPad Configuration File
docpadConfig = {

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
			title: "Startup Hostel: The home for the doers of the world"

			# The website description (for SEO)
			description: """
				When your website appears in search results in say Google, the text here will be shown underneath your website's title.
				"""

			# The website keywords (for SEO) separated by commas
			keywords: """
				place, your, website, keywoards, here, keep, them, related, to, the, content, of, your, website
				"""

			# The website's styles
			styles: [
				'/vendor/normalize.css'
				'/vendor/h5bp.css'
				'/styles/style.css'
			]

			# The website's scripts
			scripts: [
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
}

# Export our DocPad Configuration
module.exports = docpadConfig