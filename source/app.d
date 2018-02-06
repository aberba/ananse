// myproject.d
import dlangui;

mixin APP_ENTRY_POINT;

/// entry point for dlangui based application
extern (C) int UIAppMain(string[] args)
{
    // embed and register app resources listed in file views/resources.list
    embeddedResourceList.addResources(embedResourcesFromList!("resources.list")());
    // load theme from file "theme_custom.xml"
    Platform.instance.uiTheme = "theme_ananse_light";

    // create window
    Window window = Platform.instance.createWindow("Ananse Theme", null);

    auto vlayout = new VerticalLayout();
    vlayout.margins = 20; // distance from window frame to vlayout background
    vlayout.padding = 10; // distance from vlayout background bound to child widgets
    vlayout.backgroundColor = 0xFFFFC0; // yellow background color

    // put some widgets into background
    vlayout.addChild(new TextWidget(null, "First text item"d));
    vlayout.addChild(new RadioButton(null, "RadioButton1"d));
    vlayout.addChild(new EditLine(null, "Some text for parameter 1"d));
    vlayout.addChild(new CheckBox(null, "Check box text"d));
    vlayout.addChild(new ImageTextButton(null, "dialog-ok", "Check box text"d));
    vlayout.addChild(new ComboBox(null, ["item value 1"d, "item value 2"d,
            "item value 3"d, "item value 4"d, "item value 5"d, "item value 6"d]));

    // create some widget to show in window
    window.mainWidget = vlayout;
    window.show();
    // run message loop
    return Platform.instance.enterMessageLoop();
}
