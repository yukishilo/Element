import Cocoa
/**
 * When the the user scrolls
 */
class ScrollView: DisplaceView, Scrollable {
    override func scrollWheel(with event: NSEvent) {//TODO: move to displaceview
        scroll(event)/*forward the event to the extension which adjust Slider and calls setProgress in this method*/
        super.scrollWheel(with: event)/*forward the event other delegates higher up in the stack*/
    }
}
