local name = "weather:hail"

local conditions = {
	min_height			= weather.settings.min_height,
	max_height			= weather.settings.max_height,
	indoors				= false,
}

local effects = {}

effects["climate_api:sound"] = {
	name = "weather_hail",
	gain = 1
}

effects["weather:lightning"] = 1 / 30

local textures = {}
for i = 1,5 do
	textures[i] = "weather_hail" .. i .. ".png"
end

effects["climate_api:particles"] = {
	boxsize = { x = 18, y = 0, z = 18 },
	v_offset = 7,
	velocity = 20,
	amount = 6,
	expirationtime = 0.7,
	texture = textures,
	glow = 5
}

climate_api.register_weather(name, conditions, effects)
