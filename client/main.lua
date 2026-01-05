if not lib.checkDependency('ox_lib', '3.32.0', true) then return end

local Config = require 'shared.config'

-- Functions
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
                position = 'offcenter-right',
                options = closetMenuOptions
            })

            lib.showContext('vehicle_closet_menu')
        end
    elseif Config.Framework == 'qbx' then
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
            position = 'offcenter-right',
            options = closetMenuOptions
        })

        lib.showContext('vehicle_closet_menu')
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
                end)
        elseif Config.Progress.style == 'ox_bar' then
            if lib.progressBar({
                    duration = Config.Progress.duration,
                    label = locale('info.progress_label'),
                    icon = 'fa-solid fa-shirt',
                    iconColor = '#FFFFFF',
                    color = '#FF0000',
                    useWhileDead = false,
                    canCancel = true,
                    disable = {
                        move = true,
                        car = true,
                        combat = true,
                        mouse = false
                    }
                }) then
                vehicleClosetMenu(vehicle)
            else
                lib.notify({
                    title = locale('error.cancellation_title'),
                    description = locale('error.cancellation_description'),
                    position = 'center-right',
                    type = 'error'
                })
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
                        mouse = false,
                        combat = true
                    }
                })
            then
                vehicleClosetMenu(vehicle)
            else
                lib.notify({
                    title = locale('error.cancellation_title'),
                    description = locale('error.cancellation_description'),
                    position = 'center-right',
                    type = 'error'
                })
            end
        end
    elseif Config.Framework == 'qbx' then
        if Config.Progress.style == 'ox_bar' then
            if lib.progressBar({
                    duration = Config.Progress.duration,
                    label = locale('info.progress_label'),
                    icon = 'fa-solid fa-shirt',
                    iconColor = '#FFFFFF',
                    color = '#FF0000',
                    useWhileDead = false,
                    canCancel = true,
                    disable = {
                        move = true,
                        car = true,
                        combat = true,
                        mouse = false
                    }
                }) then
                vehicleClosetMenu(vehicle)
            else
                lib.notify({
                    title = locale('error.cancellation_title'),
                    description = locale('error.cancellation_description'),
                    position = 'center-right',
                    type = 'error'
                })
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
                        mouse = false,
                        combat = true
                    }
                })
            then
                vehicleClosetMenu(vehicle)
            else
                lib.notify({
                    title = locale('error.cancellation_title'),
                    description = locale('error.cancellation_description'),
                    position = 'center-right',
                    type = 'error'
                })
            end
        end
    end
end

local function hasKeys(vehicle)
    if Config.Framework == 'qb' then
        local QBCore = exports['qb-core']:GetCoreObject()
        if Config.VehicleKeysRequired then
            local plate = QBCore.Functions.GetPlate(vehicle)
            local hasKeys = exports['qb-vehiclekeys']:HasKeys(plate)
            if hasKeys then
                vehicleClosetProgress(vehicle)
            else
                QBCore.Functions.Notify(locale('error.vehicle_keys_error_description'), 'error', 5000)
            end
        else
            vehicleClosetProgress(vehicle)
        end
    elseif Config.Framework == 'qbx' then
        if Config.VehicleKeysRequired then
            local hasKeys = exports.qbx_vehiclekeys:HasKeys(vehicle)
            if hasKeys then
                vehicleClosetProgress(vehicle)
            else
                lib.notify({
                    title = locale('error.vehicle_keys_error_title'),
                    description = locale('error.vehicle_keys_error_description'),
                    position = 'center-right',
                    type = 'error'
                })
            end
        else
            vehicleClosetProgress(vehicle)
        end
    end
end

-- Event
RegisterNetEvent('stark_vehiclecloset:client:changeClothes', function()
    if not GetInvokingResource() then return end
    if Config.Framework == 'qb' then
        TriggerServerEvent('InteractSound_SV:PlayOnSource', 'Clothes1', 0.4)
    else
        lib.print.warn("WARNING:" .. locale('error.framework_error_description'))
    end
    TriggerEvent('qb-clothing:client:openOutfitMenu')
end)

-- Main Thread
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
        local ox_target = exports.ox_target
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
    end
end)
