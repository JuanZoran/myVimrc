local use = require("packer").use
-- NOTE: load the packer compiled file
require("plugins.base.compiled")


use("wbthomason/packer.nvim")

use({
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
})
-- fast speed
use("lewis6991/impatient.nvim")
use {
    "nathom/filetype.nvim",
    config = [[ require 'plugins.base.filetype' ]]
}
