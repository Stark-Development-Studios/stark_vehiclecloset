return {
    VersionCheck = true,
    VehicleKeysRequired = true,
    Framework = 'qbx',    -- supported: 'qb' or 'qbx'
    Target = 'ox',        -- supported: 'qb' or 'ox'
    Menu = 'ox',          -- supported: 'qb' or 'ox' (QBCore Only)
    Progress = {
        style = 'ox_bar', -- supported: 'qb', 'ox_bar', or 'ox_circle'
        duration = 2000
    }
}
