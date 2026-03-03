#include "ui/style/variables.inc"

#ifndef UI_INC
    #define UI_INC 1

    #define CardtitleButton( column, row, mat, cur, goal, quest, response, time ) \
            itemDef \
            { \
                rect 0 0 CARDTITLE_W CARDTITLE_H 0 0 \
                style 1 \
                type 1 \
                visible 1 \
                backcolor PRIMARY_COLOR \
                exp rect x ( ( column * CARDTITLE_SPACE_X ) ) \
                exp rect y ( ( row * CARDTITLE_SPACE_Y ) ) \
                exp material ( "roundedrect" ) \
                exp backcolor a ( select ( ( localvarint( time ) > 0 ) , \
                            max( min( ( milliseconds( ) - localvarint( time ) ) / 250 , 1 ) , 0 ), \
                            max( min( 1 - ( milliseconds( ) + localvarint( time ) ) / 250 , 1 ) , 0 ) \
                        ) ) \
                action \
                { \
                    play "mouse_click"; \
                    scriptMenuResponse response; \
                } \
                onFocus \
                { \
                    setLocalVarInt time ( ( 1 ) * milliseconds( ) ); \
                    play "mouse_over"; \
                } \
                leaveFocus \
                { \
                    setLocalVarInt time ( ( -1 ) * milliseconds( ) ); \
                } \
            } \
            itemDef \
            { \
                rect 0 0 ( CARDTITLE_W - PADDING_S * 2 ) ( CARDTITLE_SHADER_H ) 0 0 \
                style 1 \
                decoration \
                visible 1 \
                backcolor 1 1 1 1 \
                exp rect x ( ( column * CARDTITLE_SPACE_X ) + PADDING_S ) \
                exp rect y ( ( row * CARDTITLE_SPACE_Y ) + PADDING_S ) \
                exp material ( mat ) \
            } \
            itemDef \
            { \
                rect 0 0 ( CARDTITLE_H - PADDING_S * 4 ) ( CARDTITLE_SHADER_H - PADDING_S * 2 ) 0 0 \
                style 1 \
                decoration \
                visible when ( cur < goal ) \
                backcolor 1 1 1 1 \
                exp rect x ( ( column * CARDTITLE_SPACE_X ) + PADDING_S * 2 ) \
                exp rect y ( ( row * CARDTITLE_SPACE_Y ) + PADDING_S * 2 ) \
                exp material ( "icon_lock" ) \
            } \
            itemDef \
            { \
                rect 0 0 ( CARDTITLE_W - PADDING_S * 2 ) CARDTITLE_TEXT_H 0 0 \
                style 1 \
                decoration \
                visible 1 \
                forecolor 1 1 1 1 \
                textalign 10 \
                textscale 0.275 \
                textfont 1 \
                exp rect x ( ( column * CARDTITLE_SPACE_X ) + PADDING_S ) \
                exp rect y ( ( row * CARDTITLE_SPACE_Y + CARDTITLE_SHADER_H + PADDING_S ) ) \
                exp text ( cur + " / " + goal ) \
            } \
            itemDef \
            { \
                rect 0 0 ( CARDTITLE_W - PADDING_S * 2 ) CARDTITLE_TEXT_H 0 0 \
                style 1 \
                decoration \
                visible 1 \
                forecolor 1 1 1 1 \
                textalign 8 \
                textscale 0.275 \
                textfont 1 \
                exp rect x ( ( column * CARDTITLE_SPACE_X ) + PADDING_S ) \
                exp rect y ( ( row * CARDTITLE_SPACE_Y + CARDTITLE_SHADER_H + PADDING_S ) ) \
                exp text (  quest ) \
            }

    #define InformationWindow() \
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

    #define InformationTitle( column, row, txt ) \
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

    #define InformationDescription( column, row, txt ) \
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

    #define InformationDescriptionSplit( column, row, txt ) \
            itemDef \
            { \
                rect ( INFORMATION_TEXT_X * column + INFORMATION_TEXT_W / 2 ) ( INFORMATION_TEXT_Y * row ) ( INFORMATION_TEXT_W / 2 ) INFORMATION_TEXT_H 0 0 \
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

    #define SettingsSpacer( idx ) \
            itemDef \
            { \
                rect -64 ( 33.334 + 20 * idx ) 301.5 2 1 1 \
                visible 1 \
                style 3 \
                decoration \
                forecolor 1 1 1 1 \
                background "navbar_tick" \
            }

    #define SettingsSelector( idx, txt, time, response, dvar_name ) \
            itemDef \
            { \
                rect -64 ( 35.334 + 20 * idx ) 501.5 17.567 1 1 \
                visible 1 \
                style 1 \
                type 1 \
                action \
                { \
                    play "mouse_click"; \
                    scriptMenuResponse response; \
                } \
                onFocus \
                { \
                    setLocalVarInt time ( ( 1 ) * milliseconds( ) ); \
                    play "mouse_over"; \
                } \
                leaveFocus \
                { \
                    setLocalVarInt time ( ( -1 ) * milliseconds( ) ); \
                } \
            } \
            itemDef \
            { \
                rect -64 ( 35.334 + 20 * idx ) 301.5 17.567 1 1 \
                decoration \
                visible 1 \
                style 1 \
                backcolor 1 1 1 1 \
                background "navbar_selection_bar" \
                exp backcolor a ( select ( ( localvarint( time ) > 0 ) , \
                            max( min( ( milliseconds( ) - localvarint( time ) ) / 250 , 1 ) , 0 ), \
                            max( min( 1 - ( milliseconds( ) + localvarint( time ) ) / 250 , 1 ) , 0 ) \
                        ) ) \
            } \
            itemDef \
            { \
                rect -64 ( 33.334 + 20 * idx ) 276.667 19.567 1 1 \
                decoration \
                visible 1 \
                style 1 \
                forecolor 1 1 1 1 \
                textfont 3 \ 
                textalign 10 \
                textscale 0.375 \
                exp text ( txt ) \
            } \
            itemDef \
            { \
                rect 269.5 ( 33.334 + 20 * idx ) 276.667 19.567 1 1 \
                decoration \
                visible 1 \
                style 1 \
                forecolor 1 1 1 1 \
                textfont 3 \
                textalign 4 \
                textscale 0.375 \
                exp text ( dvarstring( dvar_name ) ) \
            }

    #define SettingsToggle( idx, txt, time, response, dvar_name ) \
            itemDef \
            { \
                rect -64 ( 35.334 + 20 * idx ) 501.5 17.567 1 1 \
                visible 1 \
                style 1 \
                type 1 \
                action \
                { \
                    play "mouse_click"; \
                    scriptMenuResponse response; \
                } \
                onFocus \
                { \
                    setLocalVarInt time ( ( 1 ) * milliseconds( ) ); \
                    play "mouse_over"; \
                } \
                leaveFocus \
                { \
                    setLocalVarInt time ( ( -1 ) * milliseconds( ) ); \
                } \
            } \
            itemDef \
            { \
                rect -64 ( 35.334 + 20 * idx ) 301.5 17.567 1 1 \
                decoration \
                visible 1 \
                style 1 \
                backcolor 1 1 1 1 \
                background "navbar_selection_bar" \
                exp backcolor a ( select ( ( localvarint( time ) > 0 ) , \
                            max( min( ( milliseconds( ) - localvarint( time ) ) / 250 , 1 ) , 0 ), \
                            max( min( 1 - ( milliseconds( ) + localvarint( time ) ) / 250 , 1 ) , 0 ) \
                        ) ) \
            } \
            itemDef \
            { \
                rect -64 ( 33.334 + 20 * idx ) 276.667 19.567 1 1 \
                decoration \
                visible 1 \
                style 1 \
                forecolor 1 1 1 1 \
                textfont 3 \ 
                textalign 10 \
                textscale 0.375 \
                exp text ( txt ) \
            } \
            itemDef \
            { \
                rect 269.5 ( 33.334 + 20 * idx ) 276.667 19.567 1 1 \
                decoration \
                visible 1 \
                style 1 \
                forecolor 1 1 1 1 \
                textfont 3 \
                textalign 4 \
                textscale 0.375 \
                exp text ( select( dvarbool( dvar_name ), "Yes", "No" ) ) \
            }

    #define PrestigeButton( column, row, prestige, response, time ) \
            itemDef \
            { \
                rect 0 0 PRESTIGE_W PRESTIGE_H 0 0 \
                style 1 \
                decoration \
                visible 1 \
                backcolor PRIMARY_COLOR \
                exp rect x ( ( column * PRESTIGE_SPACE_X ) ) \
                exp rect y ( ( row * PRESTIGE_SPACE_Y ) ) \
                exp material ( "roundedrect" ) \
                exp backcolor a ( select ( ( localvarint( time ) > 0 ) , \
                            max( min( ( milliseconds( ) - localvarint( time ) ) / 250 , 1 ) , 0 ), \
                            max( min( 1 - ( milliseconds( ) + localvarint( time ) ) / 250 , 1 ) , 0 ) \
                        ) ) \
                } \
            itemDef \
            { \
                rect 0 0 ( PRESTIGE_W - PADDING_S * 2 ) ( PRESTIGE_H - PADDING_S * 2 ) 0 0 \
                style 1 \
                type 1 \
                visible 1 \
                backcolor 1 1 1 1 \
                exp rect x ( ( column * PRESTIGE_SPACE_X ) + PADDING_S ) \
                exp rect y ( ( row * PRESTIGE_SPACE_Y ) + PADDING_S ) \
                exp material ( select( ( dvarint( "rank_prestige_unlocked" ) < prestige ), "icon_lock", ( tableLookup( "mp/rankIconTable.csv", 0, 1, prestige + 1 ) ) ) ) \
                action \
                { \
                    play "mouse_click"; \
                    scriptMenuResponse response; \
                } \
                onFocus \
                { \
                    setLocalVarInt time ( ( 1 ) * milliseconds( ) ); \
                    play "mouse_over"; \
                } \
                leaveFocus \
                { \
                    setLocalVarInt time ( ( -1 ) * milliseconds( ) ); \
                } \
            }

    #define HiddenPrestigeButton( column, row, dvar_name, prestige, response, time ) \
            itemDef \
            { \
                rect 0 0 PRESTIGE_W PRESTIGE_H 0 0 \
                style 1 \
                decoration \
                visible 1 \
                backcolor PRIMARY_COLOR \
                exp rect x ( ( column * PRESTIGE_SPACE_X ) ) \
                exp rect y ( ( row * PRESTIGE_SPACE_Y ) ) \
                exp material ( "roundedrect" ) \
                exp backcolor a ( select ( ( localvarint( time ) > 0 ) , \
                            max( min( ( milliseconds( ) - localvarint( time ) ) / 250 , 1 ) , 0 ), \
                            max( min( 1 - ( milliseconds( ) + localvarint( time ) ) / 250 , 1 ) , 0 ) \
                        ) ) \
                } \
            itemDef \
            { \
                rect 0 0 ( PRESTIGE_W - PADDING_S * 2 ) ( PRESTIGE_H - PADDING_S * 2 ) 0 0 \
                style 1 \
                type 1 \
                visible 1 \
                backcolor 1 1 1 1 \
                exp rect x ( ( column * PRESTIGE_SPACE_X ) + PADDING_S ) \
                exp rect y ( ( row * PRESTIGE_SPACE_Y ) + PADDING_S ) \
                exp material ( select( ( dvarint( dvar_name ) == 0 ), "icon_lock", ( tableLookup( "mp/rankIconTable.csv", 0, 1, prestige + 1 ) ) ) ) \
                exp backcolor r ( select( ( dvarint( dvar_name ) == 0 ), 1, 1 ) ) \
                exp backcolor g ( select( ( dvarint( dvar_name ) == 0 ), 0.84, 1 ) ) \
                exp backcolor b ( select( ( dvarint( dvar_name ) == 0 ), 0, 1 ) ) \
                action \
                { \
                    play "mouse_click"; \
                    scriptMenuResponse response; \
                } \
                onFocus \
                { \
                    setLocalVarInt time ( ( 1 ) * milliseconds( ) ); \
                    play "mouse_over"; \
                } \
                leaveFocus \
                { \
                    setLocalVarInt time ( ( -1 ) * milliseconds( ) ); \
                } \
            }

    #define MainWindowSepartor( idx ) \
            itemDef \
            { \
                rect -64 ( 33.334 + 20 * idx ) 301.5 2 1 1 \
                visible 1 \
                style 3 \
                decoration \
                forecolor 1 1 1 1 \
                background "navbar_tick" \
            }

    #define MainWindowButton( idx, txt, func, time ) \
            itemDef \
            { \
                rect -64 ( 33.334 + 19.567 + 20 * idx ) 301.5 1 1 1 \
                visible 1 \
                style 1 \
                decoration \
                backcolor 0 0 0 0 \
                background "navbar_selection_bar" \
                exp backcolor a ( select ( ( localvarint( time ) > 0 ) , \
                            max( min( ( milliseconds( ) - localvarint( time ) ) / 250 , 1 ) , 0 ), \
                            max( min( 1 - ( milliseconds( ) + localvarint( time ) ) / 250 , 1 ) , 0 ) \
                        ) ) \
            } \
            itemDef \
            { \
                rect -64 ( 35.334 + 20 * idx ) 301.5 17.567 1 1 \
                visible 1 \
                style 1 \
                type 1 \
                backcolor 1 1 1 1 \
                background "navbar_selection_bar" \
                exp backcolor a ( select ( ( localvarint( time ) > 0 ) , \
                            max( min( ( milliseconds( ) - localvarint( time ) ) / 250 , 1 ) , 0 ), \
                            max( min( 1 - ( milliseconds( ) + localvarint( time ) ) / 250 , 1 ) , 0 ) \
                        ) ) \
                action \
                { \
                    play "mouse_click"; \
                    func; \
                } \
                onFocus \
                { \
                    setLocalVarInt time ( ( 1 ) * milliseconds( ) ); \
                    play "mouse_over"; \
                } \
                leaveFocus \
                { \
                    setLocalVarInt time ( ( -1 ) * milliseconds( ) ); \
                } \
            } \
            itemDef \
            { \
                rect -64 ( 33.334 + 20 * idx ) 276.667 19.567 1 1 \
                decoration \
                visible 1 \
                style 1 \
                forecolor 1 1 1 1 \
                textfont 3 \
                textalign 10 \
                textscale 0.375 \
                exp text ( txt ) \
            }

#endif