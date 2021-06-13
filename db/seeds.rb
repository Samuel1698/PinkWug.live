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
		subtext: "General strike explained",
		transcript: "if you take a break, it's your problem. If everyone takes a break, it's their problem.",
		},
		image: 'their_problem.jpg'
	},
	{ attributes: {
		title: "GameStops stocks Hedge funds and rWallstreetsbets explained",
		subtext: "The effect of Reddit on the stock market",
		transcript: "Two capitalist shaking hands, announcer saying: no one knows what happened, so sadly no one can be held accountable. Breaking news headline says: Once in a lifetime recession happens again. Next panel is reddit comments, first one by tendieslord69 saying: IT LITERALLY CANNOT GO TITS UP, next comment is by mywifesboyfriend:💎💎🤚🤚. Next comment is by 420chan saying: We're going to the moon boys. Next panel is a TV announcer saying: The governemnt needs to stpe in! sinister forces are destroy8ing rich people money!. Breaking news banner on the bottom says: Should every redditor be prosecuted?", 
		},
		image: 'GameStops stocks, Hedge funds and rWallstreetsbets explained.jpg'
	},
	{ attributes: {
		title: "Avocado (Collab with ThingsInSquares)",
		subtext: "Millenials and their student debt",
		transcript: "Pink Wug reading a headline from his laptop reading: How to pay off student loans... 'eat less avocado' highlighted among the text of the newspaper. Next panel is pink wug calculating, the phrase '12654 fewer avocados' appears among different equations. Next panel shows him vomiting an avocado and counting, saying 'that makes 31...' Next panel shows him handing a banker the keys to a truck full of avocados in the back, saying 'I'm paying off my debt please'", 
		},
		image: 'avocado (collab with ThingsInSquares).png'
	},
]
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