// Given to ascended knock heretics, is a form of shapeshift that can turn into all 4 common heretic summons, and is not limited to 1 selection.
/datum/action/cooldown/spell/shapeshift/eldritch/ascension
	name = "Ascended Shapechange"
	desc = "A spell that allows you to take on the form of another eldritch creature, gaining their abilities. \
		You can change your choice at any time, and if your form dies, you dont die."
	cooldown_time = 20 SECONDS
	die_with_shapeshifted_form = FALSE
	possible_shapes = list(
		/mob/living/simple_animal/hostile/heretic_summon/raw_prophet,
		/mob/living/simple_animal/hostile/heretic_summon/rust_spirit,
		/mob/living/simple_animal/hostile/heretic_summon/ash_spirit,
		/mob/living/simple_animal/hostile/heretic_summon/stalker,
	)

/datum/action/cooldown/spell/shapeshift/eldritch/ascension/do_shapeshift(mob/living/caster)
	. = ..()
	if(!.)
		return
	//buff our forms so this ascension ability isnt shit
	playsound(caster, 'sound/magic/demon_consume.ogg', 50, TRUE)
	var/mob/living/monster = .
	monster.AddComponent(/datum/component/seethrough_mob)
	monster.maxHealth *= 1.5
	monster.health = monster.maxHealth
	monster.melee_damage_lower = max((monster.melee_damage_lower * 2), 40)
	monster.melee_damage_upper = monster.melee_damage_upper / 2
	monster.transform *= 1.5
	monster.AddElement(/datum/element/wall_smasher, strength_flag = ENVIRONMENT_SMASH_RWALLS)

/datum/action/cooldown/spell/shapeshift/eldritch/ascension/do_unshapeshift(mob/living/caster)
	. = ..()
	shapeshift_type = null //pick another loser
