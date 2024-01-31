-- Function to resize the split vertically
function ResizeVertical()
    local input = vim.fn.input('Enter resize value: ')
    if input ~= '' then
        vim.cmd('vertical resize ' .. input)
    end
end
