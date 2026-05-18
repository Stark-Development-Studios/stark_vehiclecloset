if not lib.checkDependency('ox_lib', '3.33.0', true) then return end

local Config = require 'shared.config'

local lation_ui = exports.lation_ui

local ox_target = exports.ox_target

local function vehicleClosetMenu(vehicle)
    if Config.Framework == 'qb' then
        if Config.Menu == 'qb' then
            local closetMenu = {
                {
                    header = locale('info.menu_header'),
                    icon = 'fa-solid fa-car',
                    isMenuHeader = true
                },
                {
                    header = locale('info.menu_open_closet_option'),
                    txt = locale('info.menu_open_closet_description'),
                    icon = 'fa-solid fa-shirt',
                    action = function()
                        SetVehicleDoorShut(vehicle, 5, false)
                        TriggerEvent('stark_vehiclecloset:client:changeClothes')
                    end,
                },
                {
                    header = locale('info.menu_close_closet_option'),
                    txt = locale('info.menu_close_closet_description'),
                    icon = 'fa-solid fa-lock',
                    action = function()
                        SetVehicleDoorShut(vehicle, 5, false)
                        exports['qb-menu']:closeMenu()
                    end,
                }
            }

            exports['qb-menu']:openMenu(closetMenu)
        elseif Config.Menu == 'ox' then
            local closetMenuOptions = {
                {
                    title = locale('info.menu_open_closet_option'),
                    onSelect = function()
                        SetVehicleDoorShut(vehicle, 5, false)
                        TriggerEvent('stark_vehiclecloset:client:changeClothes')
                    end,
                    icon = 'fa-solid fa-shirt',
                    iconColor = 'white',
                    arrow = true,
                    description = locale('info.menu_open_closet_description'),
                },
                {
                    title = locale('info.menu_close_closet_option'),
                    onSelect = function()
                        SetVehicleDoorShut(vehicle, 5, false)
                        lib.hideContext()
                    end,
                    icon = 'fa-solid fa-lock',
                    iconColor = 'white',
                    arrow = true,
                    description = locale('info.menu_close_closet_description'),
                }
            }

            lib.registerContext({
                id = 'vehicle_closet_menu',
                title = locale('info.menu_header'),
                canClose = false,
                position = 'top-right',
                options = closetMenuOptions
            })

            lib.showContext('vehicle_closet_menu')
        elseif Config.Menu == 'lation' then
            local closetMenuOptions = {
                {
                    title = locale('info.menu_open_closet_option'),
                    onSelect = function()
                        SetVehicleDoorShut(vehicle, 5, false)
                        TriggerEvent('stark_vehiclecloset:client:changeClothes')
                    end,
                    icon = 'fa-solid fa-shirt',
                    iconColor = '#FFFFFF',
                    arrow = true,
                    description = locale('info.menu_open_closet_description'),
                },
                {
                    title = locale('info.menu_close_closet_option'),
                    onSelect = function()
                        SetVehicleDoorShut(vehicle, 5, false)
                        lation_ui:hideMenu()
                    end,
                    icon = 'fa-solid fa-lock',
                    iconColor = '#FFFFFF',
                    arrow = true,
                    description = locale('info.menu_close_closet_description'),
                }
            }

            lation_ui:registerMenu({
                id = 'vehicle_closet_menu',
                title = locale('info.menu_header'),
                subtitle = locale('info.menu_subtitle'),
                headerIcon = 'fa-solid fa-car',
                headerIconColor = '#FFFFFF',
                canClose = false,
                position = 'offcenter-right',
                options = closetMenuOptions
            })

            lation_ui:showMenu('vehicle_closet_menu')
        else
            lib.notify({
                title = locale('error.unsupported_menu_ui_title'),
                description = locale('error.unsupported_menu_ui_description'),
                duration = 5000,
                position = 'center-right',
                type = 'error'
            })
            Wait(2000)
            SetVehicleDoorShut(vehicle, 5, false)
        end
    elseif Config.Framework == 'qbx' then
        if Config.Menu == 'ox' then
            local closetMenuOptions = {
                {
                    title = locale('info.menu_open_closet_option'),
                    onSelect = function()
                        SetVehicleDoorShut(vehicle, 5, false)
                        TriggerEvent('stark_vehiclecloset:client:changeClothes')
                    end,
                    icon = 'fa-solid fa-shirt',
                    iconColor = 'white',
                    arrow = true,
                    description = locale('info.menu_open_closet_description'),
                },
                {
                    title = locale('info.menu_close_closet_option'),
                    onSelect = function()
                        SetVehicleDoorShut(vehicle, 5, false)
                        lib.hideContext()
                    end,
                    icon = 'fa-solid fa-lock',
                    iconColor = 'white',
                    arrow = true,
                    description = locale('info.menu_close_closet_description'),
                }
            }

            lib.registerContext({
                id = 'vehicle_closet_menu',
                title = locale('info.menu_header'),
                canClose = false,
                position = 'top-right',
                options = closetMenuOptions
            })

            lib.showContext('vehicle_closet_menu')
        elseif Config.Menu == 'lation' then
            local closetMenuOptions = {
                {
                    title = locale('info.menu_open_closet_option'),
                    onSelect = function()
                        SetVehicleDoorShut(vehicle, 5, false)
                        TriggerEvent('stark_vehiclecloset:client:changeClothes')
                    end,
                    icon = 'fa-solid fa-shirt',
                    iconColor = '#FFFFFF',
                    arrow = true,
                    description = locale('info.menu_open_closet_description'),
                },
                {
                    title = locale('info.menu_close_closet_option'),
                    onSelect = function()
                        SetVehicleDoorShut(vehicle, 5, false)
                        lation_ui:hideMenu()
                    end,
                    icon = 'fa-solid fa-lock',
                    iconColor = '#FFFFFF',
                    arrow = true,
                    description = locale('info.menu_close_closet_description'),
                }
            }

            lation_ui:registerMenu({
                id = 'vehicle_closet_menu',
                title = locale('info.menu_header'),
                subtitle = locale('info.menu_subtitle'),
                headerIcon = 'fa-solid fa-car',
                headerIconColor = '#FFFFFF',
                canClose = false,
                position = 'offcenter-right',
                options = closetMenuOptions
            })

            lation_ui:showMenu('vehicle_closet_menu')
        else
            lib.notify({
                title = locale('error.unsupported_menu_ui_title'),
                description = locale('error.unsupported_menu_ui_description'),
                duration = 5000,
                position = 'center-right',
                type = 'error'
            })
            Wait(2000)
            SetVehicleDoorShut(vehicle, 5, false)
        end
    else
        lib.notify({
            title = locale('error.unsupported_framework_error_title'),
            description = locale('error.unsupported_framework_error_description'),
            duration = 5000,
            position = 'center-right',
            type = 'error'
        })
    end
