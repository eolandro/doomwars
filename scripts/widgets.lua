DefineButtonStyle("main", {
  Size = {128, 20},
  Font = "game",
  TextNormalColor = "yellow",
  TextReverseColor = "white",
  TextAlign = "Center",
  TextPos = {64, 4},
  Default = {
    File = "graphics/ui/buttons_1.png", Size = {300, 144}, Frame = 4,
  },
  Hover = {
    TextNormalColor = "white",
  },
  Clicked = {
    File = "graphics/ui/buttons_1.png", Size = {300, 144}, Frame = 5,
    TextNormalColor = "white",
    TextPos = {66, 6},
  },
})

DefineButtonStyle("main-hell", {
  Size = {128, 20},
  Font = "game",
  TextNormalColor = "yellow",
  TextReverseColor = "white",
  TextAlign = "Center",
  TextPos = {64, 4},
  Default = {
    File = "graphics/ui/hell/widgets/button-thin-medium-normal.png", Size = {128, 20}, Frame = 0,
  },
  Hover = {
    TextNormalColor = "white",
  },
  Clicked = {
    File = "graphics/ui/hell/widgets/button-thin-medium-pressed.png", Size = {128, 20}, Frame = 0,
    TextNormalColor = "white",
    TextPos = {66, 6},
  },
})

DefineButtonStyle("network", {
  Size = {80, 20},
  Font = "game",
  TextNormalColor = "yellow",
  TextReverseColor = "white",
  TextAlign = "Center",
  TextPos = {40, 4},
  Default = {
    File = "graphics/ui/buttons_1.png", Size = {300, 144}, Frame = 7,
  },
  Hover = {
    TextNormalColor = "white",
  },
  Clicked = {
    File = "graphics/ui/buttons_1.png", Size = {300, 144}, Frame = 8,
    TextNormalColor = "white",
    TextPos = {42, 6},
  },
})

DefineButtonStyle("network-hell", {
  Size = {80, 20},
  Font = "game",
  TextNormalColor = "yellow",
  TextReverseColor = "white",
  TextAlign = "Center",
  TextPos = {40, 4},
  Default = {
    File = "graphics/ui/buttons_2.png", Size = {300, 144}, Frame = 7,
  },
  Hover = {
    TextNormalColor = "white",
  },
  Clicked = {
    File = "graphics/ui/buttons_2.png", Size = {300, 144}, Frame = 8,
    TextNormalColor = "white",
    TextPos = {42, 6},
  },
})

DefineButtonStyle("gm-half", {
  Size = {106, 28},
  Font = "large",
  TextNormalColor = "yellow",
  TextReverseColor = "white",
  TextAlign = "Center",
  TextPos = {53, 7},
  Default = {
    File = "graphics/ui/buttons_1.png", Size = {300, 144}, Frame = 10,
  },
  Hover = {
    TextNormalColor = "white",
  },
  Clicked = {
    File = "graphics/ui/buttons_1.png", Size = {300, 144}, Frame = 11,
    TextNormalColor = "white",
    TextPos = {55, 9},
  },
})

DefineButtonStyle("gm-full", {
  Size = {224, 28},
  Font = "large",
  TextNormalColor = "yellow",
  TextReverseColor = "white",
  TextAlign = "Center",
  TextPos = {112, 7},
  Default = {
    File = "graphics/ui/buttons_1.png", Size = {300, 144}, Frame = 16,
  },
  Hover = {
    TextNormalColor = "white",
  },
  Clicked = {
    File = "graphics/ui/buttons_1.png", Size = {300, 144}, Frame = 17,
    TextNormalColor = "white",
    TextPos = {114, 9},
  },
})

DefineButtonStyle("folder", {
  Size = {39, 22},
  Font = "large",
  TextNormalColor = "yellow",
  TextReverseColor = "white",
  TextAlign = "Left",
  TextPos = {44, 6},
  Default = {
    File = "graphics/ui/buttons_1.png", Size = {300, 144}, Frame = 51,
  },
  Hover = {
    TextNormalColor = "white",
  },
  Clicked = {
    File = "graphics/ui/buttons_1.png", Size = {300, 144}, Frame = 52,
    TextNormalColor = "white",
  },
})

DefineButtonStyle("icon", {
  Size = {46, 38},
  Font = "game",
  TextNormalColor = "yellow",
  TextReverseColor = "white",
  TextAlign = "Right",
  TextPos = {46, 26},
  Default = {
    Border = {
      Color = {0, 0, 0}, Size = 1,
    },
  },
  Hover = {
    TextNormalColor = "white",
    Border = {
      Color = {128, 128, 128}, Size = 1,
    },
  },
  Clicked = {
    TextNormalColor = "white",
    Border = {
      Color = {128, 128, 128}, Size = 1,
    },
  },
})

