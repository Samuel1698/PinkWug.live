strips = [
	{ attributes: {
		title: "Why nurses are superheroes",
		description: "All the similarities between nurses and superheroes",
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
		transcript: "Blue Wug wishes Pink Wug a job that pays what he's worth. Both wearing birthday hats. Pink says 'that will never happen in a system where job creation is driven by the possibility of paying the workers less than the value added by their labor' Blue: I ain't reading all that, but happy birthday!", 
		keywords: [ "Leftists", "Job", "labor theory of value", "LTV"],
		created_at: "05/05/2021",
		},
		image: 'On this day was born an OG leftist memer who wrote not walls, but whole buildings of text.jpg',
	},
	{ attributes: {
		title: "Union for me, but not for thee",
		description: "Collective bargaining for the corporations, but not the workers",
		transcript: "5 billion dollar corporation + 5 billion dollar corporation = 13 billion dollar corporation (+3: monopoly bonus).
		worker + worker = both fired (but not because of unionization or anything)", 
		keywords: [ "Workers", "Job", "Monopoly", "Corporations", "Unions"],
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