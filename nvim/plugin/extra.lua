
-- Toggle light/dark function
function colorToggle()
  if (vim.o.bg == "dark") then
    vim.o.bg = "light"
  else
    vim.o.bg = "dark"
  end
end