end

local function vehicleClosetProgress(vehicle)
    if Config.Framework == 'qb' then
        local QBCore = exports['qb-core']:GetCoreObject()
        if Config.Progress.style == 'qb' then
            QBCore.Functions.Progressbar(locale('info.progress_name'), locale('info.progress_label'),
                Config.Progress.duration, false, true,
                {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true
                }, {}, {}, {}, function()
                    vehicleClosetMenu(vehicle)
                end, function()
                    QBCore.Functions.Notify(locale('error.cancellation_description'), 'error', 5000)
                    Wait(2000)
                    SetVehicleDoorShut(vehicle, 5, false)
                end)
        elseif Config.Progress.style == 'ox_bar' then
            if lib.progressBar({
                    duration = Config.Progress.duration,
                    label = locale('info.progress_label'),
                    useWhileDead = false,
                    canCancel = true,
                    disable = {
                        move = true,
                        car = true,
                        combat = true,
                        mouse = false,
                        sprint = true
                    }
                }) then
                vehicleClosetMenu(vehicle)
            else
                lib.notify({
                    title = locale('error.cancellation_title'),
                    description = locale('error.cancellation_description'),
                    duration = 5000,
                    position = 'center-right',
                    type = 'error'
                })
                Wait(2000)
                SetVehicleDoorShut(vehicle, 5, false)
            end
        elseif Config.Progress.style == 'ox_circle' then
            if lib.progressCircle({
                    duration = Config.Progress.duration,
                    label = locale('info.progress_label'),
                    position = 'bottom',
                    useWhileDead = false,
                    canCancel = true,
                    disable = {
                        move = true,
                        car = true,
                        combat = true,
                        mouse = false,
                        sprint = true
                    }
                })
            then
                vehicleClosetMenu(vehicle)
            else
                lib.notify({
                    title = locale('error.cancellation_title'),
                    description = locale('error.cancellation_description'),
                    duration = 5000,
                    position = 'center-right',
                    type = 'error'
                })
                Wait(2000)
                SetVehicleDoorShut(vehicle, 5, false)
            end
        elseif Config.Progress.style == 'lation' then
            if lation_ui:progressBar({
                    duration = Config.Progress.duration,
                    label = locale('info.progress_label'),
                    icon = 'fa-solid fa-shirt',
                    iconColor = '#FFFFFF',
                    color = '#FF0000',
                    steps = {
                        { description = 'Inserting The Car Key...' },
                        { description = 'Turning The Key...' },
                        { description = 'Unlocking The Closet...' }

                    },
                    useWhileDead = false,
                    canCancel = true,
                    disable = {
                        move = true,
                        sprint = true,
                        car = true,
                        combat = true,
                        mouse = false
                    }
                }) then
                vehicleClosetMenu(vehicle)
            else
                lation_ui:notify({
                    title = locale('error.cancellation_title'),
                    message = locale('error.cancellation_description'),
                    duration = 5000,
                    type = 'error',
                    position = 'center-right',
                })
                Wait(2000)
                SetVehicleDoorShut(vehicle, 5, false)
            end
        else
            lib.notify({
                title = locale('error.unsupported_progress_ui_title'),
                description = locale('error.unsupported_progress_ui_description'),
                duration = 5000,
                position = 'center-right',
                type = 'error'
            })
            Wait(2000)
            SetVehicleDoorShut(vehicle, 5, false)
        end
    elseif Config.Framework == 'qbx' then
        if Config.Progress.style == 'ox_bar' then
            if lib.progressBar({
                    duration = Config.Progress.duration,
                    label = locale('info.progress_label'),
                    useWhileDead = false,
                    canCancel = true,
                    disable = {
                        move = true,
                        car = true,
                        combat = true,
                        mouse = false,
                        sprint = true
                    }
                }) then
                vehicleClosetMenu(vehicle)
            else
                lib.notify({
                    title = locale('error.cancellation_title'),
                    description = locale('error.cancellation_description'),
                    duration = 5000,
                    position = 'center-right',
                    type = 'error'
                })
                Wait(2000)
                SetVehicleDoorShut(vehicle, 5, false)
            end
        elseif Config.Progress.style == 'ox_circle' then
            if lib.progressCircle({
                    duration = Config.Progress.duration,
                    label = locale('info.progress_label'),
                    position = 'bottom',
                    useWhileDead = false,
                    canCancel = true,
                    disable = {
                        move = true,
                        car = true,
                        combat = true,
                        mouse = false,
                        sprint = true
                    }
                })
            then
                vehicleClosetMenu(vehicle)
            else
                lib.notify({
                    title = locale('error.cancellation_title'),
                    description = locale('error.cancellation_description'),
                    duration = 5000,
                    position = 'center-right',
                    type = 'error'
                })
                Wait(2000)
                SetVehicleDoorShut(vehicle, 5, false)
            end
        elseif Config.Progress.style == 'lation' then
            if lation_ui:progressBar({
                    duration = Config.Progress.duration,
                    label = locale('info.progress_label'),
                    icon = 'fa-solid fa-shirt',
                    iconColor = '#FFFFFF',
                    color = '#FF0000',
                    steps = {
                        { description = 'Inserting The Car Key...' },
                        { description = 'Turning The Key...' },
                        { description = 'Unlocking The Closet...' }
                    },
                    useWhileDead = false,
                    canCancel = true,
                    disable = {
                        move = true,
                        sprint = true,
                        car = true,
                        combat = true,
                        mouse = false
                    }
                }) then
                vehicleClosetMenu(vehicle)
            else
                lation_ui:notify({
                    title = locale('error.cancellation_title'),
                    message = locale('error.cancellation_description'),
                    duration = 5000,
                    type = 'error',
                    position = 'center-right',
                })
                Wait(2000)
                SetVehicleDoorShut(vehicle, 5, false)
            end
        else
            lib.notify({
                title = locale('error.unsupported_progress_ui_title'),
                description = locale('error.unsupported_progress_ui_description'),
                duration = 5000,
                position = 'center-right',
                type = 'error'
            })
            Wait(2000)
            SetVehicleDoorShut(vehicle, 5, false)
        end
    else
        lib.notify({
            title = locale('error.unsupported_framework_error_title'),
            description = locale('error.unsupported_framework_error_description'),
            duration = 5000,
            position = 'center-right',
            type = 'error'
        })
    end
