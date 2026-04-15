if not lib.checkDependency('ox_lib', '3.32.0', true) then return end

local Config = require 'shared.config'

Framework = nil
QBCore = nil
QBX = nil

if Config.VersionCheck then
    lib.versionCheck('Stark-Development-Studios/stark_vehiclecloset')
end

if GetResourceState('qb-core') == 'started' and GetResourceState('qbx_core') ~= 'started' then
    Framework = 'qb'
    QBCore = exports['qb-core']:GetCoreObject()
elseif GetResourceState('qbx_core') == 'started' then
    Framework = 'qbx'
    QBX = exports.qbx_core
end

if Config.Debug then
    lib.print.info('[stark_vehiclecloset] Framework Detected: ' .. tostring(Framework))
end
