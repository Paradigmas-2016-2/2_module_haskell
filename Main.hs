import Tribal

main = do

  putStrLn ("Tropas de defesa")
  

  putStrLn ("Informe a quantidad de spear_fighter:")
  qtd_spear_fighter  <- getLine
  let convert_to_Double = read qtd_spear_fighter :: Double
  let list1 = convert_to_Double:[]

  putStrLn ("Informe a quantidad de swordsman:")
  qtd_swordsman <- getLine
  let convert_to_Double = read qtd_swordsman :: Double
  let list2 = convert_to_Double:[]
 
  putStrLn ("Informe a quantidade de axeman:")
  qtd_aconvert_to_Doubleeman <- getLine
  let convert_to_Double = read qtd_aconvert_to_Doubleeman :: Double
  let list3 = convert_to_Double:[]

  putStrLn ("Informe a quantidade light_cavalary:")
  qtd_light_cavalary <- getLine
  let convert_to_Double = read qtd_light_cavalary :: Double
  let list4 = convert_to_Double:[]

  putStrLn ("Informe a quantidad de heavy_cavalary:")
  qtd_heavy_cavalary <- getLine
  let convert_to_Double = read qtd_heavy_cavalary :: Double
  let list5 = convert_to_Double:[]

  let final_list_defense = list1 ++ list2 ++ list3 ++ list4 ++ list5


  putStrLn("")
  putStrLn ("Tropas de ataque")
  putStrLn("")
  

  putStrLn ("Informe a quantidad de spear_fighter:")
  qtd_spear_fighter  <- getLine
  let convert_to_Double = read qtd_spear_fighter :: Double
  let list1 = convert_to_Double:[]

  putStrLn ("Informe a quantidad de swordsman:")
  qtd_swordsman <- getLine
  let convert_to_Double = read qtd_swordsman :: Double
  let list2 = convert_to_Double:[]
 
  putStrLn ("Informe a quantidade de axeman:")
  qtd_aconvert_to_Doubleeman <- getLine
  let convert_to_Double = read qtd_aconvert_to_Doubleeman :: Double
  let list3 = convert_to_Double:[]

  putStrLn ("Informe a quantidade light_cavalary:")
  qtd_light_cavalary <- getLine
  let convert_to_Double = read qtd_light_cavalary :: Double
  let list4 = convert_to_Double:[]

  putStrLn ("Informe a quantidad de heavy_cavalary:")
  qtd_heavy_cavalary <- getLine
  let convert_to_Double = read qtd_heavy_cavalary :: Double
  let list5 = convert_to_Double:[]

  let final_list_attack = list1 ++ list2 ++ list3 ++ list4 ++ list5
  

  let percent_remaining_troops = winner_loss_ratio final_list_defense final_list_attack
  print(calculate_winner (total_defense final_list_defense final_list_attack) (total_strength final_list_attack))

  putStrLn("")
  putStrLn("Quantidade de tropas restantes: ")
  putStrLn("")

  let result = multiplicate_list percent_remaining_troops final_list_attack
  let result_to_i = map round result


  putStrLn("spear_fighter: ")
  print(result_to_i!!0)
  
  putStrLn("Swordsman: ")
  print(result_to_i!!1)
  
  putStrLn("axeman: ")
  print(result_to_i!!2)
  
  putStrLn("light_cavalary: ")
  print(result_to_i!!3)
  
  putStrLn("heavy_cavalary: ")
  print(result_to_i!!4)



