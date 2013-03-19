# List
aside ".people", ->
	ul ->
		for user in (@users or [])
			continue  unless user.avatar
			li title:"#{h user.text}", ->
				showAvatar = =>
					img src:@cachr(user.avatar), alt:"#{h user.name}"
				if user.website
					a href:"#{h user.websiteurl}", showAvatar
				else
					showAvatar()
	div ".clear", ->