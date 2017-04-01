import Foundation
@testable import Utils

protocol Containable:class {//TODO: RENAME TO displaceable
    var maskSize:CGSize{get}
    var contentSize:CGSize{get}
    var itemSize:CGSize{get}
    /**/
    var width:CGFloat{get}//new
    var height:CGFloat{get}//used to represent the maskHeight aka the visible part.
    //itemHeight is not needed, Its for List, intervall can be calculated with a default interval for ContentViewers, like 10th of content represents one intervall tick etc., percentage 👈
    var itemHeight:CGFloat{get}//item of one item, used to calculate interval
    var itemsHeight:CGFloat{get}//total height of the items
    var progress:CGFloat {get}//0-1 atBegining <-> atEnd (Stores the current progress)
    var interval:CGFloat {get}//describes the speed when scrolling (distance per scroll tick)
    var lableContainer:Element? {get}
    var contentContainer:Element? {get}
    //func setProgress(_ progress:CGFloat)
    var dir:Dir {get}
    //Continue here: 
        //add dir var. with some fatal error if its not implemented etc
}
extension Containable {
    var contentContainer:Element? {return lableContainer}
    
    /**/
    //TODO:these values can be stored, but are computed now because of simplicity, does not need to be recalculated on every tick, set them when you interact, setSize, onItemChange, onScroll etc
    var interval:CGFloat{return floor(itemsHeight - height)/itemHeight}// :TODO: use ScrollBarUtils.interval instead?// :TODO: explain what this is in a comment
    var progress:CGFloat{return SliderParser.progress(lableContainer!.y, height, itemsHeight)}
    /**
     * ⚠️️ You might want to have one setProgress in scroll and one in slider and use protocol ambiguity to differentiate, but then you cant have this method in base like it is now
     * PARAM value: is the final y value for the lableContainer
     * Moves the itemContainer.y up and down
     * TODO: Try to use a preCalculated itemsHeight, as this can be heavy to calculate for lengthy lists
     */
    func setProgress(_ progress:CGFloat){
        print("🖼️ moving lableContainer up and down progress: \(progress)")
        //Swift.print("IScrollable.setProgress() progress: \(progress)")
        let progressValue = self.itemsHeight < height ? 0 : progress/*pins the lableContainer to the top if itemsHeight is less than height*/
        //Swift.print("progressValue: " + "\(progressValue)")
        ScrollableUtils.scrollTo(self,progressValue)/*Sets the target item to correct y, according to the current scrollBar progress*/
    }
}