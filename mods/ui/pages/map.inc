#define RENDER_MAP() \
		onOpen \
		{ \
            lerp x from 640 to 0 over "0.25"; \
		} \
        onRequestClose \
        { \
            lerp x from 0 to 640 over "0.25"; \
        } \
		itemDef \
		{ \
			rect -272.667 97 266.667 266.667 3 1 \
			decoration \
			visible 1 \
			style 3 \
			forecolor 1 1 1 1 \
			background "black" \
			visible when ( ! inkillcam( ) && ! localvarint( "hide_map" ) ) \
		} \
		itemDef \
		{ \
			name "fullmap_map" \
			rect -272.667 97 266.667 266.667 3 1 \
			decoration \
			visible 1 \
			ownerdraw 181 \
			forecolor 1 1 1 1 \
			background "compass_map_default" \
			type 8 \
			visible when ( ! inkillcam( ) && ! localvarint( "hide_map" ) ) \
		} \
		itemDef \
		{ \
			name "fullmap_friendlies" \
			rect -272.667 97 266.667 266.667 3 1 \
			decoration \
			visible 1 \
			ownerdraw 185 \
			forecolor 1 1 1 1 \
			type 8 \
			visible when ( ! inkillcam( ) && ! localvarint( "hide_map" ) ) \
		} \
		itemDef \
		{ \
			name "fullmap_enemies" \
			rect -272.667 97 266.667 266.667 3 1 \
			decoration \
			visible 1 \
			ownerdraw 188 \
			forecolor 1 1 1 1 \
			type 8 \
			visible when ( ! inkillcam( ) && ! localvarint( "hide_map" ) ) \
		} \
		itemDef \
		{ \
			name "fullmap_player" \
			rect -272.667 97 266.667 266.667 3 1 \
			decoration \
			visible 1 \
			ownerdraw 183 \
			forecolor 1 1 1 1 \
			background "compassping_player" \
			type 8 \
			visible when ( ! inkillcam( ) && ! localvarint( "hide_map" ) ) \
		} \
		itemDef \
		{ \
			rect -272.667 97 266.667 266.667 3 1 \
			decoration \
			visible 1 \
			style 3 \
			forecolor 1 1 1 1 \
			background "stencil_base" \
			visible when ( ! inkillcam( ) && ! localvarint( "hide_map" ) ) \
		} \
		itemDef \
		{ \
			rect -272.667 97 266.667 266.667 3 1 \
			decoration \
			visible 1 \
			style 3 \
			forecolor 1 1 1 1 \
			background "scanlines_stencil" \
			visible when ( ! inkillcam( ) && ! localvarint( "hide_map" ) ) \
		} \
		itemDef \
		{ \
			rect -272.667 97 266.667 266.667 3 1 \
			decoration \
			visible 1 \
			style 3 \
			forecolor 0.89 0.98 0.95 1 \
			background "stencil_fill" \
			visible when ( ! inkillcam( ) && ! localvarint( "hide_map" ) ) \
		} \
		itemDef \
		{ \
			rect -272.667 77.5 266.667 20 3 1 \
			decoration \
			visible 1 \
			style 1 \
			forecolor 1 1 1 1 \
			backcolor 0.1569 0.1725 0.1608 1 \
			background "white" \
			visible when ( ! inkillcam( ) && ! localvarint( "hide_map" ) ) \
		} \
		itemDef \
		{ \
			rect -272.667 77.5 266.667 20 3 1 \
			decoration \
			visible 1 \
			style 1 \
			forecolor 1 1 1 1 \
			textfont 9 \
			textalign 5 \
			textscale 0.375 \
			exp text ( getmapname( ) ) \
			visible when ( ! inkillcam( ) && ! localvarint( "hide_map" ) ) \
		}