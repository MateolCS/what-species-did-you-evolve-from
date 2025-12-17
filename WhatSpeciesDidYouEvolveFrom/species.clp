(deftemplate pytanie
   (slot tresc (type STRING))
   (multislot odpowiedzi (type STRING))
)

(deftemplate odpowiedz
   (slot tresc_pytania (type STRING))
   (slot tresc_odpowiedzi (type STRING))
)

(deftemplate wynik
   (slot zwierze (type STRING))
   (slot klucz (type STRING))
)

(defrule start
   =>
   (assert
      (pytanie
         (tresc "My favorite thing to do is:")
         (odpowiedzi "Eat" "Run" "Swim" "Sleep" "Mate" "I don't understand this chart")
      )
   )
)

(defrule sheep
   ?p <- (pytanie (tresc "My favorite thing to do is:"))
   (odpowiedz 
      (tresc_pytania "My favorite thing to do is:")
      (tresc_odpowiedzi "I don't understand this chart")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Belgium milk sheep")
	      (klucz "Accident-prone")
      )
   )
)

(defrule favorite-run
   ?p <- (pytanie (tresc "My favorite thing to do is:"))
   (odpowiedz 
      (tresc_pytania "My favorite thing to do is:")
      (tresc_odpowiedzi "Run")
   )
   =>
   (retract ?p)
   (assert
      (pytanie
         (tresc "How fast?")
         (odpowiedzi "I'm pretty quick" "So fast I fly" "Kidding... I walk")
      )
   )
)

(defrule pretty-quick
   ?p <- (pytanie (tresc "How fast?"))
   (odpowiedz 
      (tresc_pytania "How fast?")
      (tresc_odpowiedzi "I'm pretty quick")
   )
   =>
   (retract ?p)
   (assert
      (pytanie
         (tresc "Mostly indoors?")
         (odpowiedzi "Yes" "No")
      )
   )
)

(defrule indoor
   ?p <- (pytanie (tresc "Mostly indoors?"))
   (odpowiedz 
      (tresc_pytania "Mostly indoors?")
      (tresc_odpowiedzi "Yes")
   )
   =>
   (retract ?p)
   (assert
      (pytanie
         (tresc "Do you own or rent?")
         (odpowiedzi "If I pee on it, I own it, right?" "I'm in between floors at the moment")
      )
   )
)

(defrule schnauzer
   ?p <- (pytanie (tresc "Do you own or rent?"))
   (odpowiedz 
      (tresc_pytania "Do you own or rent?")
      (tresc_odpowiedzi "If I pee on it, I own it, right?")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Miniature schnauzer")
	      (klucz "Loaded")
      )
   )
)

(defrule cockroach
   ?p <- (pytanie (tresc "Do you own or rent?"))
   (odpowiedz 
      (tresc_pytania "Do you own or rent?")
      (tresc_odpowiedzi "I'm in between floors at the moment")
   )
   =>
   (assert
      (wynik
         (zwierze "Cockroach")
	      (klucz "Junkie")
      )
   )
)

(defrule outdoor
   ?p <- (pytanie (tresc "Mostly indoors?"))
   (odpowiedz 
      (tresc_pytania "Mostly indoors?")
      (tresc_odpowiedzi "No")
   )
   =>
   (retract ?p)
   (assert
      (pytanie
         (tresc "What's on your iPod?")
         (odpowiedzi "My old Kentucky home" "Hakuna matata")
      )
   )
)

(defrule quarterhorse
   ?p <- (pytanie (tresc "What's on your iPod?"))
   (odpowiedz 
      (tresc_pytania "What's on your iPod?")
      (tresc_odpowiedzi "My old Kentucky home")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Quarterhorse")
	      (klucz "Socialite")
      )
   )
)

(defrule lion
   ?p <- (pytanie (tresc "What's on your iPod?"))
   (odpowiedz 
      (tresc_pytania "What's on your iPod?")
      (tresc_odpowiedzi "Hakuna matata")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "African lion")
	      (klucz "Celebrity")
      )
   )
)

(defrule fly
   ?p <- (pytanie (tresc "How fast?"))
   (odpowiedz 
      (tresc_pytania "How fast?")
      (tresc_odpowiedzi "So fast I fly")
   )
   =>
   (retract ?p)
   (assert
      (pytanie
         (tresc "Literally?")
         (odpowiedzi "Yes" "No")
      )
   )
)

