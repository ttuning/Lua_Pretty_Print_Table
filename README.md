# Lua_Pretty_Print_Table
Print a Lua table so that you can see what it in it.  

I am including a module which has 2 pretty print functions in it.  The first is non recursive while the second is recursive.  I couldn't figure out how to format the output correctly non recursively.  However, it does dive down all the tables and print them out.  The children aren't under the tables tho and that is a fail.  If anyone, knows how to fix that let me know.  The recursive one works though.  

Example Usage: 

local pp = require("PrettyPrintTable")

local PP = pp:init()  -- init  module

table = {
    {1, 2, 3},
    {4, 5, 6},
    {7, 8, 9}
}

PP:PrettyPrintTable(table); 

PP:PrettyPrintTable2(table); 

