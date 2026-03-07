#include "ui/style/ui.inc"

#define RenderCardtitles() \
		CardtitleButton( 0, 0, "iw5_cardtitle_camo_classic", 1, 1, "Just Play", "CARDTITLE:0", "ct_time_0" ); \
		CardtitleButton( 1, 0, "iw5_cardtitle_camo_snow", dvarint( "total_kills" ), 1000, "Kills", "CARDTITLE:1", "ct_time_1" ); \
		CardtitleButton( 2, 0, "iw5_cardtitle_camo_multi", dvarint( "total_kills" ), 2500, "Kills", "CARDTITLE:2", "ct_time_2" ); \
		CardtitleButton( 0, 1, "iw5_cardtitle_camo_hex", dvarint( "total_kills" ), 5000, "Kills", "CARDTITLE:3", "ct_time_3" ); \
		CardtitleButton( 1, 1, "iw5_cardtitle_camo_choco", dvarint( "total_kills" ), 10000, "Kills", "CARDTITLE:4", "ct_time_4" ); \
		CardtitleButton( 2, 1, "iw5_cardtitle_camo_snake", dvarint( "total_deaths" ), 1000, "Deaths", "CARDTITLE:5", "ct_time_5" ); \
		CardtitleButton( 0, 2, "iw5_cardtitle_boombox", dvarint( "total_deaths" ), 2500, "Deaths", "CARDTITLE:6", "ct_time_6" ); \
		CardtitleButton( 1, 2, "iw5_cardtitle_bulletbelt", dvarint( "total_deaths" ), 5000, "Deaths", "CARDTITLE:7", "ct_time_7" ); \
		CardtitleButton( 2, 2, "iw5_cardtitle_cartepillar", dvarint( "total_deaths" ), 10000, "Deaths", "CARDTITLE:8", "ct_time_8" ); \
		CardtitleButton( 0, 3, "iw5_cardtitle_duel", dvarint( "moabs_called" ), 1, "Nukes called", "CARDTITLE:9", "ct_time_9" ); \
		CardtitleButton( 1, 3, "iw5_cardtitle_dynamite", dvarint( "moabs_called" ), 10, "Nukes called", "CARDTITLE:10", "ct_time_10" ); \
		CardtitleButton( 2, 3, "iw5_cardtitle_elite_01", dvarint( "moabs_called" ), 50, "Nukes called", "CARDTITLE:11", "ct_time_11" ); \
		CardtitleButton( 0, 4, "iw5_cardtitle_elite_11", dvarint( "moabs_called" ), 100, "Nukes called", "CARDTITLE:12", "ct_time_12" ); \
		CardtitleButton( 1, 4, "iw5_cardtitle_elite_11_green", dvarint( "moabs_called" ), 200, "Nukes called", "CARDTITLE:13", "ct_time_13" ); \
		CardtitleButton( 2, 4, "iw5_cardtitle_elite_04", dvarint( "moabs_cancelled" ), 10, "Nukes cancelled", "CARDTITLE:14", "ct_time_14" ); \
		CardtitleButton( 0, 5, "iw5_cardtitle_elite_05", dvarint( "moabs_cancelled" ), 50, "Nukes cancelled", "CARDTITLE:15", "ct_time_15" ); \
		CardtitleButton( 1, 5, "iw5_cardtitle_elite_06", dvarint( "rank_prestige_unlocked" ), 10, "Prestige", "CARDTITLE:16", "ct_time_16" ); \
		CardtitleButton( 2, 5, "iw5_cardtitle_elite_10", dvarint( "rank_prestige_unlocked" ), 20, "Prestige", "CARDTITLE:17", "ct_time_17" ); \
		CardtitleButton( 0, 6, "iw5_cardtitle_explosion_a", dvarint( "rank_prestige_unlocked" ), 30, "Prestige", "CARDTITLE:18", "ct_time_18" ); \
		CardtitleButton( 1, 6, "iw5_cardtitle_explosion_b", dvarint( "rank_prestige_unlocked" ), 40, "Prestige", "CARDTITLE:19", "ct_time_19" ); \
		CardtitleButton( 2, 6, "iw5_cardtitle_explosion_c", dvarint( "tis_destroyed" ), 50, "Insertions Destroyed", "CARDTITLE:20", "ct_time_20" ); \
		CardtitleButton( 0, 7, "iw5_cardtitle_eyes", dvarint( "tis_destroyed" ), 100, "Insertions Destroyed", "CARDTITLE:21", "ct_time_21" ); \
		CardtitleButton( 1, 7, "iw5_cardtitle_feathers", dvarint( "chickens_killed" ), 50, "Chickens Killed", "CARDTITLE:22", "ct_time_22" ); \
		CardtitleButton( 2, 7, "iw5_cardtitle_gargole", dvarint( "highest_killstreak" ), 40, "Highest Gun Killstreak", "CARDTITLE:23", "ct_time_23" ); \
		CardtitleButton( 0, 8, "iw5_cardtitle_gazin", dvarint( "highest_melee_killstreak" ), 20, "Highest Melee Killstreak", "CARDTITLE:24", "ct_time_24" ); \
		CardtitleButton( 1, 8, "iw5_cardtitle_golden_guns", dvarint( "infected_kills" ), 500, "Kills as Infected", "CARDTITLE:25", "ct_time_25" ); \
		CardtitleButton( 2, 8, "iw5_cardtitle_knife", dvarint( "infected_kills" ), 1000, "Kills as Infected", "CARDTITLE:26", "ct_time_26" );

