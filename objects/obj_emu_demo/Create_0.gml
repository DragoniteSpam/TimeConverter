randomize();

global.input_hours = 0;
global.input_minutes = 0;
global.input_seconds = 0;
global.input_frames = 0;
global.input_multiplier = 1;

container = new EmuCore(32, 32, 640, 640);

container.AddContent([
    new EmuText(32, EMU_AUTO, 256, 32, "Input:"),
    new EmuInput(32, EMU_AUTO, 256, 32, "Hours:", "0", "", 2, E_InputTypes.INT, function() {
        global.input_hours = real(self.value);
    }),
    new EmuInput(32, EMU_AUTO, 256, 32, "Minutes:", "0", "", 2, E_InputTypes.INT, function() {
        global.input_minutes = real(self.value);
    }),
    new EmuInput(32, EMU_AUTO, 256, 32, "Seconds:", "0", "", 2, E_InputTypes.INT, function() {
        global.input_seconds = real(self.value);
    }),
    new EmuInput(32, EMU_AUTO, 256, 32, "Frames:", "0", "", 2, E_InputTypes.INT, function() {
        global.input_frames = real(self.value);
    }),
    new EmuInput(32, EMU_AUTO, 256, 32, "Multiplier:", "1", "eg 1.25", 5, E_InputTypes.REAL, function() {
        global.input_multiplier = real(self.value);
    }).SetRealNumberBounds(0.1, 100),
    new EmuText(32, EMU_AUTO, 256, 32, "").SetTextUpdate(function() {
        static format_time = function(val) {
            val = string(val);
            while (string_length(val) < 2) {
                val = "0" + val;
            }
            return val;
        };
        
        var frame_total = global.input_hours;
        frame_total *= 60;
        frame_total += global.input_minutes;
        frame_total *= 60;
        frame_total += global.input_seconds;
        frame_total *= 60;
        frame_total += global.input_frames;
        frame_total /= global.input_multiplier;
        
        var ff = frame_total % 60;
        frame_total = frame_total div 60;
        var ss = frame_total % 60;
        frame_total = frame_total div 60;
        var mm = frame_total % 60;
        frame_total = frame_total div 60;
        var hh = frame_total;
        
        return format_time(hh) + ":" + format_time(mm) + ":" + format_time(ss) + ":" + format_time(ff);
    }),
]);