# Example:
```luau
local strokes = StrokeGlow({
	layers = 7,
	maxThickness = 0.1,
	minTransparency = 0.5,
	maxTransparency = 1,
	position = Enum.BorderStrokePosition.Outer,
	color = Color3.fromRGB(255, 255, 255),
	SizingMode = Enum.StrokeSizingMode.ScaledSize,
	childen = {Gradient}
}, script.Parent.Frame)
```

# Credit to pnloth for dropshadow effect
