--[[
	This file is similar to the 'wmmsgs.lua' file.
	The difference is, this file has a 'WM_' for every
	value from 0x0000 all the way up to 0x4000, filling
	in the gaps from the wmmsgs file with WM_RESERVED_XXX
	That way, if we ever see a message that we don't already
	know, we'll at least see the 'RESERVED' and can investigate.
]]
local enum = require("enum")

local export = enum {
    WM_NULL = 0x0000;
    WM_CREATE = 0x01;
    WM_DESTROY = 0x02;
    WM_MOVE = 0x03;
WM_SIZEWAIT = 0x04;
WM_SIZE = 0x05;
WM_ACTIVATE = 0x06;
WM_SETFOCUS = 0x07;
WM_KILLFOCUS = 0x08;
WM_SETVISIBLE = 0x09;
WM_ENABLE = 0x0a;
WM_SETREDRAW = 0x0b;
WM_SETTEXT = 0x0c;
WM_GETTEXT = 0x0d;
WM_GETTEXTLENGTH = 0x0e;
WM_PAINT = 0x0f;
WM_CLOSE = 0x10;
WM_QUERYENDSESSION = 0x11;
WM_QUIT = 0x12;
WM_QUERYOPEN = 0x13;
WM_ERASEBKGND = 0x14;
WM_SYSCOLORCHANGE = 0x15;
WM_ENDSESSION = 0x16;
WM_SYSTEMERROR = 0x17;
WM_SHOWWINDOW = 0x18;
WM_CTLCOLOR = 0x19;
WM_WININICHANGE = 0x1a;
WM_DEVMODECHANGE = 0x1b;
WM_ACTIVATEAPP = 0x1c;
WM_FONTCHANGE = 0x1d;
WM_TIMECHANGE = 0x1e;
WM_CANCELMODE = 0x1f;
WM_SETCURSOR = 0x20;
WM_MOUSEACTIVATE = 0x21;
WM_CHILDACTIVATE = 0x22;
WM_QUEUESYNC = 0x23;
WM_GETMINMAXINFO = 0x24;
WM_LOGOFF = 0x25;
WM_PAINTICON = 0x26;
WM_ICONERASEBKGND = 0x27;
WM_NEXTDLGCTL = 0x28;
WM_ALTTABACTIVE = 0x29;
WM_SPOOLERSTATUS = 0x2a;
WM_DRAWITEM = 0x2b;
WM_MEASUREITEM = 0x2c;
WM_DELETEITEM = 0x2d;
WM_VKEYTOITEM = 0x2e;
WM_CHARTOITEM = 0x2f;
WM_SETFONT = 0x30;
WM_GETFONT = 0x31;
WM_SETHOTKEY = 0x32;
WM_GETHOTKEY = 0x33;
WM_SHELLNOTIFY = 0x34;
WM_ISACTIVEICON = 0x35;
WM_QUERYPARKICON = 0x36;
WM_QUERYDRAGICON = 0x37;
WM_WINHELP = 0x38;
WM_COMPAREITEM = 0x39;
WM_FULLSCREEN = 0x3a;
WM_CLIENTSHUTDOWN = 0x3b;
WM_DDEMLEVENT = 0x3c;
WM_GETOBJECT = 0x3d;
undefined_1 = 0x3e;
undefined_2 = 0x3f;
WM_TESTING = 0x40;
WM_COMPACTING = 0x41;
WM_OTHERWINDOWCREATED = 0x42;
WM_OTHERWINDOWDESTROYED = 0x43;
WM_COMMNOTIFY = 0x44;
undefined_3 = 0x45;
WM_WINDOWPOSCHANGING = 0x46;
WM_WINDOWPOSCHANGED = 0x47;
WM_POWER = 0x48;
WM_COPYGLOBALDATA = 0x49;
WM_COPYDATA = 0x4a;
WM_CANCELJOURNAL = 0x4b;
undefined_4 = 0x4c;
WM_KEYF1 = 0x4d;
WM_NOTIFY = 0x4e;
WM_ACCESS_WINDOW = 0x4f;
WM_INPUTLANGCHANGEREQUEST = 0x50;
WM_INPUTLANGCHANGE = 0x51;
WM_TCARD = 0x52;
WM_HELP = 0x53;
WM_USERCHANGED = 0x54;
WM_NOTIFYFORMAT = 0x55;
undefined_5 = 0x56;
undefined_6 = 0x57;
undefined_7 = 0x58;
undefined_8 = 0x59;
undefined_9 = 0x5a;
undefined_10 = 0x5b;
undefined_11 = 0x5c;
undefined_12 = 0x5d;
undefined_13 = 0x5e;
undefined_14 = 0x5f;
undefined_15 = 0x60;
undefined_16 = 0x61;
undefined_17 = 0x62;
undefined_18 = 0x63;
undefined_19 = 0x64;
undefined_20 = 0x65;
undefined_21 = 0x66;
undefined_22 = 0x67;
undefined_23 = 0x68;
undefined_24 = 0x69;
undefined_25 = 0x6a;
undefined_26 = 0x6b;
undefined_27 = 0x6c;
undefined_28 = 0x6d;
undefined_29 = 0x6e;
undefined_30 = 0x6f;
WM_FINALDESTROY = 0x70;
WM_MEASUREITEM_CLIENTDATA = 0x71;
undefined_31 = 0x72;
undefined_32 = 0x73;
undefined_33 = 0x74;
undefined_34 = 0x75;
undefined_35 = 0x76;
undefined_36 = 0x77;
undefined_37 = 0x78;
undefined_38 = 0x79;
undefined_39 = 0x7a;
WM_CONTEXTMENU = 0x7b;
WM_STYLECHANGING = 0x7c;
WM_STYLECHANGED = 0x7d;
WM_DISPLAYCHANGE = 0x7e;
WM_GETICON = 0x7f;
WM_SETICON = 0x80;
WM_NCCREATE = 0x81;
WM_NCDESTROY = 0x82;
WM_NCCALCSIZE = 0x83;
WM_NCHITTEST = 0x84;
WM_NCPAINT = 0x85;
WM_NCACTIVATE = 0x86;
WM_GETDLGCODE = 0x87;
WM_SYNCPAINT = 0x88;
WM_SYNCTASK = 0x89;
undefined_40 = 0x8a;
WM_KLUDGEMINRECT = 0x8b;
WM_LPKDRAWSWITCHWND = 0x8c;
undefined_41 = 0x8d;
undefined_42 = 0x8e;
undefined_43 = 0x8f;
WM_UAHDESTROYWINDOW = 0x90;
WM_UAHDRAWMENU = 0x91;
WM_UAHDRAWMENUITEM = 0x92;
WM_UAHINITMENU = 0x93;
WM_UAHMEASUREMENUITEM = 0x94;
WM_UAHNCPAINTMENUPOPUP = 0x95;
WM_UAHUPDATE = 0x96;
undefined_44 = 0x97;
undefined_45 = 0x98;
undefined_46 = 0x99;
undefined_47 = 0x9a;
undefined_48 = 0x9b;
undefined_49 = 0x9c;
undefined_50 = 0x9d;
undefined_51 = 0x9e;
undefined_52 = 0x9f;
WM_NCMOUSEMOVE = 0xa0;
WM_NCLBUTTONDOWN = 0xa1;
WM_NCLBUTTONUP = 0xa2;
WM_NCLBUTTONDBLCLK = 0xa3;
WM_NCRBUTTONDOWN = 0xa4;
WM_NCRBUTTONUP = 0xa5;
WM_NCRBUTTONDBLCLK = 0xa6;
WM_NCMBUTTONDOWN = 0xa7;
WM_NCMBUTTONUP = 0xa8;
WM_NCMBUTTONDBLCLK = 0xa9;
undefined_53 = 0xaa;
WM_NCXBUTTONDOWN = 0xab;
WM_NCXBUTTONUP = 0xac;
WM_NCXBUTTONDBLCLK = 0xad;
WM_NCUAHDRAWCAPTION = 0xae;
WM_NCUAHDRAWFRAME = 0xaf;
EM_GETSEL = 0xb0;
EM_SETSEL = 0xb1;
EM_GETRECT = 0xb2;
EM_SETRECT = 0xb3;
EM_SETRECTNP = 0xb4;
EM_SCROLL = 0xb5;
EM_LINESCROLL = 0xb6;
EM_SCROLLCARET = 0xb7;
EM_GETMODIFY = 0xb8;
EM_SETMODIFY = 0xb9;
EM_GETLINECOUNT = 0xba;
EM_LINEINDEX = 0xbb;
EM_SETHANDLE = 0xbc;
EM_GETHANDLE = 0xbd;
EM_GETTHUMB = 0xbe;
undefined_54 = 0xbf;
undefined_55 = 0xc0;
EM_LINELENGTH = 0xc1;
EM_REPLACESEL = 0xc2;
EM_SETFONT = 0xc3;
EM_GETLINE = 0xc4;
EM_LIMITTEXT = 0xc5;
EM_CANUNDO = 0xc6;
EM_UNDO = 0xc7;
EM_FMTLINES = 0xc8;
EM_LINEFROMCHAR = 0xc9;
EM_SETWORDBREAK = 0xca;
EM_SETTABSTOPS = 0xcb;
EM_SETPASSWORDCHAR = 0xcc;
EM_EMPTYUNDOBUFFER = 0xcd;
EM_GETFIRSTVISIBLELINE = 0xce;
EM_SETREADONLY = 0xcf;
EM_SETWORDBREAKPROC = 0xd0;
EM_GETWORDBREAKPROC = 0xd1;
EM_GETPASSWORDCHAR = 0xd2;
EM_SETMARGINS = 0xd3;
EM_GETMARGINS = 0xd4;
EM_GETLIMITTEXT = 0xd5;
EM_POSFROMCHAR = 0xd6;
EM_CHARFROMPOS = 0xd7;
EM_SETIMESTATUS = 0xd8;
EM_GETIMESTATUS = 0xd9;
EM_MSGMAX = 0xda;
undefined_56 = 0xdb;
undefined_57 = 0xdc;
undefined_58 = 0xdd;
undefined_59 = 0xde;
undefined_60 = 0xdf;
undefined_61 = 0xe0;
undefined_62 = 0xe1;
undefined_63 = 0xe2;
undefined_64 = 0xe3;
undefined_65 = 0xe4;
undefined_66 = 0xe5;
undefined_67 = 0xe6;
undefined_68 = 0xe7;
undefined_69 = 0xe8;
undefined_70 = 0xe9;
undefined_71 = 0xea;
undefined_72 = 0xeb;
undefined_73 = 0xec;
undefined_74 = 0xed;
undefined_75 = 0xee;
undefined_76 = 0xef;
undefined_77 = 0xf0;
undefined_78 = 0xf1;
undefined_79 = 0xf2;
undefined_80 = 0xf3;
undefined_81 = 0xf4;
undefined_82 = 0xf5;
undefined_83 = 0xf6;
undefined_84 = 0xf7;
undefined_85 = 0xf8;
undefined_86 = 0xf9;
undefined_87 = 0xfa;
undefined_88 = 0xfb;
undefined_89 = 0xfc;
undefined_90 = 0xfd;
WM_INPUT_DEVICE_CHANGE = 0xfe;
WM_INPUT = 0xff;
WM_KEYDOWN = 0x100;
WM_KEYUP = 0x101;
WM_CHAR = 0x102;
WM_DEADCHAR = 0x103;
WM_SYSKEYDOWN = 0x104;
WM_SYSKEYUP = 0x105;
WM_SYSCHAR = 0x106;
WM_SYSDEADCHAR = 0x107;
WM_YOMICHAR = 0x108;
WM_UNICHAR = 0x109;
WM_CONVERTREQUEST = 0x10a;
WM_CONVERTRESULT = 0x10b;
WM_INTERIM = 0x10c;
WM_IME_STARTCOMPOSITION = 0x10d;
WM_IME_ENDCOMPOSITION = 0x10e;
WM_IME_COMPOSITION = 0x10f;
WM_INITDIALOG = 0x110;
WM_COMMAND = 0x111;
WM_SYSCOMMAND = 0x112;
WM_TIMER = 0x113;
WM_HSCROLL = 0x114;
WM_VSCROLL = 0x115;
WM_INITMENU = 0x116;
WM_INITMENUPOPUP = 0x117;
WM_SYSTIMER = 0x118;
WM_GESTURE = 0x119;
WM_GESTURENOTIFY = 0x11a;
WM_GESTUREINPUT = 0x11b;
WM_GESTURENOTIFIED = 0x11c;
undefined_91 = 0x11d;
undefined_92 = 0x11e;
WM_MENUSELECT = 0x11f;
WM_MENUCHAR = 0x120;
WM_ENTERIDLE = 0x121;
WM_MENURBUTTONUP = 0x122;
WM_MENUDRAG = 0x123;
WM_MENUGETOBJECT = 0x124;
WM_UNINITMENUPOPUP = 0x125;
WM_MENUCOMMAND = 0x126;
WM_CHANGEUISTATE = 0x127;
WM_UPDATEUISTATE = 0x128;
WM_QUERYUISTATE = 0x129;
undefined_93 = 0x12a;
undefined_94 = 0x12b;
undefined_95 = 0x12c;
undefined_96 = 0x12d;
undefined_97 = 0x12e;
undefined_98 = 0x12f;
undefined_99 = 0x130;
WM_LBTRACKPOINT = 0x131;
WM_CTLCOLORMSGBOX = 0x132;
WM_CTLCOLOREDIT = 0x133;
WM_CTLCOLORLISTBOX = 0x134;
WM_CTLCOLORBTN = 0x135;
WM_CTLCOLORDLG = 0x136;
WM_CTLCOLORSCROLLBAR = 0x137;
WM_CTLCOLORSTATIC = 0x138;
undefined_100 = 0x139;
undefined_101 = 0x13a;
undefined_102 = 0x13b;
undefined_103 = 0x13c;
undefined_104 = 0x13d;
undefined_105 = 0x13e;
undefined_106 = 0x13f;
CB_GETEDITSEL = 0x140;
CB_LIMITTEXT = 0x141;
CB_SETEDITSEL = 0x142;
CB_ADDSTRING = 0x143;
CB_DELETESTRING = 0x144;
CB_DIR = 0x145;
CB_GETCOUNT = 0x146;
CB_GETCURSEL = 0x147;
CB_GETLBTEXT = 0x148;
CB_GETLBTEXTLEN = 0x149;
CB_INSERTSTRING = 0x14a;
CB_RESETCONTENT = 0x14b;
CB_FINDSTRING = 0x14c;
CB_SELECTSTRING = 0x14d;
CB_SETCURSEL = 0x14e;
CB_SHOWDROPDOWN = 0x14f;
CB_GETITEMDATA = 0x150;
CB_SETITEMDATA = 0x151;
CB_GETDROPPEDCONTROLRECT = 0x152;
CB_SETITEMHEIGHT = 0x153;
CB_GETITEMHEIGHT = 0x154;
CB_SETEXTENDEDUI = 0x155;
CB_GETEXTENDEDUI = 0x156;
CB_GETDROPPEDSTATE = 0x157;
CB_FINDSTRINGEXACT = 0x158;
CB_SETLOCALE = 0x159;
CB_GETLOCALE = 0x15a;
CB_GETTOPINDEX = 0x15b;
CB_SETTOPINDEX = 0x15c;
CB_GETHORIZONTALEXTENT = 0x15d;
CB_SETHORIZONTALEXTENT = 0x15e;
CB_GETDROPPEDWIDTH = 0x15f;
CB_SETDROPPEDWIDTH = 0x160;
CB_INITSTORAGE = 0x161;
CB_MSGMAX_OLD = 0x162;
CB_MULTIPLEADDSTRING = 0x163;
CB_GETCOMBOBOXINFO = 0x164;
CB_MSGMAX = 0x165;
undefined_107 = 0x166;
undefined_108 = 0x167;
undefined_109 = 0x168;
undefined_110 = 0x169;
undefined_111 = 0x16a;
undefined_112 = 0x16b;
undefined_113 = 0x16c;
undefined_114 = 0x16d;
undefined_115 = 0x16e;
undefined_116 = 0x16f;
undefined_117 = 0x170;
undefined_118 = 0x171;
undefined_119 = 0x172;
undefined_120 = 0x173;
undefined_121 = 0x174;
undefined_122 = 0x175;
undefined_123 = 0x176;
undefined_124 = 0x177;
undefined_125 = 0x178;
undefined_126 = 0x179;
undefined_127 = 0x17a;
undefined_128 = 0x17b;
undefined_129 = 0x17c;
undefined_130 = 0x17d;
undefined_131 = 0x17e;
undefined_132 = 0x17f;
LB_ADDSTRING = 0x180;
LB_INSERTSTRING = 0x181;
LB_DELETESTRING = 0x182;
LB_SELITEMRANGEEX = 0x183;
LB_RESETCONTENT = 0x184;
LB_SETSEL = 0x185;
LB_SETCURSEL = 0x186;
LB_GETSEL = 0x187;
LB_GETCURSEL = 0x188;
LB_GETTEXT = 0x189;
LB_GETTEXTLEN = 0x18a;
LB_GETCOUNT = 0x18b;
LB_SELECTSTRING = 0x18c;
LB_DIR = 0x18d;
LB_GETTOPINDEX = 0x18e;
LB_FINDSTRING = 0x18f;
LB_GETSELCOUNT = 0x190;
LB_GETSELITEMS = 0x191;
LB_SETTABSTOPS = 0x192;
LB_GETHORIZONTALEXTENT = 0x193;
LB_SETHORIZONTALEXTENT = 0x194;
LB_SETCOLUMNWIDTH = 0x195;
LB_ADDFILE = 0x196;
LB_SETTOPINDEX = 0x197;
LB_GETITEMRECT = 0x198;
LB_GETITEMDATA = 0x199;
LB_SETITEMDATA = 0x19a;
LB_SELITEMRANGE = 0x19b;
LB_SETANCHORINDEX = 0x19c;
LB_GETANCHORINDEX = 0x19d;
LB_SETCARETINDEX = 0x19e;
LB_GETCARETINDEX = 0x19f;
LB_SETITEMHEIGHT = 0x1a0;
LB_GETITEMHEIGHT = 0x1a1;
LB_FINDSTRINGEXACT = 0x1a2;
LBCB_CARETON = 0x1a3;
LBCB_CARETOFF = 0x1a4;
LB_SETLOCALE = 0x1a5;
LB_GETLOCALE = 0x1a6;
LB_SETCOUNT = 0x1a7;
LB_INITSTORAGE = 0x1a8;
LB_ITEMFROMPOINT = 0x1a9;
LB_INSERTSTRINGUPPER = 0x1aa;
LB_INSERTSTRINGLOWER = 0x1ab;
LB_ADDSTRINGUPPER = 0x1ac;
LB_ADDSTRINGLOWER = 0x1ad;
LBCB_STARTTRACK = 0x1ae;
LBCB_ENDTRACK = 0x1af;
LB_MSGMAX_OLD = 0x1b0;
LB_MULTIPLEADDSTRING = 0x1b1;
LB_GETLISTBOXINFO = 0x1b2;
LB_MSGMAX = 0x1b3;
undefined_133 = 0x1b4;
undefined_134 = 0x1b5;
undefined_135 = 0x1b6;
undefined_136 = 0x1b7;
undefined_137 = 0x1b8;
undefined_138 = 0x1b9;
undefined_139 = 0x1ba;
undefined_140 = 0x1bb;
undefined_141 = 0x1bc;
undefined_142 = 0x1bd;
undefined_143 = 0x1be;
undefined_144 = 0x1bf;
undefined_145 = 0x1c0;
undefined_146 = 0x1c1;
undefined_147 = 0x1c2;
undefined_148 = 0x1c3;
undefined_149 = 0x1c4;
undefined_150 = 0x1c5;
undefined_151 = 0x1c6;
undefined_152 = 0x1c7;
undefined_153 = 0x1c8;
undefined_154 = 0x1c9;
undefined_155 = 0x1ca;
undefined_156 = 0x1cb;
undefined_157 = 0x1cc;
undefined_158 = 0x1cd;
undefined_159 = 0x1ce;
undefined_160 = 0x1cf;
undefined_161 = 0x1d0;
undefined_162 = 0x1d1;
undefined_163 = 0x1d2;
undefined_164 = 0x1d3;
undefined_165 = 0x1d4;
undefined_166 = 0x1d5;
undefined_167 = 0x1d6;
undefined_168 = 0x1d7;
undefined_169 = 0x1d8;
undefined_170 = 0x1d9;
undefined_171 = 0x1da;
undefined_172 = 0x1db;
undefined_173 = 0x1dc;
undefined_174 = 0x1dd;
undefined_175 = 0x1de;
undefined_176 = 0x1df;
MN_FIRST = 0x1e0;
MN_GETHMENU = 0x1e1;
undefined_177 = 0x1e2;
undefined_178 = 0x1e3;
undefined_179 = 0x1e4;
undefined_180 = 0x1e5;
undefined_181 = 0x1e6;
undefined_182 = 0x1e7;
undefined_183 = 0x1e8;
undefined_184 = 0x1e9;
undefined_185 = 0x1ea;
undefined_186 = 0x1eb;
undefined_187 = 0x1ec;
undefined_188 = 0x1ed;
undefined_189 = 0x1ee;
undefined_190 = 0x1ef;
undefined_191 = 0x1f0;
undefined_192 = 0x1f1;
undefined_193 = 0x1f2;
undefined_194 = 0x1f3;
undefined_195 = 0x1f4;
undefined_196 = 0x1f5;
undefined_197 = 0x1f6;
undefined_198 = 0x1f7;
undefined_199 = 0x1f8;
undefined_200 = 0x1f9;
undefined_201 = 0x1fa;
undefined_202 = 0x1fb;
undefined_203 = 0x1fc;
undefined_204 = 0x1fd;
undefined_205 = 0x1fe;
undefined_206 = 0x1ff;
WM_MOUSEMOVE = 0x200;
WM_LBUTTONDOWN = 0x201;
WM_LBUTTONUP = 0x202;
WM_LBUTTONDBLCLK = 0x203;
WM_RBUTTONDOWN = 0x204;
WM_RBUTTONUP = 0x205;
WM_RBUTTONDBLCLK = 0x206;
WM_MBUTTONDOWN = 0x207;
WM_MBUTTONUP = 0x208;
WM_MBUTTONDBLCLK = 0x209;
WM_MOUSEWHEEL = 0x20a;
WM_XBUTTONDOWN = 0x20b;
WM_XBUTTONUP = 0x20c;
WM_XBUTTONDBLCLK = 0x20d;
WM_MOUSEHWHEEL = 0x20e;
undefined_207 = 0x20f;
WM_PARENTNOTIFY = 0x210;
WM_ENTERMENULOOP = 0x211;
WM_EXITMENULOOP = 0x212;
WM_NEXTMENU = 0x213;
WM_SIZING = 0x214;
WM_CAPTURECHANGED = 0x215;
WM_MOVING = 0x216;
undefined_208 = 0x217;
WM_POWERBROADCAST = 0x218;
WM_DEVICECHANGE = 0x219;
undefined_209 = 0x21a;
undefined_210 = 0x21b;
undefined_211 = 0x21c;
undefined_212 = 0x21d;
undefined_213 = 0x21e;
undefined_214 = 0x21f;
WM_MDICREATE = 0x220;
WM_MDIDESTROY = 0x221;
WM_MDIACTIVATE = 0x222;
WM_MDIRESTORE = 0x223;
WM_MDINEXT = 0x224;
WM_MDIMAXIMIZE = 0x225;
WM_MDITILE = 0x226;
WM_MDICASCADE = 0x227;
WM_MDIICONARRANGE = 0x228;
WM_MDIGETACTIVE = 0x229;
WM_DROPOBJECT = 0x22a;
WM_QUERYDROPOBJECT = 0x22b;
WM_BEGINDRAG = 0x22c;
WM_DRAGLOOP = 0x22d;
WM_DRAGSELECT = 0x22e;
WM_DRAGMOVE = 0x22f;
WM_MDISETMENU = 0x230;
WM_ENTERSIZEMOVE = 0x231;
WM_EXITSIZEMOVE = 0x232;
WM_DROPFILES = 0x233;
WM_MDIREFRESHMENU = 0x234;
undefined_215 = 0x235;
undefined_216 = 0x236;
undefined_217 = 0x237;
WM_POINTERDEVICECHANGE = 0x238;
WM_POINTERDEVICEINRANGE = 0x239;
WM_POINTERDEVICEOUTOFRANGE = 0x23a;
WM_STOPINERTIA = 0x23b;
WM_ENDINERTIA = 0x23c;
WM_EDGYINERTIA = 0x23d;
undefined_218 = 0x23e;
undefined_219 = 0x23f;
WM_TOUCH = 0x240;
WM_NCPOINTERUPDATE = 0x241;
WM_NCPOINTERDOWN = 0x242;
WM_NCPOINTERUP = 0x243;
WM_NCPOINTERLAST = 0x244;
WM_POINTERUPDATE = 0x245;
WM_POINTERDOWN = 0x246;
WM_POINTERUP = 0x247;
WM_POINTER_reserved_248 = 0x248;
WM_POINTERENTER = 0x249;
WM_POINTERLEAVE = 0x24a;
WM_POINTERACTIVATE = 0x24b;
WM_POINTERCAPTURECHANGED = 0x24c;
WM_TOUCHHITTESTING = 0x24d;
WM_POINTERWHEEL = 0x24e;
WM_POINTERHWHEEL = 0x24f;
WM_POINTER_reserved_250 = 0x250;
WM_POINTER_reserved_251 = 0x251;
WM_POINTER_reserved_252 = 0x252;
WM_POINTER_reserved_253 = 0x253;
WM_POINTER_reserved_254 = 0x254;
WM_POINTER_reserved_255 = 0x255;
WM_POINTER_reserved_256 = 0x256;
WM_POINTERLAST = 0x257;
undefined_220 = 0x258;
undefined_221 = 0x259;
undefined_222 = 0x25a;
undefined_223 = 0x25b;
undefined_224 = 0x25c;
undefined_225 = 0x25d;
undefined_226 = 0x25e;
undefined_227 = 0x25f;
undefined_228 = 0x260;
undefined_229 = 0x261;
undefined_230 = 0x262;
undefined_231 = 0x263;
undefined_232 = 0x264;
undefined_233 = 0x265;
undefined_234 = 0x266;
undefined_235 = 0x267;
undefined_236 = 0x268;
undefined_237 = 0x269;
undefined_238 = 0x26a;
undefined_239 = 0x26b;
undefined_240 = 0x26c;
undefined_241 = 0x26d;
undefined_242 = 0x26e;
undefined_243 = 0x26f;
WM_VISIBILITYCHANGED = 0x270;
WM_VIEWSTATECHANGED = 0x271;
WM_UNREGISTER_WINDOW_SERVICES = 0x272;
WM_CONSOLIDATED = 0x273;
undefined_244 = 0x274;
undefined_245 = 0x275;
undefined_246 = 0x276;
undefined_247 = 0x277;
undefined_248 = 0x278;
undefined_249 = 0x279;
undefined_250 = 0x27a;
undefined_251 = 0x27b;
undefined_252 = 0x27c;
undefined_253 = 0x27d;
undefined_254 = 0x27e;
undefined_255 = 0x27f;
WM_IME_REPORT = 0x280;
WM_IME_SETCONTEXT = 0x281;
WM_IME_NOTIFY = 0x282;
WM_IME_CONTROL = 0x283;
WM_IME_COMPOSITIONFULL = 0x284;
WM_IME_SELECT = 0x285;
WM_IME_CHAR = 0x286;
WM_IME_SYSTEM = 0x287;
WM_IME_REQUEST = 0x288;
WM_KANJI_reserved_289 = 0x289;
WM_KANJI_reserved_28a = 0x28a;
WM_KANJI_reserved_28b = 0x28b;
WM_KANJI_reserved_28c = 0x28c;
WM_KANJI_reserved_28d = 0x28d;
WM_KANJI_reserved_28e = 0x28e;
WM_KANJI_reserved_28f = 0x28f;
WM_IME_KEYDOWN = 0x290;
WM_IME_KEYUP = 0x291;
WM_KANJI_reserved_292 = 0x292;
WM_KANJI_reserved_293 = 0x293;
WM_KANJI_reserved_294 = 0x294;
WM_KANJI_reserved_295 = 0x295;
WM_KANJI_reserved_296 = 0x296;
WM_KANJI_reserved_297 = 0x297;
WM_KANJI_reserved_298 = 0x298;
WM_KANJI_reserved_299 = 0x299;
WM_KANJI_reserved_29a = 0x29a;
WM_KANJI_reserved_29b = 0x29b;
WM_KANJI_reserved_29c = 0x29c;
WM_KANJI_reserved_29d = 0x29d;
WM_KANJI_reserved_29e = 0x29e;
WM_KANJILAST = 0x29f;
WM_NCMOUSEHOVER = 0x2a0;
WM_MOUSEHOVER = 0x2a1;
WM_NCMOUSELEAVE = 0x2a2;
WM_MOUSELEAVE = 0x2a3;
WM_TRACKMOUSEEVENT__reserved_2a4 = 0x2a4;
WM_TRACKMOUSEEVENT__reserved_2a5 = 0x2a5;
WM_TRACKMOUSEEVENT__reserved_2a6 = 0x2a6;
WM_TRACKMOUSEEVENT__reserved_2a7 = 0x2a7;
WM_TRACKMOUSEEVENT__reserved_2a8 = 0x2a8;
WM_TRACKMOUSEEVENT__reserved_2a9 = 0x2a9;
WM_TRACKMOUSEEVENT__reserved_2aa = 0x2aa;
WM_TRACKMOUSEEVENT__reserved_2ab = 0x2ab;
WM_TRACKMOUSEEVENT__reserved_2ac = 0x2ac;
WM_TRACKMOUSEEVENT__reserved_2ad = 0x2ad;
WM_TRACKMOUSEEVENT__reserved_2ae = 0x2ae;
WM_TRACKMOUSEEVENT_LAST = 0x2af;
undefined_256 = 0x2b0;
WM_WTSSESSION_CHANGE = 0x2b1;
undefined_257 = 0x2b2;
undefined_258 = 0x2b3;
undefined_259 = 0x2b4;
undefined_260 = 0x2b5;
undefined_261 = 0x2b6;
undefined_262 = 0x2b7;
undefined_263 = 0x2b8;
undefined_264 = 0x2b9;
undefined_265 = 0x2ba;
undefined_266 = 0x2bb;
undefined_267 = 0x2bc;
undefined_268 = 0x2bd;
undefined_269 = 0x2be;
undefined_270 = 0x2bf;
WM_TABLET_FIRST = 0x2c0;
WM_TABLET__reserved_2c1 = 0x2c1;
WM_TABLET__reserved_2c2 = 0x2c2;
WM_TABLET__reserved_2c3 = 0x2c3;
WM_TABLET__reserved_2c4 = 0x2c4;
WM_TABLET__reserved_2c5 = 0x2c5;
WM_TABLET__reserved_2c6 = 0x2c6;
WM_TABLET__reserved_2c7 = 0x2c7;
WM_POINTERDEVICEADDED = 0x2c8;
WM_POINTERDEVICEDELETED = 0x2c9;
WM_TABLET__reserved_2ca = 0x2ca;
WM_FLICK = 0x2cb;
WM_TABLET__reserved_2cc = 0x2cc;
WM_FLICKINTERNAL = 0x2cd;
WM_BRIGHTNESSCHANGED = 0x2ce;
WM_TABLET__reserved_2cf = 0x2cf;
WM_TABLET__reserved_2d0 = 0x2d0;
WM_TABLET__reserved_2d1 = 0x2d1;
WM_TABLET__reserved_2d2 = 0x2d2;
WM_TABLET__reserved_2d3 = 0x2d3;
WM_TABLET__reserved_2d4 = 0x2d4;
WM_TABLET__reserved_2d5 = 0x2d5;
WM_TABLET__reserved_2d6 = 0x2d6;
WM_TABLET__reserved_2d7 = 0x2d7;
WM_TABLET__reserved_2d8 = 0x2d8;
WM_TABLET__reserved_2d9 = 0x2d9;
WM_TABLET__reserved_2da = 0x2da;
WM_TABLET__reserved_2db = 0x2db;
WM_TABLET__reserved_2dc = 0x2dc;
WM_TABLET__reserved_2dd = 0x2dd;
WM_TABLET__reserved_2de = 0x2de;
WM_TABLET_LAST = 0x2df;
WM_DPICHANGED = 0x2e0;
undefined_271 = 0x2e1;
undefined_272 = 0x2e2;
undefined_273 = 0x2e3;
undefined_274 = 0x2e4;
undefined_275 = 0x2e5;
undefined_276 = 0x2e6;
undefined_277 = 0x2e7;
undefined_278 = 0x2e8;
undefined_279 = 0x2e9;
undefined_280 = 0x2ea;
undefined_281 = 0x2eb;
undefined_282 = 0x2ec;
undefined_283 = 0x2ed;
undefined_284 = 0x2ee;
undefined_285 = 0x2ef;
undefined_286 = 0x2f0;
undefined_287 = 0x2f1;
undefined_288 = 0x2f2;
undefined_289 = 0x2f3;
undefined_290 = 0x2f4;
undefined_291 = 0x2f5;
undefined_292 = 0x2f6;
undefined_293 = 0x2f7;
undefined_294 = 0x2f8;
undefined_295 = 0x2f9;
undefined_296 = 0x2fa;
undefined_297 = 0x2fb;
undefined_298 = 0x2fc;
undefined_299 = 0x2fd;
undefined_300 = 0x2fe;
undefined_301 = 0x2ff;
WM_CUT = 0x300;
WM_COPY = 0x301;
WM_PASTE = 0x302;
WM_CLEAR = 0x303;
WM_UNDO = 0x304;
WM_RENDERFORMAT = 0x305;
WM_RENDERALLFORMATS = 0x306;
WM_DESTROYCLIPBOARD = 0x307;
WM_DRAWCLIPBOARD = 0x308;
WM_PAINTCLIPBOARD = 0x309;
WM_VSCROLLCLIPBOARD = 0x30a;
WM_SIZECLIPBOARD = 0x30b;
WM_ASKCBFORMATNAME = 0x30c;
WM_CHANGECBCHAIN = 0x30d;
WM_HSCROLLCLIPBOARD = 0x30e;
WM_QUERYNEWPALETTE = 0x30f;
WM_PALETTEISCHANGING = 0x310;
WM_PALETTECHANGED = 0x311;
WM_HOTKEY = 0x312;
WM_SYSMENU = 0x313;
WM_HOOKMSG = 0x314;
WM_EXITPROCESS = 0x315;
WM_WAKETHREAD = 0x316;
WM_PRINT = 0x317;
WM_PRINTCLIENT = 0x318;
WM_APPCOMMAND = 0x319;
WM_THEMECHANGED = 0x31a;
WM_UAHINIT = 0x31b;
WM_DESKTOPNOTIFY = 0x31c;
WM_CLIPBOARDUPDATE = 0x31d;
WM_DWMCOMPOSITIONCHANGED = 0x31e;
WM_DWMNCRENDERINGCHANGED = 0x31f;
WM_DWMCOLORIZATIONCOLORCHANGED = 0x320;
WM_DWMWINDOWMAXIMIZEDCHANGE = 0x321;
WM_DWMEXILEFRAME = 0x322;
WM_DWMSENDICONICTHUMBNAIL = 0x323;
WM_MAGNIFICATION_STARTED = 0x324;
WM_MAGNIFICATION_ENDED = 0x325;
WM_DWMSENDICONICLIVEPREVIEWBITMAP = 0x326;
WM_DWMTHUMBNAILSIZECHANGED = 0x327;
WM_MAGNIFICATION_OUTPUT = 0x328;
WM_BSDRDATA = 0x329;
WM_DWMTRANSITIONSTATECHANGED = 0x32a;
undefined_302 = 0x32b;
WM_KEYBOARDCORRECTIONCALLOUT = 0x32c;
WM_KEYBOARDCORRECTIONACTION = 0x32d;
WM_UIACTION = 0x32e;
WM_ROUTED_UI_EVENT = 0x32f;
WM_MEASURECONTROL = 0x330;
WM_GETACTIONTEXT = 0x331;
WM_CE_ONLY__reserved_332 = 0x332;
WM_FORWARDKEYDOWN = 0x333;
WM_FORWARDKEYUP = 0x334;
WM_CE_ONLY__reserved_335 = 0x335;
WM_CE_ONLY__reserved_336 = 0x336;
WM_CE_ONLY__reserved_337 = 0x337;
WM_CE_ONLY__reserved_338 = 0x338;
WM_CE_ONLY__reserved_339 = 0x339;
WM_CE_ONLY__reserved_33a = 0x33a;
WM_CE_ONLY__reserved_33b = 0x33b;
WM_CE_ONLY__reserved_33c = 0x33c;
WM_CE_ONLY__reserved_33d = 0x33d;
WM_CE_ONLY_LAST = 0x33e;
WM_GETTITLEBARINFOEX = 0x33f;
WM_NOTIFYWOW = 0x340;
undefined_303 = 0x341;
undefined_304 = 0x342;
undefined_305 = 0x343;
undefined_306 = 0x344;
undefined_307 = 0x345;
undefined_308 = 0x346;
undefined_309 = 0x347;
undefined_310 = 0x348;
undefined_311 = 0x349;
undefined_312 = 0x34a;
undefined_313 = 0x34b;
undefined_314 = 0x34c;
undefined_315 = 0x34d;
undefined_316 = 0x34e;
undefined_317 = 0x34f;
undefined_318 = 0x350;
undefined_319 = 0x351;
undefined_320 = 0x352;
undefined_321 = 0x353;
undefined_322 = 0x354;
undefined_323 = 0x355;
undefined_324 = 0x356;
undefined_325 = 0x357;
WM_HANDHELDFIRST = 0x358;
WM_HANDHELD_reserved_359 = 0x359;
WM_HANDHELD_reserved_35a = 0x35a;
WM_HANDHELD_reserved_35b = 0x35b;
WM_HANDHELD_reserved_35c = 0x35c;
WM_HANDHELD_reserved_35d = 0x35d;
WM_HANDHELD_reserved_35e = 0x35e;
WM_HANDHELDLAST = 0x35f;
WM_AFXFIRST = 0x360;
WM_AFX_reserved_361 = 0x361;
WM_AFX_reserved_362 = 0x362;
WM_AFX_reserved_363 = 0x363;
WM_AFX_reserved_364 = 0x364;
WM_AFX_reserved_365 = 0x365;
WM_AFX_reserved_366 = 0x366;
WM_AFX_reserved_367 = 0x367;
WM_AFX_reserved_368 = 0x368;
WM_AFX_reserved_369 = 0x369;
WM_AFX_reserved_36a = 0x36a;
WM_AFX_reserved_36b = 0x36b;
WM_AFX_reserved_36c = 0x36c;
WM_AFX_reserved_36d = 0x36d;
WM_AFX_reserved_36e = 0x36e;
WM_AFX_reserved_36f = 0x36f;
WM_AFX_reserved_370 = 0x370;
WM_AFX_reserved_371 = 0x371;
WM_AFX_reserved_372 = 0x372;
WM_AFX_reserved_373 = 0x373;
WM_AFX_reserved_374 = 0x374;
WM_AFX_reserved_375 = 0x375;
WM_AFX_reserved_376 = 0x376;
WM_AFX_reserved_377 = 0x377;
WM_AFX_reserved_378 = 0x378;
WM_AFX_reserved_379 = 0x379;
WM_AFX_reserved_37a = 0x37a;
WM_AFX_reserved_37b = 0x37b;
WM_AFX_reserved_37c = 0x37c;
WM_AFX_reserved_37d = 0x37d;
WM_AFX_reserved_37e = 0x37e;
WM_AFXLAST = 0x37f;
WM_PENWINFIRST = 0x380;
WM_PENWIN_reserved_381 = 0x381;
WM_PENWIN_reserved_382 = 0x382;
WM_PENWIN_reserved_383 = 0x383;
WM_PENWIN_reserved_384 = 0x384;
WM_PENWIN_reserved_385 = 0x385;
WM_PENWIN_reserved_386 = 0x386;
WM_PENWIN_reserved_387 = 0x387;
WM_PENWIN_reserved_388 = 0x388;
WM_PENWIN_reserved_389 = 0x389;
WM_PENWIN_reserved_38a = 0x38a;
WM_PENWIN_reserved_38b = 0x38b;
WM_PENWIN_reserved_38c = 0x38c;
WM_PENWIN_reserved_38d = 0x38d;
WM_PENWIN_reserved_38e = 0x38e;
WM_PENWINLAST = 0x38f;
WM_COALESCE_FIRST = 0x390;
WM_COALESCE__reserved_391 = 0x391;
WM_COALESCE__reserved_392 = 0x392;
WM_COALESCE__reserved_393 = 0x393;
WM_COALESCE__reserved_394 = 0x394;
WM_COALESCE__reserved_395 = 0x395;
WM_COALESCE__reserved_396 = 0x396;
WM_COALESCE__reserved_397 = 0x397;
WM_COALESCE__reserved_398 = 0x398;
WM_COALESCE__reserved_399 = 0x399;
WM_COALESCE__reserved_39a = 0x39a;
WM_COALESCE__reserved_39b = 0x39b;
WM_COALESCE__reserved_39c = 0x39c;
WM_COALESCE__reserved_39d = 0x39d;
WM_COALESCE__reserved_39e = 0x39e;
WM_COALESCE_LAST = 0x39f;

--[[
	static const int MM_JOY1MOVE         = 0x3A0;           /* joystick */
static const int MM_JOY2MOVE         = 0x3A1;
static const int MM_JOY1ZMOVE        = 0x3A2;
static const int MM_JOY2ZMOVE        = 0x3A3;
static const int MM_JOY1BUTTONDOWN   = 0x3B5;
static const int MM_JOY2BUTTONDOWN   = 0x3B6;
static const int MM_JOY1BUTTONUP     = 0x3B7;
static const int MM_JOY2BUTTONUP     = 0x3B8;
]]
MM_JOY1MOVE = 0x3a0;
MM_JOY2MOVE = 0x3a1;
MM_JOY1ZMOVE = 0x3a2;
MM_JOY2ZMOVE = 0x3a3;
WM_MM_RESERVED__reserved_3a4 = 0x3a4;
WM_MM_RESERVED__reserved_3a5 = 0x3a5;
WM_MM_RESERVED__reserved_3a6 = 0x3a6;
WM_MM_RESERVED__reserved_3a7 = 0x3a7;
WM_MM_RESERVED__reserved_3a8 = 0x3a8;
WM_MM_RESERVED__reserved_3a9 = 0x3a9;
WM_MM_RESERVED__reserved_3aa = 0x3aa;
WM_MM_RESERVED__reserved_3ab = 0x3ab;
WM_MM_RESERVED__reserved_3ac = 0x3ac;
WM_MM_RESERVED__reserved_3ad = 0x3ad;
WM_MM_RESERVED__reserved_3ae = 0x3ae;
WM_MM_RESERVED__reserved_3af = 0x3af;
WM_MM_RESERVED__reserved_3b0 = 0x3b0;
WM_MM_RESERVED__reserved_3b1 = 0x3b1;
WM_MM_RESERVED__reserved_3b2 = 0x3b2;
WM_MM_RESERVED__reserved_3b3 = 0x3b3;
WM_MM_RESERVED__reserved_3b4 = 0x3b4;
MM_JOY1BUTTONDOWN = 0x3b5;
MM_JOY2BUTTONDOWN = 0x3b6;
MM_JOY1BUTTONUP = 0x3b7;
MM_JOY2BUTTONUP = 0x3b8;
WM_MM_RESERVED__reserved_3b9 = 0x3b9;
WM_MM_RESERVED__reserved_3ba = 0x3ba;
WM_MM_RESERVED__reserved_3bb = 0x3bb;
WM_MM_RESERVED__reserved_3bc = 0x3bc;
WM_MM_RESERVED__reserved_3bd = 0x3bd;
WM_MM_RESERVED__reserved_3be = 0x3be;
WM_MM_RESERVED__reserved_3bf = 0x3bf;
WM_MM_RESERVED__reserved_3c0 = 0x3c0;
WM_MM_RESERVED__reserved_3c1 = 0x3c1;
WM_MM_RESERVED__reserved_3c2 = 0x3c2;
WM_MM_RESERVED__reserved_3c3 = 0x3c3;
WM_MM_RESERVED__reserved_3c4 = 0x3c4;
WM_MM_RESERVED__reserved_3c5 = 0x3c5;
WM_MM_RESERVED__reserved_3c6 = 0x3c6;
WM_MM_RESERVED__reserved_3c7 = 0x3c7;
WM_MM_RESERVED__reserved_3c8 = 0x3c8;
WM_MM_RESERVED__reserved_3c9 = 0x3c9;
WM_MM_RESERVED__reserved_3ca = 0x3ca;
WM_MM_RESERVED__reserved_3cb = 0x3cb;
WM_MM_RESERVED__reserved_3cc = 0x3cc;
WM_MM_RESERVED__reserved_3cd = 0x3cd;
WM_MM_RESERVED__reserved_3ce = 0x3ce;
WM_MM_RESERVED__reserved_3cf = 0x3cf;
WM_MM_RESERVED__reserved_3d0 = 0x3d0;
WM_MM_RESERVED__reserved_3d1 = 0x3d1;
WM_MM_RESERVED__reserved_3d2 = 0x3d2;
WM_MM_RESERVED__reserved_3d3 = 0x3d3;
WM_MM_RESERVED__reserved_3d4 = 0x3d4;
WM_MM_RESERVED__reserved_3d5 = 0x3d5;
WM_MM_RESERVED__reserved_3d6 = 0x3d6;
WM_MM_RESERVED__reserved_3d7 = 0x3d7;
WM_MM_RESERVED__reserved_3d8 = 0x3d8;
WM_MM_RESERVED__reserved_3d9 = 0x3d9;
WM_MM_RESERVED__reserved_3da = 0x3da;
WM_MM_RESERVED__reserved_3db = 0x3db;
WM_MM_RESERVED__reserved_3dc = 0x3dc;
WM_MM_RESERVED__reserved_3dd = 0x3dd;
WM_MM_RESERVED__reserved_3de = 0x3de;
WM_MM_RESERVED_LAST = 0x3df;
WM_INTERNAL_DDE_FIRST = 0x3e0;
WM_INTERNAL_DDE__reserved_3e1 = 0x3e1;
WM_INTERNAL_DDE__reserved_3e2 = 0x3e2;
WM_INTERNAL_DDE__reserved_3e3 = 0x3e3;
WM_INTERNAL_DDE__reserved_3e4 = 0x3e4;
WM_INTERNAL_DDE__reserved_3e5 = 0x3e5;
WM_INTERNAL_DDE__reserved_3e6 = 0x3e6;
WM_INTERNAL_DDE__reserved_3e7 = 0x3e7;
WM_INTERNAL_DDE__reserved_3e8 = 0x3e8;
WM_INTERNAL_DDE__reserved_3e9 = 0x3e9;
WM_INTERNAL_DDE__reserved_3ea = 0x3ea;
WM_INTERNAL_DDE__reserved_3eb = 0x3eb;
WM_INTERNAL_DDE__reserved_3ec = 0x3ec;
WM_INTERNAL_DDE__reserved_3ed = 0x3ed;
WM_INTERNAL_DDE__reserved_3ee = 0x3ee;
WM_INTERNAL_DDE_LAST = 0x3ef;
WM_CBT_RESERVED_FIRST = 0x3f0;
WM_CBT_RESERVED__reserved_3f1 = 0x3f1;
WM_CBT_RESERVED__reserved_3f2 = 0x3f2;
WM_CBT_RESERVED__reserved_3f3 = 0x3f3;
WM_CBT_RESERVED__reserved_3f4 = 0x3f4;
WM_CBT_RESERVED__reserved_3f5 = 0x3f5;
WM_CBT_RESERVED__reserved_3f6 = 0x3f6;
WM_CBT_RESERVED__reserved_3f7 = 0x3f7;
WM_CBT_RESERVED__reserved_3f8 = 0x3f8;
WM_CBT_RESERVED__reserved_3f9 = 0x3f9;
WM_CBT_RESERVED__reserved_3fa = 0x3fa;
WM_CBT_RESERVED__reserved_3fb = 0x3fb;
WM_CBT_RESERVED__reserved_3fc = 0x3fc;
WM_CBT_RESERVED__reserved_3fd = 0x3fd;
WM_CBT_RESERVED__reserved_3fe = 0x3fe;
WM_CBT_RESERVED_LAST = 0x3ff
}


return export