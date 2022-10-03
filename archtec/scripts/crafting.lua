if minetest.get_modpath("pride_flags") then
    minetest.clear_craft({
        output = "pride_flags:lower_mast"
    })
    minetest.register_craft({
        output = "pride_flags:lower_mast",
        recipe = {
            {"default:steel_ingot", "farming:string"},
            {"default:steel_ingot", "farming:string"},
            {"default:steel_ingot", "farming:string"},
        }
    })
end

--homedecor:table_legs_wood/ropes:ladder_wood
if minetest.get_modpath("ropes") then
    minetest.clear_craft({
        output = "ropes:ladder_wood"
    })
    minetest.register_craft({
        output = "ropes:ladder_wood",
        recipe = {
            {"group:stick", "", "group:stick"},
            {"group:stick", "", "group:stick"},
            {"group:stick", "group:stick", "group:stick"},
        }
    })
end

--homedecor:table/ts_furniture:default_WOODTYPE_small_table
if minetest.get_modpath("homedecor_tables") then
    minetest.clear_craft({
        output = "homedecor:table"
    })
    minetest.register_craft({
        output = "homedecor:table",
        recipe = {
            { "group:wood","group:wood", "group:wood" },
            { "group:stick", "", "group:stick" },
            { "", "group:stick", "" },
        },
    })
end

--doors:prison_door (xdecor)/xpanes:door_steel_bar (xpanes)
if minetest.get_modpath("xpanes") then
    minetest.clear_craft({
        output = "xpanes:door_steel_bar"
    })
    minetest.register_craft({
        output = "xpanes:door_steel_bar",
		recipe = {
			{"xpanes:bar_flat", "default:steel_ingot"},
			{"default:steel_ingot", "xpanes:bar_flat"},
			{"xpanes:bar_flat", "default:steel_ingot"},
		},
    })
end