(defrule falcon
   ?p <- (pytanie (tresc "Literally?"))
   (odpowiedz 
      (tresc_pytania "Literally?")
      (tresc_odpowiedzi "Yes")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Peregrine falcon")
	      (klucz "Rebel")
      )
   )
)

(defrule fly-no
   ?p <- (pytanie (tresc "Literally?"))
   (odpowiedz 
      (tresc_pytania "Literally?")
      (tresc_odpowiedzi "No")
   )
   =>
   (retract ?p)
   (assert
      (pytanie
         (tresc "How so, then?")
         (odpowiedzi "In my dreams" "Metaphorically")
      )
   )
)

(defrule ostrich
   ?p <- (pytanie (tresc "How so, then?"))
   (odpowiedz 
      (tresc_pytania "How so, then?")
      (tresc_odpowiedzi "In my dreams")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Tanzania ostrich")
	      (klucz "Flirt")
      )
   )
)

(defrule cheetah
   ?p <- (pytanie (tresc "How so, then?"))
   (odpowiedz 
      (tresc_pytania "How so, then?")
      (tresc_odpowiedzi "Metaphorically")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Cheetah")
	      (klucz "Jock")
      )
   )
)

(defrule walk
   ?p <- (pytanie (tresc "How fast?"))
   (odpowiedz 
      (tresc_pytania "How fast?")
      (tresc_odpowiedzi "Kidding... I walk")
   )
   =>
   (retract ?p)
   (assert
      (pytanie
         (tresc "With haste?")
         (odpowiedzi "Yes" "No")
      )
   )
)

(defrule tortoise
   ?p <- (pytanie (tresc "With haste?"))
   (odpowiedz 
      (tresc_pytania "With haste?")
      (tresc_odpowiedzi "No")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Galapagos tortoise")
	      (klucz "Brainiac")
      )
   )
)

(defrule haste
   ?p <- (pytanie (tresc "With haste?"))
   (odpowiedz 
      (tresc_pytania "With haste?")
      (tresc_odpowiedzi "Yes")
   )
   =>
   (retract ?p)
   (assert
      (pytanie
         (tresc "How's your posture?")
         (odpowiedzi "Bloody good, mate" "Quasimodo")
      )
   )
)

(defrule kangaroo
   ?p <- (pytanie (tresc "How's your posture?"))
   (odpowiedz 
      (tresc_pytania "How's your posture?")
      (tresc_odpowiedzi "Bloody good, mate")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Antilopine kangaroo")
	      (klucz "Socialite")
      )
   )
)

(defrule gorilla
   ?p <- (pytanie (tresc "How's your posture?"))
   (odpowiedz 
      (tresc_pytania "How's your posture?")
      (tresc_odpowiedzi "Quasimodo")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Silverback gorilla")
	      (klucz "Jock")
      )
   )
)

(defrule favorite-eat
   ?p <- (pytanie (tresc "My favorite thing to do is:"))
   (odpowiedz 
      (tresc_pytania "My favorite thing to do is:")
      (tresc_odpowiedzi "Eat")
   )
   =>
   (retract ?p)
   (assert
      (pytanie
         (tresc "What?")
         (odpowiedzi "No meat" "Eh, I'm not that picky" "Things with blood")
      )
   )
)

(defrule no-meat
   ?p <- (pytanie (tresc "What?"))
   (odpowiedz 
      (tresc_pytania "What?")
      (tresc_odpowiedzi "No meat")
   )
   =>
   (retract ?p)
   (assert
      (pytanie
         (tresc "Are you a hippie?")
         (odpowiedzi "Yes" "No")
      )
   )
)

(defrule hippie
   ?p <- (pytanie (tresc "Are you a hippie?"))
   (odpowiedz 
      (tresc_pytania "Are you a hippie?")
      (tresc_odpowiedzi "Yes")
   )
   =>
   (retract ?p)
   (assert
      (pytanie
         (tresc "Rockin' the beard?")
	      (odpowiedzi "Full-body" "I'm more into tats")
      )
   )
)

(defrule yak
   ?p <- (pytanie (tresc "Rockin' the beard?"))
   (odpowiedz 
      (tresc_pytania "Rockin' the beard?")
      (tresc_odpowiedzi "Full-body")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Woolly yak")
	      (klucz "Junkie")
      )
   )
)