#define RenderSecretCardtitles() \ 
		CardtitleButton( 0, 0, "iw5_cardtitle_mastodon", dvarint( "intel_terminal" ), 1, "Intel Terminal", "CARDTITLE:27", "ct_time_27" ); \
		CardtitleButton( 1, 0, "iw5_cardtitle_falling_money", dvarint( "intel_trailerpark" ), 1, "Intel Trailer Park", "CARDTITLE:28", "ct_time_28" ); \
		CardtitleButton( 2, 0, "iw5_cardtitle_money_bags", dvarint( "intel_pipeline" ), 1, "Intel Pipeline", "CARDTITLE:29", "ct_time_29" ); \
		CardtitleButton( 0, 1, "iw5_cardtitle_punch_in_the_face", dvarint( "intel_backlot" ), 1, "Intel Backlot", "CARDTITLE:30", "ct_time_30" ); \
		CardtitleButton( 1, 1, "iw5_cardtitle_redrocket", dvarint( "intel_derriese" ), 1, "Intel der Riese", "CARDTITLE:31", "ct_time_31" ); \
		CardtitleButton( 2, 1, "iw5_cardtitle_burger_town", dvarint( "intel_wasteland" ), 1, "Intel Wasteland", "CARDTITLE:32", "ct_time_32" ); \
		CardtitleButton( 0, 2, "iw5_cardtitle_mw_character_delta_01", dvarint( "intel_nuketown" ), 1, "Intel Nuketown", "CARDTITLE:33", "ct_time_33" ); \
		CardtitleButton( 1, 2, "iw5_cardtitle_pinup", dvarint( "intel_broadcast" ), 1, "Intel Broadcast", "CARDTITLE:34", "ct_time_34" ); \
		CardtitleButton( 2, 2, "iw5_cardtitle_teabag", dvarint( "intel_afghan" ), 1, "Intel Afghan", "CARDTITLE:35", "ct_time_35" ); \
		CardtitleButton( 0, 3, "iw5_cardtitle_plaster", dvarint( "intel_meteora" ), 1, "Intel Sanctuary", "CARDTITLE:36", "ct_time_36" ); \
		CardtitleButton( 1, 3, "iw5_cardtitle_paddle", dvarint( "sacrifice_axis_crosswalk" ), 1, "Intersection", "CARDTITLE:37", "ct_time_37" ); \
		CardtitleButton( 2, 3, "iw5_cardtitle_spent_slugs", dvarint( "sacrifice_allies_crosswalk" ), 1, "Intersection", "CARDTITLE:38", "ct_time_38" );

