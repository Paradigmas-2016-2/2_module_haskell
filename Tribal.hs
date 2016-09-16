--defining module Tribal
module Tribal
(unit,
 unit_strength,
 unit_general_defense,
 unit_cavalry_defense,
 general_strength,
 cavalry_strength,
 total_strength,
 general_attack_ratio,
 general_defense,
 cavalry_defense,
 total_general_defense,
 total_cavalry_defense,
 total_defense,
 defense_strength_ratio,
 strength_defense_ratio,
 calculate_winner,
 loss_ratio,
 winner_loss_ratio,
 multiplicate_list
) where

--unit data, first argument is attack, second general defense and the third argument is the cavalary defense
spear_fighter = [10, 15, 45]   :: [Double]
swordsman     = [25, 50, 25]   :: [Double]
axeman        = [40, 10, 5]    :: [Double]
light_cavalry = [130, 30, 40]  :: [Double]
heavy_cavalry = [150, 200, 80] :: [Double]

--defining the data type
data Winner = Defender | Attacker deriving (Show)
data Fight = Fighters [Int] [Int]

--types of troop
unit :: Int -> [Double]
unit  troops = [spear_fighter, swordsman, axeman, light_cavalry, heavy_cavalry]!!troops

--defining function to get only the atribute attack of troops
unit_strength :: [Double] -> Double
unit_strength (x:xs) = x

--defining function to get only the atribute general defense of troops
unit_general_defense :: [Double] -> Double
unit_general_defense xs = xs!!1

--defining function to get only the atribute cavalary defense of troops
unit_cavalry_defense :: [Double] -> Double
unit_cavalry_defense xs = xs!!2

--defining function to calculate attack data only of troop without horse
general_strength :: Int -> [Double] -> Double
--2 is the last troop without horse, and 3 is the base case
general_strength 3 xs = 0	
general_strength troops xs = (unit_strength (unit troops)) * (xs !! troops) + general_strength (troops + 1) xs

--defining funtion to get attack data of all troops with cavalary attack
cavalry_strength :: Int -> [Double] -> Double
--4 is the last troop, and 5 is the base case
cavalry_strength 5 xs = 0
cavalry_strength troops xs = (unit_strength (unit troops)) * (xs !! troops) + cavalry_strength (troops + 1) xs

--defining funtion to return the sum of the strenght
total_strength :: [Double] -> Double
total_strength xs = general_strength 0 xs + cavalry_strength 3 xs

--defining funtion to calculate the attack ratio based in general strength
general_attack_ratio :: [Double] -> Double
general_attack_ratio xs = general_strength 0 xs / total_strength xs

--defining funtion to calculate the attack ratio based in cavalary strength
cavalry_attack_ratio :: [Double] -> Double
--we passed the init value in 3, cause the 0,1,2 we calculate in general strength, and we want only to calculate cavalary strength
cavalry_attack_ratio xs = cavalry_strength 3 xs / total_strength xs


--defining function to get defense data of all troops
general_defense :: Int -> [Double] -> Double
general_defense 5 xs = 0
general_defense troops xs = (unit_general_defense (unit troops)) * (xs !! troops) + general_defense (troops + 1) xs

cavalry_defense :: Int -> [Double] -> Double
cavalry_defense 5 xs = 0
cavalry_defense troops xs = (unit_cavalry_defense (unit troops)) * (xs !! troops) + cavalry_defense (troops + 1) xs

total_general_defense :: [Double] -> [Double] -> Double
total_general_defense xs ys = general_attack_ratio ys * general_defense 0 xs

total_cavalry_defense :: [Double] -> [Double] -> Double
total_cavalry_defense xs ys = cavalry_attack_ratio ys * cavalry_defense 0 xs

--defining function to calculate the total defense of troops
total_defense :: [Double] -> [Double] -> Double
total_defense xs ys = total_general_defense xs ys + total_cavalry_defense xs ys

--winner data
--winner loss ratio = (([loser fight value]/[winner fight value])^(1/2)/([winner fight value]/[loser fight value])
defense_strength_ratio :: Double -> Double -> Double
defense_strength_ratio total_defense total_strength = total_defense / total_strength

strength_defense_ratio :: Double -> Double -> Double
strength_defense_ratio total_defense total_strength = total_strength / total_defense

calculate_winner :: Double -> Double -> Winner
calculate_winner total_defense total_strength = if total_strength > total_defense then Attacker else Defender

loss_ratio :: Winner -> Double -> Double -> Double
loss_ratio Defender total_defense total_strength = sqrt (strength_defense_ratio total_defense total_strength) / defense_strength_ratio total_defense total_strength
loss_ratio Attacker total_defense total_strength = sqrt (defense_strength_ratio total_defense total_strength) / strength_defense_ratio total_defense total_strength

winner_loss_ratio :: [Double] -> [Double] -> Double
winner_loss_ratio xs xy = loss_ratio (calculate_winner (total_defense xs xy) (total_strength xy)) (total_defense xs xy) (total_strength xy)

multiplicate_list :: Double -> [Double] -> [Double]
multiplicate_list x ys = map (x *) ys
