--genere moi 100 questions variées et de difficulte varies mais 70% difficile et 30% moyen du genre: 
--INSERT INTO questions (id, question, answer, created_at, answer_detail, category, is_video_only, image_file) 
--VALUES (16, 'The Eiffel Tower is over 300 meters tall', 1, '2026-01-09 23:22:52', 'The Eiffel Tower is exactly 330 meters tall including its antennas.', 
--'general', 1, 'eiffel_tower.jpg'), mais dans la categorie "fun fact" du genre: 
--(28, 'A volcano can erupt underwater', 1, '2026-01-11 02:37:55', '', 'fun fact', 1, 'volcano.jpg'), 
--La colonne answer_detail, peut etre null, donc rempli 50% des questions seulement. 
--Le reste laisse vide. la colonne created at par defaut. doonne moi 3 exemples d'abord que je talide puis tu fais les 100
-- exemple: INSERT INTO `questions`
(`question`, `answer`, `answer_detail`, `category`, `is_video_only`, `image_file`)
VALUES
('The song "Happy Birthday" was once copyrighted', 1, 'It entered public domain in 2016.', 'music', false, 'happy_birthday.jpg'),
('Mozart wrote his first symphony at age 8', 1, NULL, 'music', false, 'mozart.jpg'),


--
genere moi 100 questions vrai ou false variées et de difficulte varies mais 70% difficile et 30% moyen.
-- La colonne answer_detail, peut etre null, donc rempli pour 50% des questions seulement, et il doit repondre ou expliquer en une phrase courte pourquoi c'est vrai ou c'est faux, ou alors juste donner des details si c'est pertinent. exemple (Yes, Manchester city won the treble in 2023.) ou (No, the Premier League started in 1992.) ou sans Yes ou No, juste une explication du genre (It is the most popular sport worldwide.) ou (It was invented in England in the 19th century.)
 Il faut que ca soit une phrase courte. Le 50% restant tu laisse vide. la colonne created at par defaut. 
La colonne image file contient un nom generique (ex: ronaldo.jsp, soccer.jpg, barcelona.jsp, soccer_referee.jsg) et peut etre reutilisé, pas precis et avec extension .jpg
Ecrit insert into juste une fois et les values sur une seule ligne par question. 
Mets is_video_only a false pour tous
Je veux 60% de vrai et 40% de faux.
Il faut que les questions soient le plus varie possible et evite de donner des questions faux ou vrai super Evident et facile.
Vu que les questions seront de categorie differente, il faudra que pour 60% des questions que tu genere, tu precise le sujet si besoin. Exemple si la categorie est "mange", ttu peux dire "Naruto is a jinchuriki since he was born", mais tu ne peux pas dire "SonGoku is the tailed beast with 4 queues", car Songoku est aussi le nom d'un autre manga, donc ce que je veux dire c'est que si le contexte n'est pas precis et que la question n'est pas trop longues, tu devras ajouter des : "In the naruto manga, ..." au debut ou a la fin de la question.
Parfait, maintenant avec ces condition, genere moi 100 question avec categorie: "Soccer"