#define RenderPrestiges() \
        PrestigeButton( 0, 0,  0, "PRESTIGE:0", "pre_time_0" ); \
        PrestigeButton( 1, 0,  1, "PRESTIGE:1", "pre_time_1" ); \
        PrestigeButton( 2, 0,  2, "PRESTIGE:2", "pre_time_2" ); \
        PrestigeButton( 3, 0,  3, "PRESTIGE:3", "pre_time_3" ); \
        PrestigeButton( 4, 0,  4, "PRESTIGE:4", "pre_time_4" ); \
        PrestigeButton( 5, 0,  5, "PRESTIGE:5", "pre_time_5" ); \
        PrestigeButton( 6, 0,  6, "PRESTIGE:6", "pre_time_6" ); \
        PrestigeButton( 7, 0,  7, "PRESTIGE:7", "pre_time_7" ); \
        PrestigeButton( 0, 1,  8, "PRESTIGE:8", "pre_time_8" ); \
        PrestigeButton( 1, 1,  9, "PRESTIGE:9", "pre_time_9" ); \
        PrestigeButton( 2, 1, 10, "PRESTIGE:10", "pre_time_10" ); \
        PrestigeButton( 3, 1, 11, "PRESTIGE:11", "pre_time_11" ); \
        PrestigeButton( 4, 1, 12, "PRESTIGE:12", "pre_time_12" ); \
        PrestigeButton( 5, 1, 13, "PRESTIGE:13", "pre_time_13" ); \
        PrestigeButton( 6, 1, 14, "PRESTIGE:14", "pre_time_14" ); \
        PrestigeButton( 7, 1, 15, "PRESTIGE:15", "pre_time_15" ); \
        PrestigeButton( 0, 2, 16, "PRESTIGE:16", "pre_time_16" ); \
        PrestigeButton( 1, 2, 17, "PRESTIGE:17", "pre_time_17" ); \
        PrestigeButton( 2, 2, 18, "PRESTIGE:18", "pre_time_18" ); \
        PrestigeButton( 3, 2, 19, "PRESTIGE:19", "pre_time_19" ); \
        PrestigeButton( 4, 2, 20, "PRESTIGE:20", "pre_time_20" ); \
        PrestigeButton( 5, 2, 21, "PRESTIGE:21", "pre_time_21" ); \
        PrestigeButton( 6, 2, 22, "PRESTIGE:22", "pre_time_22" ); \
        PrestigeButton( 7, 2, 23, "PRESTIGE:23", "pre_time_23" ); \
        PrestigeButton( 0, 3, 24, "PRESTIGE:24", "pre_time_24" ); \
        PrestigeButton( 1, 3, 25, "PRESTIGE:25", "pre_time_25" ); \
        PrestigeButton( 2, 3, 26, "PRESTIGE:26", "pre_time_26" ); \
        PrestigeButton( 3, 3, 27, "PRESTIGE:27", "pre_time_27" ); \
        PrestigeButton( 4, 3, 28, "PRESTIGE:28", "pre_time_28" ); \
        PrestigeButton( 5, 3, 29, "PRESTIGE:29", "pre_time_29" ); \
        PrestigeButton( 6, 3, 30, "PRESTIGE:30", "pre_time_30" ); \
        PrestigeButton( 7, 3, 31, "PRESTIGE:31", "pre_time_31" ); \
        PrestigeButton( 0, 4, 32, "PRESTIGE:32", "pre_time_32" ); \
        PrestigeButton( 1, 4, 33, "PRESTIGE:33", "pre_time_33" ); \
        PrestigeButton( 2, 4, 34, "PRESTIGE:34", "pre_time_34" ); \
        PrestigeButton( 3, 4, 35, "PRESTIGE:35", "pre_time_35" ); \
        PrestigeButton( 4, 4, 36, "PRESTIGE:36", "pre_time_36" ); \
        PrestigeButton( 5, 4, 37, "PRESTIGE:37", "pre_time_37" ); \
        PrestigeButton( 6, 4, 38, "PRESTIGE:38", "pre_time_38" ); \
        PrestigeButton( 7, 4, 39, "PRESTIGE:39", "pre_time_39" ); \
        PrestigeButton( 0, 5, 40, "PRESTIGE:40", "pre_time_40" ); \
        PrestigeButton( 1, 5, 41, "PRESTIGE:41", "pre_time_41" ); \
        HiddenPrestigeButton( 2, 5, "hidden_prestige_1", 42, "PRESTIGE:42", "pre_time_42" ); \
        HiddenPrestigeButton( 3, 5, "hidden_prestige_2", 43, "PRESTIGE:43", "pre_time_43" ); \
        HiddenPrestigeButton( 4, 5, "hidden_prestige_3", 44, "PRESTIGE:44", "pre_time_44" ); \
        HiddenPrestigeButton( 5, 5, "hidden_prestige_4", 45, "PRESTIGE:45", "pre_time_45" );