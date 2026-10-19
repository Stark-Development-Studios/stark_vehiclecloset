return {
    VersionCheck = true,

    Debug = false,

    Framework = 'qbx', -- supported: 'qb' or 'qbx'

    Target = 'ox',     -- supported: 'qb' or 'ox'

    Menu = 'lation',   -- supported: 'qb', 'ox', or 'lation'

    Notify = 'lation', -- supported: 'qb', 'ox', or 'lation'

    Progress = {
        style = 'lation', -- supported: 'qb', 'ox_bar', 'ox_circle', or 'lation'
        duration = 2000
    },

    VehicleKeys = {
        required = true, -- True Requires The Player To Have Keys To Access The Closet, False Disables It
        type = 'qbx'     -- supported: 'qb' (qb-vehiclekeys), 'qbx' (qbx_vehiclekeys), or 'wasabi' (wasabi_carlock)
    }
}
