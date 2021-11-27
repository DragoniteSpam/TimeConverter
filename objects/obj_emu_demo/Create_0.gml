randomize();

container = new EmuCore(32, 32, 640, 640);

container.AddContent([
    new EmuText(32, EMU_AUTO, 256, 32, "Input:"),
    new EmuInput(32, EMU_AUTO, 256, 32, "Hours:", "0", "", 2, E_InputTypes.INT, function() {
    }),
    new EmuInput(32, EMU_AUTO, 256, 32, "Minutes:", "0", "", 2, E_InputTypes.INT, function() {
    }),
    new EmuInput(32, EMU_AUTO, 256, 32, "Seconds:", "0", "", 2, E_InputTypes.INT, function() {
    }),
    new EmuInput(32, EMU_AUTO, 256, 32, "Frames:", "0", "", 2, E_InputTypes.INT, function() {
    }),
    new EmuInput(32, EMU_AUTO, 256, 32, "Multiplier:", "1.25", "eg 1.25", 2, E_InputTypes.REAL, function() {
    }),
    new EmuText(32, EMU_AUTO, 256, 32, "").SetTextUpdate(function() {
        return "";
    }),
]);