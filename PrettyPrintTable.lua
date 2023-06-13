local M = {}
local M_mt = { __index = M }


------------------------------------
-- Local functions
------------------------------------

--------------------------------------------------------------------------------
--   remove entry from table  by key instead of postition 
-- 
-- Usage example:
--      local map = { foo = 1, bar = 2 }
--      table.removekey(map,'bar')

function table.removekey (
    t,   -- lua table 
    key) -- element to remove 
-- returns removed element
    local element = t[key]
    t[key] = nil
    return element
end

------------------------------------
---  Class functions 
------------------------------------

-- return new object
function M:init( options )
    local self = {}
    setmetatable( self, M_mt ) 
    self.myclass = "Pretty Print "
       
    print ("************************* "..self.myclass.."  initialized**********************************")
    return self
end
 -- non recursive attempt that doesn't format the output correctly. 
function M:PrettyPrintTable(
       t        -- lua table address
       )
       --return:  Output to log
       print ("************************* PP initialized**********************************")
    local indent =  " "
    local depth = 0
    local stack = {t}
    while #stack > 0  do  -- loop through all tables no matter the depth. 
        local currentTable = table.remove(stack)
        depth = depth + 1 
        for k, v in pairs(currentTable) do
            if type(v) == "table" then
                table.insert(stack,1,v)
                
            end    
            print (string.rep(" ", depth * 4) .. tostring(k) .. " :  " .. tostring(v) )
        end
    end
    return 
end    

-- recursive version which does work. 
function M:PrettyPrintTable2(
       t        -- lua table address
       )
       --return:  Output to log
       print ("************************* PP initialized**********************************")
    local indent =  " "
    local depth = 0
    
    local function PP(element, depth )
        for k, v in pairs(element) do
           print (string.rep(indent, depth * 2) .. tostring(k) .. " :  " .. tostring(v) )
           if type(v) == "table" then
              PP(v,depth + 1 )    -- recursive call 
           end    
        end
        return 
     end
     PP(t,depth)
    return 
end    

return M
