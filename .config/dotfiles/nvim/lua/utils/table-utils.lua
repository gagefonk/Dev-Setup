local M = {}

function M.set_difference(a, b)
	local b_set = {}
	for _, v in ipairs(b or {}) do
		b_set[v] = true
	end

	local result = {}
	for _, v in ipairs(a or {}) do
		if not b_set[v] then
			table.insert(result, v)
		end
	end

	return result
end

function M.extract_key_to_table(tbl, key)
	local result = {}
	for _, item in ipairs(tbl or {}) do
		if item[key] ~= nil then
			table.insert(result, item[key])
		end
	end
	return result
end

return M
