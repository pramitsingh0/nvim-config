local status, tree = pcall(require, "nvim-tree")

if not status then
    print("nvim tree not found")
    return
end

tree.setup{}
