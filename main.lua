require "AddAppDirectory"
AddAppDirectory()

runfile[[simpleLights.lua]]
runfile[[SimSparta/SimSparta.lua]]

local function CenterTransformAtPosition(xform, pos)
	local bound = xform:getBound()
	return Transform{
		position = -bound:center() + Vec(unpack(pos)),
		xform,
	}
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

blade = Transform{
	Model[[models/Blade.ive]]
}

blendingstand = Transform{
	Model[[models/BlendingStand.ive]]
}

glass = Transform{
	Model[[models/glass.ive]]
}

cap = Transform{
	Model[[models/cap.ive]]
}

feet = Transform{
	Model[[models/Feet.ive]]
}

holder = Transform{
	Model[[models/Holder.ive]]
}

lid = Transform{
	Model[[models/lid.ive]]
}

measurements = Transform{
	Model[[models/Measurements.ive]]
}

top = Transform{
	Model[[models/Top.jt.ive]]
}


all_models = Transform{
	position = {4.72,.85,-3},
	Transform{
		scale = .001,
		blade, blendingstand,cap,feet,holder,lid,measurements,top,
	}
}

all_models_centered = CenterTransformAtPosition(all_models,{1,1,0})

RelativeTo.World:addChild(all_models_centered)

-- SimSparta{
	-- blade, blendingstand,cap,feet,holder,lid,measurements,top,
	-- cycleThroughParts = true,
	-- dragBtn = gadget.DigitalInterface("WMButtonB"),
	-- nextBtn = gadget.DigitalInterface("WMButtonRight"),
	-- prevBtn = gadget.DigitalInterface("WMButtonLeft"),
	-- resetBtn = gadget.DigitalInterface("WMButton1"),
-- } 