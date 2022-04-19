public class OsthemeObserver: Application {
    private OsthemeObserver() {
        Object (application_id: "com.github.altescy.ostheme", flags: ApplicationFlags.HANDLES_COMMAND_LINE);
    }

    private void showCurrentMode () {
        var granite_settings = Granite.Settings.get_default ();
        if (granite_settings.prefers_color_scheme == Granite.Settings.ColorScheme.DARK) {
            print ("Dark\n");
        } else {
            print ("Light\n");
        }
    }

    public override void activate () {
        this.showCurrentMode();
        var granite_settings = Granite.Settings.get_default ();
        granite_settings.notify["prefers-color-scheme"].connect(this.showCurrentMode);
    }

    public override int command_line (ApplicationCommandLine command_line) {
        string[] args = command_line.get_arguments ();
        if (args[1] == "--observe") {
            this.hold();
        }
        this.activate();
        return 0;
    }

    public static int main (string[] args) {
        var app = new OsthemeObserver();
        int status = app.run (args);
        return status;
    }
}
