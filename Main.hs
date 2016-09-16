--importing fuctions
import Tribal
import System.Console.ANSI

main = do

--clearScreen is a fuction of System, only to clear screen
  clearScreen
  putStrLn ("Attacking troops\n\n\n\n")
  
--getting datas of attacker 
  putStrLn ("Enter the amount of attacking Spear Fighters:")
  qtd_spear_fighter  <- getLine
  let convert_to_Double = read qtd_spear_fighter :: Double
  let list1 = convert_to_Double:[]

  putStrLn ("Enter the amount of attacking Swordsman:")
  qtd_swordsman <- getLine
  let convert_to_Double = read qtd_swordsman :: Double
  let list2 = convert_to_Double:[]
 
  putStrLn ("Enter the amount of attacking Axeman:")
  qtd_aconvert_to_Doubleeman <- getLine
  let convert_to_Double = read qtd_aconvert_to_Doubleeman :: Double
  let list3 = convert_to_Double:[]

  putStrLn ("Enter the amount of attacking Light Cavalary:")
  qtd_light_cavalary <- getLine
  let convert_to_Double = read qtd_light_cavalary :: Double
  let list4 = convert_to_Double:[]

  putStrLn ("Enter the amount of attacking Heavy Cavalary:")
  qtd_heavy_cavalary <- getLine
  let convert_to_Double = read qtd_heavy_cavalary :: Double
  let list5 = convert_to_Double:[]

  let final_list_attack = list1 ++ list2 ++ list3 ++ list4 ++ list5

  clearScreen
--getting datas of defenser
  putStrLn ("Defense troops\n\n\n\n")

  putStrLn ("Enter the amount of defense Spear Fighters:")
  qtd_spear_fighter <- getLine
  let convert_to_Double = read qtd_spear_fighter :: Double
  let list1 = convert_to_Double:[]

  putStrLn ("Enter the amount of defense Swordsman:")
  qtd_swordsman <- getLine
  let convert_to_Double = read qtd_swordsman :: Double
  let list2 = convert_to_Double:[]
 
  putStrLn ("Enter the amount of defense Axeman:")
  qtd_aconvert_to_Doubleeman <- getLine
  let convert_to_Double = read qtd_aconvert_to_Doubleeman :: Double
  let list3 = convert_to_Double:[]

  putStrLn ("Enter the amount of defense Light Cavalary:")
  qtd_light_cavalary <- getLine
  let convert_to_Double = read qtd_light_cavalary :: Double
  let list4 = convert_to_Double:[]

  putStrLn ("Enter the amount of defense Heavy Cavalary:")
  qtd_heavy_cavalary <- getLine
  let convert_to_Double = read qtd_heavy_cavalary :: Double
  let list5 = convert_to_Double:[]

  let final_list_defense = list1 ++ list2 ++ list3 ++ list4 ++ list5

  
--getting the percent of remaining of troops
  let percent_remaining_troops = winner_loss_ratio final_list_defense final_list_attack
  clearScreen
  putStrLn("-----------------------Winner--------------------- \n")
--printing the winner of the attack
  print(calculate_winner (total_defense final_list_defense final_list_attack) (total_strength final_list_attack))

  
  putStrLn("\n\n\nNumber of remaining troops: \n")
--getting result of remaining troops
  let result = multiplicate_list percent_remaining_troops final_list_attack
--coverting the result to integer
  let result_to_i = map round result

--priting results
  putStrLn("Spear Fighter: ")
  print(result_to_i!!0)
  
  putStrLn("Swordsman: ")
  print(result_to_i!!1)
  
  putStrLn("Axeman: ")
  print(result_to_i!!2)
  
  putStrLn("Light Cavalary: ")
  print(result_to_i!!3)
  
  putStrLn("Heavy Cavalary: ")
  print(result_to_i!!4)



