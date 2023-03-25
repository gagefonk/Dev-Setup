local setup, comment = pcall(require, "Comment")
if not setup then
    print("Failed to load Comment.")
    return
end

comment.setup()