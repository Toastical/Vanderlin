/datum/idle_behavior/idle_random_walk
	///Chance that the mob random walks per second
	var/walk_chance = 10

/datum/idle_behavior/idle_random_walk/perform_idle_behavior(delta_time, datum/ai_controller/controller)
	. = ..()
	var/mob/living/living_pawn = controller.pawn
	if(prob(walk_chance) && (living_pawn.mobility_flags & MOBILITY_MOVE) && isturf(living_pawn.loc) && !living_pawn.pulledby)
		var/move_dir = pick(GLOB.alldirs)
		living_pawn.Move(get_step(living_pawn, move_dir), move_dir)
