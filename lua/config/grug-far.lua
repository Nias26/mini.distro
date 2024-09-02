local ok, grug_far = pcall(require, "grug-far")
if not ok then
  return print("Grug-far failed to load!")
end

grug_far.setup()