DefineButtonStyle("uac-button-prev-mode", {
  Size = {26, 26},
  Font = "small",
  TextNormalColor = "yellow",
  TextReverseColor = "white",
  TextAlign = "Center",
  TextPos = {0, 0},
  Default = {
    File = "graphics/ui/uac/widgets/ui-prev-view.png", Size = {26, 26}, Frame = 0,
  },
  Hover = {
    TextNormalColor = "white",
	Border = {
      Color = {192, 192, 192}, Size = 1,
    },
  },
  Clicked = {
    TextNormalColor = "white",
	Border = {
      Color = {192, 192, 192}, Size = 1,
    },
  },
})

DefineButtonStyle("uac-button-next-mode", {
  Size = {26, 26},
  Font = "small",
  TextNormalColor = "yellow",
  TextReverseColor = "white",
  TextAlign = "Center",
  TextPos = {0, 0},
  Default = {
    File = "graphics/ui/uac/widgets/ui-next-view.png", Size = {26, 26}, Frame = 0,
  },
  Hover = {
    TextNormalColor = "white",
	Border = {
      Color = {192, 192, 192}, Size = 1,
    },
  },
  Clicked = {
    TextNormalColor = "white",
	Border = {
      Color = {192, 192, 192}, Size = 1,
    },
  },
})

DefineButtonStyle("uac-button-pause", {
  Size = {26, 26},
  Font = "small",
  TextNormalColor = "yellow",
  TextReverseColor = "white",
  TextAlign = "Center",
  TextPos = {0, 0},
  Default = {
    File = "graphics/ui/uac/widgets/ui-pause.png", Size = {26, 26}, Frame = 0,
  },
  Hover = {
    TextNormalColor = "white",
	Border = {
      Color = {192, 192, 192}, Size = 1,
    },
  },
  Clicked = {
    TextNormalColor = "white",
	Border = {
      Color = {192, 192, 192}, Size = 1,
    },
  },
})

DefineButtonStyle("uac-button-center-message", {
  Size = {26, 26},
  Font = "small",
  TextNormalColor = "yellow",
  TextReverseColor = "white",
  TextAlign = "Center",
  TextPos = {0, 0},
  Default = {
    File = "graphics/ui/uac/widgets/ui-center-message.png", Size = {26, 26}, Frame = 0,
  },
  Hover = {
    TextNormalColor = "white",
	Border = {
      Color = {192, 192, 192}, Size = 1,
    },
  },
  Clicked = {
    TextNormalColor = "white",
	Border = {
      Color = {192, 192, 192}, Size = 1,
    },
  },
})

DefineButtonStyle("uac-button-toggle-terrain", {
  Size = {26, 26},
  Font = "small",
  TextNormalColor = "yellow",
  TextReverseColor = "white",
  TextAlign = "Center",
  TextPos = {0, 0},
  Default = {
    File = "graphics/ui/uac/widgets/ui-toogle-terrain.png", Size = {26, 26}, Frame = 0,
  },
  Hover = {
    TextNormalColor = "white",
	Border = {
      Color = {192, 192, 192}, Size = 1,
    },
  },
  Clicked = {
    TextNormalColor = "white",
	Border = {
      Color = {192, 192, 192}, Size = 1,
    },
  },
})

DefineButtonStyle("uac-button-free-worker", {
  Size = {26, 26},
  Font = "small",
  TextNormalColor = "yellow",
  TextReverseColor = "white",
  TextAlign = "Center",
  TextPos = {0, 0},
  Default = {
    File = "graphics/ui/uac/widgets/ui-worker.png", Size = {26, 26}, Frame = 0,
  },
  Hover = {
    TextNormalColor = "white",
	Border = {
      Color = {192, 192, 192}, Size = 1,
    },
  },
  Clicked = {
    TextNormalColor = "white",
	Border = {
      Color = {192, 192, 192}, Size = 1,
    },
  },
})

DefineButtonStyle("hell-button-free-worker", {
  Size = {26, 26},
  Font = "small",
  TextNormalColor = "yellow",
  TextReverseColor = "white",
  TextAlign = "Center",
  TextPos = {0, 0},
  Default = {
    File = "graphics/ui/hell/widgets/ui-worker.png", Size = {26, 26}, Frame = 0,
  },
  Hover = {
    TextNormalColor = "white",
	Border = {
      Color = {192, 192, 192}, Size = 1,
    },
  },
  Clicked = {
    TextNormalColor = "white",
	Border = {
      Color = {192, 192, 192}, Size = 1,
    },
  },
})