;;; ***************************
;;; * DEFTEMPLATES & DEFFACTS *
;;; ***************************

(deftemplate UI-state
   (slot id (default-dynamic (gensym*)))
   (slot display)
   (slot relation-asserted (default none))
   (slot response (default none))
   (multislot valid-answers)
   (slot state (default middle)))

(deftemplate state-list
   (slot current)
   (multislot sequence))

(deffacts startup
   (state-list))


;;;****************
;;;* STARTUP RULE *
;;;****************

(defrule system-banner ""

  =>

  (assert (UI-state (display WelcomeMessage)
                    (relation-asserted start)
                    (state initial)
                    (valid-answers))))


;;;***************
;;;* QUERY RULES *
;;;***************

(defrule choose_start_question ""
    (logical (start))
    =>
    (assert (UI-state (display StartMessage)
                      (relation-asserted make_money)
                      (valid-answers yes_money no_money)))
)

(defrule choose_brain_question ""
    (logical (make_money yes_money))
    =>
    (assert (UI-state (display MoneyMessage)
                      (relation-asserted use_brain)
                      (valid-answers yes_brain no_brain)))
)


(defrule choose_office_question ""
    (logical (use_brain yes_brain))
    =>
    (assert (UI-state (display OfficeMessage)
                      (relation-asserted office)
                      (valid-answers yes_office no_office)))
)

(defrule choose_office_question ""
    (logical (use_brain yes_brain))
    =>
    (assert (UI-state (display OfficeMessage)
                      (relation-asserted office)
                      (valid-answers yes_office no_office)))
)


(defrule choose_MCmaster_question ""
    (logical (office yes_office))
    =>
    (assert (UI-state (display MCmasterMessage)
                      (relation-asserted MCmaster)
                      (valid-answers yes_MCmaster no_MCmaster)))
)

(defrule choose_science_question ""
    (logical (MCmaster yes_MCmaster))
    =>
    (assert (UI-state (display scienceMessage)
                      (relation-asserted science)
                      (valid-answers yes_science no_science)))
)

(defrule answer_research ""
    (logical (science yes_science))
    =>
    (assert (UI-state (display researchMessage)
                      (relation-asserted research)
                      (state final)))
)

(defrule answer_mcMasterA ""
    (logical (science no_science))
    =>
    (assert (UI-state (display mcMasterAMessage)
                      (relation-asserted mcMasterA)
                      (state final)))
)

(defrule choose_decent_question ""
    (logical (MCmaster no_MCmaster))
    =>
    (assert (UI-state (display decentMessage)
                      (relation-asserted decent)
                      (valid-answers yes_decent no_decent)))
)

(defrule choose_coding_q ""
    (logical (decent yes_decent))
    =>
    (assert (UI-state (display codingMessage)
                      (relation-asserted coding)
                      (valid-answers yes_coding no_coding)))
)

(defrule answer_Software ""
    (logical (coding yes_coding))
    =>
    (assert (UI-state (display SoftwareMessage)
                      (relation-asserted Software)
                      (state final)))
)

(defrule answer_admin ""
    (logical (coding no_coding))
    =>
    (assert (UI-state (display adminMessage)
                      (relation-asserted admin)
                      (state final)))
)

(defrule answer_civil ""
    (logical (decent no_decent))
    =>
    (assert (UI-state (display civilMessage)
                      (relation-asserted civil)
                      (state final)))
)

(defrule choose_boss_q ""
    (logical (office no_office))
    =>
    (assert (UI-state (display bossMessage)
                      (relation-asserted boss)
                      (valid-answers yes_boss no_boss)))
)

(defrule choose_academics_q ""
    (logical (boss yes_boss))
    =>
    (assert (UI-state (display academicsMessage)
                      (relation-asserted academics)
                      (valid-answers yes_academics no_academics)))
)

(defrule choose_outside_q ""
    (logical (boss no_boss))
    =>
    (assert (UI-state (display outsideMessage)
                      (relation-asserted outside)
                      (valid-answers yes_outside no_outside)))
)


