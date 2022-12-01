local status, _ = pcall("require", "impatient")
if not status then 
	vim.notify("Error impatient not found", "error")
end

require 'loader'
