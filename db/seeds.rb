# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

strips = [
	{ attributes: {
		title: "their problem", 
		subtext: "unions",
		transcript: "if you take a break, it's your problem. If everyone takes a break, it's their problem.",
		},
		image: 'their_problem.jpg'
	},
	{ attributes: {
		title: "GameStops stocks", 
		subtext: "Hedge funds and rWallstreetsbets explained", 
		transcript: "Two capitalist shaking hands, announcer saying: no one knows what happened, so sadly no one can be held accountable. Breaking news headline says: Once in a lifetime recession happens again. Next panel is reddit comments, first one by tendieslord69 saying: IT LITERALLY CANNOT GO TITS UP, next comment is by mywifesboyfriend:💎💎🤚🤚. Next comment is by 420chan saying: We're going to the moon boys. Next panel is a TV announcer saying: The governemnt needs to stpe in! sinister forces are destroy8ing rich people money!. Breaking news banner on the bottom says: Should every redditor be prosecuted?", 
		},
		image: 'GameStops stocks, Hedge funds and rWallstreetsbets explained.jpg'
	},
]

#Grey wug wearing an elephant hat receives mail. Letter reads: my beloved GOP, my worse half, my partner in war crime. i cant spell political duopoly without you. please come back, if not for me, for our donors. your truly, establishment dems ❤️. Next panel is someone off screen asking: what are you reading? Next panel, the GOP wug turns around, throws the letter on a trashcan and says "nothing to worry about babe". The hidden wug is wearing a bundle and axe, implying it's a fascists. for Can they come back together
strips.each do |strip|
	if Strip.find_by(title: strip[:attributes][:title])
	   puts "#{strip[:attributes][:title]} already exists, skipping"
	   next
	end
	s = Strip.new(strip[:attributes])
	fn = "public/assets/comics/#{strip[:image]}"
	  if File.exist? fn
	    s.image.attach(io: File.open(fn), filename: strip[:image])
	  end
	if s.save
	  puts "Created #{s.title}"
	end
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?