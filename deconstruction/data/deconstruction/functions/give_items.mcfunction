clear @s
give @s bow{display:{Name:"{\"text\":\"Firebow\"}"}}
give @s bow{display:{Name:"{\"text\":\"Tunneler\"}"}}
give @s dispenser{display:{Name:"{\"text\":\"Bomber\"}"}}
give @s magma_cube_spawn_egg{display:{Name:"{\"text\":\"Nuke\"}"}}

tellraw @s ["",{"text":"-=Help=-\n Help:","color":"gold"},{"text":" Hold a sign renamed \"help\".\n "},{"text":"Weapons:","color":"aqua"},{"text":" Just rename an item to whatever the weapon is called (case sensitive).\n\n"},{"text":"-=Bows=-","color":"dark_gray"},{"text":"\n"},{"text":" ","color":"red"},{"text":"Firebow ","color":"dark_red"},{"text":"- Shoots fireballs instead of arrows.\n "},{"text":"Tunneler ","color":"dark_green"},{"text":"- Fills an area around its arrows with air.\n\n"},{"text":"-=Dispenser=-","color":"dark_gray"},{"text":"\n "},{"text":"Bomber ","color":"dark_red"},{"text":"- Rains down TNT on your enemies."},{"text":"\n\n"},{"text":"-=Other=-","color":"green"},{"text":"\n "},{"text":"TNT ","color":"red"},{"text":"- All TNT is more powerful."}]