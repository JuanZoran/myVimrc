local use = require("packer").use
-- NOTE : load the packer compiled file

use("wbthomason/packer.nvim")

use {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
}

-- NOTE :better performance
use("lewis6991/impatient.nvim")
