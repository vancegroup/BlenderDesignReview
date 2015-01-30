require "AddAppDirectory"
require "TransparentGroup"
AddAppDirectory()

runfile[[simpleLights.lua]]
runfile[[SimSparta/SimSparta.lua]]

local function assignButtons(a)
	if a.metal then
		print("Loading METaL Buttons")
		a.dragBtn = gadget.DigitalInterface("WMButtonB")
		a.nextBtn = gadget.DigitalInterface("WMButtonRight")
		a.prevBtn = gadget.DigitalInterface("WMButtonLeft")
		a.resetBtn = gadget.DigitalInterface("WMButton1")
	else
		print("Loading Workstation Buttons")
		a.nextBtn = gadget.DigitalInterface("VJButton0")
		a.dragBtn = gadget.DigitalInterface("VJButton2")
		a.prevBtn = gadget.DigitalInterface("VJButton1")
	end
end

kitchen = Transform{
	Transform{
		scale = .02,
		Model[[models/kitchen.ive]],
		orientation = AngleAxis(Degrees(180),Axis{0,0,1})
	},
	orientation = AngleAxis(Degrees(-90),Axis{0,1,0})
}
RelativeTo.World:addChild(kitchen)

global_pos = {2.1,.733,-2.55}
global_scale = .001

blade = Transform{
	position = global_pos,
	Transform{
		scale = global_scale,
		Model[[models/blade.ive]]
	}
}

blendingstand = Transform{
	position = global_pos,
	Transform{
		scale = global_scale,
		Model[[models/BlendingStand.ive]],
		Model[[models/Feet.ive]]
	}
}

holder = Transform{
	position = global_pos,
	Transform{
		scale = global_scale,
		Model[[models/Measurements.ive]],
		TransparentGroup{
			Model[[models/Holder2.ive]],
			alpha = .2
		}
	}
}

top = Transform{
	position = global_pos,
	Transform{
		scale = global_scale,
		Model[[models/Top.jt.ive]]
	}
}

location = {metal=false}
assignButtons(location)

SimSparta{
	top, blade, blendingstand,holder,
	cycleThroughParts = true,
	dragBtn = location.dragBtn,
	nextBtn = location.nextBtn,
	prevBtn = location.prevBtn,
	resetBtn = location.resetBtn,
} 
