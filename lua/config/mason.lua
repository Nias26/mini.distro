local ok, mason = pcall(require, "mason")
if not ok then
	return print("Mason failed to load!")
end

mason.setup()