end

local function hasKeys(vehicle)
    if Config.Framework == 'qb' then
        local QBCore = exports['qb-core']:GetCoreObject()
        local plate = lib.getVehicleProperties(vehicle).plate
        if Config.VehicleKeys.required then
            if Config.VehicleKeys.type == 'qb' then
                local hasKey = exports['qb-vehiclekeys']:HasKeys(plate)
                if hasKey then
                    vehicleClosetProgress(vehicle)
                else
                    QBCore.Functions.Notify(locale('error.vehicle_keys_error_description'), 'error', 5000)
                end
            elseif Config.VehicleKeys.type == 'wasabi' then
                local wasabi_carlock = exports.wasabi_carlock
                local hasKey = wasabi_carlock:HasKey(plate)
                if hasKey then
                    vehicleClosetProgress(vehicle)
                else
                    QBCore.Functions.Notify(locale('error.vehicle_keys_error_description'), 'error', 5000)
                end
            else
                QBCore.Functions.Notify(locale('error.unsupported_vehicle_key_description'), 'error', 5000)
            end
        else
            vehicleClosetProgress(vehicle)
        end
    elseif Config.Framework == 'qbx' then
        local plate = lib.getVehicleProperties(vehicle).plate
        if Config.VehicleKeys.required then
            if Config.VehicleKeys.type == 'qbx' then
                local hasKey = exports.qbx_vehiclekeys:HasKeys(vehicle)
                if hasKey then
                    vehicleClosetProgress(vehicle)
                else
                    lib.notify({
                        title = locale('error.vehicle_keys_error_title'),
                        description = locale('error.vehicle_keys_error_description'),
                        duration = 5000,
                        position = 'center-right',
                        type = 'error'
                    })
                end
            elseif Config.VehicleKeys.type == 'wasabi' then
                local wasabi_carlock = exports.wasabi_carlock
                local hasKey = wasabi_carlock:HasKey(plate)
                if hasKey then
                    vehicleClosetProgress(vehicle)
                else
                    lib.notify({
                        title = locale('error.vehicle_keys_error_title'),
                        description = locale('error.vehicle_keys_error_description'),
                        duration = 5000,
                        position = 'center-right',
                        type = 'error'
                    })
                end
            else
                lib.notify({
                    title = locale('error.unsupported_vehicle_key_title'),
                    description = locale('error.unsupported_vehicle_key_description'),
                    duration = 5000,
                    position = 'center-right',
                    type = 'error'
                })
            end
        else
            vehicleClosetProgress(vehicle)
        end
    else
        lib.notify({
            title = locale('error.unsupported_framework_error_title'),
            description = locale('error.unsupported_framework_error_description'),
            duration = 5000,
            position = 'center-right',
            type = 'error'
        })
        Wait(2000)
        SetVehicleDoorShut(vehicle, 5, false)
    end
