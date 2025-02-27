local S = archtec.S
local cache = {}

local function get_list(name)
    if not name or name == "" then return {} end
    if cache[name] then -- load from direct cache
        return cache[name]
    end
    local ignores = minetest.deserialize(archtec_playerdata.get(name, "ignores"))
    if ignores == nil then -- no data available, do nothing
        ignores = {}
    end
    cache[name] = ignores
    return ignores
end

local function purge_cache()
    local l = 0 + archtec.count_keys(cache)
    -- purge
    cache = {}
    if l > 0 then
        minetest.log("action", "[archtec] Ignore cache cleaner removed " .. l .. " entries")
    end
end

-- mintest.after() does not work :\
local time = 0
minetest.register_globalstep(function(dtime)
    time = time + dtime
    if time > 25200 then -- 7h
        purge_cache()
        time = 0
    end
end)

local function is_ignored(name, target)
    if type(name) ~= "string" then return false end
    local ignores = get_list(name)
    return ignores[target] ~= nil
end

archtec.is_ignored = is_ignored

function archtec.ignore_check(name, target)
    if not target or target == "" then return false end
    if not name or name == "" then return false end
    return is_ignored(name, target) or is_ignored(target, name)
end

local function ignore_player(name, target)
    local ignores = get_list(name)
    ignores[target] = true
    archtec_playerdata.set(name, "ignores", minetest.serialize(ignores))
    -- update cache
    if not cache[name] then
        cache[name] = {}
    end
    cache[name][target] = true
    minetest.log("action", "[archtec_ignore] '" .. name .. "' now ignores '" .. target .. "'")
end

local function unignore_player(name, target)
    local ignores = get_list(name)
    ignores[target] = nil
    if next(ignores) ~= nil then -- do not save table if nobody is ignored
        archtec_playerdata.set(name, "ignores", minetest.serialize(ignores))
    else
        archtec_playerdata.set(name, "ignores", "") -- run's playerdata's garbage collector
    end
    -- update cache
    if not cache[name] then
        cache[name] = {}
    else
        cache[name][target] = nil
    end
    minetest.log("action", "[archtec_ignore] '" .. name .. "' no longer ignores '" .. target .. "'")
end

local function list_ignored_players(name)
    local ignores = get_list(name)
    if next(ignores) == nil then
        return ""
    end
    local string = ""
    for key, _ in pairs(ignores) do
        string = string .. key .. ", "
    end
    string = string:sub(1, #string - 2)
    return string
end

local function count_ignored_players(name)
    local ignores = get_list(name)
    return archtec.count_keys(ignores)
end

local C = minetest.colorize

minetest.register_chatcommand("ignore", {
	description = "Ignores someone",
	privs = {interact = true},
	func = function(name, param)
		minetest.log("action", "[/ignore] executed by '" .. name .. "' with param '" .. (param or "") .. "'")
        local params = {}
        for p in string.gmatch(param, "[^%s]+") do
            table.insert(params, p)
        end
        local action = params[1]
        if action == "ignore" or action == "add" then
            local target = archtec.get_and_trim(params[2])
            if minetest.player_exists(target) then
                if is_ignored(name, target) then
                    minetest.chat_send_player(name, C("#FF0000", S("[ignore] You ignore @1 already!", target)))
                    return
                end
                if minetest.get_player_privs(target).staff then
                    minetest.chat_send_player(name, C("#FF0000", S("[ignore] You can't ignore staff members!")))
                    return
                end
                if minetest.get_player_privs(name).staff then
                    minetest.chat_send_player(name, C("#FF0000", S("[ignore] Staff members can't ignore other players!")))
                    return
                end
                if name == target then
                    minetest.chat_send_player(name, C("#FF0000", S("[ignore] You can't ignore yourself!")))
                    return
                end
                if count_ignored_players(name) >= 10 then
                    minetest.chat_send_player(name, C("#FF0000", S("[ignore] You can't ignore more than 10 players!")))
                    return
                end
                ignore_player(name, target)
                minetest.chat_send_player(name, C("#00BD00", S("[ignore] You are ignoring @1 now", target)))
                return
            elseif target == "" then
                minetest.chat_send_player(name, C("#FF0000", S("[ignore] You must specify a player name!")))
                return
            else
                minetest.chat_send_player(name, C("#FF0000", S("[ignore] Player @1 is not a registered player!", target)))
                return
            end
        elseif action == "unignore" or action == "remove" then
            local target = archtec.get_and_trim(params[2])
            if minetest.player_exists(target) then
                if not is_ignored(name, target) then
                    minetest.chat_send_player(name, C("#FF0000", S("[ignore] You aren't ignoring @1!", target)))
                    return
                end
                unignore_player(name, target)
                minetest.chat_send_player(name, C("#00BD00", S("[ignore] You are no longer ignoring @1", target)))
                return
            elseif target == "" then
                minetest.chat_send_player(name, C("#FF0000", S("[ignore] You must specify a player name!")))
                return
            else
                minetest.chat_send_player(name, C("#FF0000", S("[ignore] Player @1 is not a registered player!", target)))
                return
            end
        elseif action == "" or action == nil or action == "list" then
            local target = archtec.get_and_trim(params[2])
            if target ~= "" and target ~= name then
                if not minetest.get_player_privs(name).staff then
                    minetest.chat_send_player(name, C("#FF0000", S("[ignore] You aren't authorized to query this data!")))
                    return
                end
                local list = list_ignored_players(target)
                if list == "" then
                    minetest.chat_send_player(name, C("#00BD00", S("[ignore] @1 isn't ignoring anyone", target)))
                    return
                end
                minetest.chat_send_player(name, C("#00BD00", S("[ignore] List of players @1 ignores: @2", target, list)))
                return
            else
                local list = list_ignored_players(name)
                if list == "" then
                    minetest.chat_send_player(name, C("#00BD00", S("[ignore] You aren't ignoring anyone")))
                    return
                end
                minetest.chat_send_player(name, C("#00BD00", S("[ignore] List of players you ignore: @1", list)))
                return
            end
        end
        minetest.chat_send_player(name, C("#FF0000", S("[ignore] Unknown subcommand!")))
	end
})

function archtec.ignore_msg(cmdname, name, target)
    if cmdname then
        cmdname = "[" .. cmdname .. "]"
    else
        cmdname = ""
    end
    if is_ignored(name, target) then
        minetest.chat_send_player(name, C("#FF0000", S("@1 You are ignoring @2. You can't interact with them!", cmdname, target)))
    else
        minetest.chat_send_player(name, C("#FF0000", S("@1 @2 ignores you. You can't interact with them!", cmdname, target)))
    end
end
