import Foundation
/*
* // :FIXME: should be able to return an empty skin, sometimes an empty skin is what you want
* // :TODO: use Vector<String> for speed etc?
*/
class SkinResolver{
    /**
     *  Returns a Skin instance
     * // :TODO: future additions? //resolveSkinFromStylabaleParents(stylable) || resolveSkinByClass(stylable) || resolveSkinBySuperClass(stylable) || resolveSkinByDeafultStyling(stylable)
     * 	   enable these additions when you have more controll over the Aurora FrameWork for now you need to throw error to debug
     */
    class func skin(element:IElement)->ISkin?{
        let style:IStyle = StyleResolver.style(element);
        //			trace("style: " + style);
        let skinName:String = style.getValue("skin") as? String ?? Utils.skinName(element);
        Swift.print(skinName)
        //return SkinManager.getInstance().getSkinInstance(skinName,element,style) || resolveError(style,element);
        
        return nil
    }
}

private class Utils{
    /**
    * Returns a skin name based on what class type the element parent is
    */
    class func skinName(element:IElement)->String {
        var skinName:String;
        switch element.getClassType(){
            case "Text":skinName = SkinFactory.textSkin
            default:skinName = SkinFactory.graphicsSkin
        }
        return skinName;
    }
}