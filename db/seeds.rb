# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

strips = [
	{ attributes: {
		title: "GameStops stocks Hedge funds and rWallstreetsbets explained",
		description: "The effect of Reddit on the stock market",
		links: "https://twitter.com/PinkWug/status/1415352022967140358
    https://www.instagram.com/p/CRUI7fAl7j5/
    https://www.reddit.com/r/PinkWug/comments/ok89q3/when_governments_criminalize_homelessness/
    https://www.facebook.com/PinkWug/posts/685510745726284
    https://pinkwug.tumblr.com/post/656703380823097344/when-governments-criminalize-homelessness",
		transcript: "Two capitalist shaking hands, announcer saying: no one knows what happened, so sadly no one can be held accountable. 
		Breaking news headline says: Once in a lifetime recession happens again. 
		Next panel is reddit comments, first one by tendieslord69 saying: IT LITERALLY CANNOT GO TITS UP, next comment is by mywifesboyfriend:💎💎🤚🤚. 
		Next comment is by 420chan saying: We're going to the moon boys. 
		Next panel is a TV announcer saying: The governemnt needs to stpe in! sinister forces are destroy8ing rich people money!. Breaking news banner on the bottom says: Should every redditor be prosecuted?", 
		keywords: ["Reddit", "GME", "Stock Market", "Wall Street"],
		created_at: "27/01/2021",
		},
		image: 'GameStops stocks, Hedge funds and rWallstreetsbets explained.jpg',
	},
	{ attributes: {
		title: "their problem",
		description: "General strike explained",
		links: "https://twitter.com/PinkWug/status/1415352022967140358
    https://www.instagram.com/p/CRUI7fAl7j5/
    https://www.reddit.com/r/PinkWug/comments/ok89q3/when_governments_criminalize_homelessness/
    https://www.facebook.com/PinkWug/posts/685510745726284",
		transcript: "if you take a break, it's your problem. 
		If everyone takes a break, it's their problem.",
		keywords: ["Strike", "Capitalism", "Unions", "Amazon"],
		created_at: "04/02/2021",
		},
		image: 'their_problem.jpg',
	},
	{ attributes: {
		title: "Avocado (Collab with ThingsInSquares)",
		description: "Millenials and their student debt",
		links: "https://twitter.com/PinkWug/status/1415352022967140358
    https://www.instagram.com/p/CRUI7fAl7j5/
    https://www.reddit.com/r/PinkWug/comments/ok89q3/when_governments_criminalize_homelessness/
    https://www.facebook.com/PinkWug/posts/685510745726284",
		transcript: "Pink Wug reading a headline from his laptop reading: How to pay off student loans... 'eat less avocado' highlighted among the text of the newspaper. 
		Pink wug calculating, the phrase '12654 fewer avocados' appears among different equations. 
		Pink is vomiting an avocado, counting 'that makes 31...'
		He hands a banker the keys to a truck full of avocados in the back, saying 'I'm paying off my debt please'", 
		keywords: ["Student Debt", "Loans", "Millenials"],
		created_at: "11/02/2021",
		},
		image: 'avocado (collab with ThingsInSquares).png',
	},
	{ attributes: {
		title: "NPCs",
		description: "Republicans' reaction to any police killing involving black people",
		links: "https://twitter.com/PinkWug/status/1415352022967140358
    https://www.facebook.com/PinkWug/posts/685510745726284",
		transcript: "Breaking News, police killed an unarmed black man.
		Closeup of grey wug's thought process, executing a program called bootlicking.exe that contains 'Is the victim perfect? if yes, dig deeper, ask again. If no, he was no angel'.
		Grey wug quote tweets someone who says cops shouldn't execute people with 'ummm actually if you look at his fb photos...'", 
		keywords: ["Republicans", "Fascists", "BLM", "Breaking News", "Twitter", "No angel", "Police"],
		created_at: "14/04/2021",
		},
		image: 'NPCs.jpg',
	},
	{ attributes: {
		title: "Relatable",
		description: "My reaction when someone says they relate to my comics",
		links: "https://twitter.com/PinkWug/status/1415352022967140358
    https://www.instagram.com/p/CRUI7fAl7j5/
    https://www.reddit.com/r/PinkWug/comments/ok89q3/when_governments_criminalize_homelessness/
    https://www.facebook.com/PinkWug/posts/685510745726284",
		transcript: "Yellow wug says 'I relate so much to your comics'.
		Pink wug replies: damn I'm sorry to hear that", 
		keywords: [ "Non-political"],
		created_at: "29/04/2021",
		},
		image: 'Relatable.jpg',
	},
	{ attributes: {
		title: "Why nurses are superheroes",
		description: "All the similarities between nurses and superheroes",
		links: "https://twitter.com/PinkWug/status/1415352022967140358
    https://www.instagram.com/p/CRUI7fAl7j5/
    https://www.reddit.com/r/PinkWug/comments/ok89q3/when_governments_criminalize_homelessness/
    https://www.facebook.com/PinkWug/posts/685510745726284",
		transcript: "They're paid with applause (nurse is pictured picking up a penny). 
		Their job is seen as their moral duty (capitalist wug threatens the nurse with a gun and says 'you wont abandon your patients right?'
		government dont want them realising the power they hold (nurse carrying a sign for 'nurses united' while a cop and guy in suit glare)", 
		keywords: [ "Nurses", "Heroes", "Essential workers", "Unions", "Moral duty", "patients", "government", "power"],
		created_at: "04/05/2021",
		},
		image: 'Why nurses are superheroes.jpg',
	},
	{ attributes: {
		title: "On this day was born an OG leftists memer who wrote not walls, but whole buildings of text",
		description: "Leftists walls of texts",
		links: "https://twitter.com/PinkWug/status/1415352022967140358
    https://www.instagram.com/p/CRUI7fAl7j5/
    https://www.reddit.com/r/PinkWug/comments/ok89q3/when_governments_criminalize_homelessness/
    https://www.facebook.com/PinkWug/posts/685510745726284",
		transcript: "Blue Wug wishes Pink Wug a job that pays what he's worth. Both wearing birthday hats. Pink says 'that will never happen in a system where job creation is driven by the possibility of paying the workers less than the value added by their labor' Blue: I ain't reading all that, but happy birthday!", 
		keywords: [ "Leftists", "Job", "labor theory of value", "LTV"],
		created_at: "05/05/2021",
		},
		image: 'On this day was born an OG leftist memer who wrote not walls, but whole buildings of text.jpg',
	},
	{ attributes: {
		title: "Union for me, but not for thee",
		description: "Collective bargaining for the corporations, but not the workers",
		links: "https://twitter.com/PinkWug/status/1415352022967140358
    https://www.instagram.com/p/CRUI7fAl7j5/
    https://www.reddit.com/r/PinkWug/comments/ok89q3/when_governments_criminalize_homelessness/
    https://www.facebook.com/PinkWug/posts/685510745726284",
		transcript: "5 billion dollar corporation + 5 billion dollar corporation = 13 billion dollar corporation (+3: monopoly bonus).
		worker + worker = both fired (but not because of unionization or anything)", 
		keywords: [ "Workers", "Job", "Monopoly", "Corporations", "Unions"],
		comment: "Latest Comic! I'll be gone for a while, got some school work to get through!",
		created_at: "07/05/2021",
		},
		image: 'Union for me, but not for thee.jpg',
	},
]

strips.each do |strip|
	if Strip.find_by(title: strip[:attributes][:title])
	   puts "#{strip[:attributes][:title]} already exists, skipping"
	   next
	end
	s = Strip.new(strip[:attributes])
	fn = Rails.root.join("app", "assets", "images" ,"comics", "#{strip[:image]}")
	s.image.attach(io: File.open(fn), filename: strip[:image])
	if s.save!
	  puts "Created #{s.title}"
	end
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?