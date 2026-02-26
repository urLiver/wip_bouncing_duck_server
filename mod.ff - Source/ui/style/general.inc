#include "ui/style_defines.inc"

#define BUTTON( column, row, txt, hint, func ) \
		itemDef \
		{ \
			rect 0 0 BUTTON_W BUTTON_H 0 0 \
			visible 1 \
			style 1 \
            type 1 \
			backcolor 0.175 0.175 0.175 0.4 \
            background "white" \
			exp rect x ( OPTION_X + MENU_PADDING_L + ( column * ( BUTTON_X + BUTTON_W ) ) ) \
			exp rect y ( OPTION_Y + MENU_PADDING_L + ( row * ( BUTTON_Y + BUTTON_H ) ) ) \
            action \
			{ \
				play "mouse_click"; \
                func; \
			} \
		} \
		itemDef \
		{ \
			rect 0 0 1 BUTTON_H 0 0 \
			visible 1 \
			style 1 \
            decoration \
			backcolor 1 1 1 0.4 \
            background "white" \
			exp rect x ( OPTION_X + MENU_PADDING_L + ( column * ( BUTTON_X + BUTTON_W ) ) ) \
			exp rect y ( OPTION_Y + MENU_PADDING_L + ( row * ( BUTTON_Y + BUTTON_H ) ) ) \
		} \
		itemDef \
		{ \
			rect 0 0 1 BUTTON_H 0 0 \
			visible 1 \
			style 1 \
            decoration \
			backcolor 1 1 1 0.4 \
            background "white" \
			exp rect x ( OPTION_X + MENU_PADDING_L + ( column * ( BUTTON_X + BUTTON_W ) + BUTTON_W - 1 ) ) \
			exp rect y ( OPTION_Y + MENU_PADDING_L + ( row * ( BUTTON_Y + BUTTON_H ) ) ) \
		} \
		itemDef \
		{ \
			rect 0 0 BUTTON_W BUTTON_H 0 0 \
			visible 1 \
			style 1 \
            decoration \
			forecolor 1 1 1 1 \
			textfont BUTTON_FONT_TITLE \
			textalign 5 \
			textscale BUTTON_FONT_SCALE_TITLE \
			exp rect x ( OPTION_X + MENU_PADDING_L + ( column * ( BUTTON_X + BUTTON_W ) ) ) \
			exp rect y ( OPTION_Y + MENU_PADDING_L + ( row * ( BUTTON_Y + BUTTON_H ) ) ) \
        	exp text ( txt ) \
		} \
		itemDef \
		{ \
			rect 0 0 BUTTON_W BUTTON_H 0 0 \
			visible 1 \
			style 1 \
            decoration \
			forecolor 1 1 1 1 \
			textfont BUTTON_FONT_HINT \
			textalign 13 \
			textscale BUTTON_FONT_SCALE_HINT \
			exp rect x ( OPTION_X + MENU_PADDING_L + ( column * ( BUTTON_X + BUTTON_W ) ) ) \
			exp rect y ( OPTION_Y + MENU_PADDING_L + ( row * ( BUTTON_Y + BUTTON_H ) ) ) \
        	exp text ( hint ) \
		}