(defrule answer_CampLeader ""
    (logical (outside yes_outside))
    =>
    (assert (UI-state (display CampMessage)
                      (relation-asserted Camp)
                      (state final)))
)

(defrule answer_museum ""
    (logical (outside no_outside))
    =>
    (assert (UI-state (display museumMessage)
                      (relation-asserted museum)
                      (state final)))
)


(defrule choose_teaching_q ""
    (logical (academics yes_academics))
    =>
    (assert (UI-state (display teachingMessage)
                      (relation-asserted teaching)
                      (valid-answers yes_teaching no_teaching)))
)

(defrule choose_artistic_q ""
    (logical (academics no_academics))
    =>
    (assert (UI-state (display artisticMessage)
                      (relation-asserted artistic)
                      (valid-answers yes_artistic no_artistic)))
)

(defrule answer_tutor ""
    (logical (teaching yes_teaching))
    =>
    (assert (UI-state (display tutorMessage)
                      (relation-asserted tutor)
                      (state final)))
)

(defrule answer_Usra ""
    (logical (teaching no_teaching))
    =>
    (assert (UI-state (display UsraMessage)
                      (relation-asserted Usra)
                      (state final)))
)


(defrule answer_REFORMER ""
    (logical (artistic yes_artistic))
    =>
    (assert (UI-state (display reformerMessage)
                      (relation-asserted reformer)
                      (state final)))
)

(defrule answer_owner ""
    (logical (artistic no_artistic))
    =>
    (assert (UI-state (display ownerMessage)
                      (relation-asserted owner)
                      (state final)))
)

(defrule choose_outside1_q ""
    (logical (use_brain no_brain))
    =>
    (assert (UI-state (display outside1Message)
                      (relation-asserted outside1)
                      (valid-answers yes_outside1 no_outside1)))
)

(defrule choose_labour_q ""
    (logical (outside1 yes_outside1))
    =>
    (assert (UI-state (display labourMessage)
                      (relation-asserted labour)
                      (valid-answers yes_labour no_labour)))
)

(defrule choose_food_q ""
    (logical (outside1 no_outside1))
    =>
    (assert (UI-state (display foodMessage)
                      (relation-asserted food)
                      (valid-answers yes_food no_food)))
)

(defrule choose_camping_q ""
    (logical (labour no_labour))
    =>
    (assert (UI-state (display campingMessage)
                      (relation-asserted camping)
                      (valid-answers yes_camping no_camping)))
)

(defrule answer_park ""
    (logical (camping yes_camping))
    =>
    (assert (UI-state (display parkMessage)
                      (relation-asserted park)
                      (state final)))
)

(defrule answer_fruit ""
    (logical (camping no_camping))
    =>
    (assert (UI-state (display fruitMessage)
                      (relation-asserted fruit)
                      (state final)))
)

(defrule choose_showering_q ""
    (logical (labour yes_labour))
    =>
    (assert (UI-state (display showeringMessage)
                      (relation-asserted showering)
                      (valid-answers yes_showering no_showering)))
)

(defrule answer_tree ""
    (logical (showering yes_showering))
    =>
    (assert (UI-state (display treeMessage)
                      (relation-asserted tree)
                      (state final)))
)

(defrule choose_animals_q ""
    (logical (showering no_showering))
    =>
    (assert (UI-state (display animalsMessage)
                      (relation-asserted animals)
                      (valid-answers yes_animals no_animals)))
)

(defrule answer_farm ""
    (logical (animals yes_animals))
    =>
    (assert (UI-state (display farmMessage)
                      (relation-asserted tree)
                      (state final)))
)

(defrule answer_land ""
    (logical (animals no_animals))
    =>
    (assert (UI-state (display landMessage)
                      (relation-asserted tree)
                      (state final)))
)

(defrule choose_skills_q ""
    (logical (food yes_food))
    =>
    (assert (UI-state (display skillsMessage)
                      (relation-asserted skills)
                      (valid-answers yes_skills no_skills)))
)

(defrule choose_telling_q ""
    (logical (food no_food))
    =>
    (assert (UI-state (display tellingMessage)
                      (relation-asserted telling)
                      (valid-answers yes_telling no_telling)))
)

