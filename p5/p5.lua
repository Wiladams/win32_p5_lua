--[[
    This single file represents the guts of a processing/p5 skin
    The code will be very familiar to anyone who's used to doing processing,
    but done with a Lua flavor.
    

    Typical usage:

    -- This first line MUST come before any user code
    local graphicApp = require("graphicapp")

    function onMouseMove(event)
        print("MOVE: ", event.x, event.y)
    end

    -- This MUST be the last line of the user code
    graphicApp.run();
]]
local ffi = require("ffi")
local C = ffi.C 

local bit = require("bit")
local band, bor = bit.band, bit.bor
local rshift, lshift = bit.rshift, bit.lshift;

require("win32.sdkddkver")

local wingdi = require("win32.wingdi")
local winuser = require("win32.winuser")

local maths = require("p5.maths")
local sched = require("p5.scheduler")
local coloring = require("p5.coloring")


local WindowKind = require("WindowKind")
local NativeWindow = require("nativewindow")
local wmmsgs = require("wm_reserved")
local DeviceContext = require("DeviceContext")
local GDISurface = require("GDISurface")
local PixelBuffer = require("PixelBuffer")
local targa = require("targa")
local Joystick = require("Joystick")

local exports = {}
local lonMessage = false;
local SWatch = StopWatch();

--[[
-- Global things
-- Constants
HALF_PI = math.pi / 2
PI = math.pi
QUARTER_PI = math.pi/4
TWO_PI = math.pi * 2
TAU = TWO_PI


-- angleMode
DEGREES = 1;
RADIANS = 2;
--]]

-- Constants related to colors
-- colorMode
RGB = 1;
HSB = 2;

-- rectMode, ellipseMode
CORNER = 1;
CORNERS = 2;
RADIUS = 3;
CENTER = 4;

-- kind of close (for polygon)
STROKE = 0;
CLOSE = 1;

-- alignment
CENTER      = 0x00;
LEFT        = 0x01;
RIGHT       = 0x04;
TOP         = 0x10;
BOTTOM      = 0x40;
BASELINE    = 0x80;

MODEL = 1;
SCREEN = 2;
SHAPE = 3;

-- GEOMETRY
POINTS          = 0;
LINES           = 1;
LINE_STRIP      = 2;
LINE_LOOP       = 3;
POLYGON         = 4;
QUADS           = 5;
QUAD_STRIP      = 6;
TRIANGLES       = 7;
TRIANGLE_STRIP  = 8;
TRIANGLE_FAN    = 9;




-- environment
frameCount = 0;
focused = false;
displayWidth = false;
displayHeight = false;
windowWidth = false;
windowHeight = false;
width = false;
height = false;

-- Mouse state changing live
mouseX = false;
mouseY = false;
pMouseX = false;
pMouseY = false;
winMouseX = false;
winMouseY = false;
pwinMouseX = false;
pwinMouseY = false;
mouseButton = false;
mouseIsPressed = false;
-- to be implemented by user code
-- mouseMoved()
-- mouseDragged()
-- mousePressed()
-- mouseReleased()
-- mouseClicked()
-- doubleClicked()
-- mouseWheel()

-- Keyboard state changing live
keyIsPressed = false;
key = false;
keyCode = false;
-- to be implemented by client code
-- keyPressed()
-- keyReleased()
-- keyTyped()


-- Touch events
touches = false;
-- touchStarted()
-- touchMoved()
-- touchEnded()

-- Initial State for modes
AngleMode = RADIANS;
ColorMode = RGB;
RectMode = CORNER;
EllipseMode = CENTER;
ShapeMode = POLYGON;

FrameRate = 20;
LoopActive = true;
EnvironmentReady = false;

-- Typography
TextSize = 12;
TextHAlignment = LEFT;
TextVAlignment = BASELINE;
TextLeading = 0;
TextMode = SCREEN;
TextSize = 12;


StrokeWidth = 0;
StrokeWeight = 1;

--[[
    These are functions that are globally available, so user code
    can use them.  These functions don't rely specifically on the 
    drawing interface, so that can remain here in case the drawing
    driver changes.
]]

function noise(x,y,z)
    return 0
end


--[[
    COLOR
]]
function color(...)
	local nargs = select('#', ...)
    local pix = ffi.new("struct Pixel32")

	-- There can be 1, 2, 3, or 4, arguments
	--	print("Color.new - ", nargs)
	
	local r = 0
	local g = 0
	local b = 0
	local a = 0
	
	if (nargs == 1) then
			r = select(1,...)
			g = r
			b = r
			a = 255;
	elseif nargs == 2 then
			r = select(1,...)
			g = r
			b = r
			a = select(2,...)
	elseif nargs == 3 then
			r = select(1,...)
			g = select(2,...)
			b = select(3,...)
			a = 255
	elseif nargs == 4 then
		r = select(1,...)
		g = select(2,...)
		b = select(3,...)
		a = select(4,...)
	end
