CreateThread(function()
    local angle = 0.0
    local speed = 0.0
	
    while true do
        Wait(50)
		local ped = PlayerPedId()
        local veh = GetVehiclePedIsUsing(ped)
        if DoesEntityExist(veh) then
            local tangle = GetVehicleSteeringAngle(veh)
            if tangle > 10.0 or tangle < -10.0 then
                angle = tangle
            end
            speed = GetEntitySpeed(veh)
		end

		local lastVeh = GetVehiclePedIsIn(ped, true)

		local isOffOrDismount = not GetIsVehicleEngineRunning(lastVeh) or lastVeh ~= veh or GetIsTaskActive(ped, 2)
		if speed < 0.1 and DoesEntityExist(lastVeh) and isOffOrDismount and not IsThisModelABike(GetEntityModel(lastVeh)) then

			SetVehicleSteeringAngle(lastVeh, angle)
		end
		
    end
end)
