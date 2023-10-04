https://ke-complex-modifications.pqrs.org/#spacefn_plus
https://github.com/pqrs-org/Karabiner-Elements/issues/2977

# SpaceFN Plus 

This is an upgraded version of SpaceFN. The existing SpaceFN configuration unfavourably activates SpaceFN mode during rapid typing, rendering it unusability. The concept is drawn from SpaceLauncher, with two primary revisions:

Inhibit SpaceFN Mode for a duration of 0.2 seconds post the last keystroke: This adjustment allows for the quick insertion of a space following the completion of a word.
Ingore pre-defined keys within 0.2 seconds after space key down: This enhancement aims to prevent a letter from being activated before releasing the space bar during speedy typing.
I have been using these two improvements for 4 years, and they work well for me.

Known limitation: as stated here and reiterated here, Karabiner currently has a significant limitation - it overlooks rules that are outlined following other existing rules, even if those rules have unique conditions. For a more comprehensive explanation, refer to this feature request. Consequently, it is recommended to position the initial revision, “Disable SpaceFN mode after last typing,” following all other rules to prevent it from superseding the remaining rules.


{
    "title": "SpaceFN",
    "maintainers": [
        "tshu-w"
    ],
    "rules": [
        {
            "description": "SpaceFN: Space enables SpaceFN mode (see: https://geekhack.org/index.php?topic=51069.0 & https://spacelauncherapp.com)",
            "manipulators": [
                {
                    "type": "basic",
                    "from": {
                        "key_code": "spacebar"
                    },
                    "to_if_alone": [
                        {
                            "key_code": "spacebar"
                        }
                    ],
                    "to_if_held_down": [
                        {
                            "set_variable": {
                                "name": "spacefn_mode",
                                "value": 1
                            }
                        }
                    ],
                    "to_after_key_up": [
                        {
                            "set_variable": {
                                "name": "spacefn_mode",
                                "value": 0
                            }
                        }
                    ],
                    "conditions": [
                        {
                            "type": "variable_if",
                            "name": "_spacefn_mode",
                            "value": 0
                        }
                    ],
                    "parameters": {
                        "basic.to_if_alone_timeout_milliseconds": 300,
                        "basic.to_if_held_down_threshold_milliseconds": 200
                    }
                }
            ]
        },
        {
            "description": "SpaceFN: Space+b to Space (hold to repeat)",
            "manipulators": [
                {
                    "type": "basic",
                    "from": {
                        "key_code": "b",
                        "modifiers": {
                            "optional": [
                                "any"
                            ]
                        }
                    },
                    "to": [
                        {
                            "key_code": "spacebar"
                        }
                    ],
                    "conditions": [
                        {
                            "type": "variable_if",
                            "name": "spacefn_mode",
                            "value": 1
                        }
                    ]
                }
            ]
        },
        {
            "description": "SpaceFN: Space+[ijkl] to Up, Left, Down, Right",
            "manipulators": [
                {
                    "type": "basic",
                    "from": {
                        "key_code": "i",
                        "modifiers": {
                            "optional": [
                                "any"
                            ]
                        }
                    },
                    "to": [
                        {
                            "key_code": "up_arrow"
                        }
                    ],
                    "conditions": [
                        {
                            "type": "variable_if",
                            "name": "spacefn_mode",
                            "value": 1
                        }
                    ]
                },
                {
                    "type": "basic",
                    "from": {
                        "key_code": "k",
                        "modifiers": {
                            "optional": [
                                "any"
                            ]
                        }
                    },
                    "to": [
                        {
                            "key_code": "down_arrow"
                        }
                    ],
                    "conditions": [
                        {
                            "type": "variable_if",
                            "name": "spacefn_mode",
                            "value": 1
                        }
                    ]
                },
                {
                    "type": "basic",
                    "from": {
                        "key_code": "j",
                        "modifiers": {
                            "optional": [
                                "any"
                            ]
                        }
                    },
                    "to": [
                        {
                            "key_code": "left_arrow"
                        }
                    ],
                    "conditions": [
                        {
                            "type": "variable_if",
                            "name": "spacefn_mode",
                            "value": 1
                        }
                    ]
                },
                {
                    "type": "basic",
                    "from": {
                        "key_code": "l",
                        "modifiers": {
                            "optional": [
                                "any"
                            ]
                        }
                    },
                    "to": [
                        {
                            "key_code": "right_arrow"
                        }
                    ],
                    "conditions": [
                        {
                            "type": "variable_if",
                            "name": "spacefn_mode",
                            "value": 1
                        }
                    ]
                }
            ]
        },
        {
            "description": "SpaceFN: Space+[hjkl] to Left, Down, Up, Right",
            "manipulators": [
                {
                    "type": "basic",
                    "from": {
                        "key_code": "h",
                        "modifiers": {
                            "optional": [
                                "any"
                            ]
                        }
                    },
                    "to": [
                        {
                            "key_code": "left_arrow"
                        }
                    ],
                    "conditions": [
                        {
                            "type": "variable_if",
                            "name": "spacefn_mode",
                            "value": 1
                        }
                    ]
                },
                {
                    "type": "basic",
                    "from": {
                        "key_code": "j",
                        "modifiers": {
                            "optional": [
                                "any"
                            ]
                        }
                    },
                    "to": [
                        {
                            "key_code": "down_arrow"
                        }
                    ],
                    "conditions": [
                        {
                            "type": "variable_if",
                            "name": "spacefn_mode",
                            "value": 1
                        }
                    ]
                },
                {
                    "type": "basic",
                    "from": {
                        "key_code": "k",
                        "modifiers": {
                            "optional": [
                                "any"
                            ]
                        }
                    },
                    "to": [
                        {
                            "key_code": "up_arrow"
                        }
                    ],
                    "conditions": [
                        {
                            "type": "variable_if",
                            "name": "spacefn_mode",
                            "value": 1
                        }
                    ]
                },
                {
                    "type": "basic",
                    "from": {
                        "key_code": "l",
                        "modifiers": {
                            "optional": [
                                "any"
                            ]
                        }
                    },
                    "to": [
                        {
                            "key_code": "right_arrow"
                        }
                    ],
                    "conditions": [
                        {
                            "type": "variable_if",
                            "name": "spacefn_mode",
                            "value": 1
                        }
                    ]
                }
            ]
        },
        {
            "description": "SpaceFN: Space+u to Home, Space+o to End",
            "manipulators": [
                {
                    "type": "basic",
                    "from": {
                        "key_code": "u",
                        "modifiers": {
                            "optional": [
                                "any"
                            ]
                        }
                    },
                    "to": [
                        {
                            "key_code": "home"
                        }
                    ],
                    "conditions": [
                        {
                            "type": "variable_if",
                            "name": "spacefn_mode",
                            "value": 1
                        }
                    ]
                },
                {
                    "type": "basic",
                    "from": {
                        "key_code": "o",
                        "modifiers": {
                            "optional": [
                                "any"
                            ]
                        }
                    },
                    "to": [
                        {
                            "key_code": "end"
                        }
                    ],
                    "conditions": [
                        {
                            "type": "variable_if",
                            "name": "spacefn_mode",
                            "value": 1
                        }
                    ]
                }
            ]
        },
        {
            "description": "SpaceFN: Space+h to Page Up, Space+n to Page Down",
            "manipulators": [
                {
                    "type": "basic",
                    "from": {
                        "key_code": "h",
                        "modifiers": {
                            "optional": [
                                "any"
                            ]
                        }
                    },
                    "to": [
                        {
                            "key_code": "page_up"
                        }
                    ],
                    "conditions": [
                        {
                            "type": "variable_if",
                            "name": "spacefn_mode",
                            "value": 1
                        }
                    ]
                },
                {
                    "type": "basic",
                    "from": {
                        "key_code": "n",
                        "modifiers": {
                            "optional": [
                                "any"
                            ]
                        }
                    },
                    "to": [
                        {
                            "key_code": "page_down"
                        }
                    ],
                    "conditions": [
                        {
                            "type": "variable_if",
                            "name": "spacefn_mode",
                            "value": 1
                        }
                    ]
                }
            ]
        },
        {
            "description": "SpaceFN: Space+p to Print Screen, Space+Open Bracket ([) to Scroll Lock, Space+Close Bracket (]) to Pause, Space+Backslash (\\) to Insert",
            "manipulators": [
                {
                    "type": "basic",
                    "from": {
                        "key_code": "p",
                        "modifiers": {
                            "optional": [
                                "any"
                            ]
                        }
                    },
                    "to": [
                        {
                            "key_code": "print_screen"
                        }
                    ],
                    "conditions": [
                        {
                            "type": "variable_if",
                            "name": "spacefn_mode",
                            "value": 1
                        }
                    ]
                },
                {
                    "type": "basic",
                    "from": {
                        "key_code": "open_bracket",
                        "modifiers": {
                            "optional": [
                                "any"
                            ]
                        }
                    },
                    "to": [
                        {
                            "key_code": "scroll_lock"
                        }
                    ],
                    "conditions": [
                        {
                            "type": "variable_if",
                            "name": "spacefn_mode",
                            "value": 1
                        }
                    ]
                },
                {
                    "type": "basic",
                    "from": {
                        "key_code": "close_bracket",
                        "modifiers": {
                            "optional": [
                                "any"
                            ]
                        }
                    },
                    "to": [
                        {
                            "key_code": "pause"
                        }
                    ],
                    "conditions": [
                        {
                            "type": "variable_if",
                            "name": "spacefn_mode",
                            "value": 1
                        }
                    ]
                },
                {
                    "type": "basic",
                    "from": {
                        "key_code": "backslash",
                        "modifiers": {
                            "optional": [
                                "any"
                            ]
                        }
                    },
                    "to": [
                        {
                            "key_code": "insert"
                        }
                    ],
                    "conditions": [
                        {
                            "type": "variable_if",
                            "name": "spacefn_mode",
                            "value": 1
                        }
                    ]
                }
            ]
        },
        {
            "description": "SpaceFN: Space+Backspace to Forward Delete",
            "manipulators": [
                {
                    "type": "basic",
                    "from": {
                        "key_code": "delete_or_backspace",
                        "modifiers": {
                            "optional": [
                                "any"
                            ]
                        }
                    },
                    "to": [
                        {
                            "key_code": "delete_forward"
                        }
                    ],
                    "conditions": [
                        {
                            "type": "variable_if",
                            "name": "spacefn_mode",
                            "value": 1
                        }
                    ]
                }
            ]
        },
        {
            "description": "SpaceFN: Backquote (`) to Escape",
            "manipulators": [
                {
                    "type": "basic",
                    "from": {
                        "key_code": "grave_accent_and_tilde",
                        "modifiers": {
                            "optional": [
                                "any"
                            ]
                        }
                    },
                    "to": [
                        {
                            "key_code": "escape"
                        }
                    ],
                    "conditions": [
                        {
                            "type": "variable_if",
                            "name": "spacefn_mode",
                            "value": 0
                        }
                    ]
                }
            ]
        },
        {
            "description": "SpaceFN: Space+e to Escape, Space+m to Backtick (`), Space+Comma to Tilde (~)",
            "manipulators": [
                {
                    "type": "basic",
                    "from": {
                        "key_code": "e",
                        "modifiers": {
                            "optional": [
                                "any"
                            ]
                        }
                    },
                    "to": [
                        {
                            "key_code": "escape"
                        }
                    ],
                    "conditions": [
                        {
                            "type": "variable_if",
                            "name": "spacefn_mode",
                            "value": 1
                        }
                    ]
                },
                {
                    "type": "basic",
                    "from": {
                        "key_code": "m",
                        "modifiers": {
                            "optional": [
                                "any"
                            ]
                        }
                    },
                    "to": [
                        {
                            "key_code": "grave_accent_and_tilde"
                        }
                    ],
                    "conditions": [
                        {
                            "type": "variable_if",
                            "name": "spacefn_mode",
                            "value": 1
                        }
                    ]
                },
                {
                    "type": "basic",
                    "from": {
                        "key_code": "comma",
                        "modifiers": {
                            "optional": [
                                "any"
                            ]
                        }
                    },
                    "to": [
                        {
                            "key_code": "grave_accent_and_tilde",
                            "modifiers": [
                                "left_shift"
                            ]
                        }
                    ],
                    "conditions": [
                        {
                            "type": "variable_if",
                            "name": "spacefn_mode",
                            "value": 1
                        }
                    ]
                }
            ]
        },
        {
            "description": "SpaceFN: Space+[1234567890-=] to F[1-12]",
            "manipulators": [
                {
                    "type": "basic",
                    "from": {
                        "key_code": "1",
                        "modifiers": {
                            "optional": [
                                "any"
                            ]
                        }
                    },
                    "to": [
                        {
                            "key_code": "f1"
                        }
                    ],
                    "conditions": [
                        {
                            "type": "variable_if",
                            "name": "spacefn_mode",
                            "value": 1
                        }
                    ]
                },
                {
                    "type": "basic",
                    "from": {
                        "key_code": "2",
                        "modifiers": {
                            "optional": [
                                "any"
                            ]
                        }
                    },
                    "to": [
                        {
                            "key_code": "f2"
                        }
                    ],
                    "conditions": [
                        {
                            "type": "variable_if",
                            "name": "spacefn_mode",
                            "value": 1
                        }
                    ]
                },
                {
                    "type": "basic",
                    "from": {
                        "key_code": "3",
                        "modifiers": {
                            "optional": [
                                "any"
                            ]
                        }
                    },
                    "to": [
                        {
                            "key_code": "f3"
                        }
                    ],
                    "conditions": [
                        {
                            "type": "variable_if",
                            "name": "spacefn_mode",
                            "value": 1
                        }
                    ]
                },
                {
                    "type": "basic",
                    "from": {
                        "key_code": "4",
                        "modifiers": {
                            "optional": [
                                "any"
                            ]
                        }
                    },
                    "to": [
                        {
                            "key_code": "f4"
                        }
                    ],
                    "conditions": [
                        {
                            "type": "variable_if",
                            "name": "spacefn_mode",
                            "value": 1
                        }
                    ]
                },
                {
                    "type": "basic",
                    "from": {
                        "key_code": "5",
                        "modifiers": {
                            "optional": [
                                "any"
                            ]
                        }
                    },
                    "to": [
                        {
                            "key_code": "f5"
                        }
                    ],
                    "conditions": [
                        {
                            "type": "variable_if",
                            "name": "spacefn_mode",
                            "value": 1
                        }
                    ]
                },
                {
                    "type": "basic",
                    "from": {
                        "key_code": "6",
                        "modifiers": {
                            "optional": [
                                "any"
                            ]
                        }
                    },
                    "to": [
                        {
                            "key_code": "f6"
                        }
                    ],
                    "conditions": [
                        {
                            "type": "variable_if",
                            "name": "spacefn_mode",
                            "value": 1
                        }
                    ]
                },
                {
                    "type": "basic",
                    "from": {
                        "key_code": "7",
                        "modifiers": {
                            "optional": [
                                "any"
                            ]
                        }
                    },
                    "to": [
                        {
                            "key_code": "f7"
                        }
                    ],
                    "conditions": [
                        {
                            "type": "variable_if",
                            "name": "spacefn_mode",
                            "value": 1
                        }
                    ]
                },
                {
                    "type": "basic",
                    "from": {
                        "key_code": "8",
                        "modifiers": {
                            "optional": [
                                "any"
                            ]
                        }
                    },
                    "to": [
                        {
                            "key_code": "f8"
                        }
                    ],
                    "conditions": [
                        {
                            "type": "variable_if",
                            "name": "spacefn_mode",
                            "value": 1
                        }
                    ]
                },
                {
                    "type": "basic",
                    "from": {
                        "key_code": "9",
                        "modifiers": {
                            "optional": [
                                "any"
                            ]
                        }
                    },
                    "to": [
                        {
                            "key_code": "f9"
                        }
                    ],
                    "conditions": [
                        {
                            "type": "variable_if",
                            "name": "spacefn_mode",
                            "value": 1
                        }
                    ]
                },
                {
                    "type": "basic",
                    "from": {
                        "key_code": "0",
                        "modifiers": {
                            "optional": [
                                "any"
                            ]
                        }
                    },
                    "to": [
                        {
                            "key_code": "f10"
                        }
                    ],
                    "conditions": [
                        {
                            "type": "variable_if",
                            "name": "spacefn_mode",
                            "value": 1
                        }
                    ]
                },
                {
                    "type": "basic",
                    "from": {
                        "key_code": "hyphen",
                        "modifiers": {
                            "optional": [
                                "any"
                            ]
                        }
                    },
                    "to": [
                        {
                            "key_code": "f11"
                        }
                    ],
                    "conditions": [
                        {
                            "type": "variable_if",
                            "name": "spacefn_mode",
                            "value": 1
                        }
                    ]
                },
                {
                    "type": "basic",
                    "from": {
                        "key_code": "equal_sign",
                        "modifiers": {
                            "optional": [
                                "any"
                            ]
                        }
                    },
                    "to": [
                        {
                            "key_code": "f12"
                        }
                    ],
                    "conditions": [
                        {
                            "type": "variable_if",
                            "name": "spacefn_mode",
                            "value": 1
                        }
                    ]
                }
            ]
        },
        {
            "description": "SpaceFN: Space+Slash (/) to Menu",
            "manipulators": [
                {
                    "type": "basic",
                    "from": {
                        "key_code": "slash",
                        "modifiers": {
                            "optional": [
                                "any"
                            ]
                        }
                    },
                    "to": [
                        {
                            "key_code": "menu"
                        }
                    ],
                    "conditions": [
                        {
                            "type": "variable_if",
                            "name": "spacefn_mode",
                            "value": 1
                        }
                    ]
                }
            ]
        },
        {
            "description": "SpaceFN: Disable SpaceFN mode after last typing",
            "manipulators": [
                {
                    "from": {
                        "key_code": "spacebar"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "spacebar"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "caps_lock"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "caps_lock"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "left_control"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "left_control"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "left_shift"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "left_shift"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "left_option"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "left_option"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "left_command"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "left_command"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "right_control"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "right_control"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "right_shift"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "right_shift"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "right_option"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "right_option"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "right_command"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "right_command"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "fn"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "fn"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "return_or_enter"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "return_or_enter"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "escape"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "escape"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "delete_or_backspace"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "delete_or_backspace"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "delete_forward"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "delete_forward"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "tab"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "tab"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "spacebar"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "spacebar"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "hyphen"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "hyphen"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "equal_sign"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "equal_sign"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "open_bracket"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "open_bracket"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "close_bracket"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "close_bracket"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "backslash"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "backslash"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "non_us_pound"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "non_us_pound"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "semicolon"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "semicolon"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "quote"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "quote"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "grave_accent_and_tilde"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "grave_accent_and_tilde"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "comma"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "comma"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "period"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "period"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "slash"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "slash"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "non_us_backslash"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "non_us_backslash"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "up_arrow"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "up_arrow"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "down_arrow"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "down_arrow"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "left_arrow"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "left_arrow"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "right_arrow"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "right_arrow"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "a"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "a"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "b"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "b"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "c"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "c"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "d"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "d"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "e"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "e"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "f"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "f"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "g"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "g"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "h"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "h"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "i"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "i"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "j"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "j"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "k"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "k"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "l"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "l"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "m"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "m"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "n"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "n"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "o"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "o"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "p"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "p"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "q"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "q"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "r"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "r"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "s"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "s"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "t"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "t"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "u"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "u"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "v"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "v"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "w"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "w"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "x"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "x"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "y"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "y"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "z"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "z"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "1"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "1"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "2"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "2"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "3"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "3"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "4"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "4"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "5"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "5"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "6"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "6"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "7"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "7"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "8"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "8"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "9"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "9"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "0"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "0"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "f1"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "f1"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "f2"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "f2"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "f3"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "f3"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "f4"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "f4"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "f5"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "f5"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "f6"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "f6"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "f7"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "f7"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "f8"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "f8"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "f9"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "f9"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "f10"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "f10"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "f11"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "f11"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                },
                {
                    "from": {
                        "key_code": "f12"
                    },
                    "to": [
                        {
                            "set_variable": {
                                "name": "_spacefn_mode",
                                "value": 1
                            }
                        },
                        {
                            "key_code": "f12"
                        }
                    ],
                    "to_delayed_action": {
                        "to_if_invoked": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ],
                        "to_if_canceled": [
                            {
                                "set_variable": {
                                    "name": "_spacefn_mode",
                                    "value": 0
                                }
                            }
                        ]
                    },
                    "parameters": {
                        "basic.to_delayed_action_delay_milliseconds": 200
                    },
                    "type": "basic"
                }
            ]
        }
    ]
}