--print("r,g,b: ", r,g,b)
    pix.Red = r
    pix.Green = g
    pix.Blue = b 
    --pix.Alpha = a  

	--self.cref = wingdi.RGB(r,g,b)
	
	--self.R = r
	--self.G = g
	--self.B = b
	--self.A = a

	return pix;
end


function blue(c)
	return c.B
end

function green(c)
	return c.G
end

function red(c)
	return c.R
end

function alpha(c)
	return c.A
end

-- Modes to be honored by various drawing APIs
function angleMode(newMode)
    if newMode ~= DEGREES and newMode ~= RADIANS then 
        return false 
    end

    AngleMode = newMode;

    return true;
end

function ellipseMode(newMode)
    EllipseMode = newMode;
end

function rectMode(newMode)
    RectMode = newMode;
end

-- Image handling
function loadImage(filename)
--[[
    local img, err = targa.readFromFile(filename)
    if not img then 
        return false, err
    end
--]]
    return img
end

-- timing
function seconds()
    return SWatch:seconds();
end

function millis()
    -- get millis from p5 stopwatch
    return SWatch:millis();
end

function frameRate(...)
    if select('#', ...) == 0 then
        return FrameRate;
    end

    if type(select(1,...)) ~= "number" then
        return false, 'must specify a numeric frame rate'
    end

    FrameRate = select(1,...);

    -- reset frame timer
end

function loop()
    LoopActive = true;
end

function noLoop()
    LoopActive = false;
end

-- Drawing and canvas management
function refreshWindow()
    --appWindow:redraw(bor(ffi.C.RDW_UPDATENOW, ffi.C.RDW_INTERNALPAINT))
    --appWindow:redraw(bor(ffi.C.RDW_INTERNALPAINT))
    appWindow:invalidate();

    return true;
end

function redraw()
    if draw then
        draw();
        surface.DC:flush();
    end

    refreshWindow();

    return true;
end

require("p5.p5_user32")


-- Register UI event handler global functions
-- These are the functions that the user should implement
-- in their code
-- the user implements a global function with the name
-- listed on the 'response' side.
local function setupUIHandlers()
    local handlers = {
        {activity = 'gap_mousemove', response = "mouseMoved"};
        {activity = 'gap_mouseup', response = "mouseReleased"};
        {activity = 'gap_mousedown', response = "mousePressed"};
        {activity = 'gap_mousedrag', response = 'mouseDragged'};
        {activity = 'gap_mousewheel', response = "mouseWheel"};
        {activity = 'gap_mouseclick', response = "mouseClicked"};

        {activity = 'gap_keydown', response = "keyPressed"};
        {activity = 'gap_keyup', response = "keyReleased"};
        {activity = 'gap_keytyped', response = "keyTyped"};

        {activity = 'gap_syskeydown', response = "sysKeyPressed"};
        {activity = 'gap_syskeyup', response = "sysKeyReleased"};
        {activity = 'gap_syskeytyped', response = "sysKeyTyped"};

        {activity = 'gap_joymove', response = "joyMoved"};
        {activity = 'gap_joyzmove', response = "joyZMoved"};
        {activity = 'gap_joyup', response = "joyReleased"};
        {activity = 'gap_joydown', response = "joyPressed"};


        {activity = 'gap_idle', response = "onIdle"};
        --{activity = 'gap_frame', response = "draw"};
    }

    for i, handler in ipairs(handlers) do
        --print("response: ", handler.response, _G[handler.response])
        if _G[handler.response] ~= nil then
            on(handler.activity, _G[handler.response])
        end
    end

end

local function handleFrame()
    if LoopActive and EnvironmentReady then
        if draw then
            redraw();
        end
        frameCount = frameCount + 1;
    end
end


local function main(params)

    FrameRate = params.frameRate or 15;

    -- make a local for 'onMessage' global function    
    if onMessage then
        lonMessage = onMessage;
    end

	surface = GDISurface(params)

    spawn(msgLoop);
    yield();

	createWindow(params);
    setupUIHandlers();
    yield();


    background(0xCC)        -- light gray
    fill(0,0,0)             -- black
    stroke(0,0,0)

    EnvironmentReady = true;

    if setup then
        setup();
    end
    redraw();
    yield();

    -- setup the periodic frame calling
    local framePeriod = math.floor((1/FrameRate)*1000)
    --print("Frame Period: ", framePeriod)
    periodic(framePeriod, handleFrame)

    signalAll("gap_ready");
end


function go(params)
    params = params or {
        width = 640;
        height = 480;
        title = "p5"
    }
    params.width = params.width or 640;
    params.height = params.height or 480;
    params.title = params.title or "p5";
    params.frameRate = params.frameRate or 15;

    run(main, params)
end

require("p5_gdi")