(defrule zebra
   ?p <- (pytanie (tresc "Rockin' the beard?"))
   (odpowiedz 
      (tresc_pytania "Rockin' the beard?")
      (tresc_odpowiedzi "I'm more into tats")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Grant's zebra")
	      (klucz "Rebel")
      )
   )
)

(defrule no-hippie
   ?p <- (pytanie (tresc "Are you a hippie?"))
   (odpowiedz 
      (tresc_pytania "Are you a hippie?")
      (tresc_odpowiedzi "No")
   )
   =>
   (retract ?p)
   (assert
      (pytanie
         (tresc "How do you vote?")
	      (odpowiedzi "For the underground movement" "For guns")
      )
   )
)

(defrule worm
   ?p <- (pytanie (tresc "How do you vote?"))
   (odpowiedz 
      (tresc_pytania "How do you vote?")
      (tresc_odpowiedzi "For the underground movement")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Garden worm")
	      (klucz "Brainiac")
      )
   )
)

(defrule elephant
   ?p <- (pytanie (tresc "How do you vote?"))
   (odpowiedz 
      (tresc_pytania "How do you vote?")
      (tresc_odpowiedzi "For guns")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "African elephant")
	      (klucz "Loaded")
      )
   )
)

(defrule picky
   ?p <- (pytanie (tresc "What?"))
   (odpowiedz 
      (tresc_pytania "What?")
      (tresc_odpowiedzi "Eh, I'm not that picky")
   )
   =>
   (retract ?p)
   (assert
      (pytanie
         (tresc "Would you climb a tree to get it?")
         (odpowiedzi "Yes" "No")
      )
   )
)

(defrule climb
   ?p <- (pytanie (tresc "Would you climb a tree to get it?"))
   (odpowiedz 
      (tresc_pytania "Would you climb a tree to get it?")
      (tresc_odpowiedzi "Yes")
   )
   =>
   (retract ?p)
   (assert
      (pytanie
         (tresc "How quickly?")
         (odpowiedzi "Faster than you'd think" "Slower than you'd think")
      )
   )
)

(defrule bear
   ?p <- (pytanie (tresc "How quickly?"))
   (odpowiedz 
      (tresc_pytania "How quickly?")
      (tresc_odpowiedzi "Faster than you'd think")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Himalayan black bear")
	      (klucz "Jock")
      )
   )
)

(defrule sloth
   ?p <- (pytanie (tresc "How quickly?"))
   (odpowiedz 
      (tresc_pytania "How quickly?")
      (tresc_odpowiedzi "Slower than you'd think")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Twotoed sloth")
	      (klucz "Accident-prone")
      )
   )
)

(defrule no-climb
   ?p <- (pytanie (tresc "Would you climb a tree to get it?"))
   (odpowiedz 
      (tresc_pytania "Would you climb a tree to get it?")
      (tresc_odpowiedzi "No")
   )
   =>
   (retract ?p)
   (assert
      (pytanie
         (tresc "Why so lazy?")
         (odpowiedzi "I need 9 month of beauty sleep" "Trash cans are easier")
      )
   )
)

(defrule raccoon
   ?p <- (pytanie (tresc "Why so lazy?"))
   (odpowiedz 
      (tresc_pytania "Why so lazy?")
      (tresc_odpowiedzi "Trash cans are easier")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Northern raccoon")
	      (klucz "Junkie")
      )
   )
)

(defrule marmot
   ?p <- (pytanie (tresc "Why so lazy?"))
   (odpowiedz 
      (tresc_pytania "Why so lazy?")
      (tresc_odpowiedzi "I need 9 month of beauty sleep")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Alpine marmot")
	      (klucz "Celebrity")
      )
   )
)

(defrule with-blood
   ?p <- (pytanie (tresc "What?"))
   (odpowiedz 
      (tresc_pytania "What?")
      (tresc_odpowiedzi "Things with blood")
   )
   =>
   (retract ?p)
   (assert
      (pytanie
         (tresc "Do you kill it?")
         (odpowiedzi "Yes" "No")
      )
   )
)

(defrule kill
   ?p <- (pytanie (tresc "Do you kill it?"))
   (odpowiedz 
      (tresc_pytania "Do you kill it?")
      (tresc_odpowiedzi "Yes")
   )
   =>
   (retract ?p)
   (assert
      (pytanie
         (tresc "How long does it take?")
         (odpowiedzi "Hours" "A few seconds" "I tie it up out back and kill it later")
      )
   )
)

