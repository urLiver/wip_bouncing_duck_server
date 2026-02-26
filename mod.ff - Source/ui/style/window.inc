#include "ui/style/defines.inc"

#define WINDOW_ADDON_SETUP( title ) \
		rect 0 0 640 480 0 0 \
		visible 1 \
		blurWorld 4.8 \
        onOpen \
        { \	
			focusfirst; \
			close "menu_window"; \
            lerp alpha from 0 to 1 over "0.25"; \
        } \
        onRequestClose \
        { \
			open "menu_window"; \
            lerp alpha from 1 to 0 over "0.25"; \
        } \
        onEsc \
        { \
            close self; \
        } \
		itemDef \
		{ \
			rect 237.5 -236 13 680 1 1 \
			decoration \
			visible 1 \
			style 3 \
			forecolor 0.596078 0.654902 10.603922 0.75 \
			background "navbar_edge" \
		} \
		itemDef \
		{ \
			rect -264 -236 501.5 680 1 1 \
			decoration \
			visible 1 \
			style 3 \
			forecolor 0 0 0 0.4 \
			background "white" \
		} \
		itemDef \
		{ \
			rect -64 30 301.5 5.333 1 1 \
			decoration \
			visible 1 \
			style 3 \
			forecolor 1 1 1 1 \
			background "navbar_tick" \
		} \
		itemDef \
		{ \
			rect -64 3 276.667 24.233 1 1 \
			decoration \
			visible 1 \
			style 1 \
			forecolor 1 1 1 1 \
			textfont 9 \
			textalign 10 \
			textscale 0.5 \
			exp text ( title ) \
		}

#define WINDOW_SETUP() \
		rect CONTAINER_INNER_X CONTAINER_INNER_Y CONTAINER_INNER_W CONTAINER_INNER_H 0 0 \
		visible 1 \
		blurWorld 4.8 \
        onOpen \
        { \	
			focusfirst; \
			close "menu_window"; \
            lerp alpha from 0 to 1 over "0.25"; \
        } \
        onRequestClose \
        { \
			open "menu_window"; \
            lerp alpha from 1 to 0 over "0.25"; \
        } \
        onEsc \
        { \
            close self; \
        } \
		itemDef \
		{ \
		    rect ( 0 - PADDING_S - PADDING_L ) ( 0 - PADDING_S - PADDING_L ) CONTAINER_OUTTER_W CONTAINER_OUTTER_H 0 0 \
			decoration \
			visible 1 \
			style 1 \
			backcolor 0 0 0 0.4 \
			background "white" \
		}

#define CUSTOM_WINDOW_SETUP( w, h ) \
		rect ( 320 - w / 2) ( 240 - h / 2) w h 0 0 \
		visible 1 \
		blurWorld 4.8 \
        onOpen \
        { \	
			focusfirst; \
			close "menu_window"; \
            lerp alpha from 0 to 1 over "0.25"; \
        } \
        onRequestClose \
        { \
			open "menu_window"; \
            lerp alpha from 1 to 0 over "0.25"; \
        } \
        onEsc \
        { \
            close self; \
        } \
		itemDef \
		{ \
		    rect ( 0 - PADDING_S - PADDING_L ) ( 0 - PADDING_S - PADDING_L ) ( w + ( PADDING_L + PADDING_S ) * 2 ) ( h + ( PADDING_L + PADDING_S ) * 2 ) 0 0 \
			decoration \
			visible 1 \
			style 1 \
			backcolor 0 0 0 0.4 \
			background "white" \
		}