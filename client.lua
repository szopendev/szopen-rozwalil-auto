--  
-- definitelynotszopen 
-- nw co to jest to jest w 80% moje 
-- bo pierwsza funkcja jest z neta i pozniej troche oddnoscik do local ped chuj nie bede ci sie tlumaczyl masz i uzywaj
--
function GetVehHealthPercent()
	local ped = GetPlayerPed(-1)
	local vehicle = GetVehiclePedIsUsing(ped)
	local vehiclehealth = GetEntityHealth(vehicle) - 100
	local maxhealth = GetEntityMaxHealth(vehicle) - 100
	local procentage = (vehiclehealth / maxhealth) * 100
	return procentage
end




function ShowNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end


Citizen.CreateThread(function()
	while true do
	Citizen.Wait(0)
		local ped = GetPlayerPed(-1)
		local vehicle = GetVehiclePedIsUsing(ped)
		local damage = GetVehHealthPercent(vehicle)
		if IsPedInAnyVehicle(ped, false) then
			SetPlayerVehicleDamageModifier(PlayerId(), 100) 
			if damage < 85 then
				SetVehicleUndriveable(vehicle, true)
				ShowNotification("~g~Gratulacje Uzytowniku Rozjebales Swoj Samochód! szopen ogarniesz?")
			end
		end
	end
end)