(defrule python
   ?p <- (pytanie (tresc "How long does it take?"))
   (odpowiedz 
      (tresc_pytania "How long does it take?")
      (tresc_odpowiedzi "Hours")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Burmese python")
	      (klucz "Anger issues")
      )
   )
)

(defrule crocodile
   ?p <- (pytanie (tresc "How long does it take?"))
   (odpowiedz 
      (tresc_pytania "How long does it take?")
      (tresc_odpowiedzi "A few seconds")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Saltwater crocodile")
	      (klucz "Jock")
      )
   )
)

(defrule spider
   ?p <- (pytanie (tresc "How long does it take?"))
   (odpowiedz 
      (tresc_pytania "How long does it take?")
      (tresc_odpowiedzi "I tie it up out back and kill it later")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Black widow spider")
	      (klucz "Celebrity")
      )
   )
)

(defrule no-kill
   ?p <- (pytanie (tresc "Do you kill it?"))
   (odpowiedz 
      (tresc_pytania "Do you kill it?")
      (tresc_odpowiedzi "No")
   )
   =>
   (retract ?p)
   (assert
      (pytanie
         (tresc "Why not?")
         (odpowiedzi "'Cuz smeone else does" "I like my steak extra rare")
      )
   )
)

(defrule vulture
   ?p <- (pytanie (tresc "Why not?"))
   (odpowiedz 
      (tresc_pytania "Why not?")
      (tresc_odpowiedzi "'Cuz smeone else does")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Ruppell's griffin vulture")
	      (klucz "Rebel")
      )
   )
)

(defrule leech
   ?p <- (pytanie (tresc "Why not?"))
   (odpowiedz 
      (tresc_pytania "Why not?")
      (tresc_odpowiedzi "I like my steak extra rare")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Horse leech")
	      (klucz "Junkie")
      )
   )
)

(defrule favorite-sleep
   ?p <- (pytanie (tresc "My favorite thing to do is:"))
   (odpowiedz 
      (tresc_pytania "My favorite thing to do is:")
      (tresc_odpowiedzi "Sleep")
   )
   =>
   (retract ?p)
   (assert
      (pytanie
         (tresc "'Cuz you work the graveyard shift?")
         (odpowiedzi "No" "Yes")
      )
   )
)

(defrule bat
   ?p <- (pytanie (tresc "'Cuz you work the graveyard shift?"))
   (odpowiedz 
      (tresc_pytania "'Cuz you work the graveyard shift?")
      (tresc_odpowiedzi "Yes")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Brown bat")
	      (klucz "Junkie")
      )
   )
)

(defrule no-shif
   ?p <- (pytanie (tresc "'Cuz you work the graveyard shift?"))
   (odpowiedz 
      (tresc_pytania"'Cuz you work the graveyard shift?")
      (tresc_odpowiedzi "No")
   )
   =>
   (retract ?p)
   (assert
      (pytanie
         (tresc "Are you cuddly?")
         (odpowiedzi "My mother says I am" "People other tkan my mother say I am")
      )
   )
)

(defrule armadillo
   ?p <- (pytanie (tresc "Are you cuddly?"))
   (odpowiedz 
      (tresc_pytania "Are you cuddly?")
      (tresc_odpowiedzi "My mother says I am")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Giant armadillo")
	      (klucz "Loaded")
      )
   )
)

(defrule koala
   ?p <- (pytanie (tresc "Are you cuddly?"))
   (odpowiedz 
      (tresc_pytania "Are you cuddly?")
      (tresc_odpowiedzi "People other tkan my mother say I am")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Koala bear")
	      (klucz "Flirt")
      )
   )
)

(defrule favorite-swim
   ?p <- (pytanie (tresc "My favorite thing to do is:"))
   (odpowiedz 
      (tresc_pytania "My favorite thing to do is:")
      (tresc_odpowiedzi "Swim")
   )
   =>
   (retract ?p)
   (assert
      (pytanie
         (tresc "Where?")
         (odpowiedzi "The sand" "In the shallows" "The deep blue sea" "No, the DEEP blue sea")
      )
   )
)

(defrule monitor
   ?p <- (pytanie (tresc "Where?"))
   (odpowiedz 
      (tresc_pytania "Where?")
      (tresc_odpowiedzi "The sand")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Desert monitor")
	      (klucz "Rebel")
      )
   )
)

