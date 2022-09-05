" Enable Mouse
set mouse=a

" Set Editor Font
if exists(':GuiFont')
    " Use GuiFont! to ignore font errors
    "GuiFont SF Mono:h13
    GuiFont JetBrains Mono:h13:w57
endif

" Enable GUI ScrollBar
if exists(':GuiScrollBar')
    GuiScrollBar 1
endif
GuiPopupmenu 0
set linespace=-1 "to make the statusline height = 1
