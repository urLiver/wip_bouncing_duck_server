#include "ui/style/defines.inc"

#define INFORMATION_BOX() \
		itemDef \
		{ \
			rect ( INFORMATION_HALF_W - 0.5 ) 0 1 INFORMATION_H 0 0 \
			visible 1 \
			style 1 \
            decoration \
            backcolor 1 1 1 0.5 \
            background "white" \
		} \
		itemDef \
		{ \
			rect 0 ( INFORMATION_HALF_H - 0.5 ) INFORMATION_W 1 0 0 \
			visible 1 \
			style 1 \
            decoration \
            backcolor 1 1 1 0.5 \
            background "white" \
		} 

#define INFORMATION_TITLE( column, row, txt ) \
		itemDef \
		{ \
			rect ( INFORMATION_TEXT_X * column ) ( INFORMATION_TEXT_Y * row ) INFORMATION_TEXT_W INFORMATION_TEXT_H 0 0 \
			visible 1 \
			style 1 \
            decoration \
			forecolor PRIMARY_COLOR \
			textfont 1 \
			textalign 5 \
			textscale 0.425 \
        	exp text ( txt ) \
		} 

#define INFORMATION_TEXT( column, row, txt ) \
		itemDef \
		{ \
			rect ( INFORMATION_TEXT_X * column ) ( INFORMATION_TEXT_Y * row ) INFORMATION_TEXT_W INFORMATION_TEXT_H 0 0 \
			visible 1 \
			style 1 \
            decoration \
			autowrapped \
			forecolor 1 1 1 1 \
			textfont 1 \
			textalign 4 \  
			textscale 0.275 \
			exp rect y ( PADDING_S + getTextHeight( 1, 0.425 ) + INFORMATION_TEXT_Y * row ) \
			exp rect h ( INFORMATION_TEXT_Y - PADDING_S - getTextHeight( 1, 0.425 ) ) \
        	exp text ( txt ) \
		} 

#define RENDER_INFORMATION() \
        INFORMATION_BOX; \
		INFORMATION_TITLE( 0, 0, "Gamemode" ); \
		INFORMATION_TITLE( 0, 1, "Credits" ); \
		INFORMATION_TITLE( 1, 0, "Commands" ); \
		INFORMATION_TITLE( 1, 1, "Changelog" ); \
        INFORMATION_TEXT( 0, 0, "A Modded Version of the loved Gamemode Infected, where Bounces \nare Possibile and the only defense against the Infected is \na good old Shotgun :D" ); \
        INFORMATION_TEXT( 0, 1, "ZECxR3ap3r \nWiizard \nJoelrau \nSloth \nLastDemon99 \nM0vx \nUwUneedsBunni \nClaudi0 \nurLiver" ); \
        INFORMATION_TEXT( 1, 0, "Chat Commands \nPromote with: ?p / ?prestige \nSelecte a Prestige with: ?sp / ?setprestige \n\nBinds \n[{+actionslot 6}] = Suicide \n[{vote no}] = Toggle Fullbright \n[{vote yes}] = Toggle Render Distance \n" ); \
        INFORMATION_TEXT( 1, 1, "V1.0 Initiale Release" );