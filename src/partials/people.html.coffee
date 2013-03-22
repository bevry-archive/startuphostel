# List
aside ".people", ->
	ul ->
		for user in (@users or [])
			continue  unless user.avatar
			li ".person.person-#{user.hash}", title:"#{h user.text}", ->
				showName = =>
					span ".person-name", -> "#{h user.name}"
				if user.website
					a ".person-link", href:"#{h user.website}", showName
				else
					showName()
	div ".clear", ->