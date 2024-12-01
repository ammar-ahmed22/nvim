require("chatgpt").setup({
    openai_params = {
        model = "gpt-4o",
        max_tokens = 4096,
    },
    popup_window = {
        border = {
            style = "single"
        }
    },
    chat = {
        sessions_window = {
            border = {
                style = "single"
            }
        }
    },
    popup_input = {
        border = {
            style = "single"
        }
    },
    system_window = {
        border = {
            style = "single"
        }
    },
    settings_window = {
        border = {
            style = "single"
        }
    },
    help_window = {
        border = {
            style = "single"
        }
    }
})