end

RegisterNetEvent('stark_vehiclecloset:client:changeClothes', function()
    if not GetInvokingResource() then return end
    if Config.Framework == 'qb' then
        TriggerServerEvent('InteractSound_SV:PlayOnSource', 'Clothes1', 0.4)
    elseif Config.Framework == 'qbx' and GetResourceState('interact-sound') == 'started' then
        TriggerServerEvent('InteractSound_SV:PlayOnSource', 'Clothes1', 0.4)
    else
        lib.print.warn("WARNING: " .. locale('error.framework_error_description'))
    end
    TriggerEvent('qb-clothing:client:openOutfitMenu')
end)

CreateThread(function()
    if Config.Target == 'qb' and GetResourceState('qb-target') == 'started' then
        exports['qb-target']:AddTargetBone('boot', {
            options = {
                {
                    icon = 'fa-solid fa-vest',
                    label = locale('info.target_label'),
                    action = function(entity)
                        local Vehicle = entity
                        SetVehicleDoorOpen(Vehicle, 5, false, false)
                        hasKeys(Vehicle)
                    end
                }
            },
            distance = 3.0
        })
    elseif Config.Target == 'ox' and GetResourceState('ox_target') == 'started' then
        ox_target:addGlobalVehicle({
            label = locale('info.target_label'),
            icon = 'fa-solid fa-vest',
            iconColor = 'white',
            distance = 3.0,
            bones = 'boot',
            onSelect = function(data)
                local Vehicle = data.entity
                SetVehicleDoorOpen(Vehicle, 5, false, false)
                hasKeys(Vehicle)
            end
        })
    else
        lib.notify({
            title = locale('error.unsupported_target_title'),
            description = locale('error.unsupported_target_description'),
            duration = 5000,
            position = 'center-right',
            type = 'error'
        })
    end
end)
