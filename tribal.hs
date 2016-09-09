--unit data
spear_fighter = [10, 15, 45]
swordsman = [25, 50, 25]
axeman = [40, 10, 5]
light_cavalry = [130, 30, 40]
heavy_cavalry = [150, 200, 80]

unit i = [spear_fighter, swordsman, axeman, light_cavalry, heavy_cavalry]!!i
unit_strength (x:xs) = x
unit_general_defense xs = xs!!1
unit_cavalry_defense xs = xs!!2

--attack data
general_strength 3 xs = 0
general_strength i xs = (unit_strength (unit i)) * (xs !! i) + general_strength (i + 1) xs

cavalry_strength 5 xs = 0
cavalry_strength i xs = (unit_strength (unit i)) * (xs !! i) + cavalry_strength (i + 1) xs

total_strength xs = general_strength 0 xs + cavalry_strength 3 xs

general_attack_ratio xs = general_strength 0 xs / total_strength xs
cavalry_attack_ratio xs = cavalry_strength 3 xs / total_strength xs


--defense data
general_defense 5 xs = 0
general_defense i xs = (unit_general_defense (unit i)) * (xs !! i) + general_defense (i + 1) xs

cavalry_defense 5 xs = 0
cavalry_defense i xs = (unit_cavalry_defense (unit i)) * (xs !! i) + cavalry_defense (i + 1) xs

total_general_defense xs ys = general_attack_ratio ys * general_defense 0 xs
total_cavalry_defense xs ys = cavalry_attack_ratio ys * cavalry_defense 0 xs

total_defense xs ys = total_general_defense xs ys + total_cavalry_defense xs ys

--winner data
--winner loss ratio= (([loser fight value]/[winner fight value])^(1/2)/([winner fight value]/[loser fight value])
winner_loss_ratio = 