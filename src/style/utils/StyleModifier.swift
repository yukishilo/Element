import Foundation
class StyleModifier {
    /**
     * Clones a style
     * CSSParser.as, StyleHeritageResolver.as uses this function
     * // :TODO: explain what newSelectors does
     */
    class func clone(style:IStyle, _ newName:String? = nil)->IStyle{
        let returnStyle:IStyle = Style(newName ?? style.name);
        for styleProperty : IStyleProperty in style.styleProperties{
            returnStyle.addStyleProperty(StyleProperty(styleProperty.name, styleProperty.value));
        }
        return returnStyle;
    }
    /**
    *
    */
    class func overrideStyleProperty(inout style:IStyle, _ styleProperty:IStyleProperty){// :TODO: argument should only be a styleProperty
        let stylePropertiesLength:Int = style.styleProperties.count;
        for (var i:Int=0; i<stylePropertiesLength; i++) { // :TODO: use fore each
            if((style.styleProperties[i] as IStyleProperty).name == styleProperty.name){
                style.styleProperties[i] = styleProperty;
                break//was return
            }
        }
        Swift.print("\(String(style))"+" PROPERTY BY THE NAME OF "+styleProperty.name+" WAS NOT FOUND IN THE PROPERTIES ")//this should throw error
    }
    
    /**
    * Combines @param a and @param b
    * @Note: if similar styleProperties are found @param b takes precedence
    * TODO: you can speed this method up by looping with a  better algo. dont check already checked b's etc
    * TODO: maybe use map or filter to speed this up?
    */
    class func combine(inout a:IStyle,_ b:IStyle){
        let aLength:Int = a.styleProperties.count
        let bLength:Int = b.styleProperties.count
        for (var i:Int=0; i < aLength; i++) {
            let stylePropA : IStyleProperty = a.styleProperties[i]
            for (var e:Int=0; e < bLength; e++) {
                let stylePropB : IStyleProperty = b.styleProperties[e]
                if(stylePropA.name == stylePropB.name){
                    a.styleProperties[i] = stylePropB
                }else{
                    StyleModifier.append(&a,stylePropB)
                }
            }
        }
    }
    /**
    *
    */
    class func merge(){
        //see old code
    }
    /**
    * Adds @param styleProperty to the end of the @param style.styleProperties array
    * @Note will throw an error if a styleProperty with the same name is allready added
    */
    class func append(inout style:IStyle,_ styleProperty:IStyleProperty){
        for styleProp:IStyleProperty in style.styleProperties{
            if(styleProp.name == styleProperty.name) {
                Swift.print(String(style) + " STYLE PROPERTY BY THE NAME OF " + styleProperty.name + " IS ALREADY IN THE _styleProperties ARRAY: " + styleProperty.name)//checks if there is no duplicates in the list
            }
        }
        style.styleProperties.append(styleProperty)
    }
}

