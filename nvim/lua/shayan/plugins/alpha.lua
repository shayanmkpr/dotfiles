return {
    'goolord/alpha-nvim',
    config = function()
        local alpha = require'alpha'
        local dashboard = require'alpha.themes.dashboard'
        dashboard.section.header.val = {
			"                          |]__/,|   (`] ",
			"                        _.|o o  |_   ) )",
			"                        -(((---(((--------",
            "  ███╗   ██╗███████╗ ██████╗            ██╗   ██╗ ██╗      ",
            "  ████╗  ██║██╔════╝██╔═══██╗           ██║   ██║ ██║      ",
            "  ██╔██╗ ██║█████╗  ██║   ██║           ██║   ██║ ██║      ",
            "  ██║╚██╗██║██╔══╝  ██║   ██║           ╚██╗ ██╔╝ ██║      ",
            "  ██║ ╚████║███████╗╚██████╔╝            ╚████╔╝  ██║      ",
            "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝              ╚═══╝   ╚═╝      "
                                                                                                                                    
                                                                                                                                    
        }
        
        alpha.setup(dashboard.config)
    end
}
