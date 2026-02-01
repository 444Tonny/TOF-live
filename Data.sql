--genere moi 100 questions variées et de difficulte varies mais 70% difficile et 30% moyen du genre: 
--INSERT INTO questions (id, question, answer, created_at, answer_detail, category, is_video_only, image_file) 
--VALUES (16, 'The Eiffel Tower is over 300 meters tall', 1, '2026-01-09 23:22:52', 'The Eiffel Tower is exactly 330 meters tall including its antennas.', 
--'general', 1, 'eiffel_tower.jpg'), mais dans la categorie "fun fact" du genre: 
--(28, 'A volcano can erupt underwater', 1, '2026-01-11 02:37:55', '', 'fun fact', 1, 'volcano.jpg'), 
--La colonne answer_detail, peut etre null, donc rempli 50% des questions seulement. 
--Le reste laisse vide. la colonne created at par defaut. doonne moi 3 exemples d'abord que je talide puis tu fais les 100


-- General
-- Soccer x 100
-- Technology x 100
-- Geography x 100
-- Fun Fact x 100
-- Manga x 200
-- NBA x 100
-- Science
-- Games x 50
-- History
-- Astronomy
-- Art
-- Cinema x 100
-- Music x 100
-- HipHop
-- Celebrity x 100
-- Animals x 100
-- Food x 100
-- Politics
-- Tennis
-- Golf
-- Formule1
-- Myths
-- Guinness
-- Internet

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