(defrule choose_manhattan_q ""
    (logical (skills yes_skills))
    =>
    (assert (UI-state (display manhattanMessage)
                      (relation-asserted manhattan)
                      (valid-answers yes_manhattan no_manhattan)))
)

(defrule choose_greasy_q ""
    (logical (skills no_skills))
    =>
    (assert (UI-state (display greasyMessage)
                      (relation-asserted greasy)
                      (valid-answers yes_greasy no_greasy)))
)

(defrule choose_burgers_q ""
    (logical (greasy no_greasy))
    =>
    (assert (UI-state (display burgersMessage)
                      (relation-asserted burgers)
                      (valid-answers yes_burgers no_burgers)))
)

(defrule answer_bartender ""
    (logical (manhattan yes_manhattan))
    =>
    (assert (UI-state (display bartenderMessage)
                      (relation-asserted bartender)
                      (state final)))
)

(defrule answer_barrista ""
    (logical (manhattan no_manhattan))
    =>
    (assert (UI-state (display barristaMessage)
                      (relation-asserted barrista)
                      (state final)))
)


(defrule answer_FASTFOOD ""
    (logical (burgers yes_burgers))
    =>
    (assert (UI-state (display fastfoodMessage)
                      (relation-asserted fastfood)
                      (state final)))
)

(defrule answer_prepcook ""
    (logical (burgers no_burgers))
    =>
    (assert (UI-state (display prepcookMessage)
                      (relation-asserted prepcook)
                      (state final)))
)

(defrule answer_grocery ""
    (logical (greasy yes_greasy))
    =>
    (assert (UI-state (display groceryMessage)
                      (relation-asserted grocery)
                      (state final)))
)

(defrule choose_BULKY_q ""
    (logical (telling yes_telling))
    =>
    (assert (UI-state (display bulkyMessage)
                      (relation-asserted bulky)
                      (valid-answers yes_bulky no_bulky)))
)

(defrule choose_swimmer_q ""
    (logical (bulky no_bulky))
    =>
    (assert (UI-state (display swimmerMessage)
                      (relation-asserted swimmer)
                      (valid-answers yes_swimmer no_swimmer)))
)

(defrule answer_security ""
    (logical (bulky yes_bulky))
    =>
    (assert (UI-state (display securityMessage)
                      (relation-asserted security)
                      (state final)))
)

(defrule answer_LIFEguard ""
    (logical (swimmer yes_swimmer))
    =>
    (assert (UI-state (display lifeguardMessage)
                      (relation-asserted lifeguard)
                      (state final)))
)

(defrule answer_referee ""
    (logical (swimmer no_swimmer))
    =>
    (assert (UI-state (display refereeMessage)
                      (relation-asserted referee)
                      (state final)))
)


(defrule choose_travelling_q ""
    (logical (telling no_telling))
    =>
    (assert (UI-state (display travellingMessage)
                      (relation-asserted travelling)
                      (valid-answers yes_travelling no_travelling)))
)

(defrule choose_needles_q ""
    (logical (travelling no_travelling))
    =>
    (assert (UI-state (display needlesMessage)
                      (relation-asserted needles)
                      (valid-answers yes_needles no_needles)))
)

(defrule answer_promoter ""
    (logical (travelling yes_travelling))
    =>
    (assert (UI-state (display promoterMessage)
                      (relation-asserted promoter)
                      (state final)))
)

(defrule answer_clerk ""
    (logical (needles yes_needles))
    =>
    (assert (UI-state (display clerkMessage)
                      (relation-asserted clerk)
                      (state final)))
)

(defrule answer_medical ""
    (logical (needles no_needles))
    =>
    (assert (UI-state (display medicalMessage)
                      (relation-asserted medical)
                      (state final)))
)


(defrule choose_SPEND_q ""
    (logical (make_money no_money))
    =>
    (assert (UI-state (display spendMessage)
                      (relation-asserted spend)
                      (valid-answers yes_spend no_spend)))
)

(defrule choose_hamilton_q ""
    (logical (spend yes_spend))
    =>
    (assert (UI-state (display hamiltonMessage)
                      (relation-asserted hamilton)
                      (valid-answers yes_hamilton no_hamilton)))
)

