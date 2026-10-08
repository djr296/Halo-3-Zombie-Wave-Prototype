; Halo 3 MCC - Flood Survival prototype
; Milestone 1: prove a five-wave AI loop on an existing campaign scenario.
;
; Required scenario AI references:
;   fs_wave_01, fs_wave_02, fs_wave_03, fs_wave_04, fs_wave_05

(global short fs_wave_index 0)
(global long fs_team_supplies 0)
(global boolean fs_running false)
(global boolean fs_victory false)

(script static void fs_wait_for_current_wave
    (sleep_until (= (ai_living_count fs_wave_01) 0) 30)
)

(script static void fs_clear_wave_one
    (set fs_wave_index 1)
    (print "FLOOD SURVIVAL: WAVE 1")
    (ai_place fs_wave_01)
    (fs_wait_for_current_wave)
    (set fs_team_supplies (+ fs_team_supplies 500))
    (print "WAVE 1 CLEARED - TEAM SUPPLIES +500")
)

(script static void fs_clear_wave_two
    (set fs_wave_index 2)
    (print "FLOOD SURVIVAL: WAVE 2")
    (ai_place fs_wave_02)
    (sleep_until (= (ai_living_count fs_wave_02) 0) 30)
    (set fs_team_supplies (+ fs_team_supplies 600))
    (print "WAVE 2 CLEARED - TEAM SUPPLIES +600")
)

(script static void fs_clear_wave_three
    (set fs_wave_index 3)
    (print "FLOOD SURVIVAL: WAVE 3")
    (ai_place fs_wave_03)
    (sleep_until (= (ai_living_count fs_wave_03) 0) 30)
    (set fs_team_supplies (+ fs_team_supplies 700))
    (print "WAVE 3 CLEARED - TEAM SUPPLIES +700")
)

(script static void fs_clear_wave_four
    (set fs_wave_index 4)
    (print "FLOOD SURVIVAL: WAVE 4")
    (ai_place fs_wave_04)
    (sleep_until (= (ai_living_count fs_wave_04) 0) 30)
    (set fs_team_supplies (+ fs_team_supplies 800))
    (print "WAVE 4 CLEARED - TEAM SUPPLIES +800")
)

(script static void fs_clear_wave_five
    (set fs_wave_index 5)
    (print "FLOOD SURVIVAL: WAVE 5")
    (ai_place fs_wave_05)
    (sleep_until (= (ai_living_count fs_wave_05) 0) 30)
    (set fs_team_supplies (+ fs_team_supplies 1000))
    (print "WAVE 5 CLEARED - PROTOTYPE COMPLETE")
)

(script startup flood_survival_startup
    (set fs_running true)
    (print "FLOOD SURVIVAL PROTOTYPE")
    (print "PREPARE - WAVE 1 STARTS IN 20 SECONDS")
    (sleep (* 30 20))

    (fs_clear_wave_one)
    (sleep (* 30 10))
    (fs_clear_wave_two)
    (sleep (* 30 10))
    (fs_clear_wave_three)
    (sleep (* 30 10))
    (fs_clear_wave_four)
    (sleep (* 30 10))
    (fs_clear_wave_five)

    (set fs_victory true)
    (set fs_running false)
    (print "FLOOD SURVIVAL: VICTORY")
)

