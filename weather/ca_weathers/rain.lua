local name = "weather:rain"

local conditions = {
	min_height		= weather.settings.min_height,
	max_height		= weather.settings.max_height,
	indoors			= false
}

local effects = {}

effects["climate_api:sound"] = {
	name = "weather_rain",
	gain = 1.5
}

effects["climate_api:particles"] = {
	boxsize = { x = 18, y = 2, z = 18 },
	v_offset = 6,
	expirationtime = 1.6,
	size = 2,
	amount = 15,
	velocity = 6,
	acceleration = 0.05,
	texture = "weather_raindrop.png",
	glow = 5
}

climate_api.register_weather(name, conditions, effects)