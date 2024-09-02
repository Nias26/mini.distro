local ok, neodev = pcall(require, "neodev")
if not ok then
  return print("Neodev failed to load!")
end

neodev.setup()
