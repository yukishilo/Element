import Cocoa

class RectGraphic:SizeableGraphic{
    /**
     *
     */
    override func drawFill() {
        var x:CGFloat = graphic.lineOffsetType.left == OffsetType.outside ? graphic.lineStyle!.thickness : 0;
        var y:CGFloat = graphic.lineOffsetType.top == OffsetType.outside ? graphic.lineStyle!.thickness : 0;
        x += getGraphic().x
        y += getGraphic().y
        let rect:CGRect = CGRect(x,y,width, height)
        graphic.path = rect.path
    }
    /**
     *
     */
    override func drawLine(){
        //Swift.print("RectGraphic.drawLine()")
        if(graphic.lineStyle != nil){
            let graphicRect:CGRect = CGRect(0, 0, width, height)
            
            //Swift.print("graphicRect: " + String(graphicRect))
            let rect:CGRect = RectGraphicUtils.offsetRect(graphicRect, graphic.lineStyle!, graphic.lineOffsetType);
            //Swift.print("rect: " + String(rect))
            
            
            
            //drawLine
            
            graphic.linePath = rect.path
            
            
            //lineShape.graphics.drawRect(rect.x, rect.y, rect.width, rect.height);
            //let maskRect:CGRect = RectGraphicUtils.maskRect(CGRect(0,0, graphic.width,graphic.height), graphic.lineStyle!, graphic.lineOffsetType!);
            //draw the mask line
            //lineMask.graphics.drawRect(maskRect.x, maskRect.y, maskRect.width, maskRect.height);
        }
    }
}


/*

func setSize(width:CGFloat,height:CGFloat) {
self.width = width;
self.height = height;
}

*/
