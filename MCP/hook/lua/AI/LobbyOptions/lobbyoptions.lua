
AIOpts = {
    {
        default = 1,
        label = "[MCP] Exclusive engineering suite",
        help = "Regular engineer can build exclusive economic structures but no defenses, field engineer can build exclusive defense structures but no eco.",
        key = 'MCPEngiSplit',
        mponly = false,
        value_text = "",
        value_help = "",
        values = {
            {
                text = "On",
                help = "Buildings are split between eco engineer and field engineer",
                key = true,
            },
            {
                text = "Off",
                help = "Regular engineer can build everything",
                key = false,
            },
        },
    },
}