-- Manga
INSERT INTO `questions` (`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`) VALUES ('One Piece is the best-selling manga of all time',1,'Yes, it holds the all-time sales record.','manga',false,'one_piece.jpg');
INSERT INTO `questions` (`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`) VALUES ('Naruto was originally planned to be a short manga',1,'Yes, Kishimoto planned a shorter story.','manga',false,'naruto.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Attack on Titan ended with a happy ending',0,'No, the ending is tragic and controversial.','manga',false,'aot.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Dragon Ball popularized power scaling in shonen manga',1,'Yes, it heavily influenced battle shonen tropes.','manga',false,'dragon_ball.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Bleach was cancelled by its author',0,'No, it ended due to health and scheduling issues.','manga',false,'bleach.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Demon Slayer became popular mainly due to its anime',1,'Yes, the anime boosted manga sales massively.','manga',false,'demon_slayer.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Jujutsu Kaisen author was inspired by Bleach',1,'Yes, Gege Akutami cited Bleach as influence.','manga',false,'jjk.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('My Hero Academia takes place in a post-apocalyptic world',0,'No, it takes place in a superhero society.','manga',false,'mha.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Death Note was first published in Weekly Shonen Jump',1,'Yes, it debuted in Shonen Jump.','manga',false,'death_note.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Light Yagami is considered a traditional hero',0,'No, he is an anti-hero/villain.','manga',false,'light.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Chainsaw Man mixes horror with dark comedy',1,'Yes, it blends gore and absurd humor.','manga',false,'chainsaw_man.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Tokyo Ghoul was originally intended as a romance manga',0,'No, it was planned as dark fantasy.','manga',false,'tokyo_ghoul.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Hunter x Hunter is known for frequent hiatuses',1,'Yes, the author often pauses the series.','manga',false,'hxh.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Fullmetal Alchemist has two different anime endings',1,'Yes, Brotherhood followed the manga.','manga',false,'fma.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Berserk was completed before the author’s death',0,'No, it continues posthumously.','manga',false,'berserk.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('One Punch Man started as a webcomic',1,'Yes, it began online before serialization.','manga',false,'one_punch_man.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('JoJo’s Bizarre Adventure changes protagonists each part',1,'Yes, each part follows a new JoJo.','manga',false,'jojo.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Spy x Family is a dark psychological manga',0,'No, it is mainly comedy and action.','manga',false,'spy_family.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Vinland Saga is inspired by real historical figures',1,'Yes, it uses Viking history.','manga',false,'vinland_saga.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Attack on Titan was the first manga to use 3D maneuver gear',1,'Yes, it introduced a unique combat system.','manga',false,'aot_gear.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Black Clover was inspired by Naruto',1,'Yes, rivalry themes are similar.','manga',false,'black_clover.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Dragon Ball Z was originally meant to end with Frieza',1,'Yes, that was the initial plan.','manga',false,'frieza.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Haikyuu!! is considered one of the best sports manga',1,'Yes, it is widely praised.','manga',false,'haikyuu.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Slam Dunk is more popular outside Japan than inside',0,'No, it was massive in Japan.','manga',false,'slam_dunk.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Demon Slayer holds the record for fastest manga sales growth',1,'Yes, during its peak years.','manga',false,'demon_sales.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('My Hero Academia is set in the same universe as One Punch Man',0,'No, they are unrelated.','manga',false,'mha_opm.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Tokyo Revengers mixes time travel with gang drama',1,'Yes, that is its core concept.','manga',false,'tokyo_revengers.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Berserk heavily influenced Dark Souls games',1,'Yes, creators confirmed inspiration.','manga',false,'berserk_ds.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Attack on Titan explores political and philosophical themes',1,'Yes, beyond pure action.','manga',false,'aot_themes.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('One Piece has been running for over 25 years',1,'Yes, it started in 1997.','manga',false,'one_piece_years.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Vinland Saga shifts from action to pacifism',1,'Yes, Thorfinn’s philosophy changes.','manga',false,'vinland_pacifism.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('JoJo popularized stylized poses in manga',1,'Yes, it became iconic.','manga',false,'jojo_pose.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Attack on Titan manga finished before its anime',1,'Yes, the manga ended first.','manga',false,'aot_manga.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Berserk is considered one of the darkest manga ever',1,'Yes, due to extreme themes.','manga',false,'berserk_dark.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`) VALUES ('Luffy can stretch because he ate the Gomu Gomu no Mi',0,'No, it was revealed to be the Hito Hito no Mi, Model: Nika.','manga',false,'luffy_nika.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('In One Piece, Gear 5 represents the awakening of Luffy’s Devil Fruit',1,'Yes, it is the awakened form of his fruit.','manga',false,'gear5.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('In One Piece, Zoro has permanently lost his left eye in One Piece',1,'Yes, it has never been opened again.','manga',false,'zoro_eye.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('In One Piece, Shanks uses a Devil Fruit power',0,'No, Shanks relies on Haki.','manga',false,'shanks.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('In One Piece, Kaido was defeated in a 1v1 fight',0,'No, multiple fighters weakened him first.','manga',false,'kaido.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Eren Yeager can see future memories',1,'Yes, through the Attack Titan’s power.','manga',false,'eren_future.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Mikasa is biologically linked to the Ackerman clan’s power',1,'Yes, Ackermans possess awakened abilities.','manga',false,'mikasa.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Levi Ackerman is the strongest Titan shifter',0,'No, he is not a Titan shifter.','manga',false,'levi.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The Rumbling activates all Titans worldwide',0,'No, it activates the Wall Titans only.','manga',false,'rumbling.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Eren dies at the end of Attack on Titan',1,'Yes, he is killed by Mikasa.','manga',false,'eren_end.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Gojo Satoru’s Infinity stops attacks automatically',1,'Yes, it creates infinite distance.','manga',false,'gojo_infinity.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Sukuna originally possessed Megumi first',0,'No, Yuji was Sukuna’s first vessel.','manga',false,'sukuna.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Domain Expansions guarantee a hit unless countered',1,'Yes, unless another domain or technique interferes.','manga',false,'domain_expansion.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Gojo can be harmed inside his own domain',0,'No, his domain strengthens him further.','manga',false,'gojo_domain.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Sukuna can use Megumi’s Ten Shadows Technique',1,'Yes, after taking over his body.','manga',false,'ten_shadows.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Light Yagami needed a face and name to kill',1,'Yes, both are required by the Death Note.','manga',false,'death_note_rules.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('L could legally arrest Light without proof',0,'No, proof was required to act.','manga',false,'l_detective.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Ryuk cares about human morality',0,'No, he is neutral and bored.','manga',false,'ryuk.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The Death Note has a limit on how many names it can store',0,'No, it has no known limit.','manga',false,'death_note.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Light dies believing he is justice',1,'Yes, he never admits defeat.','manga',false,'light_end.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Tanjiro’s breathing style is Hinokami Kagura',1,'Yes, it is a Sun Breathing derivative.','manga',false,'tanjiro.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Nezuko remains immune to sunlight permanently',0,'No, she later overcomes it uniquely.','manga',false,'nezuko.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Muzan can kill demons remotely',1,'Yes, he controls their cells.','manga',false,'muzan.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('All Hashira survive the final arc',0,'No, several Hashira die.','manga',false,'hashira.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Demon Slayer demons regenerate using human blood',1,'Yes, blood strengthens them.','manga',false,'demons.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Guts uses the Berserker Armor at the cost of his body',1,'Yes, it damages him severely.','manga',false,'berserker_armor.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Griffith sacrificed the Band of the Hawk',1,'Yes, during the Eclipse.','manga',false,'eclipse.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Casca fully recovers mentally immediately',0,'No, her recovery is gradual.','manga',false,'casca.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The Behelit activates by choice',0,'No, it activates when fate demands.','manga',false,'behelit.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Femto is a member of the God Hand',1,'Yes, after Griffith’s rebirth.','manga',false,'femto.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Denji’s heart is actually Pochita',1,'Yes, Pochita replaced his heart.','manga',false,'pochita.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Makima controls people through fear alone',0,'No, her power relies on contracts and dominance.','manga',false,'makima.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Devils grow stronger the more they are feared',1,'Yes, fear fuels their power.','manga',false,'devils.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Chainsaw Man erases devils permanently',1,'Yes, devils eaten by him vanish from existence.','manga',false,'chainsaw_power.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Denji fights mainly for heroic reasons',0,'No, his motivations are selfish and simple.','manga',false,'denji.jpg');
 
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Thorfinn initially seeks revenge against Askeladd',1,'Yes, revenge drives him early on.','manga',false,'thorfinn.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Askeladd is purely evil',0,'No, he has complex motivations.','manga',false,'askeladd.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Vinland Saga later focuses on pacifism',1,'Yes, violence is rejected later.','manga',false,'vinland.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Thorfinn becomes physically weaker later',1,'Yes, he abandons combat.','manga',false,'thorfinn_change.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The story is based entirely on myth',0,'No, it uses real Viking history.','manga',false,'viking.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Ichigo has powers from multiple races',1,'Yes, Shinigami, Hollow, Quincy and Human.','manga',false,'ichigo.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Aizen planned Ichigo’s entire life',1,'Yes, he manipulated events.','manga',false,'aizen.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Bankai can be used without training',0,'No, mastering it takes years.','manga',false,'bankai.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Hollows are corrupted human souls',1,'Yes, they originate from lost souls.','manga',false,'hollow.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Ichigo permanently loses his powers',0,'No, he regains them later.','manga',false,'ichigo_power.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Naruto contains Kurama entirely by birth',0,'No, Kurama was sealed after birth.','manga',false,'kurama.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Sasuke awakens Rinnegan through Hagoromo',1,'Yes, it was granted to him.','manga',false,'sasuke_rinnegan.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Itachi killed his clan purely out of hatred',0,'No, he acted under orders.','manga',false,'itachi.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Naruto becomes Hokage at a young age',0,'No, he becomes Hokage as an adult.','manga',false,'naruto_hokage.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Chakra is a mix of physical and spiritual energy',1,'Yes, both are required.','manga',false,'chakra.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Blue Lock rewards teamwork over ego',0,'No, ego is the core philosophy.','manga',false,'blue_lock_ego.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Isagi’s main weapon is spatial awareness',1,'Yes, it defines his playstyle.','manga',false,'isagi.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Elimination in Blue Lock means career death',1,'Yes, players are banned from national team.','manga',false,'blue_lock_rule.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Blue Lock is supervised by FIFA',0,'No, it is fictional.','manga',false,'blue_lock_fifa.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The project aims to create the world’s best striker',1,'Yes, not a full team.','manga',false,'blue_lock_goal.jpg');

-- Soccer
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`) VALUES ('Brazil has won the FIFA World Cup more times than any other country',1,'Yes, Brazil has won the World Cup five times.','soccer',false,'brazil_wc.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Lionel Messi won his first Ballon d’Or after age 25',0,'No, Messi won his first Ballon d’Or at age 22.','soccer',false,'messi_ballondor.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The World Cup has been hosted in Africa only once',1,'Yes, South Africa hosted it in 2010.','soccer',false,'wc_africa.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Cristiano Ronaldo has scored in five different World Cups',1,'Yes, he scored in every World Cup from 2006 to 2022.','soccer',false,'ronaldo_wc.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('A goalkeeper cannot score a goal',0,'No, goalkeepers can score goals.','soccer',false,'goalkeeper_goal.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The Premier League started in 1992',1,'Yes, it replaced the old First Division.','soccer',false,'premier_league.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Pelé won three World Cups',1,'Yes, he won in 1958, 1962, and 1970.','soccer',false,'pele_wc.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('No African team has ever reached a World Cup semifinal',0,'No, Morocco reached the semifinals in 2022.','soccer',false,'morocco_wc.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The offside rule has always existed in football',0,'No, it was introduced later in the sport’s history.','soccer',false,'offside.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The Ballon d’Or was originally only for European players',1,'Yes, non-Europeans were excluded at first.','soccer',false,'ballon_dor.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('A red card always results in a match suspension',0,'No, suspensions depend on competition rules.','soccer',false,'red_card.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Germany has won the World Cup more than Italy',0,'No, both have four World Cups.','soccer',false,'germany_italy.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('VAR was first used in a World Cup in 2018',1,'Yes, Russia 2018 introduced VAR.','soccer',false,'var_wc.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The Champions League final has always been played at night',0,'No, early finals were daytime matches.','soccer',false,'ucl_final.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Zinedine Zidane scored twice in the 1998 World Cup final',1,'Yes, both goals were headers.','soccer',false,'zidane_1998.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('No player has ever scored a hat-trick in a World Cup final',0,'No, Geoff Hurst did it in 1966.','soccer',false,'hurst_1966.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The fastest red card in football history was under 5 seconds',1,'Yes, it happened after kickoff.','soccer',false,'fast_red.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Barcelona has never been relegated from La Liga',1,'Yes, Barcelona has always stayed in La Liga.','soccer',false,'barcelona.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('A match can legally end 0–0',1,'Yes, draws without goals are allowed.','soccer',false,'draw.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The first World Cup was held in Europe',0,'No, it was held in Uruguay.','soccer',false,'wc_1930.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('A football team must have exactly 11 players on the field',0,'No, matches can continue with fewer players.','soccer',false,'players.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Real Madrid has won the Champions League more than any other club',1,'Yes, they are the most successful club.','soccer',false,'real_madrid.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Penalty shootouts were always part of football rules',0,'No, they were introduced later.','soccer',false,'penalty.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The yellow card was introduced after the 1966 World Cup',1,'Yes, it was added to improve communication.','soccer',false,'yellow_card.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Goal-line technology uses cameras to detect goals',1,'Yes, multiple cameras track the ball.','soccer',false,'goal_line.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('A referee can award a goal without the ball crossing the line',0,'No, the ball must fully cross the line.','soccer',false,'goal_rule.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The FIFA headquarters is located in Switzerland',1,'Yes, it is based in Zurich.','soccer',false,'fifa_hq.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('All professional football pitches have the same dimensions',0,'No, pitch sizes can vary within limits.','soccer',false,'pitch.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The Copa Libertadores is older than the Champions League',1,'Yes, it started in 1960.','soccer',false,'libertadores.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('A player can score directly from a corner kick',1,'Yes, it is called an olimpico.','soccer',false,'corner_goal.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The World Cup trophy has always been the same design',0,'No, the original Jules Rimet trophy was replaced.','soccer',false,'wc_trophy.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('A football match lasts exactly 90 minutes',0,'No, added time can extend it.','soccer',false,'extra_time.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Only captains are allowed to speak to the referee',0,'No, others can speak but captains have priority.','soccer',false,'referee.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('UEFA organizes the Champions League',1,'Yes, it is a European competition.','soccer',false,'uefa.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('A team can make unlimited substitutions',0,'No, substitutions are limited by rules.','soccer',false,'substitution.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The handball rule has never changed',0,'No, it has been modified many times.','soccer',false,'handball.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Argentina won the World Cup in 2022',1,'Yes, they defeated France in the final.','soccer',false,'argentina_2022.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The away goals rule still applies in the Champions League',0,'No, UEFA removed it in 2021.','soccer',false,'away_goals.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('A player can receive a red card after the final whistle',1,'Yes, disciplinary actions still apply.','soccer',false,'post_match_red.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The World Cup is held every two years',0,'No, it is held every four years.','soccer',false,'wc_cycle.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Futsal is played with a smaller ball',1,'Yes, the ball is designed to bounce less.','soccer',false,'futsal.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('A referee can stop a match permanently',1,'Yes, for safety or serious incidents.','soccer',false,'match_stop.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('England invented modern football rules',1,'Yes, the FA codified the rules.','soccer',false,'england_fa.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('All football boots are made with metal studs',0,'No, many use rubber or plastic studs.','soccer',false,'boots.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The Champions League anthem is based on classical music',1,'Yes, it is adapted from Handel.','soccer',false,'ucl_anthem.jpg');

-- Technology 100
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The first computer virus was created in the 1970s',1,'Creeper appeared in 1971.','technology',false,'computer_virus.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The Internet was originally designed for entertainment',0,'It began as a military research network.','technology',false,'arpanet.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Email existed before the World Wide Web',1,'Email dates back to the early 1970s.','technology',false,'email.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Moore’s Law predicts exponential growth in transistor count',1,'It observes doubling roughly every two years.','technology',false,'moores_law.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The first smartphone was the iPhone',0,'IBM Simon existed in 1994.','technology',false,'ibm_simon.jpg');
 
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Linux was originally developed as a hobby project',1,'Linus Torvalds started it in 1991.','technology',false,'linux.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Bluetooth is named after a Viking king',1,'Harald Bluetooth united Denmark.','technology',false,'bluetooth.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The term “bug” in computing came from a real insect',1,'A moth caused a hardware issue.','technology',false,'computer_bug.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Quantum computers store data as bits',0,'They use qubits instead.','technology',false,'quantum.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The first website is still online',1,'Yes, the website is about the WWW project.','technology',false,'first_website.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Wi-Fi stands for Wireless Fidelity',0,'It is not an acronym.','technology',false,'wifi.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The QWERTY keyboard was designed to slow typists',1,'It reduced mechanical jams.','technology',false,'qwerty.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Passwords were introduced in the 1980s',0,'They existed as early as the 1960s.','technology',false,'password.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('NASA helped invent the computer mouse',0,'It was developed at Stanford.','technology',false,'mouse.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The first hard drive weighed over one ton',1,'IBM 305 RAMAC was massive.','technology',false,'hard_drive.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Open-source software is always free',0,'Some open-source software is paid.','technology',false,'opensource.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('GPS requires signals from at least four satellites',1,'To calculate accurate positioning.','technology',false,'gps.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The original Nintendo used cartridges',1,NULL,'technology',false,'nintendo.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Artificial intelligence can fully explain its decisions',0,'Many models act as black boxes.','technology',false,'ai_blackbox.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The first webcam was used to monitor coffee',1,'At Cambridge University.','technology',false,'webcam.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('CAPTCHA was created to stop bots',1,NULL,'technology',false,'captcha.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('HTML is a programming language',0,'It is a markup language.','technology',false,'html.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The first computer programmer was a woman',1,'Ada Lovelace wrote early algorithms.','technology',false,'ada_lovelace.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Smartphones emit ionizing radiation',0,'They emit non-ionizing radiation.','technology',false,'radiation.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Data stored in the cloud exists physically',1,'It resides on servers.','technology',false,'cloud_servers.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('USB was created to reduce cable clutter',1,NULL,'technology',false,'usb.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Facial recognition works equally well on all faces',0,'Bias issues exist.','technology',false,'facial_recognition.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The first computer game was created in the 1950s',1,'Tennis for Two appeared in 1958.','technology',false,'first_game.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Encryption guarantees 100% data security',0,'Human error still matters.','technology',false,'encryption.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Supercomputers are mainly used for gaming',0,NULL,'technology',false,'supercomputer.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Touchscreens existed before smartphones',1,'Early versions appeared decades earlier.','technology',false,'touchscreen.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Blockchain can only be used for cryptocurrencies',0,'It has many other applications.','technology',false,'blockchain.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The first computer monitor was a modified TV',1,NULL,'technology',false,'monitor.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('All programming languages are based on English',0,'Some use symbols or non-English words.','technology',false,'programming.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('A terabyte equals exactly 1000 gigabytes',0,'In computing it can be 1024.','technology',false,'storage.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Biometric data can be changed like passwords',0,'Biometrics are permanent.','technology',false,'biometric.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The first email message was sent in 1971',1,NULL,'technology',false,'first_email.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Machine learning requires massive datasets',0,'Small datasets can also be used.','technology',false,'machine_learning.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The Internet and the Web are the same thing',0,'The Web runs on the Internet.','technology',false,'internet_web.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Self-driving cars rely on multiple sensor types',1,'Cameras, radar, and lidar.','technology',false,'self_driving.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('All data deleted from a computer is unrecoverable',0,'Data can often be recovered.','technology',false,'data_recovery.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The first domain name ever registered was symbolics.com',1,NULL,'technology',false,'domain.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('5G networks are slower than 4G',0,NULL,'technology',false,'5g.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Early computers were programmed using switches',1,'Physical wiring was required.','technology',false,'early_computer.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Virtual reality can cause motion sickness',1,NULL,'technology',false,'vr.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The first Apple logo featured Isaac Newton',1,'It was later simplified.','technology',false,'apple_logo.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('AI models understand meaning like humans do',0,'They recognize patterns, not understanding.','technology',false,'ai_understanding.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Cybersecurity is only a concern for large companies',0,NULL,'technology',false,'cybersecurity.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Satellites help synchronize global time systems',1,'GPS provides precise time signals.','technology',false,'satellite_time.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The first calculator was digital',0,'Early ones were mechanical.','technology',false,'calculator.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Data centers consume significant global electricity',1,NULL,'technology',false,'data_center.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('All software bugs are easy to fix',0,NULL,'technology',false,'software_bug.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Augmented reality overlays digital content onto the real world',1,NULL,'technology',false,'ar.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The first computer mouse was wireless',0,'It was wired.','technology',false,'mouse_wire.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Technology progress always reduces energy consumption',0,'Some tech increases demand.','technology',false,'energy.jpg');

--Geography 100
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Russia spans more than 11 time zones',1,'It is the largest country on Earth.','geography',false,'russia_map.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Africa has only one time zone',0,'Africa spans multiple time zones.','geography',false,'africa_timezone.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Mount Everest grows slightly every year',1,'Due to tectonic plate movement.','geography',false,'everest.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The Nile is the longest river in the world',0,'The Amazon is often considered longer.','geography',false,'nile.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Australia is wider than the Moon',1,'The Moon is about 3,400 km wide.','geography',false,'australia_moon.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Greenland is the largest island on Earth',1,'Australia is classified as a continent.','geography',false,'greenland.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Europe is larger than South America',0,NULL,'geography',false,'europe_sa.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Japan consists of over 6,000 islands',1,'Many are uninhabited.','geography',false,'japan_islands.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The Sahara is the largest desert in the world',0,'Antarctica is technically the largest.','geography',false,'sahara.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Iceland has no mosquitoes',1,'They cannot survive its climate.','geography',false,'iceland.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Vatican City is smaller than Central Park',1,'It is under 1 km².','geography',false,'vatican.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Brazil borders every South American country',0,'It does not border Chile or Ecuador.','geography',false,'brazil_map.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('There are countries entirely below sea level',1,'The Netherlands is partly below sea level.','geography',false,'netherlands.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Canada has more lakes than the rest of the world combined',1,'It has over 2 million lakes.','geography',false,'canada_lakes.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The equator passes through Europe',0,NULL,'geography',false,'equator.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Indonesia is located on the Pacific Ring of Fire',1,'It has frequent volcanic activity.','geography',false,'indonesia_volcano.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Alaska is closer to Africa than Florida',0,NULL,'geography',false,'alaska_map.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('France has borders in South America',1,'French Guiana is overseas territory.','geography',false,'french_guiana.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The Dead Sea is one of the saltiest bodies of water',1,'Its salinity is extremely high.','geography',false,'dead_sea.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('All European capitals are inland cities',0,NULL,'geography',false,'europe_capitals.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Chile stretches across more than 35 degrees of latitude',1,'It spans a very long north-south range.','geography',false,'chile_map.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Antarctica has active volcanoes',1,'Mount Erebus is still active.','geography',false,'antarctica_volcano.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The Amazon rainforest is shrinking every year',1,'Deforestation is ongoing.','geography',false,'amazon.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The UK is closer to the US than to Russia',1,'Measured coast to coast.','geography',false,'uk_distance.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Spain is part of Africa',0,NULL,'geography',false,'spain_africa.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('There are more pyramids in Sudan than Egypt',1,'Sudan has over 200 pyramids.','geography',false,'sudan_pyramids.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('China has only one official time zone',1,'Despite its large size.','geography',false,'china_timezone.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Mexico is part of Central America',0,NULL,'geography',false,'mexico_map.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Lake Baikal contains about 20% of Earth’s fresh water',1,'It is the deepest lake.','geography',false,'baikal.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The Mediterranean Sea is shrinking',1,'Africa and Europe are converging.','geography',false,'mediterranean.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('No country lies entirely in the Southern Hemisphere',0,NULL,'geography',false,'southern_hemi.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Nepal has the highest elevation range of any country',1,'From near sea level to Everest.','geography',false,'nepal.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The Arctic is a continent',0,NULL,'geography',false,'arctic.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Turkey lies on two continents',1,'Europe and Asia.','geography',false,'turkey_map.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('All deserts are hot',0,'Some deserts are frozen.','geography',false,'cold_desert.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The Panama Canal connects two oceans',1,'Atlantic and Pacific.','geography',false,'panama_canal.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Switzerland has no coastline',1,NULL,'geography',false,'switzerland.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The longest mountain range is the Andes',0,'The mid-ocean ridge is longer.','geography',false,'andes.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Italy has more UNESCO sites than any other country',1,NULL,'geography',false,'italy_unesco.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Every country has a national capital',0,'Some territories do not.','geography',false,'capital.jpg');
 
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Mongolia has the lowest population density',1,'One of the sparsest globally.','geography',false,'mongolia.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('New Zealand is part of Australia',0,NULL,'geography',false,'nz_map.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The Great Wall is visible from space with the naked eye',0,'This is a myth.','geography',false,'great_wall.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Iran has more mountains than deserts',1,'Zagros and Alborz ranges dominate.','geography',false,'iran_mountains.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Africa is split by the Prime Meridian',1,NULL,'geography',false,'prime_meridian.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('South Africa has three capital cities',1,'Each serves a different function.','geography',false,'south_africa.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('All volcanoes are found on land',0,NULL,'geography',false,'underwater_volcano.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The Caspian Sea is technically a lake',1,'It is landlocked.','geography',false,'caspian.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The equator passes through Kenya',1,NULL,'geography',false,'kenya.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('No country begins with the letter A',0,'Afghanistan, Albania, etc.','geography',false,'countries_a.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Indonesia is the most volcanically active country',1,NULL,'geography',false,'indonesia.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('All rivers flow southward',0,NULL,'geography',false,'river_flow.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The US state with the most coastline is Alaska',1,NULL,'geography',false,'alaska.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Antarctica has no permanent residents',1,NULL,'geography',false,'antarctica_station.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Paris is south of Montreal',1,NULL,'geography',false,'paris_montreal.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Bolivia has lost its coastline',1,'After the War of the Pacific.','geography',false,'bolivia.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The equator is the hottest place on Earth',0,'Deserts are often hotter.','geography',false,'equator_heat.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Asia is the largest continent by land area',1,NULL,'geography',false,'asia.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Every country has access to fresh water',0,NULL,'geography',false,'water_access.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('The Maldives is the lowest-lying country',1,'Average elevation is about 1.5m.','geography',false,'maldives.jpg');

-- celebrity 100
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Leonardo DiCaprio won his first Oscar for The Revenant', 1, 'He won Best Actor in 2016.', 'celebrity', false, 'leo_oscar.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Rihanna is the best-selling female artist of the 21st century', 1, 'Based on global sales and certifications.', 'celebrity', false, 'rihanna.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Tom Cruise performs most of his own stunts', 1, 'Including high-risk Mission Impossible scenes.', 'celebrity', false, 'cruise_stunt.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Taylor Swift started her career in pop music', 0, 'She began as a country singer.', 'celebrity', false, 'swift_country.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Dwayne Johnson was a professional wrestler before acting', 1, 'He was known as The Rock in WWE.', 'celebrity', false, 'rock_wwe.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Beyoncé holds the record for most Grammy wins', 1, 'She surpassed all artists.', 'celebrity', false, 'beyonce_grammy.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Johnny Depp has never played a villain', 0, 'He played multiple antagonistic roles.', 'celebrity', false, 'depp_villain.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Lady Gaga studied at NYU Tisch School of the Arts', 1, 'She attended before pursuing music full-time.', 'celebrity', false, 'gaga_nyu.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Will Smith declined the role of Neo in The Matrix', 1, 'He chose another project.', 'celebrity', false, 'smith_matrix.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Brad Pitt and Angelina Jolie met on a red carpet', 0, 'They met on a movie set.', 'celebrity', false, 'pitt_jolie.jpg');
 
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Keanu Reeves donated a large part of his Matrix earnings', 1, 'He supported crew and charities.', 'celebrity', false, 'reeves_matrix.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Emma Watson voiced Belle in Beauty and the Beast', 1, 'She starred in the live-action remake.', 'celebrity', false, 'emma_belle.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Elon Musk has appeared in Hollywood films', 1, 'Including Iron Man 2 cameos.', 'celebrity', false, 'musk_movie.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Chris Evans initially turned down Captain America', 1, 'He hesitated before accepting.', 'celebrity', false, 'evans_cap.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Scarlett Johansson is the highest-grossing actor ever', 1, 'Based on worldwide box office totals.', 'celebrity', false, 'scarlett_box.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Robert Downey Jr. was Marvel’s first casting choice for Iron Man', 0, 'The choice was considered risky.', 'celebrity', false, 'rdj_ironman.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Adele once worked as a music producer', 0, 'She worked in retail before fame.', 'celebrity', false, 'adele_job.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Zendaya won an Emmy before age 25', 1, 'For her role in Euphoria.', 'celebrity', false, 'zendaya_emmy.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Drake was a child actor before music fame', 1, 'He starred in Degrassi.', 'celebrity', false, 'drake_degrassi.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Jennifer Lawrence won an Oscar before age 25', 1, 'She won for Silver Linings Playbook.', 'celebrity', false, 'lawrence_oscar.jpg');
 
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Morgan Freeman was born with his iconic voice', 0, 'His voice deepened with age.', 'celebrity', false, 'freeman_voice.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Margot Robbie is Australian', 1, 'She was born in Queensland.', 'celebrity', false, 'robbie_aus.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Ryan Gosling was a member of the Mickey Mouse Club', 1, 'Alongside other future stars.', 'celebrity', false, 'gosling_mmc.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Daniel Radcliffe earned more from Harry Potter than the author', 0, 'J.K. Rowling earned more overall.', 'celebrity', false, 'radcliffe_hp.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Natalie Portman holds a degree from Harvard', 1, 'She studied psychology.', 'celebrity', false, 'portman_harvard.jpg');
 
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Chris Pratt was homeless before acting success', 1, 'He lived in a van in Hawaii.', 'celebrity', false, 'pratt_story.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Selena Gomez started her career on Disney Channel', 1, 'She starred in Wizards of Waverly Place.', 'celebrity', false, 'selena_disney.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Eminem has never won an Oscar', 0, 'He won for Lose Yourself.', 'celebrity', false, 'eminem_oscar.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Angelina Jolie has directed multiple films', 1, 'She directed several dramas.', 'celebrity', false, 'jolie_director.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Timothée Chalamet was born in France', 0, 'He was born in the USA.', 'celebrity', false, 'chalamet_birth.jpg');
 
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Bruno Mars is part of Silk Sonic', 1, 'The duo includes Anderson .Paak.', 'celebrity', false, 'bruno_silk.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Hugh Jackman almost rejected Wolverine', 1, 'He was cast late.', 'celebrity', false, 'jackman_wolverine.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Kanye West never produced music for other artists', 0, 'He produced for many before fame.', 'celebrity', false, 'kanye_producer.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Gal Gadot served in the Israeli military', 1, 'Service is mandatory in Israel.', 'celebrity', false, 'gadot_idf.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Tom Holland trained as a dancer', 1, 'He studied ballet and gymnastics.', 'celebrity', false, 'holland_dance.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Oprah Winfrey was the first Black female billionaire', 1, 'She reached billionaire status.', 'celebrity', false, 'oprah_billion.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Chris Hemsworth learned acting after becoming Thor', 0, 'He acted years before Marvel.', 'celebrity', false, 'hemsworth_thor.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Billie Eilish records music only in professional studios', 0, 'She recorded early songs at home.', 'celebrity', false, 'billie_home.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Samuel L. Jackson appears in over 100 films', 1, 'He is one of the most prolific actors.', 'celebrity', false, 'jackson_films.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Miley Cyrus was born Hannah Montana', 0, 'That was her character name.', 'celebrity', false, 'miley_name.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Ryan Reynolds owns stakes in multiple companies', 1, 'Including Aviation Gin.', 'celebrity', false, 'reynolds_business.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Jackie Chan performed many of his own stunts', 1, 'Often resulting in injuries.', 'celebrity', false, 'chan_stunts.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Jennifer Lopez started as a backup dancer', 1, 'She danced for Janet Jackson.', 'celebrity', false, 'jlo_dancer.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Brad Pitt won an Oscar for acting before producing', 0, 'He won first as a producer.', 'celebrity', false, 'pitt_oscar.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Ed Sheeran was once a street performer', 1, 'He busked before fame.', 'celebrity', false, 'sheeran_busker.jpg');

INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Chris Rock voiced a character in Madagascar', 1, 'He voiced Marty the zebra.', 'celebrity', false, 'chrisrock_voice.jpg');
INSERT INTO `questions`(`question`,`answer`,`answer_detail`,`category`,`is_video_only`,`image_file`)  VALUES ('Nicole Kidman was born in the United States', 1, 'She later grew up in Australia.', 'celebrity', false, 'kidman_birth.jpg');

-- Games 50
INSERT INTO `questions`
(`question`, `answer`, `answer_detail`, `category`, `is_video_only`, `image_file`)
VALUES
('Tetris was created in the Soviet Union', 1, 'Developed in 1984 by Alexey Pajitnov.', 'games', false, 'tetris.jpg'),
('Minecraft is the best-selling video game of all time', 1, NULL, 'games', false, 'minecraft.jpg'),
('The first video game was released in the 1970s', 1, 'Early arcade games appeared then.', 'games', false, 'arcade.jpg'),
('Nintendo started as a playing card company', 1, 'Founded in 1889.', 'games', false, 'nintendo.jpg'),
('The PlayStation logo has never changed', 1, NULL, 'games', false, 'playstation.jpg'),

('All video games are made using game engines', 0, 'Some are built from scratch.', 'games', false, 'engine.jpg'),
('Online gaming began with broadband internet', 0, 'It existed with dial-up.', 'games', false, 'online.jpg'),
('Higher FPS always improves gameplay experience', 0, 'It depends on genre and player.', 'games', false, 'fps.jpg'),
('Console exclusives are always permanent', 0, 'Many become timed exclusives.', 'games', false, 'exclusive.jpg'),
('Retro games were simpler because of design choice', 0, 'Hardware limits played a big role.', 'games', false, 'retro.jpg'),

('The Game Boy outsold the PlayStation Portable', 1, NULL, 'games', false, 'gameboy.jpg'),
('Speedrunners often use bugs intentionally', 1, 'Glitches are part of strategies.', 'games', false, 'speedrun.jpg'),
('Some video game music is performed by orchestras', 1, NULL, 'games', false, 'orchestra.jpg'),
('Pac-Man was designed to appeal to women', 1, 'It avoided violent themes.', 'games', false, 'pacman.jpg'),
('Esports tournaments existed before streaming platforms', 1, 'Competitions predate Twitch.', 'games', false, 'esports.jpg'),

('Games with microtransactions are always free-to-play', 0, 'Many are full-price games.', 'games', false, 'microtransactions.jpg'),
('All video game delays indicate poor development', 0, 'Delays often improve quality.', 'games', false, 'delay.jpg'),
('More polygons always mean better graphics', 0, 'Lighting and art style matter.', 'games', false, 'graphics.jpg'),
('Games are tested mostly by players after release', 0, 'QA testing happens before launch.', 'games', false, 'qa.jpg'),
('Cheat codes were originally made for players', 0, 'They were for developers.', 'games', false, 'cheatcode.jpg'),

('The first console war involved Sega and Nintendo', 1, 'In the late 80s and 90s.', 'games', false, 'console_war.jpg'),
('Open-world games require more memory than linear games', 1, NULL, 'games', false, 'open_world.jpg'),
('The term NPC means Non-Playable Character', 1, NULL, 'games', false, 'npc.jpg')

-- Fun Fact
INSERT INTO `questions`
(`question`, `answer`, `answer_detail`, `category`, `is_video_only`, `image_file`)
VALUES
('Octopuses have three hearts', 1, 'Two pump blood to the gills, one to the body.', 'fun fact', 1, 'octopus.jpg'),
('Bananas are radioactive', 1, 'They contain the naturally radioactive potassium-40.', 'fun fact', 1, 'banana.jpg'),
('Honey never spoils', 1, 'Edible honey has been found in ancient tombs.', 'fun fact', 1, 'honey.jpg'),
('A day on Venus is longer than a year on Venus', 1, NULL, 'fun fact', 1, 'venus.jpg'),
('Sharks existed before trees', 1, 'Sharks appeared over 400 million years ago.', 'fun fact', 1, 'shark.jpg'),

('Humans only use 10% of their brain', 0, 'Brain imaging shows most areas are active.', 'fun fact', 1, 'brain.jpg'),
('Goldfish have a memory of only 3 seconds', 0, 'They can remember things for months.', 'fun fact', 1, 'goldfish.jpg'),
('The Great Wall of China is visible from the Moon', 0, NULL, 'fun fact', 1, 'great_wall.jpg'),
('Lightning never strikes the same place twice', 0, 'It often strikes the same spot repeatedly.', 'fun fact', 1, 'lightning.jpg'),
('Humans have five senses', 0, 'Balance and pain are also senses.', 'fun fact', 1, 'senses.jpg'),

('There are more possible chess games than atoms in the universe', 1, 'This is called the Shannon number.', 'fun fact', 1, 'chess.jpg'),
('Wombat poop is cube-shaped', 1, NULL, 'fun fact', 1, 'wombat.jpg'),
('Scotland has over 400 words for snow', 1, NULL, 'fun fact', 1, 'snow.jpg'),
('Some metals explode when in contact with water', 1, 'Sodium reacts violently with water.', 'fun fact', 1, 'sodium.jpg'),
('Butterflies can taste with their feet', 1, NULL, 'fun fact', 1, 'butterfly.jpg'),

('Eating carrots improves night vision', 0, 'This was WWII propaganda.', 'fun fact', 1, 'carrot.jpg'),
('Bulls are angered by the color red', 0, 'They react to movement, not color.', 'fun fact', 1, 'bull.jpg'),
('Cracking knuckles causes arthritis', 0, NULL, 'fun fact', 1, 'knuckles.jpg'),
('Hair keeps growing after death', 0, 'Skin retracts, giving that illusion.', 'fun fact', 1, 'hair.jpg'),
('Humans are the only animals that sweat', 0, NULL, 'fun fact', 1, 'sweat.jpg'),

('There are more trees on Earth than stars in the Milky Way', 1, 'Estimated 3 trillion trees exist.', 'fun fact', 1, 'trees.jpg'),
('Antarctica is technically a desert', 1, 'It receives very little rainfall.', 'fun fact', 1, 'antarctica.jpg'),
('Some turtles can breathe through their butts', 1, NULL, 'fun fact', 1, 'turtle.jpg'),
('A cloud can weigh over a million tons', 1, 'Water droplets add massive weight.', 'fun fact', 1, 'cloud.jpg'),
('Oxford University is older than the Aztecs', 1, NULL, 'fun fact', 1, 'oxford.jpg'),

('Chameleons change color to blend in', 0, 'They change color to communicate.', 'fun fact', 1, 'chameleon.jpg'),
('Sugar makes kids hyperactive', 0, 'Studies show no clear link.', 'fun fact', 1, 'sugar.jpg'),
('Camels store water in their humps', 0, 'Humps store fat, not water.', 'fun fact', 1, 'camel.jpg'),
('Humans swallow spiders while sleeping', 0, NULL, 'fun fact', 1, 'spider.jpg'),
('Napoleon was extremely short', 0, 'He was average height for his time.', 'fun fact', 1, 'napoleon.jpg'),

('The human body glows faintly', 1, 'Biochemical reactions emit light.', 'fun fact', 1, 'human_glow.jpg'),
('There are more possible card shuffles than people on Earth', 1, '52! is an enormous number.', 'fun fact', 1, 'cards.jpg'),
('Some bacteria can survive in space', 1, NULL, 'fun fact', 1, 'bacteria.jpg'),
('A single teaspoon of honey is a lifetime of work for one bee', 1, NULL, 'fun fact', 1, 'bee.jpg'),
('Your bones are constantly breaking and rebuilding', 1, 'Bone tissue renews over time.', 'fun fact', 1, 'bones.jpg'),

('We only have five types of taste', 0, 'Umami was added as a sixth.', 'fun fact', 1, 'taste.jpg'),
('Glass is a supercooled liquid', 0, 'It is an amorphous solid.', 'fun fact', 1, 'glass.jpg'),
('Alcohol warms the body', 0, 'It increases heat loss.', 'fun fact', 1, 'alcohol.jpg'),
('Humans evolved from chimpanzees', 0, 'They share a common ancestor.', 'fun fact', 1, 'evolution.jpg'),
('Mount Everest is the tallest mountain from base to peak', 0, 'Mauna Kea is taller that way.', 'fun fact', 1, 'everest.jpg');

-- Food
INSERT INTO `questions`
(`question`, `answer`, `answer_detail`, `category`, `is_video_only`, `image_file`)
VALUES
('Chocolate was once used as money', 1, 'Cacao beans were used as currency by the Aztecs.', 'food', 1, 'chocolate.jpg'),
('Honey never expires', 1, 'Sealed honey can last thousands of years.', 'food', 1, 'honey.jpg'),
('Ketchup was once sold as medicine', 1, 'It was marketed as a cure in the 1800s.', 'food', 1, 'ketchup.jpg'),
('Cheese is the most stolen food in the world', 1, NULL, 'food', 1, 'cheese.jpg'),
('Apples float because they are 25% air', 1, NULL, 'food', 1, 'apple.jpg'),

('Microwaving food destroys all nutrients', 0, 'It often preserves nutrients better.', 'food', 1, 'microwave.jpg'),
('Brown eggs are more nutritious than white eggs', 0, 'Shell color depends on the hen.', 'food', 1, 'eggs.jpg'),
('MSG is harmful to everyone', 0, 'Scientific consensus shows it is safe.', 'food', 1, 'msg.jpg'),
('Spicy food burns holes in your stomach', 0, NULL, 'food', 1, 'spicy.jpg'),
('Sugar causes hyperactivity in children', 0, 'Studies show no clear link.', 'food', 1, 'sugar.jpg'),

('Wasabi served in restaurants is often fake', 1, 'It is usually dyed horseradish.', 'food', 1, 'wasabi.jpg'),
('Carrots were originally purple', 1, NULL, 'food', 1, 'carrot.jpg'),
('Peanuts are not nuts', 1, 'They are legumes.', 'food', 1, 'peanut.jpg'),
('White chocolate is not real chocolate', 1, 'It contains no cocoa solids.', 'food', 1, 'white_chocolate.jpg'),
('Nutmeg can be toxic in large amounts', 1, NULL, 'food', 1, 'nutmeg.jpg'),

('Frozen vegetables are less healthy than fresh ones', 0, 'They can retain more nutrients.', 'food', 1, 'frozen_veggies.jpg'),
('Eating at night automatically causes weight gain', 0, NULL, 'food', 1, 'night_eating.jpg'),
('Coffee dehydrates your body', 0, 'It still contributes to hydration.', 'food', 1, 'coffee.jpg'),
('Salt is the main cause of high blood pressure', 0, 'It is one of several factors.', 'food', 1, 'salt.jpg'),
('All fats are bad for you', 0, NULL, 'food', 1, 'fats.jpg'),

('Pineapples eat you back when you eat them', 1, 'They contain a protein-digesting enzyme.', 'food', 1, 'pineapple.jpg'),
('Bananas are berries', 1, NULL, 'food', 1, 'banana.jpg'),
('Almonds are related to peaches', 1, 'They belong to the same family.', 'food', 1, 'almond.jpg'),
('Some cheeses are illegal in certain countries', 1, NULL, 'food', 1, 'illegal_cheese.jpg'),
('Chili peppers evolved to deter mammals', 1, 'Birds are immune to capsaicin.', 'food', 1, 'chili.jpg'),

('Drinking milk strengthens bones in everyone', 0, 'Benefits vary by individual.', 'food', 1, 'milk.jpg'),
('Organic food is always healthier', 0, NULL, 'food', 1, 'organic.jpg'),
('All mushrooms are vegetables', 0, 'They are fungi.', 'food', 1, 'mushroom.jpg'),
('Eating ice cream causes colds', 0, NULL, 'food', 1, 'icecream.jpg'),
('Gluten is bad for most people', 0, 'Only harmful for some individuals.', 'food', 1, 'gluten.jpg'),

('Tomatoes were once thought to be poisonous', 1, NULL, 'food', 1, 'tomato.jpg'),
('Saffron is the most expensive spice', 1, 'It requires hand-harvesting.', 'food', 1, 'saffron.jpg'),
('Popcorn was invented thousands of years ago', 1, NULL, 'food', 1, 'popcorn.jpg'),
('Cucumbers are technically fruits', 1, NULL, 'food', 1, 'cucumber.jpg'),
('The smell of food can make you feel full', 1, 'It can trigger satiety signals.', 'food', 1, 'food_smell.jpg'),

('Dark chocolate contains no sugar', 0, 'Most varieties still contain sugar.', 'food', 1, 'dark_chocolate.jpg'),
('Eating raw eggs is always safe', 0, NULL, 'food', 1, 'raw_eggs.jpg'),
('Sea salt is healthier than table salt', 0, 'They have similar sodium content.', 'food', 1, 'sea_salt.jpg'),
('All calories are processed the same way', 0, 'Different macros affect the body differently.', 'food', 1, 'calories.jpg'),
('Fruit juice is as healthy as whole fruit', 0, NULL, 'food', 1, 'fruit_juice.jpg'),

('Chewing gum was made from tree sap', 1, 'Early gum used chicle.', 'food', 1, 'gum.jpg'),
('Avocados are poisonous to some animals', 1, NULL, 'food', 1, 'avocado.jpg'),
('Bread was eaten before farming existed', 1, 'Ancient hunter-gatherers made bread.', 'food', 1, 'bread.jpg'),
('The flavor of vanilla comes from orchids', 1, NULL, 'food', 1, 'vanilla.jpg'),
('Cheese can trigger vivid dreams', 1, 'Linked to digestion and sleep cycles.', 'food', 1, 'cheese_dream.jpg'),

('All bacteria in food are harmful', 0, 'Some are beneficial.', 'food', 1, 'bacteria.jpg'),
('Eating spicy food causes ulcers', 0, 'Ulcers are caused by bacteria.', 'food', 1, 'ulcer.jpg'),
('Microwaves make food radioactive', 0, NULL, 'food', 1, 'radioactive_food.jpg'),
('Vegetarians lack enough protein', 0, 'Plant protein can be sufficient.', 'food', 1, 'protein.jpg'),
('Frozen meat loses all its flavor', 0, NULL, 'food', 1, 'frozen_meat.jpg');

-- ANimals
INSERT INTO `questions`
(`question`, `answer`, `answer_detail`, `category`, `is_video_only`, `image_file`)
VALUES
('Octopuses have blue blood', 1, 'It contains copper instead of iron.', 'animals', false, 'octopus.jpg'),
('Cows have best friends', 1, 'They show less stress together.', 'animals', false, 'cow.jpg'),
('Dolphins have unique names', 1, 'They use signature whistles.', 'animals', false, 'dolphin.jpg'),
('Wombats produce cube-shaped poop', 1, NULL, 'animals', false, 'wombat.jpg'),
('Elephants can recognize themselves in mirrors', 1, 'They pass the mirror test.', 'animals', false, 'elephant.jpg'),

('Bats are blind', 0, 'Most bats can see well.', 'animals', false, 'bat.jpg'),
('Goldfish have a 3-second memory', 0, 'They remember for months.', 'animals', false, 'goldfish.jpg'),
('Ostriches bury their heads in sand', 0, NULL, 'animals', false, 'ostrich.jpg'),
('Sharks cannot get cancer', 0, 'They can develop tumors.', 'animals', false, 'shark.jpg'),
('Dogs only see in black and white', 0, 'They see some colors.', 'animals', false, 'dog.jpg'),

('A snail can sleep for three years', 1, NULL, 'animals', false, 'snail.jpg'),
('Butterflies remember being caterpillars', 1, 'Memories survive metamorphosis.', 'animals', false, 'butterfly.jpg'),
('Ravens can plan for the future', 1, 'They hide food strategically.', 'animals', false, 'raven.jpg'),
('Frogs can freeze and survive', 1, NULL, 'animals', false, 'frog.jpg'),
('Tigers have striped skin', 1, 'Stripes go beyond fur.', 'animals', false, 'tiger.jpg'),

('All spiders are dangerous to humans', 0, 'Most are harmless.', 'animals', false, 'spider.jpg'),
('Cats always land on their feet', 0, NULL, 'animals', false, 'cat.jpg'),
('Chameleons change color to blend in', 0, 'They communicate with color.', 'animals', false, 'chameleon.jpg'),
('Camels store water in their humps', 0, 'They store fat.', 'animals', false, 'camel.jpg'),
('Penguins can fly underwater', 1, 'They swim like flying.', 'animals', false, 'penguin.jpg'),

('Bees can recognize human faces', 1, 'They use visual patterns.', 'animals', false, 'bee.jpg'),
('A shrimp’s heart is in its head', 1, NULL, 'animals', false, 'shrimp.jpg'),
('Crows hold funerals for dead crows', 1, 'They gather and observe.', 'animals', false, 'crow.jpg'),
('Koalas have unique fingerprints', 1, 'Very similar to humans.', 'animals', false, 'koala.jpg'),
('Seahorses are monogamous', 1, NULL, 'animals', false, 'seahorse.jpg'),

('Lions are the fastest land animals', 0, 'Cheetahs are faster.', 'animals', false, 'lion.jpg'),
('All snakes are venomous', 0, NULL, 'animals', false, 'snake.jpg'),
('Bulls get angry at the color red', 0, 'They react to movement.', 'animals', false, 'bull.jpg'),
('Frogs give you warts', 0, NULL, 'animals', false, 'frog_wart.jpg'),
('Mice love cheese naturally', 0, 'They prefer grains.', 'animals', false, 'mouse.jpg'),

('Giraffes have the same number of neck vertebrae as humans', 1, 'Both have seven.', 'animals', false, 'giraffe.jpg'),
('Some turtles breathe through their butts', 1, NULL, 'animals', false, 'turtle.jpg'),
('Parrots can live over 80 years', 1, 'Some species reach that age.', 'animals', false, 'parrot.jpg'),
('Jellyfish are biologically immortal', 1, 'One species can reset its life cycle.', 'animals', false, 'jellyfish.jpg'),
('Ants can lift 50 times their weight', 1, NULL, 'animals', false, 'ant.jpg'),

('Rabbits sweat to cool down', 0, 'They regulate heat through ears.', 'animals', false, 'rabbit.jpg'),
('All birds can fly', 0, NULL, 'animals', false, 'bird.jpg'),
('Fishes never sleep', 0, 'They enter rest states.', 'animals', false, 'fish.jpg'),
('Wolves howl at the moon', 0, 'They howl to communicate.', 'animals', false, 'wolf.jpg'),
('Snakes are slimy', 0, NULL, 'animals', false, 'snake_skin.jpg'),

('Otters hold hands while sleeping', 1, 'To avoid drifting apart.', 'animals', false, 'otter.jpg'),
('Goats have rectangular pupils', 1, NULL, 'animals', false, 'goat.jpg'),
('A cockroach can live without a head', 1, 'For several days.', 'animals', false, 'cockroach.jpg'),
('Horses can’t vomit', 1, NULL, 'animals', false, 'horse.jpg'),
('Some birds sleep while flying', 1, 'They rest one brain side.', 'animals', false, 'bird_sleep.jpg'),

('Dogs sweat through their skin', 0, 'They cool mostly by panting.', 'animals', false, 'dog_sweat.jpg'),
('All mammals live on land', 0, NULL, 'animals', false, 'mammal.jpg'),
('Owls can rotate their heads 360 degrees', 0, 'They rotate about 270°.', 'animals', false, 'owl.jpg'),
('Bears hibernate the entire winter without waking', 0, NULL, 'animals', false, 'bear.jpg'),
('Dolphins breathe automatically while sleeping', 0, 'They breathe consciously.', 'animals', false, 'dolphin_sleep.jpg');

-- NBA
INSERT INTO `questions`
(`question`, `answer`, `answer_detail`, `category`, `is_video_only`, `image_file`)
VALUES
('Michael Jordan won 6 NBA championships', 1, 'All with the Chicago Bulls.', 'NBA', false, 'jordan.jpg'),
('LeBron James was drafted straight out of high school', 1, NULL, 'NBA', false, 'lebron.jpg'),
('Kareem Abdul-Jabbar is the NBA all-time leading scorer', 1, 'He held the record for decades.', 'NBA', false, 'kareem.jpg'),
('The NBA was founded in 1946', 1, NULL, 'NBA', false, 'nba_1946.jpg'),
('Wilt Chamberlain once scored 100 points in a game', 1, 'In 1962 against the Knicks.', 'NBA', false, 'wilt.jpg'),

('Kobe Bryant played for three NBA teams', 0, 'He played only for the Lakers.', 'NBA', false, 'kobe.jpg'),
('Shaquille O’Neal won a title with the Suns', 0, NULL, 'NBA', false, 'shaq.jpg'),
('The NBA logo is Jerry West', 1, 'Though never officially confirmed.', 'NBA', false, 'nba_logo.jpg'),
('Magic Johnson won Finals MVP as a rookie', 1, NULL, 'NBA', false, 'magic.jpg'),
('Larry Bird won 5 MVP awards', 0, 'He won 3 MVPs.', 'NBA', false, 'bird.jpg'),

('Stephen Curry holds the record for most 3-pointers in NBA history', 1, NULL, 'NBA', false, 'curry.jpg'),
('The Toronto Raptors joined the NBA in 1995', 1, NULL, 'NBA', false, 'raptors.jpg'),
('Tim Duncan played his entire career with one team', 1, 'The San Antonio Spurs.', 'NBA', false, 'duncan.jpg'),
('Allen Iverson was the first overall pick in 1996', 1, NULL, 'NBA', false, 'iverson.jpg'),
('The NBA introduced the 3-point line in 1979', 1, NULL, 'NBA', false, 'three_point.jpg'),

('Kevin Durant has won an MVP award', 1, 'He won it in 2014.', 'NBA', false, 'durant.jpg'),
('Dennis Rodman led the NBA in assists', 0, 'He led in rebounds.', 'NBA', false, 'rodman.jpg'),
('The Boston Celtics have won the most NBA championships', 1, NULL, 'NBA', false, 'celtics.jpg'),
('James Harden once averaged over 36 points per game in a season', 1, NULL, 'NBA', false, 'harden.jpg'),
('Dirk Nowitzki played for more than one NBA team', 0, 'He only played for Dallas.', 'NBA', false, 'dirk.jpg'),

('Giannis Antetokounmpo won MVP and Defensive Player of the Year in the same season', 1, 'In the 2019–2020 season.', 'NBA', false, 'giannis.jpg'),
('The Chicago Bulls won 8 championships in the 1990s', 0, 'They won 6.', 'NBA', false, 'bulls_90s.jpg'),
('The NBA All-Star Game started in 1951', 1, NULL, 'NBA', false, 'allstar.jpg'),
('Kawhi Leonard won Finals MVP with two teams', 1, 'Spurs and Raptors.', 'NBA', false, 'kawhi.jpg'),
('The Lakers have always been based in Los Angeles', 0, 'They started in Minneapolis.', 'NBA', false, 'lakers.jpg'),

('Russell Westbrook averaged a triple-double in multiple seasons', 1, NULL, 'NBA', false, 'westbrook.jpg'),
('Bill Russell won 11 NBA championships', 1, NULL, 'NBA', false, 'russell.jpg'),
('The shot clock in the NBA is 24 seconds', 1, NULL, 'NBA', false, 'shot_clock.jpg'),
('The NBA banned dunking for a decade', 0, 'It was banned only in college.', 'NBA', false, 'dunk.jpg'),
('Chris Paul has never reached the NBA Finals', 0, 'He reached the Finals in 2021.', 'NBA', false, 'cp3.jpg'),

('The Miami Heat were founded in 1988', 1, NULL, 'NBA', false, 'heat.jpg'),
('Reggie Miller spent his entire career with one team', 1, 'The Indiana Pacers.', 'NBA', false, 'miller.jpg'),
('The NBA has more than 30 teams', 0, 'There are 30 teams.', 'NBA', false, 'nba_teams.jpg'),
('Nikola Jokić was drafted in the first round', 0, 'He was a second-round pick.', 'NBA', false, 'jokic.jpg'),
('The Spurs made the playoffs for over 20 straight seasons', 1, NULL, 'NBA', false, 'spurs.jpg'),

('Vince Carter played in four different decades', 1, '1990s to 2020s.', 'NBA', false, 'vince.jpg'),
('The NBA Finals are always best-of-seven', 1, NULL, 'NBA', false, 'finals.jpg'),
('Dwight Howard won Defensive Player of the Year three times', 1, NULL, 'NBA', false, 'dwight.jpg'),
('The Sacramento Kings have won an NBA championship', 0, 'Not since the NBA era.', 'NBA', false, 'kings.jpg'),
('The NBA allows goaltending on offense', 0, 'It is illegal.', 'NBA', false, 'goaltending.jpg'),

('Jason Kidd once led the NBA in assists per game', 1, NULL, 'NBA', false, 'kidd.jpg'),
('The New York Knicks have won two NBA championships', 1, 'Both in the 1970s.', 'NBA', false, 'knicks.jpg'),
('The NBA added the play-in tournament in 2020', 1, NULL, 'NBA', false, 'play_in.jpg'),
('Ray Allen held the 3-point record before Curry', 1, NULL, 'NBA', false, 'ray_allen.jpg'),
('The Clippers have never made a conference finals', 0, 'They did in 2021.', 'NBA', false, 'clippers.jpg'),

('Scottie Pippen won championships without Michael Jordan', 0, 'All were with Jordan.', 'NBA', false, 'pippen.jpg'),
('The NBA once allowed hand-checking on defense', 1, 'Rule changes limited it.', 'NBA', false, 'hand_check.jpg'),
('The Phoenix Suns have never won an NBA title', 1, NULL, 'NBA', false, 'suns.jpg'),
('The NBA draft lottery was created to prevent tanking', 1, NULL, 'NBA', false, 'lottery.jpg'),
('Every NBA team has won a championship', 0, 'Several teams have none.', 'NBA', false, 'nba_titles.jpg'),

('Hakeem Olajuwon won MVP, DPOY, and Finals MVP in the same season', 1, 'In the 1993–94 season.', 'NBA', false, 'hakeem.jpg'),
('The NBA once had a team in Vancouver', 1, 'The Grizzlies relocated.', 'NBA', false, 'vancouver.jpg'),
('The NBA season has always been 82 games', 0, 'Some seasons were shorter.', 'NBA', false, 'season.jpg'),
('Paul Pierce won Finals MVP in 2008', 1, NULL, 'NBA', false, 'pierce.jpg'),
('The NBA introduced instant replay in the 2000s', 1, NULL, 'NBA', false, 'replay.jpg');

-- Cinema
INSERT INTO `questions`
(`question`, `answer`, `answer_detail`, `category`, `is_video_only`, `image_file`)
VALUES
('The first movie ever made was under a minute long', 1, 'Early films were very short.', 'cinema', false, 'first_film.jpg'),
('Avatar is the highest-grossing film of all time', 1, NULL, 'cinema', false, 'avatar.jpg'),
('The Oscars were first held in 1929', 1, NULL, 'cinema', false, 'oscars.jpg'),
('The Godfather won Best Picture', 1, NULL, 'cinema', false, 'godfather.jpg'),
('Jurassic Park used real dinosaur sounds', 1, 'Sounds were mixed from animals.', 'cinema', false, 'jurassic.jpg'),

('Black-and-white films had no sound', 0, 'Silent films came earlier.', 'cinema', false, 'black_white.jpg'),
('Titanic was filmed entirely underwater', 0, NULL, 'cinema', false, 'titanic.jpg'),
('The first Star Wars movie was Episode I', 0, 'It was Episode IV.', 'cinema', false, 'star_wars.jpg'),
('Actors always cry real tears on screen', 0, NULL, 'cinema', false, 'tears.jpg'),
('All animated movies are made for kids', 0, 'Many target adults.', 'cinema', false, 'animation.jpg'),

('Psycho was the first movie to show a toilet flushing', 1, NULL, 'cinema', false, 'psycho.jpg'),
('The Wizard of Oz was originally in color', 1, 'Kansas scenes were sepia-toned.', 'cinema', false, 'wizard_oz.jpg'),
('Jaws caused a fear of swimming in the ocean', 1, NULL, 'cinema', false, 'jaws.jpg'),
('The Lion King was inspired by Hamlet', 1, NULL, 'cinema', false, 'lion_king.jpg'),
('Alfred Hitchcock never won an Oscar for Best Director', 1, NULL, 'cinema', false, 'hitchcock.jpg'),

('Movies are filmed in chronological order', 0, 'Scenes are shot out of order.', 'cinema', false, 'filming.jpg'),
('CGI completely replaced practical effects', 0, NULL, 'cinema', false, 'cgi.jpg'),
('All movie sound effects are recorded on set', 0, 'Many are added later.', 'cinema', false, 'sound_fx.jpg'),
('Actors improvise most of their dialogue', 0, NULL, 'cinema', false, 'script.jpg'),
('Sequels are always planned from the start', 0, 'Many are made after success.', 'cinema', false, 'sequel.jpg'),

('The movie Alien was released in 1979', 1, NULL, 'cinema', false, 'alien.jpg'),
('James Cameron directed Titanic and Avatar', 1, NULL, 'cinema', false, 'cameron.jpg'),
('The first CGI character appeared in the 1970s', 1, 'Used in Westworld.', 'cinema', false, 'cgi_first.jpg'),
('Rocky won Best Picture', 1, NULL, 'cinema', false, 'rocky.jpg'),
('Actors sometimes gain or lose extreme weight for roles', 1, NULL, 'cinema', false, 'method_acting.jpg'),

('The Oscars are voted on by fans', 0, 'They are voted by the Academy.', 'cinema', false, 'academy.jpg'),
('Every movie shown in theaters is shot on film', 0, NULL, 'cinema', false, 'digital.jpg'),
('Foreign films cannot win Best Picture', 0, 'They became eligible.', 'cinema', false, 'foreign_film.jpg'),
('All stunts are done by actors themselves', 0, NULL, 'cinema', false, 'stunt.jpg'),
('Movie trailers always show real scenes', 0, 'Some scenes are trailer-only.', 'cinema', false, 'trailer.jpg'),

('The Dark Knight was the first superhero movie to gross over $1B', 1, NULL, 'cinema', false, 'dark_knight.jpg'),
('The movie Parasite won Best Picture', 1, 'First non-English winner.', 'cinema', false, 'parasite.jpg'),
('Casablanca was released during World War II', 1, NULL, 'cinema', false, 'casablanca.jpg'),
('Soundtracks are often recorded after filming', 1, NULL, 'cinema', false, 'soundtrack.jpg'),
('The Matrix popularized bullet time', 1, NULL, 'cinema', false, 'matrix.jpg'),

('3D movies are a modern invention', 0, 'They existed in the 1950s.', 'cinema', false, '3d.jpg'),
('Actors always keep costumes after filming', 0, NULL, 'cinema', false, 'costume.jpg'),
('All horror movies are filmed at night', 0, NULL, 'cinema', false, 'horror.jpg'),
('Movies never change titles after release', 0, 'Some are retitled.', 'cinema', false, 'title.jpg'),
('Film ratings are the same worldwide', 0, 'Ratings vary by country.', 'cinema', false, 'rating.jpg'),

('The movie Inception has no official ending explanation', 1, NULL, 'cinema', false, 'inception.jpg'),
('Some movies are filmed without a finished script', 1, NULL, 'cinema', false, 'scriptless.jpg'),
('The longest movie ever made lasts over 800 hours', 1, 'Logistics is 857 hours long.', 'cinema', false, 'long_movie.jpg'),
('Actors often record dialogue again after filming', 1, 'This is called ADR.', 'cinema', false, 'adr.jpg'),
('Silent films were shown with live music', 1, NULL, 'cinema', false, 'silent_music.jpg'),

('All movie explosions are real', 0, 'Many are CGI.', 'cinema', false, 'explosion.jpg'),
('Actors are paid only after a movie releases', 0, NULL, 'cinema', false, 'salary.jpg'),
('Every director edits their own movies', 0, 'Editors handle most cuts.', 'cinema', false, 'editing.jpg'),
('Movies are always filmed where they are set', 0, NULL, 'cinema', false, 'location.jpg'),
('Awards guarantee a movie’s success', 0, 'Many winners flop.', 'cinema', false, 'award.jpg');

-- Music
INSERT INTO `questions`
(`question`, `answer`, `answer_detail`, `category`, `is_video_only`, `image_file`)
VALUES
('The song "Happy Birthday" was once copyrighted', 1, 'It entered public domain in 2016.', 'music', false, 'happy_birthday.jpg'),
('Mozart wrote his first symphony at age 8', 1, NULL, 'music', false, 'mozart.jpg'),
('The Beatles never won Album of the Year at the Grammys', 1, 'They never won that category.', 'music', false, 'beatles.jpg'),
('Michael Jackson’s "Thriller" is the best-selling album ever', 1, NULL, 'music', false, 'thriller.jpg'),
('A piano has over 200 strings', 1, 'Most have around 230.', 'music', false, 'piano.jpg'),

('Vinyl records store music digitally', 0, 'They store analog sound.', 'music', false, 'vinyl.jpg'),
('Classical music has no copyright restrictions', 0, 'Recordings can be copyrighted.', 'music', false, 'classical.jpg'),
('Auto-Tune was invented for pop music', 0, 'It came from oil industry tech.', 'music', false, 'autotune.jpg'),
('The Grammy Awards were created before the Oscars', 0, 'The Oscars came first.', 'music', false, 'grammy.jpg'),
('Listening to music always improves concentration', 0, NULL, 'music', false, 'concentration.jpg'),

('Elvis Presley never wrote his own songs', 1, 'He mostly recorded others’ songs.', 'music', false, 'elvis.jpg'),
('The longest officially released song is over 13 hours long', 1, 'Bull of Heaven holds the record.', 'music', false, 'long_song.jpg'),
('Freddie Mercury had a four-octave vocal range', 1, NULL, 'music', false, 'freddie.jpg'),
('Spotify pays artists per stream', 1, 'Payment is per-stream based.', 'music', false, 'spotify.jpg'),
('The first music video aired on MTV was "Video Killed the Radio Star"', 1, NULL, 'music', false, 'mtv.jpg'),

('All famous singers can read sheet music', 0, 'Many rely on ear training.', 'music', false, 'sheet_music.jpg'),
('Live albums are always recorded in one concert', 0, 'Often edited from many shows.', 'music', false, 'live_album.jpg'),
('Streaming killed album sales entirely', 0, 'Physical sales still exist.', 'music', false, 'album_sales.jpg'),
('Perfect pitch is required to be a great musician', 0, NULL, 'music', false, 'perfect_pitch.jpg'),
('All music genres use the same musical scales', 0, 'Scales vary widely.', 'music', false, 'scales.jpg'),

('The song "Bohemian Rhapsody" has no chorus', 1, NULL, 'music', false, 'bohemian.jpg'),
('Some instruments are older than written language', 1, 'Flutes date back 40,000 years.', 'music', false, 'ancient_flute.jpg'),
('The human voice is considered a musical instrument', 1, NULL, 'music', false, 'voice.jpg'),
('The metronome was invented after Beethoven’s death', 1, 'It existed during his life.', 'music', false, 'metronome.jpg'),
('Jazz musicians often improvise during performances', 1, NULL, 'music', false, 'jazz.jpg'),

('Music charts are based only on sales', 0, 'Streaming and radio count.', 'music', false, 'charts.jpg'),
('Songs in minor keys are always sad', 0, NULL, 'music', false, 'minor_key.jpg'),
('All pop songs follow the same chord progression', 0, 'Many patterns exist.', 'music', false, 'chords.jpg'),
('The louder a song, the more energy it uses digitally', 0, 'File size is unaffected.', 'music', false, 'digital_audio.jpg'),
('Listening to music while sleeping stops the brain from resting', 0, NULL, 'music', false, 'sleep_music.jpg'),

('Bob Dylan won a Nobel Prize in Literature', 1, NULL, 'music', false, 'bob_dylan.jpg'),
('Drums are one of the oldest instruments', 1, NULL, 'music', false, 'drums.jpg'),
('Some songs can trigger physical chills', 1, 'This is called frisson.', 'music', false, 'frisson.jpg'),
('The key of a song can affect perceived emotion', 1, NULL, 'music', false, 'music_key.jpg'),
('Studio albums often contain sounds not playable live', 1, NULL, 'music', false, 'studio.jpg'),

('Music streaming uses more data than video streaming', 0, 'Video uses far more data.', 'music', false, 'streaming.jpg'),
('All cultures use the 12-note scale', 0, 'Many use microtones.', 'music', false, 'microtones.jpg'),
('Hearing loss only affects old musicians', 0, NULL, 'music', false, 'hearing.jpg'),
('Song length is limited by streaming platforms', 0, 'No strict length limit.', 'music', false, 'song_length.jpg'),
('You must understand music theory to compose music', 0, NULL, 'music', false, 'music_theory.jpg'),

('The loudness war affected modern music mastering', 1, 'Tracks were heavily compressed.', 'music', false, 'loudness.jpg'),
('Some instruments are tuned differently depending on genre', 1, NULL, 'music', false, 'tuning.jpg'),
('Music can activate the same brain areas as drugs', 1, 'Dopamine is involved.', 'music', false, 'dopamine.jpg'),
('The first albums were collections of shellac discs', 1, NULL, 'music', false, 'shellac.jpg'),
('Silence is an intentional element in music composition', 1, NULL, 'music', false, 'silence.jpg'),

('All musicians earn most of their income from streams', 0, 'Tours and merch dominate.', 'music', false, 'income.jpg'),
('Music tempo directly changes heart rate in all listeners', 0, 'Responses vary by person.', 'music', false, 'tempo.jpg'),
('Older music is always recorded at lower quality', 0, 'Many recordings were remastered.', 'music', false, 'remaster.jpg'),
('Every hit song follows music theory rules', 0, NULL, 'music', false, 'rules.jpg'),
('Music genres evolve independently from technology', 0, 'Tech heavily influences genres.', 'music', false, 'music_tech.jpg');

-- First

-- Categorie

-- General x 50
-- Soccer x 450
-- Technology x 100
-- Geography x 100
-- Fun Fact x 100
-- Manga x 200
-- NBA x 100
-- Science
-- Games x 50
-- History x 100
-- Astronomy x100
-- Art
-- Cinema x 100
-- Music x 100
-- Rap x 200
-- Celebrity x 100
-- Animals x 100
-- Food x 100
-- Politics x 100
-- Tennis
-- Golf
-- Formule1
-- Myths
-- Guinness x 50
-- Internet

-- Second wave


-- Soccer 300 
INSERT INTO `questions`
(`question`, `answer`, `answer_detail`, `category`, `is_video_only`, `image_file`)
VALUES
('In the FIFA World Cup, Brazil is the only nation to have won the tournament on four different continents.', 1, 'Their titles came in South America, Europe, North America, and Asia.', 'Soccer', false, 'soccer1.jpg'),
('In European club football, AC Milan has won more Champions League titles than Real Madrid.', 0, 'Real Madrid holds the record with the most Champions League titles.', 'Soccer', false, 'soccer2.jpg'),
('The offside rule applies when any part of the body that can score is beyond the last defender.', 1, 'Hands and arms are excluded from offside considerations.', 'Soccer', false, 'soccer3.jpg'),
('In the Premier League, no team has ever finished a season unbeaten.', 0, 'Arsenal went unbeaten during the 2003–04 season.', 'Soccer', false, 'soccer4.jpg'),
('In international soccer, penalty shootouts were first introduced in the 1970s.', 1, 'They were adopted to avoid replayed matches.', 'Soccer', false, 'soccer5.jpg'),
('Lionel Messi has won league titles in three different countries.', 1, 'He won domestic leagues in Spain and France, plus later abroad.', 'Soccer', false, 'soccer6.jpg'),
('In the FIFA Laws of the Game, a goalkeeper can handle the ball anywhere inside the penalty area.', 0, 'They cannot handle deliberate back-passes from teammates.', 'Soccer', false, 'soccer7.jpg'),
('In World Cup history, the Golden Boot can be shared by multiple players.', 1, 'Ties are decided by assists and minutes only in recent editions.', 'Soccer', false, 'soccer8.jpg'),
('In European soccer, promotion and relegation systems exist in most national leagues.', 1, NULL, 'Soccer', false, 'soccer9.jpg'),
('Cristiano Ronaldo scored his first professional goal in the UEFA Champions League.', 0, 'His first senior goal came in domestic competition.', 'Soccer', false, 'soccer10.jpg'),

('In the FIFA World Cup, host nations are automatically qualified for the tournament.', 1, NULL, 'Soccer', false, 'soccer11.jpg'),
('In soccer, a direct free kick can be scored without touching another player.', 1, 'The ball can go directly into the goal.', 'Soccer', false, 'soccer12.jpg'),
('In international soccer, yellow cards reset after the group stage of the World Cup.', 0, 'Accumulated cards can carry over to knockout rounds.', 'Soccer', false, 'soccer13.jpg'),
('In European football history, Juventus has never been relegated.', 0, 'Juventus was relegated to Serie B in 2006.', 'Soccer', false, 'soccer14.jpg'),
('In the Premier League, goal difference is used before head-to-head results to rank teams.', 1, NULL, 'Soccer', false, 'soccer15.jpg'),
('The FIFA World Cup trophy is made entirely of solid gold.', 0, 'It is hollow and made of 18-carat gold.', 'Soccer', false, 'soccer16.jpg'),
('In soccer, a player can score an own goal directly from a corner kick.', 0, 'A corner leading directly to an own goal results in another corner.', 'Soccer', false, 'soccer17.jpg'),
('In the Champions League, away goals are no longer used as a tiebreaker.', 1, 'UEFA abolished the rule in 2021.', 'Soccer', false, 'soccer18.jpg'),
('In international soccer, a match can end without any added time.', 1, NULL, 'Soccer', false, 'soccer19.jpg'),
('In European soccer, Bayern Munich has won the Bundesliga more times than any other club.', 1, NULL, 'Soccer', false, 'soccer20.jpg'),

('In soccer rules, a dropped ball must always be contested by at least two players.', 0, 'Modern rules allow uncontested dropped balls.', 'Soccer', false, 'soccer21.jpg'),
('In World Cup history, no African team has reached a semifinal.', 0, 'Morocco reached the semifinals in 2022.', 'Soccer', false, 'soccer22.jpg'),
('In professional soccer, squad numbers were mandatory before the 1950s.', 0, 'Permanent squad numbers came much later.', 'Soccer', false, 'soccer23.jpg'),
('In soccer, VAR can overturn goals for offside decisions made by millimeters.', 1, 'Technology uses calibrated lines for decisions.', 'Soccer', false, 'soccer24.jpg'),
('In European competitions, clubs from the same country can face each other in early knockout rounds.', 1, NULL, 'Soccer', false, 'soccer25.jpg'),
('In FIFA regulations, a match can be abandoned if a team has fewer than seven players.', 1, 'Seven players is the minimum required.', 'Soccer', false, 'soccer26.jpg'),
('In the Premier League, referees are allowed to wear non-black kits.', 1, NULL, 'Soccer', false, 'soccer27.jpg'),
('In World Cup history, the final has always been played on a Sunday.', 0, 'Some finals were played on different days.', 'Soccer', false, 'soccer28.jpg'),
('In soccer tactics, a false nine refers to a midfielder playing as a striker.', 1, 'The player drops deep to create space.', 'Soccer', false, 'soccer29.jpg'),
('In European football, Ajax has won the Champions League more times than Barcelona.', 0, 'Barcelona has more Champions League titles.', 'Soccer', false, 'soccer30.jpg'),

('In international soccer, a player can represent more than one national team in official matches.', 0, 'Once capped competitively, a switch is restricted.', 'Soccer', false, 'soccer31.jpg'),
('In soccer, the penalty spot is exactly 12 yards from the goal line.', 1, NULL, 'Soccer', false, 'soccer32.jpg'),
('In World Cup tournaments, goalkeepers have won the Golden Ball award.', 1, 'Oliver Kahn won it in 2002.', 'Soccer', false, 'soccer33.jpg'),
('In professional soccer, artificial turf is banned by FIFA.', 0, 'Artificial turf is allowed under regulations.', 'Soccer', false, 'soccer34.jpg'),
('In soccer history, the back-pass rule was introduced in the 1990s.', 1, 'It aimed to reduce time-wasting.', 'Soccer', false, 'soccer35.jpg'),
('In European club football, PSG won the Champions League before 2020.', 0, 'PSG reached the final but did not win.', 'Soccer', false, 'soccer36.jpg'),
('In FIFA competitions, extra time is always played before penalties.', 1, NULL, 'Soccer', false, 'soccer37.jpg'),
('In soccer, a throw-in can result directly in a goal for the throwing team.', 0, 'It must touch another player first.', 'Soccer', false, 'soccer38.jpg'),
('In international soccer, Germany has won the World Cup more times than Italy.', 0, 'Italy has four titles, Germany also has four.', 'Soccer', false, 'soccer39.jpg'),
('In European soccer leagues, winter breaks are common but not universal.', 1, NULL, 'Soccer', false, 'soccer40.jpg'),

('In soccer, a match referee has the authority to stop a game permanently.', 1, 'Safety concerns can justify abandonment.', 'Soccer', false, 'soccer41.jpg'),
('In World Cup history, no final has ever gone to penalties.', 0, 'The 1994 final was decided by penalties.', 'Soccer', false, 'soccer42.jpg'),
('In professional soccer, shirt sponsorships were common before the 1960s.', 0, 'They became widespread much later.', 'Soccer', false, 'soccer43.jpg'),
('In soccer, advantage can be applied even after a foul inside the penalty area.', 1, 'Referees may delay the whistle.', 'Soccer', false, 'soccer44.jpg'),
('In European football, clubs can qualify for continental competitions through domestic cups.', 1, NULL, 'Soccer', false, 'soccer45.jpg'),
('In FIFA World Cup history, Pelé scored in every final he played.', 1, 'He scored in the 1958 and 1970 finals.', 'Soccer', false, 'soccer46.jpg'),
('In soccer, a goalkeeper cannot score a goal from open play.', 0, 'Goalkeepers have scored goals from play.', 'Soccer', false, 'soccer47.jpg'),
('In European leagues, points deductions can be applied for financial violations.', 1, NULL, 'Soccer', false, 'soccer48.jpg'),
('In soccer history, red cards were introduced before yellow cards.', 0, 'Yellow and red cards were introduced together.', 'Soccer', false, 'soccer49.jpg'),
('In international soccer, substitutions were always allowed since the sport began.', 0, 'Substitutions were introduced much later.', 'Soccer', false, 'soccer50.jpg'),

('In soccer, a free kick can be indirect even if awarded inside the penalty area.', 1, 'Indirect free kicks can occur for technical fouls.', 'Soccer', false, 'soccer51.jpg'),
('In World Cup history, France has won the tournament as both host and non-host.', 1, NULL, 'Soccer', false, 'soccer52.jpg'),
('In professional soccer, referees can add unlimited stoppage time.', 1, 'There is no formal upper limit.', 'Soccer', false, 'soccer53.jpg'),
('In European football, Manchester United has never been relegated from the Premier League era.', 1, NULL, 'Soccer', false, 'soccer54.jpg'),
('In soccer rules, a goal can be awarded after the final whistle.', 0, 'Play must be active for a goal to count.', 'Soccer', false, 'soccer55.jpg'),
('In international soccer, the Confederations Cup is still an active tournament.', 0, 'It was discontinued by FIFA.', 'Soccer', false, 'soccer56.jpg'),
('In soccer tactics, a low block refers to a defensive line positioned deep.', 1, NULL, 'Soccer', false, 'soccer57.jpg'),
('In World Cup history, South American teams have won tournaments held in Europe.', 1, 'Brazil won the 1958 World Cup in Sweden.', 'Soccer', false, 'soccer58.jpg'),
('In professional soccer, goal-line technology is mandatory in all leagues.', 0, 'Its use depends on the competition.', 'Soccer', false, 'soccer59.jpg'),
('In soccer, a team can win a match despite having zero shots on target.', 1, 'Own goals can decide matches.', 'Soccer', false, 'soccer60.jpg'),

('In international soccer, the captain is the only player allowed to speak to the referee.', 0, 'Other players may speak respectfully.', 'Soccer', false, 'soccer61.jpg'),
('In European football, Sevilla holds the record for most Europa League titles.', 1, NULL, 'Soccer', false, 'soccer62.jpg'),
('In soccer history, floodlights were introduced before televised matches.', 1, 'They enabled night games before TV broadcasts.', 'Soccer', false, 'soccer63.jpg'),
('In FIFA rules, a player can be offside from a throw-in.', 0, 'Offside does not apply to throw-ins.', 'Soccer', false, 'soccer64.jpg'),
('In professional soccer, managers can receive yellow and red cards.', 1, NULL, 'Soccer', false, 'soccer65.jpg'),
('In World Cup history, Italy has never lost a final in regular time.', 1, 'All Italian final losses came via penalties.', 'Soccer', false, 'soccer66.jpg'),
('In soccer, a match must be replayed if it ends in a draw.', 0, 'League matches often allow draws.', 'Soccer', false, 'soccer67.jpg'),
('In European football, clubs can be banned from competitions for fan behavior.', 1, NULL, 'Soccer', false, 'soccer68.jpg'),
('In soccer rules, a handball is always a yellow card offense.', 0, 'Context determines disciplinary action.', 'Soccer', false, 'soccer69.jpg'),
('In international soccer, referees are required to speak English.', 0, 'There is no such requirement.', 'Soccer', false, 'soccer70.jpg'),

('In soccer, a match ball must be spherical and meet size regulations.', 1, NULL, 'Soccer', false, 'soccer71.jpg'),
('In World Cup history, England has won more than one World Cup.', 0, 'England has won only once.', 'Soccer', false, 'soccer72.jpg'),
('In professional soccer, players can be transferred outside of transfer windows.', 0, 'Transfers are restricted to windows.', 'Soccer', false, 'soccer73.jpg'),
('In soccer, a goal kick can result directly in a goal for the kicking team.', 1, 'Law changes now allow direct goals.', 'Soccer', false, 'soccer74.jpg'),
('In European football, referees are selected independently from clubs.', 1, NULL, 'Soccer', false, 'soccer75.jpg'),
('In international soccer, FIFA was founded before UEFA.', 1, 'FIFA was founded in 1904.', 'Soccer', false, 'soccer76.jpg'),
('In soccer, players can wear any color boots without restriction.', 1, NULL, 'Soccer', false, 'soccer77.jpg'),
('In World Cup history, the same country has won three consecutive titles.', 0, 'No nation has won three in a row.', 'Soccer', false, 'soccer78.jpg'),
('In professional soccer, referees can review decisions on a pitch-side monitor.', 1, NULL, 'Soccer', false, 'soccer79.jpg'),
('In soccer, a draw always benefits both teams equally.', 0, 'Standings context affects impact.', 'Soccer', false, 'soccer80.jpg'),

('In international soccer, FIFA rankings are based solely on match results.', 0, 'They also consider opponent strength.', 'Soccer', false, 'soccer81.jpg'),
('In European football, some leagues award three points for a win.', 1, NULL, 'Soccer', false, 'soccer82.jpg'),
('In soccer history, the World Cup has been canceled more than once.', 0, 'It was canceled only during WWII.', 'Soccer', false, 'soccer83.jpg'),
('In professional soccer, medical staff can enter the field without referee permission.', 0, 'Referee approval is required.', 'Soccer', false, 'soccer84.jpg'),
('In soccer, a match can be decided by a coin toss.', 0, 'Coin tosses only decide kickoff.', 'Soccer', false, 'soccer85.jpg'),
('In international soccer, substitution limits have changed over time.', 1, NULL, 'Soccer', false, 'soccer86.jpg'),
('In European football, clubs can be owned by foreign investors.', 1, NULL, 'Soccer', false, 'soccer87.jpg'),
('In soccer rules, a penalty can be retaken if the goalkeeper moves early.', 1, 'Encroachment rules apply.', 'Soccer', false, 'soccer88.jpg'),
('In World Cup history, every host nation has reached the knockout stage.', 0, 'Some hosts were eliminated early.', 'Soccer', false, 'soccer89.jpg'),
('In professional soccer, referees can end a match early due to weather.', 1, 'Safety conditions can end matches.', 'Soccer', false, 'soccer90.jpg'),

('In soccer, a player can score with any part of the body except arms and hands.', 1, NULL, 'Soccer', false, 'soccer91.jpg'),
('In European football, VAR is mandatory in all competitions.', 0, 'Its usage depends on the competition.', 'Soccer', false, 'soccer92.jpg'),
('In international soccer, the World Cup has always featured 32 teams.', 0, 'Earlier tournaments had fewer teams.', 'Soccer', false, 'soccer93.jpg'),
('In professional soccer, referees are paid by the home club.', 0, 'They are paid by governing bodies.', 'Soccer', false, 'soccer94.jpg'),
('In soccer tactics, pressing refers to applying pressure without the ball.', 1, NULL, 'Soccer', false, 'soccer95.jpg'),
('In World Cup history, the Golden Boot winner always comes from the winning team.', 0, 'Top scorers can be from other teams.', 'Soccer', false, 'soccer96.jpg'),
('In soccer, a red card always results in a multi-match suspension.', 0, 'Suspensions depend on competition rules.', 'Soccer', false, 'soccer97.jpg'),
('In European football, clubs must meet financial fair play requirements.', 1, NULL, 'Soccer', false, 'soccer98.jpg'),
('In international soccer, referees can overrule assistant referees.', 1, 'The referee has final authority.', 'Soccer', false, 'soccer99.jpg'),
('In soccer, a match can officially end before 90 minutes are completed.', 1, 'Abandonment can end matches early.', 'Soccer', false, 'soccer100.jpg');


INSERT INTO `questions`
(`question`, `answer`, `answer_detail`, `category`, `is_video_only`, `image_file`)
VALUES
('In the Premier League, Riyad Mahrez won the PFA Player of the Year award in 2016.', 1, 'He won it after Leicester City’s title season.', 'Soccer', false, 'premier_league.jpg'),
('N’Golo Kanté won league titles in both France and England in consecutive seasons.', 1, 'With Leicester City then Chelsea.', 'Soccer', false, 'soccer_player.jpg'),
('Cesc Fàbregas provided over 100 assists in the Premier League.', 1, NULL, 'Soccer', false, 'soccer_player.jpg'),
('In the Champions League, Blaise Matuidi never scored a knockout-stage goal.', 0, 'He scored during Juventus knockout matches.', 'Soccer', false, 'soccer_player.jpg'),
('In La Liga, Karim Benzema won a Pichichi Trophy.', 1, 'He won it in the 2021–22 season.', 'Soccer', false, 'soccer_player.jpg'),
('In international tournaments, Luka Modrić has won a Golden Ball award.', 1, 'He won it at the 2018 World Cup.', 'Soccer', false, 'soccer_player.jpg'),
('In the Bundesliga, Robert Lewandowski broke Gerd Müller’s single-season goal record.', 1, NULL, 'Soccer', false, 'soccer_player.jpg'),
('In the Serie A, Zlatan Ibrahimović never won a league title.', 0, 'He won titles with AC Milan and Inter.', 'Soccer', false, 'soccer_player.jpg'),
('In the Premier League, Thierry Henry won the Golden Boot four times.', 1, NULL, 'Soccer', false, 'soccer_player.jpg'),
('In international football, Didier Drogba never scored at a World Cup.', 1, 'He failed to score in his World Cup appearances.', 'Soccer', false, 'premier_league.jpg'),

('In the Champions League, Cristiano Ronaldo scored more than 130 goals.', 1, NULL, 'Soccer', false, 'ronaldo.jpg'),
('Lionel Messi has won the Ballon d’Or more times than any other player.', 1, NULL, 'Soccer', false, 'messi.jpg'),
('In the Premier League, Kevin De Bruyne equaled the single-season assist record.', 1, 'He matched Thierry Henry’s record.', 'Soccer', false, 'messi.jpg'),
('In La Liga, Xavi Hernández never scored more than 5 goals in a season.', 0, 'He scored more than that in several seasons.', 'Soccer', false, 'premier_league.jpg'),
('In international football, Andrés Iniesta scored the winning goal in a World Cup final.', 1, NULL, 'Soccer', false, 'xavi.jpg'),
('In the Premier League, Mohamed Salah scored 32 goals in a single season.', 1, 'During the 2017–18 season.', 'Soccer', false, 'premier_league.jpg'),
('In Serie A, Gianluigi Buffon won more than 10 league titles.', 1, NULL, 'Soccer', false, 'soccer_goalkeeper.jpg'),
('In the Champions League, Manuel Neuer has provided an assist.', 1, 'He assisted a goal with Bayern Munich.', 'Soccer', false, 'soccer_goalkeeper.jpg'),
('In La Liga, Ronaldinho won the league only once.', 0, 'He won it twice with Barcelona.', 'Soccer', false, 'soccer_player.jpg'),
('In the Premier League, Patrick Vieira was never team captain.', 0, 'He captained Arsenal.', 'Soccer', false, 'premier_league.jpg'),

('In international football, Kylian Mbappé scored a hat-trick in a World Cup final.', 1, NULL, 'Soccer', false, 'mbappe.jpg'),
('In Ligue 1, Neymar never reached 20 assists in a season.', 1, NULL, 'Soccer', false, 'soccer_player.jpg'),
('In the Champions League, Sergio Ramos scored more goals than many forwards.', 1, 'He is one of the top-scoring defenders.', 'Soccer', false, 'soccer_player.jpg'),
('In the Premier League, Virgil van Dijk went an entire season without being dribbled past.', 1, 'During the 2018–19 season.', 'Soccer', false, 'soccer_player.jpg'),
('In Serie A, Andrea Pirlo won the league with two different clubs.', 1, 'With AC Milan and Juventus.', 'Soccer', false, 'pirlo.jpg'),
('In La Liga, Luka Modrić never won a domestic cup.', 0, 'He won multiple Copa del Rey titles.', 'Soccer', false, 'modric.jpg'),
('In international football, Xabi Alonso scored in two different World Cup finals.', 0, 'He scored only once in a final.', 'Soccer', false, 'soccer_player.jpg'),
('In the Bundesliga, Thomas Müller has recorded more than 20 assists in a season.', 1, NULL, 'Soccer', false, 'soccer_player.jpg'),
('In Ligue 1, Zlatan Ibrahimović won the league four times consecutively.', 1, NULL, 'Soccer', false, 'soccer_player.jpg'),
('In the Premier League, Eden Hazard never scored a headed goal.', 0, 'He scored headers for Chelsea.', 'Soccer', false, 'soccer_player.jpg'),

('In the Champions League, Chelsea won the tournament without losing a match in 2012.', 1, NULL, 'Soccer', false, 'soccer_club.jpg'),
('AC Milan have won more Champions League titles than Barcelona.', 1, NULL, 'Soccer', false, 'acmilan.jpg'),
('In the Premier League era, Manchester City won their first title in 2012.', 1, 'They won it on goal difference.', 'Soccer', false, 'manchester_city.jpg'),
('In La Liga, Atlético Madrid won the league in the 2013–14 season.', 1, NULL, 'Soccer', false, 'atletico.jpg'),
('In Serie A, Juventus were relegated to Serie B in 2006.', 1, 'Due to the Calciopoli scandal.', 'Soccer', false, 'juventus.jpg'),
('In the Bundesliga, Bayern Munich have won more than 30 league titles.', 1, NULL, 'Soccer', false, 'bayern.jpg'),
('In Ligue 1, AS Monaco won the league undefeated in 2017.', 0, 'They lost matches that season.', 'Soccer', false, 'soccer_club.jpg'),
('In the Premier League, Arsenal completed a season unbeaten.', 1, 'The 2003–04 Invincibles.', 'Soccer', false, 'arsenal.jpg'),
('In La Liga, Real Madrid won five consecutive Champions League titles.', 1, 'Between 1956 and 1960.', 'Soccer', false, 'real_madrid.jpg'),
('In Serie A, Inter Milan won a continental treble in 2010.', 1, NULL, 'Soccer', false, 'inter.jpg'),

('In modern football sponsorships, Adidas has sponsored both Lionel Messi and Mohamed Salah.', 1, NULL, 'Soccer', false, 'soccer_brand.jpg'),
('Nike has sponsored more World Cup winning teams than Adidas.', 0, 'Adidas sponsored more winners.', 'Soccer', false, 'nike.jpg'),
('In the Premier League, referees began using VAR in the 2019–20 season.', 1, NULL, 'Soccer', false, 'soccer_referee.jpg'),
('In international football, goal-line technology was first used in a World Cup in 2014.', 1, NULL, 'Soccer', false, 'soccer_referee.jpg');

INSERT INTO `questions`
(`question`, `answer`, `answer_detail`, `category`, `is_video_only`, `image_file`)
VALUES
('Lionel Messi scored at least one goal in every calendar year between 2005 and 2023.', 1, NULL, 'Soccer', false, 'messi.jpg'),
('Cristiano Ronaldo has scored official goals with both his left foot and right foot more than headers.', 1, 'Most of his goals are non-headed finishes.', 'Soccer', false, 'ronaldo.jpg'),
('N’Golo Kanté has never received a red card in his professional club career.', 1, NULL, 'Soccer', false, 'soccer_player.jpg'),
('Riyad Mahrez scored a hat-trick in a UEFA Champions League knockout match.', 1, 'He did so with Manchester City.', 'Soccer', false, 'soccer_player.jpg'),
('Cesc Fàbregas registered more assists than goals across his entire club career.', 1, NULL, 'Soccer', false, 'soccer_player.jpg'),
('Didier Drogba scored more goals in finals than in group-stage finals.', 1, 'He was known as a big-game scorer.', 'Soccer', false, 'soccer_player.jpg'),
('Zlatan Ibrahimović has scored a goal in league play after the age of 40.', 1, 'He scored with AC Milan.', 'Soccer', false, 'ibrahimovic.jpg'),
('Karim Benzema won the Ballon d’Or without winning the Champions League that same year.', 0, 'He won both in 2022.', 'Soccer', false, 'soccer_player.jpg'),
('Luka Modrić has played in a World Cup final and a Champions League final in the same year.', 1, 'He did so in 2018.', 'Soccer', false, 'modric.jpg'),
('Andrés Iniesta never scored from outside the penalty box in his career.', 0, 'He scored several long-range goals.', 'Soccer', false, 'xavi.jpg'),

('Thierry Henry recorded a 20 goals / 20 assists season in league play.', 1, 'He achieved this with Arsenal.', 'Soccer', false, 'thierry_henry.jpg'),
('Mohamed Salah has scored a goal with his weaker foot in a Champions League final.', 0, NULL, 'Soccer', false, 'soccer_player.jpg'),
('Kevin De Bruyne has provided assists in three different Champions League semifinals.', 1, NULL, 'Soccer', false, 'soccer_player.jpg'),
('Virgil van Dijk finished second in the Ballon d’Or voting.', 1, 'He finished second in 2019.', 'Soccer', false, 'soccer_player.jpg'),
('Sergio Ramos has scored more Champions League goals than some midfielders.', 1, NULL, 'Soccer', false, 'soccer_player.jpg'),
('Manuel Neuer has been credited with redefining the sweeper-keeper role.', 1, NULL, 'Soccer', false, 'soccer_goalkeeper.jpg'),
('Gianluigi Buffon won a Champions League title as a starting goalkeeper.', 0, 'He lost three finals.', 'Soccer', false, 'soccer_goalkeeper.jpg'),
('Iker Casillas won the Champions League before turning 21.', 1, 'He won it in 2000.', 'Soccer', false, 'soccer_goalkeeper.jpg'),
('Ronaldinho won a Champions League title with Barcelona.', 1, NULL, 'Soccer', false, 'soccer_player.jpg'),
('Kaká won the Ballon d’Or without winning a domestic league title that season.', 1, 'AC Milan finished second.', 'Soccer', false, 'soccer_player.jpg'),

('Real Madrid have won the Champions League with three different managers in a row.', 1, 'Ancelotti and Zidane were involved.', 'Soccer', false, 'real_madrid.jpg'),
('Barcelona once won a Champions League final without conceding a single shot on target.', 1, NULL, 'Soccer', false, 'barcelona.jpg'),
('AC Milan have appeared in more Champions League finals than Bayern Munich.', 1, NULL, 'Soccer', false, 'acmilan.jpg'),
('Manchester United won a Champions League final after scoring twice in stoppage time.', 1, 'The 1999 final.', 'Soccer', false, 'manchester_united.jpg'),
('Chelsea won the Champions League despite finishing outside the top two domestically.', 1, NULL, 'Soccer', false, 'chelsea.jpg'),
('Juventus have lost more Champions League finals than any other club.', 1, NULL, 'Soccer', false, 'juventus.jpg'),
('Atlético Madrid have reached multiple Champions League finals without winning one.', 1, NULL, 'Soccer', false, 'atletico.jpg'),
('Inter Milan won a continental treble under José Mourinho.', 1, NULL, 'Soccer', false, 'inter.jpg'),
('Bayern Munich once won the Champions League without losing a single match.', 1, NULL, 'Soccer', false, 'bayern.jpg'),
('Arsenal have won a Champions League final.', 0, NULL, 'Soccer', false, 'arsenal.jpg'),

('A World Cup Golden Boot winner has never won the tournament in the same year.', 0, 'This has happened multiple times.', 'Soccer', false, 'soccer_trophy.jpg'),
('The World Cup has been won by a host nation more than once.', 1, NULL, 'Soccer', false, 'soccer_trophy.jpg'),
('Pelé won three World Cups while starting all matches in each tournament.', 0, 'He missed matches due to injury.', 'Soccer', false, 'soccer_legend.jpg'),
('Diego Maradona scored a goal directly from a corner kick in his career.', 0, NULL, 'Soccer', false, 'soccer_legend.jpg'),
('Zinedine Zidane received a red card in a World Cup final.', 1, NULL, 'Soccer', false, 'soccer_legend.jpg'),
('France won a World Cup without conceding a goal from open play.', 1, 'In 1998.', 'Soccer', false, 'soccer_worldcup.jpg'),
('Brazil have never lost a World Cup final when scoring first.', 1, NULL, 'Soccer', false, 'soccer_worldcup.jpg'),
('Germany won a World Cup final with a goal scored in extra time.', 1, 'The 2014 final.', 'Soccer', false, 'soccer_worldcup.jpg'),
('Argentina won a World Cup final decided by penalties.', 1, 'In 2022.', 'Soccer', false, 'soccer_worldcup.jpg'),
('Italy won a World Cup final without scoring a goal in regular time.', 1, 'The 2006 final.', 'Soccer', false, 'soccer_worldcup.jpg'),

('The offside rule was originally introduced to prevent goal-hanging.', 1, NULL, 'Soccer', false, 'soccer_rules.jpg'),
('A goalkeeper can legally score from a goal kick without another touch.', 1, 'If it enters the opponent’s goal directly.', 'Soccer', false, 'soccer_rules.jpg'),
('VAR can overturn a referee decision even if play has restarted.', 0, NULL, 'Soccer', false, 'soccer_referee.jpg'),
('A penalty kick can legally be taken backwards.', 1, 'As long as it moves forward initially.', 'Soccer', false, 'soccer_rules.jpg'),
('A player can be offside from a throw-in.', 0, NULL, 'Soccer', false, 'soccer_rules.jpg'),

('Nike has sponsored both Cristiano Ronaldo and Kylian Mbappé at the same time.', 1, NULL, 'Soccer', false, 'soccer_brand.jpg'),
('Adidas has been the official World Cup ball supplier since 1970.', 1, NULL, 'Soccer', false, 'soccer_brand.jpg'),
('Puma has sponsored a Champions League winning team.', 1, 'Manchester City.', 'Soccer', false, 'soccer_brand.jpg'),
('Umbro has never sponsored a national team in a World Cup.', 0, 'They sponsored England.', 'Soccer', false, 'soccer_brand.jpg');


-- Guiness 50
INSERT INTO `questions`
(`question`, `answer`, `answer_detail`, `category`, `is_video_only`, `image_file`)
VALUES
('The tallest man ever recorded was over 2.7 meters tall.', 1, 'Yes, Robert Wadlow.', 'Guiness', false, 'guinness.jpg'),
('The longest fingernails ever recorded exceeded 9 meters combined.', 1, 'Yes, they exceeded 9 meters.', 'Guiness', false, 'guinness.jpg'),
('The fastest 100-meter sprint by a human was under 9.5 seconds.', 0, 'No, the record is 9.58 seconds.', 'Guiness', false, 'guinness.jpg'),
('The largest pizza ever made was over 1,200 square meters.', 1, 'Yes, it was made in Italy.', 'Guiness', false, 'pizza.jpg'),
('The longest time without sleep officially recorded exceeded 11 days.', 1, 'Yes, over 260 hours.', 'Guiness', false, 'sleep.jpg'),

('The heaviest aircraft ever to fly was the Airbus A380.', 1, 'Yes, at maximum takeoff weight.', 'Guiness', false, 'guinness.jpg'),
('The most goals scored in a single World Cup tournament is 16.', 1, 'Yes, by Just Fontaine.', 'Guiness', false, 'guinnessd.jpg'),
('The largest human pyramid ever involved more than 9,000 people.', 0, NULL, 'Guiness', false, 'guinness.jpg'),
('The longest marathon playing video games lasted more than 130 hours.', 1, 'Yes, over five days.', 'Guiness', false, 'guinness.jpg'),
('The tallest building ever completed is over 1,000 meters high.', 0, 'No, it is under 1,000 meters.', 'Guiness', false, 'guinness.jpg'),

('The fastest land animal recorded is the cheetah.', 1, 'Yes, officially measured.', 'Guiness', false, 'guinness2.jpg'),
('The longest beard ever recorded measured over 5 meters.', 1, 'Yes, by Hans Langseth.', 'Guiness', false, 'guinness3.jpg'),
('The most expensive car ever sold at auction exceeded 100 million dollars.', 1, 'Yes, a Ferrari 250 GTO.', 'Guiness', false, 'guinness.jpg'),
('The largest chocolate bar ever made weighed more than 5,000 kg.', 1, NULL, 'Guiness', false, 'guinness.jpg'),
('The longest official kiss lasted more than 50 hours.', 1, 'Yes, over two days.', 'Guiness', false, 'guinness.jpg'),

('The most viewed YouTube video of all time is a music video.', 1, 'Yes, a music video.', 'Guiness', false, 'guinness.jpg'),
('The longest-running TV show has aired for over 80 years.', 0, 'No, it is under 80 years.', 'Guiness', false, 'guinness.jpg'),
('The fastest time to solve a Rubik’s Cube is under 4 seconds.', 1, 'Yes, under 4 seconds.', 'Guiness', false, 'guinness.jpg'),
('The most expensive painting ever sold exceeded 450 million dollars.', 1, 'Yes, Leonardo da Vinci’s work.', 'Guiness', false, 'guinness.jpg'),
('The largest stadium ever built can hold over 150,000 people.', 1, 'Yes, Rungrado Stadium.', 'Guiness', false, 'guinness.jpg'),

('The longest snake ever recorded was over 10 meters long.', 1, 'Yes, a reticulated python.', 'Guiness', false, 'guinness.jpg'),
('The fastest commercial airplane exceeded Mach 3.', 0, 'No, it was under Mach 3.', 'Guiness', false, 'guinness.jpg'),
('The most tattoos on a single person exceeds 95 percent body coverage.', 1, 'Yes, nearly full coverage.', 'Guiness', false, 'guindness.jpg'),
('The longest-running video game franchise is over 50 years old.', 0, NULL, 'Guiness', false, 'guinness.jpg'),
('The largest concert crowd ever recorded exceeded 3 million people.', 1, 'Yes, at Copacabana.', 'Guiness', false, 'guinness.jpg'),

('The fastest goal ever scored in professional football was under 3 seconds.', 1, 'Yes, around 2 seconds.', 'Guiness', false, 'guinness.jpg'),
('The longest time holding breath underwater exceeds 20 minutes.', 1, 'Yes, with oxygen.', 'Guiness', false, 'guinness.jpg'),
('The heaviest pumpkin ever grown weighed over 1,200 kg.', 1, 'Yes, a record-breaking pumpkin.', 'Guiness', false, 'guinness.jpg'),
('The most languages spoken fluently by one person exceeds 40.', 1, 'Yes, more than 40.', 'Guiness', false, 'guinness.jpg'),
('The largest ship ever built was over 450 meters long.', 0, 'No, it was shorter.', 'Guiness', false, 'guinness.jpg'),

('The longest time spent balancing a ball on the head exceeded 2 hours.', 1, NULL, 'Guiness', false, 'guinness.jpg'),
('The most downloaded mobile game of all time exceeded 10 billion downloads.', 1, 'Yes, across all versions.', 'Guiness', false, 'gudinness.jpg'),
('The tallest dog ever recorded stood over 1 meter at the shoulder.', 1, 'Yes, a Great Dane.', 'Guiness', false, 'guinfness.jpg'),
('The longest railway platform in the world exceeds 1 kilometer.', 1, 'Yes, in India.', 'Guiness', false, 'guinnesgs.jpg'),
('The largest collection of sneakers exceeds 20,000 pairs.', 1, 'Yes, officially recorded.', 'Guiness', false, 'guinndess.jpg');


-- History 
INSERT INTO `questions`
(`question`, `answer`, `answer_detail`, `category`, `is_video_only`, `image_file`)
VALUES
('The Roman Empire officially fell in 476 AD.', 1, 'Yes, with the fall of Romulus Augustulus.', 'History', false, 'roman_empire.jpg'),
('Julius Caesar was killed inside the Roman Senate.', 1, 'Yes, on the Ides of March.', 'History', false, 'roman_senate.jpg'),
('Cleopatra was ethnically Egyptian.', 0, 'No, she was of Greek origin.', 'History', false, 'cleopatra.jpg'),
('The Great Wall of China was built as a single continuous project.', 0, NULL, 'History', false, 'great_wall.jpg'),
('Napoleon Bonaparte crowned himself emperor.', 1, 'Yes, in 1804.', 'History', false, 'napoleon.jpg'),

('The French Revolution began in 1789.', 1, NULL, 'History', false, 'french_revolution.jpg'),
('Marie Antoinette said “Let them eat cake.”', 0, 'No, the quote is apocryphal.', 'History', false, 'marie_antoinette.jpg'),
('The Bastille was a functioning prison holding many inmates in 1789.', 0, 'No, it held very few prisoners.', 'History', false, 'bastille.jpg'),
('The Magna Carta was signed in 1215.', 1, NULL, 'History', false, 'magna_carta.jpg'),
('Medieval knights commonly fought in full plate armor.', 1, NULL, 'History', false, 'medieval_knight.jpg'),

('Vikings reached North America before Christopher Columbus.', 1, 'Yes, around the year 1000.', 'History', false, 'vikings.jpg'),
('Christopher Columbus believed he had reached Asia.', 1, NULL, 'History', false, 'columbus.jpg'),
('The Aztec Empire was conquered by Hernán Cortés.', 1, NULL, 'History', false, 'aztec.jpg'),
('The Inca Empire had a written language.', 0, 'No, they used quipus.', 'History', false, 'inca.jpg'),
('The Black Death killed over one third of Europe’s population.', 1, NULL, 'History', false, 'plague.jpg'),

('The Hundred Years’ War lasted more than 100 years.', 1, 'Yes, from 1337 to 1453.', 'History', false, 'medieval_war.jpg'),
('Joan of Arc was executed by the English.', 1, NULL, 'History', false, 'joan_of_arc.jpg'),
('The Ottoman Empire captured Constantinople in 1453.', 1, NULL, 'History', false, 'constantinople.jpg'),
('Gunpowder was first invented in Europe.', 0, 'No, it originated in China.', 'History', false, 'gunpowder.jpg'),
('The Renaissance began in Italy.', 1, NULL, 'History', false, 'renaissance.jpg'),

('Leonardo da Vinci painted the Mona Lisa.', 1, NULL, 'History', false, 'mona_lisa.jpg'),
('The printing press was invented by Johannes Gutenberg.', 1, NULL, 'History', false, 'printing_press.jpg'),
('The Protestant Reformation was started by Martin Luther.', 1, 'Yes, in 1517.', 'History', false, 'martin_luther.jpg'),
('The Thirty Years’ War was primarily a religious conflict.', 1, NULL, 'History', false, 'thirty_years_war.jpg'),
('The Treaty of Versailles officially ended World War I.', 1, NULL, 'History', false, 'versailles.jpg'),

('World War I began in 1914.', 1, NULL, 'History', false, 'ww1.jpg'),
('The assassination of Archduke Franz Ferdinand triggered World War I.', 1, NULL, 'History', false, 'franz_ferdinand.jpg'),
('World War II ended in 1944.', 0, 'No, it ended in 1945.', 'History', false, 'ww2.jpg'),
('The Normandy landings occurred on D-Day.', 1, NULL, 'History', false, 'd_day.jpg'),
('The atomic bomb was used on Japan during World War II.', 1, NULL, 'History', false, 'atomic_bomb.jpg'),

('The Cold War involved direct military conflict between the USA and USSR.', 0, 'No, it was mostly indirect.', 'History', false, 'cold_war.jpg'),
('The Berlin Wall fell in 1989.', 1, NULL, 'History', false, 'berlin_wall.jpg'),
('The Soviet Union collapsed in 1991.', 1, NULL, 'History', false, 'soviet_union.jpg'),
('The first human landed on the Moon in 1969.', 1, 'Yes, Neil Armstrong.', 'History', false, 'moon_landing.jpg'),
('Ancient Egypt used a decimal system for counting.', 1, NULL, 'History', false, 'ancient_egypt.jpg');

-- RAP 200
INSERT INTO `questions`
(`question`, `answer`, `answer_detail`, `category`, `is_video_only`, `image_file`)
VALUES
('Jay-Z released his debut album in the 1990s.', 1, 'Yes, Reasonable Doubt.', 'Rap', false, 'jayz.jpg'),
('Nas won a Grammy for his album Illmatic.', 0, 'No, it never won a Grammy.', 'Rap', false, 'nas.jpg'),
('Tupac Shakur released more than one album after his death.', 1, 'Yes, several posthumous albums.', 'Rap', false, 'tupac.jpg'),
('The Notorious B.I.G. released only two studio albums while alive.', 1, NULL, 'Rap', false, 'biggie.jpg'),
('Dr. Dre founded the record label Death Row Records.', 0, 'No, he co-founded Aftermath.', 'Rap', false, 'drdre.jpg'),

('Eminem won an Oscar for a rap song.', 1, 'Yes, for Lose Yourself.', 'Rap', false, 'eminem.jpg'),
('Kanye West has won more than 20 Grammy Awards.', 1, NULL, 'Rap', false, 'kanye.jpg'),
('50 Cent’s debut album sold over 800,000 copies in its first week.', 1, 'Yes, Get Rich or Die Tryin’.', 'Rap', false, '50cent.jpg'),
('Snoop Dogg was originally discovered by Ice Cube.', 0, 'No, he was discovered by Dr. Dre.', 'Rap', false, 'snoop.jpg'),
('Ice Cube was a member of the group N.W.A.', 1, NULL, 'Rap', false, 'nwa.jpg'),

('N.W.A.’s album Straight Outta Compton was banned by some retailers.', 1, 'Yes, due to its content.', 'Rap', false, 'album.jpg'),
('Wu-Tang Clan consists of more than 7 members.', 1, NULL, 'Rap', false, 'wutang.jpg'),
('The album Enter the Wu-Tang (36 Chambers) was released in the 1980s.', 0, 'No, it was released in 1993.', 'Rap', false, 'album.jpg'),
('Drake started his career as an actor.', 1, 'Yes, on Degrassi.', 'Rap', false, 'drake.jpg'),
('Drake has topped the Billboard Hot 100 more than 10 times.', 1, NULL, 'Rap', false, 'charts.jpg'),

('Kendrick Lamar won a Pulitzer Prize for music.', 1, 'Yes, in 2018.', 'Rap', false, 'kendrick.jpg'),
('J. Cole went platinum without any featured artists.', 1, NULL, 'Rap', false, 'jcole.jpg'),
('Travis Scott’s album Astroworld debuted at number one.', 1, NULL, 'Rap', false, 'album.jpg'),
('Post Malone started his career primarily as a rapper.', 1, NULL, 'Rap', false, 'postmalone.jpg'),
('Lil Wayne was signed to Cash Money Records as a teenager.', 1, 'Yes, at age 11.', 'Rap', false, 'lilwayne.jpg'),

('Nicki Minaj was the first female rapper to top the Billboard Hot 100.', 0, 'No, she peaked at number two.', 'Rap', false, 'nicki.jpg'),
('Cardi B won a Grammy for Best Rap Album.', 1, 'Yes, Invasion of Privacy.', 'Rap', false, 'cardib.jpg'),
('Missy Elliott was inducted into the Rock and Roll Hall of Fame.', 1, NULL, 'Rap', false, 'missy.jpg'),
('Lauryn Hill won Album of the Year at the Grammys.', 1, 'Yes, in 1999.', 'Rap', false, 'laurynhill.jpg'),
('The Fugees released more than two studio albums.', 0, NULL, 'Rap', false, 'fugees.jpg'),

('OutKast won Album of the Year at the Grammys.', 1, 'Yes, for Speakerboxxx/The Love Below.', 'Rap', false, 'outkast.jpg'),
('André 3000 has released a solo rap album.', 0, 'No official solo rap album.', 'Rap', false, 'andre3000.jpg'),
('Big Boi released multiple solo albums.', 1, NULL, 'Rap', false, 'bigboi.jpg'),
('Run-D.M.C. collaborated with Aerosmith.', 1, 'Yes, Walk This Way.', 'Rap', false, 'run_dmc.jpg'),
('LL Cool J was one of the first rap artists to achieve mainstream success.', 1, NULL, 'Rap', false, 'llcoolj.jpg'),

('Public Enemy were known for politically charged lyrics.', 1, NULL, 'Rap', false, 'publicenemy.jpg'),
('The Source magazine is influential in hip-hop culture.', 1, NULL, 'Rap', false, 'magazine.jpg'),
('Def Jam Recordings played a major role in hip-hop’s rise.', 1, NULL, 'Rap', false, 'defjam.jpg'),
('Jay-Z was once the president of Def Jam.', 1, 'Yes, in the mid-2000s.', 'Rap', false, 'label.jpg'),
('Roc-A-Fella Records was co-founded by Jay-Z.', 1, NULL, 'Rap', false, 'label.jpg'),

('SoundCloud played a major role in the rise of modern rap artists.', 1, NULL, 'Rap', false, 'soundcloud.jpg'),
('Chance the Rapper won a Grammy without selling physical albums.', 1, 'Yes, streaming only.', 'Rap', false, 'chance.jpg'),
('XXXTENTACION released his debut album in the early 2010s.', 0, 'No, it was released in 2017.', 'Rap', false, 'xxxtentacion.jpg'),
('Juice WRLD was known for freestyling entire songs.', 1, NULL, 'Rap', false, 'juicewrld.jpg'),
('Playboi Carti popularized minimalist trap production.', 1, NULL, 'Rap', false, 'playboicarti.jpg'),

('Future is credited with popularizing melodic trap vocals.', 1, NULL, 'Rap', false, 'future.jpg'),
('Migos popularized the triplet flow in mainstream rap.', 1, NULL, 'Rap', false, 'migos.jpg'),
('Offset has released a solo album.', 1, NULL, 'Rap', false, 'offset.jpg'),
('Quavo has never released solo music.', 0, NULL, 'Rap', false, 'quavo.jpg'),
('Takeoff released a solo album before his death.', 1, 'Yes, in 2022.', 'Rap', false, 'takeoff.jpg'),

('DMX released multiple number-one albums.', 1, NULL, 'Rap', false, 'dmx.jpg'),
('A$AP Rocky is associated with the A$AP Mob collective.', 1, NULL, 'Rap', false, 'asaprocky.jpg'),
('Mac Miller transitioned from frat rap to more experimental styles.', 1, NULL, 'Rap', false, 'macmiller.jpg'),
('Tyler, The Creator founded the Odd Future collective.', 1, NULL, 'Rap', false, 'tyler.jpg'),
('Childish Gambino released music under a different stage name.', 1, 'Yes, Donald Glover.', 'Rap', false, 'childishgambino.jpg'),

('French Montana is originally from Morocco.', 1, NULL, 'Rap', false, 'frenchmontana.jpg'),
('DJ Khaled is primarily known as a producer and curator.', 1, NULL, 'Rap', false, 'djkhaled.jpg'),
('Rick Ross was formerly a correctional officer.', 1, 'Yes, before his rap career.', 'Rap', false, 'rickross.jpg'),
('Meek Mill was involved in criminal justice reform advocacy.', 1, NULL, 'Rap', false, 'meekmill.jpg'),
('Lil Uzi Vert released an album longer than 30 tracks.', 1, NULL, 'Rap', false, 'liluzi.jpg');

INSERT INTO `questions`
(`question`, `answer`, `answer_detail`, `category`, `is_video_only`, `image_file`)
VALUES
('Jay-Z was the first rapper to become a billionaire.', 1, 'Yes, according to Forbes.', 'Rap', false, 'jayz.jpg'),
('Nas released Illmatic after the year 2000.', 0, 'No, it was released in 1994.', 'Rap', false, 'nas.jpg'),
('Tupac Shakur appeared in multiple feature films.', 1, NULL, 'Rap', false, 'tupac.jpg'),
('The Notorious B.I.G. was part of Junior M.A.F.I.A.', 1, NULL, 'Rap', false, 'biggie.jpg'),
('Dr. Dre produced tracks for Eminem.', 1, NULL, 'Rap', false, 'drdre.jpg'),

('Eminem holds the record for fastest rap verse.', 1, 'Yes, in Godzilla.', 'Rap', false, 'eminem.jpg'),
('Kanye West began his career as a DJ.', 0, 'No, he started as a producer.', 'Rap', false, 'kanye.jpg'),
('50 Cent survived being shot multiple times.', 1, NULL, 'Rap', false, '50cent.jpg'),
('Snoop Dogg changed his stage name multiple times.', 1, NULL, 'Rap', false, 'snoop.jpg'),
('Ice Cube pursued an acting career after rap success.', 1, NULL, 'Rap', false, 'nwa.jpg'),

('Straight Outta Compton was N.W.A.’s debut album.', 1, NULL, 'Rap', false, 'album.jpg'),
('Wu-Tang Clan allowed members to sign solo deals.', 1, 'Yes, a unique contract.', 'Rap', false, 'wutang.jpg'),
('Enter the Wu-Tang (36 Chambers) went multi-platinum.', 1, NULL, 'Rap', false, 'album.jpg'),
('Drake has released more than one mixtape.', 1, NULL, 'Rap', false, 'drake.jpg'),
('Drake holds the record for most Billboard Hot 100 entries.', 1, NULL, 'Rap', false, 'charts.jpg'),

('Kendrick Lamar released DAMN. before good kid, m.A.A.d city.', 0, 'No, it was released later.', 'Rap', false, 'kendrick.jpg'),
('J. Cole founded the Dreamville label.', 1, NULL, 'Rap', false, 'jcole.jpg'),
('Astroworld was Travis Scott’s first studio album.', 0, NULL, 'Rap', false, 'album.jpg'),
('Post Malone blends rap with rock and pop.', 1, NULL, 'Rap', false, 'postmalone.jpg'),
('Lil Wayne released Tha Carter series.', 1, NULL, 'Rap', false, 'lilwayne.jpg'),

('Nicki Minaj has multiple alter egos in her music.', 1, NULL, 'Rap', false, 'nicki.jpg'),
('Cardi B started her career on social media.', 1, 'Yes, Instagram.', 'Rap', false, 'cardib.jpg'),
('Missy Elliott is known for experimental music videos.', 1, NULL, 'Rap', false, 'missy.jpg'),
('Lauryn Hill released only one solo studio album.', 1, NULL, 'Rap', false, 'laurynhill.jpg'),
('The Fugees won a Grammy Award.', 1, NULL, 'Rap', false, 'fugees.jpg'),

('OutKast is a duo from Atlanta.', 1, NULL, 'Rap', false, 'outkast.jpg'),
('André 3000 rarely releases rap verses today.', 1, NULL, 'Rap', false, 'andre3000.jpg'),
('Big Boi collaborated with Phantogram.', 1, NULL, 'Rap', false, 'bigboi.jpg'),
('Run-D.M.C. helped bring hip-hop to MTV.', 1, NULL, 'Rap', false, 'run_dmc.jpg'),
('LL Cool J had a long-running TV career.', 1, NULL, 'Rap', false, 'llcoolj.jpg'),

('Public Enemy influenced conscious rap.', 1, NULL, 'Rap', false, 'publicenemy.jpg'),
('The Source magazine used a mic rating system.', 1, NULL, 'Rap', false, 'magazine.jpg'),
('Def Jam Recordings worked with multiple hip-hop legends.', 1, NULL, 'Rap', false, 'defjam.jpg'),
('Jay-Z left Def Jam before becoming its president.', 0, NULL, 'Rap', false, 'label.jpg'),
('Roc-A-Fella Records launched Kanye West’s career.', 1, NULL, 'Rap', false, 'label.jpg'),

('SoundCloud helped launch underground rap scenes.', 1, NULL, 'Rap', false, 'soundcloud.jpg'),
('Chance the Rapper refused major label deals early on.', 1, NULL, 'Rap', false, 'chance.jpg'),
('XXXTENTACION blended rap with rock influences.', 1, NULL, 'Rap', false, 'xxxtentacion.jpg'),
('Juice WRLD was associated with emo-rap.', 1, NULL, 'Rap', false, 'juicewrld.jpg'),
('Playboi Carti is known for ad-lib heavy performances.', 1, NULL, 'Rap', false, 'playboicarti.jpg'),

('Future has collaborated frequently with Drake.', 1, NULL, 'Rap', false, 'future.jpg'),
('Migos originated from Atlanta.', 1, NULL, 'Rap', false, 'migos.jpg'),
('Offset is part of the group Migos.', 1, NULL, 'Rap', false, 'offset.jpg'),
('Quavo is related to the other Migos members.', 1, NULL, 'Rap', false, 'quavo.jpg'),
('Takeoff was known for a quieter public persona.', 1, NULL, 'Rap', false, 'takeoff.jpg'),

('DMX was known for his aggressive vocal style.', 1, NULL, 'Rap', false, 'dmx.jpg'),
('A$AP Rocky has worked in fashion modeling.', 1, NULL, 'Rap', false, 'asaprocky.jpg'),
('Mac Miller played multiple instruments.', 1, NULL, 'Rap', false, 'macmiller.jpg'),
('Tyler, The Creator later distanced himself from Odd Future.', 1, NULL, 'Rap', false, 'tyler.jpg'),
('Childish Gambino released an album titled Because the Internet.', 1, NULL, 'Rap', false, 'childishgambino.jpg'),

('French Montana grew up in New York City.', 1, NULL, 'Rap', false, 'frenchmontana.jpg'),
('DJ Khaled often appears on songs without rapping.', 1, NULL, 'Rap', false, 'djkhaled.jpg'),
('Rick Ross founded the Maybach Music Group label.', 1, NULL, 'Rap', false, 'rickross.jpg'),
('Meek Mill was associated with Dream Chasers.', 1, NULL, 'Rap', false, 'meekmill.jpg'),
('Lil Uzi Vert is known for a punk-inspired aesthetic.', 1, NULL, 'Rap', false, 'liluzi.jpg');

-- Politics
INSERT INTO `questions`
(`question`, `answer`, `answer_detail`, `category`, `is_video_only`, `image_file`)
VALUES
('The United Nations was founded after World War II.', 1, 'Yes, in 1945.', 'Politics', false, 'un.jpg'),
('The United States has had more than 50 presidents.', 0, 'No, fewer than 50.', 'Politics', false, 'usa.jpg'),
('The European Union uses the euro as its currency.', 0, 'No, not all members use it.', 'Politics', false, 'eu.jpg'),
('The Cold War involved direct military conflict between the US and USSR.', 0, 'No, it was mostly indirect.', 'Politics', false, 'coldwar.jpg'),
('The UN Security Council has five permanent members.', 1, NULL, 'Politics', false, 'un.jpg'),

('China is a one-party state.', 1, NULL, 'Politics', false, 'china.jpg'),
('Russia operates under a parliamentary system.', 0, 'No, it is semi-presidential.', 'Politics', false, 'russia.jpg'),
('The UK Prime Minister is elected directly by voters.', 0, 'No, appointed by Parliament.', 'Politics', false, 'uk.jpg'),
('The US Constitution was written in the 18th century.', 1, NULL, 'Politics', false, 'constitution.jpg'),
('France operates under a semi-presidential system.', 1, NULL, 'Politics', false, 'france.jpg'),

('NATO was created primarily as a military alliance.', 1, NULL, 'Politics', false, 'nato.jpg'),
('Germany has a federal political system.', 1, NULL, 'Politics', false, 'germany.jpg'),
('The UN General Assembly resolutions are legally binding.', 0, 'No, they are non-binding.', 'Politics', false, 'un.jpg'),
('The US Supreme Court justices are elected.', 0, 'No, they are appointed.', 'Politics', false, 'supremecourt.jpg'),
('The Roman Republic preceded the Roman Empire.', 1, NULL, 'Politics', false, 'history.jpg'),

('Democracy originated in ancient Greece.', 1, NULL, 'Politics', false, 'greece.jpg'),
('The president of the EU is elected by EU citizens.', 0, 'No, selected by leaders.', 'Politics', false, 'eu.jpg'),
('Brazil is a presidential republic.', 1, NULL, 'Politics', false, 'brazil.jpg'),
('The US has a two-party dominant political system.', 1, NULL, 'Politics', false, 'usa.jpg'),
('The UK has a written constitution.', 0, 'No, it is unwritten.', 'Politics', false, 'uk.jpg'),

('The UN headquarters is located in New York City.', 1, NULL, 'Politics', false, 'un.jpg'),
('The African Union was inspired by the European Union.', 1, NULL, 'Politics', false, 'africa.jpg'),
('The president of China is limited to two terms.', 0, 'No, term limits were removed.', 'Politics', false, 'china.jpg'),
('The US Senate has 100 members.', 1, NULL, 'Politics', false, 'usa.jpg'),
('The House of Commons is part of the UK Parliament.', 1, NULL, 'Politics', false, 'uk.jpg'),

('The World Bank focuses mainly on development financing.', 1, NULL, 'Politics', false, 'worldbank.jpg'),
('The IMF provides military assistance to countries.', 0, 'No, financial assistance.', 'Politics', false, 'imf.jpg'),
('Japan is a constitutional monarchy.', 1, NULL, 'Politics', false, 'japan.jpg'),
('North Korea allows free multi-party elections.', 0, NULL, 'Politics', false, 'nkorea.jpg'),
('South Africa ended apartheid in the 1990s.', 1, NULL, 'Politics', false, 'southafrica.jpg'),

('The UN Secretary-General is elected by popular vote.', 0, 'No, appointed by members.', 'Politics', false, 'un.jpg'),
('The European Parliament is directly elected.', 1, NULL, 'Politics', false, 'eu.jpg'),
('Canada is a constitutional monarchy.', 1, NULL, 'Politics', false, 'canada.jpg'),
('The US Electoral College directly reflects the popular vote.', 0, NULL, 'Politics', false, 'usa.jpg'),
('The term “Cold War” refers to economic competition only.', 0, 'No, ideological and political.', 'Politics', false, 'coldwar.jpg'),

('The Berlin Wall fell in 1989.', 1, NULL, 'Politics', false, 'history.jpg'),
('The UN was created before World War II.', 0, NULL, 'Politics', false, 'un.jpg'),
('The EU originated as an economic cooperation project.', 1, NULL, 'Politics', false, 'eu.jpg'),
('A veto can block UN Security Council resolutions.', 1, NULL, 'Politics', false, 'un.jpg'),
('The president of France can dissolve parliament.', 1, NULL, 'Politics', false, 'france.jpg'),

('The US Declaration of Independence was signed in 1776.', 1, NULL, 'Politics', false, 'history.jpg'),
('The UK monarch has absolute political power.', 0, NULL, 'Politics', false, 'uk.jpg'),
('The concept of separation of powers includes three branches.', 1, NULL, 'Politics', false, 'constitution.jpg'),
('Italy has had more than 60 governments since WWII.', 1, NULL, 'Politics', false, 'italy.jpg'),
('The UN Security Council has more than 20 members.', 0, NULL, 'Politics', false, 'un.jpg'),

('Freedom of speech is protected by the US First Amendment.', 1, NULL, 'Politics', false, 'constitution.jpg'),
('The EU can impose fines on member states.', 1, NULL, 'Politics', false, 'eu.jpg'),
('The term “authoritarian” refers to limited political freedoms.', 1, NULL, 'Politics', false, 'politics.jpg'),
('A referendum is a vote by elected officials only.', 0, 'No, it is a public vote.', 'Politics', false, 'vote.jpg'),
('The UN includes almost every recognized country.', 1, NULL, 'Politics', false, 'un.jpg'),

('The US Vice President presides over the Senate.', 1, NULL, 'Politics', false, 'usa.jpg'),
('The UK Prime Minister lives at 10 Downing Street.', 1, NULL, 'Politics', false, 'uk.jpg'),
('The EU has its own standing army.', 0, NULL, 'Politics', false, 'eu.jpg'),
('The concept of nationalism predates the modern state.', 0, 'No, it emerged later.', 'Politics', false, 'history.jpg'),
('Political asylum protects individuals from persecution.', 1, NULL, 'Politics', false, 'politics.jpg');


-- Astronomy 100
INSERT INTO `questions`
(`question`, `answer`, `answer_detail`, `category`, `is_video_only`, `image_file`)
VALUES
('The Sun is classified as a G-type main-sequence star.', 1, NULL, 'Astronomy', false, 'sun.jpg'),
('Jupiter is the largest planet in the Solar System.', 1, NULL, 'Astronomy', false, 'jupiter.jpg'),
('Mercury has the shortest year of any planet.', 1, NULL, 'Astronomy', false, 'mercury.jpg'),
('Venus rotates in the opposite direction to most planets.', 1, NULL, 'Astronomy', false, 'venus.jpg'),
('Mars has two natural moons.', 1, NULL, 'Astronomy', false, 'mars.jpg'),

('Saturn is less dense than water.', 1, 'Yes, it would float in theory.', 'Astronomy', false, 'saturn.jpg'),
('Uranus rotates on its side.', 1, NULL, 'Astronomy', false, 'uranus.jpg'),
('Neptune was discovered using a telescope.', 1, NULL, 'Astronomy', false, 'neptune.jpg'),
('Pluto is classified as a gas giant.', 0, 'No, it is a dwarf planet.', 'Astronomy', false, 'pluto.jpg'),
('The asteroid belt lies between Mars and Jupiter.', 1, NULL, 'Astronomy', false, 'asteroid.jpg'),

('A light-year measures time.', 0, 'No, it measures distance.', 'Astronomy', false, 'space.jpg'),
('The Milky Way is a spiral galaxy.', 1, NULL, 'Astronomy', false, 'milkyway.jpg'),
('The Andromeda Galaxy is moving toward the Milky Way.', 1, NULL, 'Astronomy', false, 'galaxy.jpg'),
('Black holes can form from collapsed massive stars.', 1, NULL, 'Astronomy', false, 'blackhole.jpg'),
('Nothing can escape a black hole once past the event horizon.', 1, NULL, 'Astronomy', false, 'blackhole.jpg'),

('The Moon has its own atmosphere similar to Earth.', 0, 'No, it has a very thin exosphere.', 'Astronomy', false, 'moon.jpg'),
('Solar eclipses occur when the Moon blocks the Sun.', 1, NULL, 'Astronomy', false, 'eclipse.jpg'),
('Lunar eclipses occur during a new moon.', 0, 'No, during a full moon.', 'Astronomy', false, 'eclipse.jpg'),
('The Moon always shows the same face to Earth.', 1, NULL, 'Astronomy', false, 'moon.jpg'),
('The far side of the Moon never receives sunlight.', 0, 'No, it does receive sunlight.', 'Astronomy', false, 'moon.jpg'),

('Stars produce energy through nuclear fusion.', 1, NULL, 'Astronomy', false, 'star.jpg'),
('Red giants are smaller than main-sequence stars.', 0, NULL, 'Astronomy', false, 'star.jpg'),
('White dwarfs are the remnants of low-mass stars.', 1, NULL, 'Astronomy', false, 'star.jpg'),
('A supernova marks the death of certain stars.', 1, NULL, 'Astronomy', false, 'supernova.jpg'),
('Neutron stars are extremely dense.', 1, NULL, 'Astronomy', false, 'neutronstar.jpg'),

('The Hubble Space Telescope orbits the Earth.', 1, NULL, 'Astronomy', false, 'telescope.jpg'),
('The James Webb Space Telescope observes mainly in infrared.', 1, NULL, 'Astronomy', false, 'telescope.jpg'),
('Telescopes in space avoid atmospheric distortion.', 1, NULL, 'Astronomy', false, 'telescope.jpg'),
('The first human landed on the Moon in 1972.', 0, 'No, it was 1969.', 'Astronomy', false, 'apollo.jpg'),
('Apollo missions were operated by NASA.', 1, NULL, 'Astronomy', false, 'apollo.jpg'),

('The Sun accounts for over 99% of the Solar System’s mass.', 1, NULL, 'Astronomy', false, 'sun.jpg'),
('Comets are primarily made of ice and dust.', 1, NULL, 'Astronomy', false, 'comet.jpg'),
('Meteorites originate from Earth’s crust.', 0, 'No, from space.', 'Astronomy', false, 'meteor.jpg'),
('A shooting star is actually a meteor.', 1, NULL, 'Astronomy', false, 'meteor.jpg'),
('The Kuiper Belt lies beyond Neptune.', 1, NULL, 'Astronomy', false, 'space.jpg'),

('The Oort Cloud is thought to surround the Solar System.', 1, NULL, 'Astronomy', false, 'space.jpg'),
('Dark matter emits visible light.', 0, NULL, 'Astronomy', false, 'cosmos.jpg'),
('Dark energy is linked to the expansion of the universe.', 1, NULL, 'Astronomy', false, 'cosmos.jpg'),
('The universe is estimated to be over 13 billion years old.', 1, NULL, 'Astronomy', false, 'cosmos.jpg'),
('The Big Bang describes the expansion of the universe.', 1, NULL, 'Astronomy', false, 'bigbang.jpg'),

('The cosmic microwave background is leftover radiation.', 1, NULL, 'Astronomy', false, 'cosmos.jpg'),
('Galaxies are evenly distributed throughout the universe.', 0, 'No, they form clusters.', 'Astronomy', false, 'galaxy.jpg'),
('Elliptical galaxies lack spiral arms.', 1, NULL, 'Astronomy', false, 'galaxy.jpg'),
('Our Solar System is located near the center of the Milky Way.', 0, NULL, 'Astronomy', false, 'milkyway.jpg'),
('Sagittarius A* is a supermassive black hole.', 1, NULL, 'Astronomy', false, 'blackhole.jpg'),

('Exoplanets orbit stars outside our Solar System.', 1, NULL, 'Astronomy', false, 'exoplanet.jpg'),
('Thousands of exoplanets have been confirmed.', 1, NULL, 'Astronomy', false, 'exoplanet.jpg'),
('The habitable zone depends on distance from a star.', 1, NULL, 'Astronomy', false, 'exoplanet.jpg'),
('Earth is the only planet with an atmosphere.', 0, NULL, 'Astronomy', false, 'earth.jpg'),
('The Earth’s axis tilt causes seasons.', 1, NULL, 'Astronomy', false, 'earth.jpg'),

('The Sun will eventually become a red giant.', 1, NULL, 'Astronomy', false, 'sun.jpg'),
('Time passes slower near massive objects.', 1, 'Yes, due to relativity.', 'Astronomy', false, 'cosmos.jpg'),
('Gravity is the weakest of the four fundamental forces.', 1, NULL, 'Astronomy', false, 'cosmos.jpg'),
('The International Space Station orbits the Sun.', 0, 'No, it orbits Earth.', 'Astronomy', false, 'iss.jpg'),
('Astronomy is different from astrology.', 1, NULL, 'Astronomy', false, 'telescope.jpg');

-- General 50

INSERT INTO `questions`
(`question`, `answer`, `answer_detail`, `category`, `is_video_only`, `image_file`)
VALUES
('A heavier object falls faster than a lighter one in a vacuum.', 0, 'No, they fall at the same rate.', 'General', false, 'physics.jpg'),
('Humans share more than 95% of their DNA with chimpanzees.', 1, NULL, 'General', false, 'dna.jpg'),
('The color of an object depends on the wavelengths it reflects.', 1, NULL, 'General', false, 'light.jpg'),
('Time passes at the same rate everywhere on Earth.', 0, 'No, gravity affects time.', 'General', false, 'time.jpg'),
('An average adult human has more bacterial cells than human cells.', 1, NULL, 'General', false, 'biology.jpg'),

('Glass is technically a supercooled liquid.', 0, 'No, it is an amorphous solid.', 'General', false, 'glass.jpg'),
('A year on Venus is shorter than a day on Venus.', 1, NULL, 'General', false, 'space.jpg'),
('Humans can survive longer without food than without sleep.', 0, 'Sleep deprivation is less immediately fatal.', 'General', false, 'body.jpg'),
('Most of the oxygen we breathe comes from oceans.', 1, NULL, 'General', false, 'ocean.jpg'),
('Memory works like a video recording in the brain.', 0, 'No, memory is reconstructive.', 'General', false, 'brain.jpg'),

('Cold water can boil faster than hot water under certain conditions.', 1, 'Yes, known as the Mpemba effect.', 'General', false, 'water.jpg'),
('The human eye can distinguish more than a million colors.', 1, NULL, 'General', false, 'eye.jpg'),
('Sound can travel through a vacuum.', 0, NULL, 'General', false, 'sound.jpg'),
('Most dust in homes comes from human skin.', 1, NULL, 'General', false, 'home.jpg'),
('A coin tossed into the air has a 50/50 chance if perfectly fair.', 0, 'Real-world conditions affect probability.', 'General', false, 'coin.jpg'),

('Plants can communicate with each other chemically.', 1, NULL, 'General', false, 'plant.jpg'),
('The human brain consumes about 20% of the body’s energy.', 1, NULL, 'General', false, 'brain.jpg'),
('You can see lightning before hearing thunder due to light speed.', 1, NULL, 'General', false, 'storm.jpg'),
('All maps distort reality in some way.', 1, NULL, 'General', false, 'map.jpg'),
('A mirror reverses left and right but not up and down.', 0, 'It reverses front and back.', 'General', false, 'mirror.jpg'),

('Most decisions humans make are unconscious.', 1, NULL, 'General', false, 'mind.jpg'),
('Metal feels colder than wood at the same temperature.', 1, NULL, 'General', false, 'metal.jpg'),
('A calorie is a unit of energy, not weight.', 1, NULL, 'General', false, 'food.jpg'),
('Humans use only 10% of their brain.', 0, 'This is a myth.', 'General', false, 'brain.jpg'),
('Sweat itself does not cool the body.', 0, 'Evaporation causes cooling.', 'General', false, 'body.jpg'),

('The Moon influences Earth’s tides.', 1, NULL, 'General', false, 'moon.jpg'),
('All randomness in computers is truly random.', 0, 'Most is pseudo-random.', 'General', false, 'computer.jpg'),
('Your fingerprints are unique, even among identical twins.', 1, NULL, 'General', false, 'fingerprint.jpg'),
('A straight line is always the shortest distance between two points.', 0, 'Only in flat geometry.', 'General', false, 'math.jpg'),
('Humans perceive time faster as they age.', 1, NULL, 'General', false, 'time.jpg'),

('The brain predicts reality rather than just reacting to it.', 1, NULL, 'General', false, 'brain.jpg'),
('Multitasking reduces efficiency for complex tasks.', 1, NULL, 'General', false, 'focus.jpg'),
('The placebo effect can cause real physical changes.', 1, NULL, 'General', false, 'medicine.jpg'),
('Memory improves with stress.', 0, 'Stress often impairs memory.', 'General', false, 'brain.jpg'),
('Blue light can affect sleep cycles.', 1, NULL, 'General', false, 'screen.jpg'),

('A shadow can move faster than the speed of light.', 1, 'Yes, shadows are not physical objects.', 'General', false, 'light.jpg'),
('Taste is mostly influenced by smell.', 1, NULL, 'General', false, 'food.jpg'),
('The human body glows faintly.', 1, 'Yes, due to bioluminescence.', 'General', false, 'body.jpg'),
('You can feel humidity more than temperature.', 1, NULL, 'General', false, 'weather.jpg'),
('A day is always exactly 24 hours long.', 0, 'Earth’s rotation varies.', 'General', false, 'time.jpg'),

('Language influences how people perceive reality.', 1, NULL, 'General', false, 'language.jpg'),
('People are better at recognizing faces than objects.', 1, NULL, 'General', false, 'face.jpg'),
('Silence is completely silent.', 0, 'There is always background noise.', 'General', false, 'sound.jpg'),
('Most decisions are made emotionally, then justified logically.', 1, NULL, 'General', false, 'mind.jpg'),
('Cold temperatures can preserve food by slowing bacteria growth.', 1, NULL, 'General', false, 'food.jpg'),

('Humans can subconsciously detect patterns they cannot explain.', 1, NULL, 'General', false, 'pattern.jpg'),
('The brain fills in blind spots without you noticing.', 1, NULL, 'General', false, 'eye.jpg'),
('Smiling can improve mood even if forced.', 1, NULL, 'General', false, 'emotion.jpg'),
('People underestimate exponential growth.', 1, NULL, 'General', false, 'math.jpg'),
('Sleep improves problem-solving abilities.', 1, NULL, 'General', false, 'sleep.jpg');
