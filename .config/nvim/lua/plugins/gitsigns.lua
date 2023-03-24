local setup, gitsigns = pcall(require, "gitsigns")
if not setup then
    print("Failed to load gitsigns.")
    return
end