(defrule shallows
   ?p <- (pytanie (tresc "Where?"))
   (odpowiedz 
      (tresc_pytania "Where?")
      (tresc_odpowiedzi "In the shallows")
   )
   =>
   (retract ?p)
   (assert
      (pytanie
         (tresc "In the shallows")
         (odpowiedzi "Sidewalk puddles" "Ponds & lakes" "Rivers & streams")
      )
   )
)

(defrule sidewalk
   ?p <- (pytanie (tresc "In the shallows"))
   (odpowiedz 
      (tresc_pytania "In the shallows")
      (tresc_odpowiedzi "Sidewalk puddles")
   )
   =>
   (retract ?p)
   (assert
      (pytanie
         (tresc "Do you eat french fries?")
         (odpowiedzi "No" "Yes, and pretzels")
      )
   )
)

(defrule algae
   ?p <- (pytanie (tresc "Do you eat french fries?"))
   (odpowiedz 
      (tresc_pytania "Do you eat french fries?")
      (tresc_odpowiedzi "No")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Probably algae")
	      (klucz "Brainiac")
      )
   )
)

(defrule pigeon
   ?p <- (pytanie (tresc "Do you eat french fries?"))
   (odpowiedz 
      (tresc_pytania "Do you eat french fries?")
      (tresc_odpowiedzi "Yes, and pretzels")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Feral pigeon")
	      (klucz "Accident-prone")
      )
   )
)

(defrule pond
   ?p <- (pytanie (tresc "In the shallows"))
   (odpowiedz 
      (tresc_pytania "In the shallows")
      (tresc_odpowiedzi "Ponds & lakes")
   )
   =>
   (retract ?p)
   (assert
      (pytanie
         (tresc "How's your buoyancy?")
         (odpowiedzi "I sink like a rock" "I couldn't sink if I tried")
      )
   )
)

(defrule mussel
   ?p <- (pytanie (tresc "How's your buoyancy?"))
   (odpowiedz 
      (tresc_pytania "How's your buoyancy?")
      (tresc_odpowiedzi "I sink like a rock")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Thick shelled river mussel")
	      (klucz "Brainiac")
      )
   )
)

(defrule goose
   ?p <- (pytanie (tresc "How's your buoyancy?"))
   (odpowiedz 
      (tresc_pytania "How's your buoyancy?")
      (tresc_odpowiedzi "I couldn't sink if I tried")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Lesser snow goose")
	      (klucz "Flirt")
      )
   )
)

(defrule river
   ?p <- (pytanie (tresc "In the shallows"))
   (odpowiedz 
      (tresc_pytania "In the shallows")
      (tresc_odpowiedzi "Rivers & streams")
   )
   =>
   (retract ?p)
   (assert
      (pytanie
         (tresc "Recreationally?")
         (odpowiedzi "I like to goof around" "I can be pretty intense")
      )
   )
)

(defrule otter
   ?p <- (pytanie (tresc "Recreationally?"))
   (odpowiedz 
      (tresc_pytania "Recreationally?")
      (tresc_odpowiedzi "I like to goof around")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Eurasion river otter")
	      (klucz "Socialite")
      )
   )
)

(defrule pirhana
   ?p <- (pytanie (tresc "Recreationally?"))
   (odpowiedz 
      (tresc_pytania "Recreationally?")
      (tresc_odpowiedzi "I can be pretty intense")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Red pirhana")
	      (klucz "Anger issues")
      )
   )
)

(defrule deep-sea
   ?p <- (pytanie (tresc "Where?"))
   (odpowiedz 
      (tresc_pytania "Where?")
      (tresc_odpowiedzi "The deep blue sea")
   )
   =>
   (retract ?p)
   (assert
      (pytanie
         (tresc "Alone?")
         (odpowiedzi "Yes" "No")
      )
   )
)

(defrule alone
   ?p <- (pytanie (tresc "Alone?"))
   (odpowiedz 
      (tresc_pytania "Alone?")
      (tresc_odpowiedzi "Yes")
   )
   =>
   (retract ?p)
   (assert
      (pytanie
         (tresc "Bummer, why?")
         (odpowiedzi "Because I'm mean" "Because I feel... invisible")
      )
   )
)

(defrule shark
   ?p <- (pytanie (tresc "Bummer, why?"))
   (odpowiedz 
      (tresc_pytania "Bummer, why?")
      (tresc_odpowiedzi "Because I'm mean")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Bull shark")
	      (klucz "Anger issues")
      )
   )
)

