function shalarm-test
    shalarm (date -d @(expr (date +%s) + 1) +%H:%M:%S)
end

