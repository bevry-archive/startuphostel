# List
aside ".people", ->
	ul ->
		for user in (@users or [])
			continue  unless user.get('avatar')
			li ".person.person-#{user.get('hash')}", title:"#{h user.get('text')}", ->
				showName = =>
					span ".person-name", -> "#{h user.get('name')}"
				if user.get('website')
					a ".person-link", href:"#{h user.get('website')}", showName
				else
					showName()
	div ".clear", ->