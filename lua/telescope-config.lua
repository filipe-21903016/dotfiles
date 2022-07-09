-- TELESCOPE SETUP
require('telescope').setup{
    defaults = {
        prompt_prefix = "$ ",
    }
}
require('telescope').load_extension('fzf')

local mappings = {}
mappings.curr_buff = function() 
    local opt = require("telescope.themes").get_ivy({sorting_strategy = "ascending", prompt_position="top"})
    require('telescope.builtin').current_buffer_fuzzy_find(opt)
end
mappings.files = function()
    local opt = require("telescope.themes").get_ivy({sorting_strategy = "ascending", prompt_position="top"})
    require('telescope.builtin').find_files(opt)
end
return mappings

