import Foundation
/**
 * HorizontalNodeSlider is used when 2 sliders are need, as in section definition or zoom, or gradient values
 */
class HNodeSlider:Element {
    var startNode:SelectButton?
    var endNode:SelectButton?
    var selectGroup:SelectGroup?
    var nodeWidth:CGFloat
    var tempNodeMouseX:CGFloat?
    var startProgress:CGFloat
    var endProgress:CGFloat
    init(width:CGFloat = NaN, height:CGFloat = NaN, nodeWidth:CGFloat = NaN, startProgress:CGFloat = 0, endProgress:CGFloat = 1, parent:IElement? = nil, id:String? = nil, classId:String? = nil) {
        self.startProgress = startProgress
        self.endProgress = endProgress
        self.nodeWidth = nodeWidth.isNaN ? height:nodeWidth
        super.init(width, height, parent, id)
    }
    override func resolveSkin() {
        super.resolveSkin();
        startNode = addSubView(SelectButton(nodeWidth, height, false, self, "start"))
        setStartProgress(startProgress)
        endNode = addSubView(SelectButton(nodeWidth, height, false, self, "end"))
        setEndProgress(endProgress)
        selectGroup = SelectGroup([startNode,endNode])
        selectGroup.setSelected(startNode)
    }
    func onStartNodeDown(event:ButtonEvent) {
//		DepthModifier.toFront(_startNode, this);
        tempNodeMouseX = startNode.mouseX
        //add on move handler here
    }
    func onEndNodeDown(event:ButtonEvent) {
//		DepthModifier.toFront(_endNode, this);
        tempNodeMouseX = endNode.mouseX
        //add on move handler here
    }
    func onStartNodeMove(event:MouseEvent) {
        startProgress = Utils.progress(mouseX, tempNodeMouseX, width, nodeWidth)
        startNode.x = Utils.nodePosition(startProgress, width, nodeWidth)
        //send this event: NodeSliderEvent(NodeSliderEvent.change,startProgress,endProgress,startNode)
    }
    func onEndNodeMove(event:MouseEvent)  {
        endProgress = Utils.progress(mouseX, tempNodeMouseX, width, nodeWidth)
        endNode.x = Utils.nodePosition(endProgress, width, nodeWidth)
        //send this event:NodeSliderEvent(NodeSliderEvent.change,startProgress,endProgress,endNode)
    }
    func onStartNodeUp(event : MouseEvent)  {
        //remove move event here
    }
    func onEndNodeUp(event : MouseEvent)  {
        //remove move event here
    }
    /**
     * @param progress (0-1)
     */
    func setStartProgress(progress:CGFloat){
        startProgress = progress
        startNode.x = Utils.nodePosition(progress, width, nodeWidth)
    }
    func setEndProgress(progress:CGFloat){
        endProgress = progress
        endNode.x = Utils.nodePosition(progress, width, nodeWidth)
    }
    func setSize(width : CGFloat, height : CGFloat)  {
        super.setSize(width, height)
        setEndProgress(endProgress)
        setStartProgress(startProgress)
        startNode.setSize(startNode.width, height)
        endNode.setSize(startNode.width, height)
    }
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}