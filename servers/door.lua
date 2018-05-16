args = { ... }
inputSide = "right"
outputSide = "left"
if #args > 0 then
	inputSide = args[1]
end
if #args > 1 then
	outputSide = args[2]
end

local prevState = rs.getInput(inputSide)

print("Door server 1.0 running")
term.setTextColor(colors.white)
print("Input:", inputSide)
print("Output:", outputSide)

while true do
	local event, sender, message = os.pullEvent()
	if event == "redstone" and rs.getInput(inputSide) ~= prevState then
		if rs.getInput(inputSide) then
			rs.setOutput(outputSide, not rs.getOutput(outputSide))
		end
		prevState = rs.getInput(inputSide)
	elseif event == "rednet_message" then
		command = quacknet.handleServerReceived(sender, message)
		if command.success then
			if command.text == "open" then
				rs.setOutput(outputSide, true)
				command.reply("Opening door...")
			elseif command.text == "close" then
				rs.setOutput(outputSide, false)
				command.reply("Closing door...")
			else
				command.reply("Unknown command \"" .. command.text .. "\"!")
			end
		end
	end
end
