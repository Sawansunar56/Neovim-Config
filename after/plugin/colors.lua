function Colors(color)
    if(color == "tkn") then
        color = "tokyonight-night"
    elseif(color == "tks") then
        color = "tokyonight-storm"
    elseif(color == "tkm") then
        color = "tokyonight-moon"
    elseif(color == "rs") then
        color = "rose-pine"
    else 
        color = "rose-pine"
    end
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

Colors()
