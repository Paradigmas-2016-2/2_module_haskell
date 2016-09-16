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

--unit data
spear_fighter = [10, 15, 45]   :: [Double]
swordsman     = [25, 50, 25]   :: [Double]
axeman        = [40, 10, 5]    :: [Double]
light_cavalry = [130, 30, 40]  :: [Double]
heavy_cavalry = [150, 200, 80] :: [Double]

data Winner = Defender | Attacker deriving (Show)
data Fight = Fighters [Int] [Int]

unit :: Int -> [Double]
unit i = [spear_fighter, swordsman, axeman, light_cavalry, heavy_cavalry]!!i

unit_strength :: [Double] -> Double
unit_strength (x:xs) = x

unit_general_defense :: [Double] -> Double
unit_general_defense xs = xs!!1

unit_cavalry_defense :: [Double] -> Double
unit_cavalry_defense xs = xs!!2

--attack data
general_strength :: Int -> [Double] -> Double
general_strength 3 xs = 0	
general_strength i xs = (unit_strength (unit i)) * (xs !! i) + general_strength (i + 1) xs

cavalry_strength :: Int -> [Double] -> Double
cavalry_strength 5 xs = 0
cavalry_strength i xs = (unit_strength (unit i)) * (xs !! i) + cavalry_strength (i + 1) xs

total_strength :: [Double] -> Double
total_strength xs = general_strength 0 xs + cavalry_strength 3 xs

general_attack_ratio :: [Double] -> Double
general_attack_ratio xs = general_strength 0 xs / total_strength xs

cavalry_attack_ratio :: [Double] -> Double
cavalry_attack_ratio xs = cavalry_strength 3 xs / total_strength xs


--defense data
general_defense :: Int -> [Double] -> Double
general_defense 5 xs = 0
general_defense i xs = (unit_general_defense (unit i)) * (xs !! i) + general_defense (i + 1) xs

cavalry_defense :: Int -> [Double] -> Double
cavalry_defense 5 xs = 0
cavalry_defense i xs = (unit_cavalry_defense (unit i)) * (xs !! i) + cavalry_defense (i + 1) xs

total_general_defense :: [Double] -> [Double] -> Double
total_general_defense xs ys = general_attack_ratio ys * general_defense 0 xs

total_cavalry_defense :: [Double] -> [Double] -> Double
total_cavalry_defense xs ys = cavalry_attack_ratio ys * cavalry_defense 0 xs

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
