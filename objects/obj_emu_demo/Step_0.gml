if (keyboard_check(vk_control) && keyboard_check_pressed(ord("V")) && clipboard_has_text()) {
    var pasted = clipboard_get_text();
    
    var hh = string_copy(pasted, 1, 2);
    var hc = string_copy(pasted, 3, 1);
    var mm = string_copy(pasted, 4, 2);
    var mc = string_copy(pasted, 6, 1);
    var ss = string_copy(pasted, 7, 2);
    var sd = string_copy(pasted, 9, 1);
    var ff = string_copy(pasted, 10, 2);
    
    if (hc != ":" || mc != ":" || sd != ".") return;
    
    try {
        hh = real(hh);
        mm = real(mm);
        ss = real(ss);
        ff = real(ff);
        
        self.container.GetChild("HOURS").SetValue(hh);
        self.container.GetChild("MINUTES").SetValue(mm);
        self.container.GetChild("SECONDS").SetValue(ss);
        self.container.GetChild("FRAMES").SetValue(ff);
        
        global.input_hours = hh;
        global.input_minutes = mm;
        global.input_seconds = ss;
        global.input_frames = ff;
    } catch (e) {
        return;
    }
}