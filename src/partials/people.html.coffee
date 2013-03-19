# List
aside ".people", ->
	ul ->
		for user in (@users or [])
			continue  unless user.avatarurl
			li title:"#{h user.text}", ->
				showAvatar = =>
					img src:@cachr(user.avatarurl), alt:"#{h user.name}"
				if user.websiteurl
					a href:"#{h user.websiteurl}", showAvatar
				else
					showAvatar()
	div ".clear", ->