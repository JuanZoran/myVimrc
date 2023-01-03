local use = require("packer").use
-- NOTE : load the packer compiled file
require("plugins.base.compiled")

use("wbthomason/packer.nvim")

use {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
}

-- NOTE :better performance
use("lewis6991/impatient.nvim")
use {
    "nathom/filetype.nvim",
    config = [[ require 'plugins.base.filetype' ]]
}
