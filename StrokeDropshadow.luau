--!strict
export type config = {
	color : Color3,
	maxThickness : number,
	minTransparency : number,
	maxTransparency : number,
	layers : number,
	position : Enum.BorderStrokePosition,
	SizingMode : Enum.StrokeSizingMode,
	Offset : UDim?,
	childen : {Instance?}?
}

local function newStroke()
	return Instance.new('UIStroke')
end

return function(config : config, parent : Instance) : {UIStroke}
	local layers = config.layers
	local maxThickness = config.maxThickness
	local minTransparency = config.minTransparency
	local maxTransparency = config.maxTransparency
	local position = config.position
	local color = config.color
	local children = config.childen
	local SizingMode = config.SizingMode
	local Offset = config.Offset
	
	local strokes = {}
	
	for i = 1, layers do
		local t = (i - 1) / (layers - 1)
		local thickness = t * maxThickness
		local transparency = minTransparency + t * (maxTransparency - minTransparency)
		
		local stroke = newStroke()
		
		if Offset then
			stroke.BorderOffset = Offset
		end
		
		stroke.StrokeSizingMode = SizingMode
		stroke.Color = color
		stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		stroke.LineJoinMode = Enum.LineJoinMode.Round
		stroke.Thickness = thickness
		stroke.Transparency = transparency
		stroke.BorderStrokePosition = position
		stroke.Parent = parent
		
		if children and #children > 0 then
			for _, v : any in children do
				local cloned = v:Clone()
				cloned.Parent = stroke
			end
		end
		
		table.insert(strokes, stroke)
	end
	
	return strokes
end
