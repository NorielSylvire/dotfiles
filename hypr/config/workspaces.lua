--------------------------------
---- WORKSPACE RULES ----------
--------------------------------

-- Main monitor: DP-2
for i = 1, 10 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor = "DP-2",
    })
end

-- Secondary monitor: DP-1
for i = 11, 20 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor = "DP-1",
    })
end
