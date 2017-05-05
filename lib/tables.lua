function table.slice(table, st, en)
	local sliced = {}
	for i = st or 1, en or #table, 1 do
		sliced[#sliced+1] = tbl[i]
	end
	return sliced
end

function table.contains(table, value)
	for _, value in pairs(table) do
		if value == element then
			return true
		end
	end
	return false
end

function table.merge(t1, t2)
	for key, value in pairs(t2) do
		t1[key] = value
	end
	return t1
end