(defrule jellyfish
   ?p <- (pytanie (tresc "Bummer, why?"))
   (odpowiedz 
      (tresc_pytania "Bummer, why?")
      (tresc_odpowiedzi "Because I feel... invisible")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Transparent jellyfish")
	      (klucz "Rebel")
      )
   )
)

(defrule no-alone
   ?p <- (pytanie (tresc "Alone?"))
   (odpowiedz 
      (tresc_pytania "Alone?")
      (tresc_odpowiedzi "No")
   )
   =>
   (retract ?p)
   (assert
      (pytanie
         (tresc "With who?")
         (odpowiedzi "My life mate" "All 15000 of my facebook friends")
      )
   )
)

(defrule angelfish
   ?p <- (pytanie (tresc "With who?"))
   (odpowiedz 
      (tresc_pytania "With who?")
      (tresc_odpowiedzi "My life mate")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "French angelfish")
	      (klucz "Flirt")
      )
   )
)

(defrule barracuda
   ?p <- (pytanie (tresc "With who?"))
   (odpowiedz 
      (tresc_pytania "With who?")
      (tresc_odpowiedzi "All 15000 of my facebook friends")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Yellowtail barracuda")
	      (klucz "Socialite")
      )
   )
)

(defrule the-deep-sea
   ?p <- (pytanie (tresc "Where?"))
   (odpowiedz 
      (tresc_pytania "Where?")
      (tresc_odpowiedzi "No, the DEEP blue sea")
   )
   =>
   (retract ?p)
   (assert
      (pytanie
         (tresc "Are you scary?")
         (odpowiedzi "Yes" "No")
      )
   )
)

(defrule scary
   ?p <- (pytanie (tresc "Are you scary?"))
   (odpowiedz 
      (tresc_pytania "Are you scary?")
      (tresc_odpowiedzi ?cos)
   )
   =>
   (retract ?p)
   (assert
      (pytanie
         (tresc "Which do you have more of?")
         (odpowiedzi "Teeth" "Appendages")
      )
   )
)

(defrule viperfish
   ?p <- (pytanie (tresc "Which do you have more of?"))
   (odpowiedz 
      (tresc_pytania "Which do you have more of?")
      (tresc_odpowiedzi "Teeth")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Viperfish")
	      (klucz "Anger issues")
      )
   )
)

(defrule squid
   ?p <- (pytanie (tresc "Which do you have more of?"))
   (odpowiedz 
      (tresc_pytania "Which do you have more of?")
      (tresc_odpowiedzi "Appendages")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Giant squid")
	      (klucz "Brainiac")
      )
   )
)

(defrule favorite-mate
   ?p <- (pytanie (tresc "My favorite thing to do is:"))
   (odpowiedz
      (tresc_pytania "My favorite thing to do is:")
      (tresc_odpowiedzi "Mate")
   )
   =>
   (retract ?p)
   (assert
      (pytanie
         (tresc "Hit it & quit it?")
         (odpowiedzi "Yes" "No")
      )
   )
)

(defrule dolphin
   ?p <- (pytanie (tresc "Hit it & quit it?"))
   (odpowiedz 
      (tresc_pytania "Hit it & quit it?")
      (tresc_odpowiedzi "Yes")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Bottlenose dolphin")
	      (klucz "Flirt")
      )
   )
)

(defrule no-quit
   ?p <- (pytanie (tresc "Hit it & quit it?"))
   (odpowiedz 
      (tresc_pytania "Hit it & quit it?")
      (tresc_odpowiedzi "No")
   )
   =>
   (retract ?p)
   (assert
      (pytanie
         (tresc "Are you a stay at home dad?")
         (odpowiedzi "Yes" "No")
      )
   )
)

(defrule seahorse
   ?p <- (pytanie (tresc "Are you a stay at home dad?"))
   (odpowiedz 
      (tresc_pytania "Are you a stay at home dad?")
      (tresc_odpowiedzi "Yes")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Pygmy seahorse")
	      (klucz "Loaded")
      )
   )
)

(defrule dove
   ?p <- (pytanie (tresc "Are you a stay at home dad?"))
   (odpowiedz 
      (tresc_pytania "Are you a stay at home dad?")
      (tresc_odpowiedzi "No")
   )
   =>
   (retract ?p)
   (assert
      (wynik
         (zwierze "Turtle dove")
	      (klucz "Celebrity")
     )
   )
)