(defrule choose_talent_q ""
    (logical (spend no_spend))
    =>
    (assert (UI-state (display talentMessage)
                      (relation-asserted talent)
                      (valid-answers yes_talent no_talent)))
)

(defrule choose_brain2_q ""
    (logical (hamilton yes_hamilton))
    =>
    (assert (UI-state (display brain2Message)
                      (relation-asserted brain2)
                      (valid-answers yes_brain2 no_brain2)))
)

(defrule answer_intern ""
    (logical (talent no_talent))
    =>
    (assert (UI-state (display internMessage)
                      (relation-asserted intern)
                      (state final)))
)

(defrule answer_musician ""
    (logical (talent yes_talent))
    =>
    (assert (UI-state (display musicianMessage)
                      (relation-asserted musician)
                      (state final)))
)


(defrule answer_traveller ""
    (logical (hamilton no_hamilton))
    =>
    (assert (UI-state (display travellerMessage)
                      (relation-asserted traveller)
                      (state final)))
)

(defrule answer_summerstudent ""
    (logical (brain2 yes_brain2))
    =>
    (assert (UI-state (display summerstudentMessage)
                      (relation-asserted summerstudent)
                      (state final)))
)

(defrule answer_potato ""
    (logical (brain2 no_brain2))
    =>
    (assert (UI-state (display potatoMessage)
                      (relation-asserted potato)
                      (state final)))
)

;;;*************************
;;;* GUI INTERACTION RULES *
;;;*************************

(defrule ask-question

   (declare (salience 5))

   (UI-state (id ?id))

   ?f <- (state-list (sequence $?s&:(not (member$ ?id ?s))))

   =>

   (modify ?f (current ?id)
              (sequence ?id ?s))

   (halt))

(defrule handle-next-no-change-none-middle-of-chain

   (declare (salience 10))

   ?f1 <- (next ?id)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))

   =>

   (retract ?f1)

   (modify ?f2 (current ?nid))

   (halt))

(defrule handle-next-response-none-end-of-chain

   (declare (salience 10))

   ?f <- (next ?id)

   (state-list (sequence ?id $?))

   (UI-state (id ?id)
             (relation-asserted ?relation))

   =>

   (retract ?f)

   (assert (add-response ?id)))

(defrule handle-next-no-change-middle-of-chain

   (declare (salience 10))

   ?f1 <- (next ?id ?response)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))

   (UI-state (id ?id) (response ?response))

   =>

   (retract ?f1)

   (modify ?f2 (current ?nid))

   (halt))

(defrule handle-next-change-middle-of-chain

   (declare (salience 10))

   (next ?id ?response)

   ?f1 <- (state-list (current ?id) (sequence ?nid $?b ?id $?e))

   (UI-state (id ?id) (response ~?response))

   ?f2 <- (UI-state (id ?nid))

   =>

   (modify ?f1 (sequence ?b ?id ?e))

   (retract ?f2))

(defrule handle-next-response-end-of-chain

   (declare (salience 10))

   ?f1 <- (next ?id ?response)

   (state-list (sequence ?id $?))

   ?f2 <- (UI-state (id ?id)
                    (response ?expected)
                    (relation-asserted ?relation))

   =>

   (retract ?f1)

   (if (neq ?response ?expected)
      then
      (modify ?f2 (response ?response)))

   (assert (add-response ?id ?response)))

(defrule handle-add-response

   (declare (salience 10))

   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))

   ?f1 <- (add-response ?id ?response)

   =>

   (str-assert (str-cat "(" ?relation " " ?response ")"))

   (retract ?f1))

(defrule handle-add-response-none

   (declare (salience 10))

   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))

   ?f1 <- (add-response ?id)

   =>

   (str-assert (str-cat "(" ?relation ")"))

   (retract ?f1))

(defrule handle-prev

   (declare (salience 10))

   ?f1 <- (prev ?id)

   ?f2 <- (state-list (sequence $?b ?id ?p $?e))

   =>

   (retract ?f1)

   (modify ?f2 (current ?p))

   (halt))
