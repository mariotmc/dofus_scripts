MIN_MONSTERS = 1
MAX_MONSTERS = 8
MIN_MONSTERS_LEVEL = 1
MAX_MONSTERS_LEVEL = 1000

-- FORBIDDEN_MONSTERS = {}

-- MANDATORY_MONSTERS = {}

MAX_PODS = 90

ELEMENTS_TO_GATHER = {1}

-- AUTO_DELETE = {}

function move()
    return {
		-- { map = "192415750", changeMap = "424" },
    -- {map = "4,-18", changeMap = "top"},
		-- { map = "4,-19", changeMap = "top" },
		-- { map = "4,-20", fight = true, changeMap = "bottom" },
    { map = "-1,-18", gather = true, changeMap = "left" },
    { map = "-2,-18", gather = true, changeMap = "right" }
    }
end

function bank()
    return {
    }
end

function phenix()
    return {
    }
end

function lost()
    return {
    }
end