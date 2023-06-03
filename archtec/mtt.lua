-- common functions
mtt.register("archtec.get_target", function(callback)
    assert(archtec.get_target("P1", "") == "P1")
    assert(archtec.get_target("P1", "P2") == "P2")
    callback()
end)