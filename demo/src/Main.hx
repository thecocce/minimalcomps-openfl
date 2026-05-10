package;

import openfl.display.Sprite;
import openfl.events.Event;
import minimalcomps.components.*;
import minimalcomps.components.Style;

class Main extends Sprite {

    public function new() {
        super();
        addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    private function onAddedToStage(event:Event):Void {
        removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

        Component.initStage(stage);
        Component.enableFilters = false; // remove all drop-shadows for crisp rendering test
        Style.setStyle(Style.LIGHT);

        // Main container panel
        var panel:Panel = new Panel(this, 10, 10);
        panel.setSize(780, 580);
        panel.filters = []; // remove drop-shadow for maximum crispness
        panel.draw();

        var xPos:Float = 20;
        var yPos:Float = 20;

        // Title label
        var title:Label = new Label(panel.content, xPos, yPos, "MinimalComps Demo - Crisp Rendering Test");
        title.draw();
        yPos += 30;

        // Label
        new Label(panel.content, xPos, yPos, "Label:");
        new Label(panel.content, xPos + 50, yPos, "Hello World");
        yPos += 25;

        // PushButton
        new PushButton(panel.content, xPos, yPos, "PushButton", function(e) {
            trace("PushButton clicked");
        });
        yPos += 30;

        // CheckBox
        var checkBox:CheckBox = new CheckBox(panel.content, xPos, yPos, "CheckBox");
        yPos += 25;

        // RadioButtons
        new RadioButton(panel.content, xPos, yPos, "Radio 1", true);
        new RadioButton(panel.content, xPos + 80, yPos, "Radio 2", false);
        yPos += 25;

        // InputText
        new InputText(panel.content, xPos, yPos, "Input text...");
        yPos += 25;

        // Text (multi-line)
        var textArea:Text = new Text(panel.content, xPos, yPos, "Multi-line text component");
        textArea.setSize(200, 60);
        yPos += 70;

        // Slider
        var slider:HSlider = new HSlider(panel.content, xPos, yPos);
        slider.setSliderParams(0, 100, 50);
        slider.addEventListener(Event.CHANGE, function(e) {
            trace("Slider value: " + slider.value);
        });
        yPos += 25;

        // NumericStepper
        var stepper:NumericStepper = new NumericStepper(panel.content, xPos, yPos);
        stepper.value = 10;
        yPos += 25;

        // ProgressBar
        var progress:ProgressBar = new ProgressBar(panel.content, xPos, yPos);
        progress.value = 0.6;
        progress.maximum = 1.0;
        yPos += 20;

        // ComboBox
        var combo:ComboBox = new ComboBox(panel.content, xPos, yPos, "Select...");
        combo.addItem("Item 1");
        combo.addItem("Item 2");
        combo.addItem("Item 3");
        yPos += 30;

        // List
        var listItems:Array<Dynamic> = ["Apple", "Banana", "Cherry", "Date", "Elderberry"];
        var list:List = new List(panel.content, xPos, yPos, listItems);
        list.setSize(150, 100);
        yPos += 110;

        // IndicatorLight
        var light:IndicatorLight = new IndicatorLight(panel.content, xPos, yPos, 0x00ff00, "Indicator");
        light.isLit = true;
        yPos += 20;

        // Knob
        var knob:Knob = new Knob(panel.content, xPos, yPos, "Knob");
        knob.value = 50;
        yPos += 70;

        // Meter
        var meter:Meter = new Meter(panel.content, xPos, yPos, "Meter");
        meter.value = 0.6;
        yPos += 60;

        // Second column
        xPos = 280;
        yPos = 50;

        // HUISlider
        var uiSlider:HUISlider = new HUISlider(panel.content, xPos, yPos, "UI Slider");
        uiSlider.value = 50;
        yPos += 30;

        // VUISlider
        var vuiSlider:VUISlider = new VUISlider(panel.content, xPos + 200, yPos - 30, "VUI");
        vuiSlider.value = 50;

        // HRangeSlider
        var hRange:HRangeSlider = new HRangeSlider(panel.content, xPos, yPos);
        hRange.lowValue = 20;
        hRange.highValue = 80;
        yPos += 25;

        // ColorChooser
        var colorChooser:ColorChooser = new ColorChooser(panel.content, xPos, yPos, 0xff0000);
        yPos += 25;

        // Window
        var window:Window = new Window(panel.content, xPos, yPos, "Window");
        window.setSize(200, 120);
        window.hasCloseButton = true;
        window.hasMinimizeButton = true;
        new PushButton(window.content, 10, 10, "Inside Window");
        yPos += 130;

        // ScrollPane
        var scrollPane:ScrollPane = new ScrollPane(panel.content, xPos, yPos);
        scrollPane.setSize(200, 100);
        var scrollContent:Sprite = new Sprite();
        scrollContent.graphics.beginFill(0xff0000);
        scrollContent.graphics.drawRect(0, 0, 300, 150);
        scrollContent.graphics.endFill();
        scrollPane.content.addChild(scrollContent);
        yPos += 110;

        // Accordion
        var accordion:Accordion = new Accordion(panel.content, xPos, yPos);
        accordion.setSize(200, 150);
        accordion.addWindow("Section 3");
        yPos += 160;

        // Calendar
        var calendar:Calendar = new Calendar(panel.content, xPos, yPos);
        yPos += 150;

        // FPSMeter
        var fps:FPSMeter = new FPSMeter(panel.content, xPos, yPos, "FPS: ");
        yPos += 25;

        // Snap toggle
        var snapToggle:PushButton = new PushButton(panel.content, xPos, yPos, "snapToPixels: ON");
        snapToggle.setSize(140, 20);
        snapToggle.addEventListener(Event.CHANGE, function(e) {
            Component.snapToPixels = !Component.snapToPixels;
            snapToggle.label = Component.snapToPixels ? "snapToPixels: ON" : "snapToPixels: OFF";
            // Force redraw of all children
            for (i in 0 ... panel.content.numChildren) {
                var child = panel.content.getChildAt(i);
                if (Std.is(child, Component)) {
                    cast(child, Component).draw();
                }
            }
        });

        // RotarySelector
        var rotary:RotarySelector = new RotarySelector(panel.content, xPos + 160, yPos - 20, "Rotary");
        rotary.numChoices = 5;
    }
}
