Secret_lair = {
	living_quarters: {
		kitchen: ['cook-o-tron-9000', 'apples', 'laser-knife', 
			# it doesn't make a ton of sense to do this but I wanted to make it more complex then necessary for the assignment
			{meat: ['ham', 'beef', 'chicken'], 
			veggies: ['asparagus', 'brocolli']},
			'banannas'],
		den: ["holo-deck", "bowling alley", "dart board"],
		bedroom: ["anti-gravity bed", "lava lamp", "smooth jazz"]
	},
	command_center: ["giant monitor", "big chair", "pet cat", "self-descruct button"],
	reactor_room: ["plutonium", "scientists"],
	torture_chamber: "unnecessarily devilishly complex mechanisms",
	henchman_housing: ['depressing bunks', 'steel tables', 'bad coffee'],
	escape_hatches: {
		sea: ['submarine', 'hollowed out whale'],
		subterranean: 'giant drill',
		sky: ['derigible', 'rocket', 'helecopter']
	},
}

puts Secret_lair[:living_quarters][:kitchen][2]
puts Secret_lair[:living_quarters][:kitchen].last
puts Secret_lair[:torture_chamber]
puts Secret_lair[:escape_hatches][:sea].first
puts Secret_lair[:living_quarters][:kitchen][3][:veggies][0]
