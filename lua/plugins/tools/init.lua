function get_plug(plug_name)
    return require ('plugins.tools.' .. plug_name)
end


return {
    get_plug 'snack',
    get_plug 'whichkey',
    get_plug 'pairs',
}
