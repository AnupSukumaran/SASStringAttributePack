//
//  File.swift
//  
//
//  Created by Manu Puthoor on 28/02/20.
//

import UIKit


public extension NSAttributedString.Key {
    static let myName = NSAttributedString.Key(rawValue: "myCustomAttributeKey")
}

public extension NSMutableAttributedString {
    
    var fontSize:CGFloat { return 17 }
    var boldFont:UIFont { return UIFont(name: "AvenirNext-Bold", size: fontSize) ?? UIFont.boldSystemFont(ofSize: fontSize) }
    var normalFont:UIFont { return UIFont(name: "AvenirNext-Regular", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)}

    func newFontSize(fontName: String = "", _ value:String, fSize: CGFloat) -> NSMutableAttributedString {
        let newboldFont = UIFont(name: fontName, size: fSize) ?? UIFont.boldSystemFont(ofSize: fontSize)
     
        let attributes:[NSAttributedString.Key : Any] = [
            .font : newboldFont
        ]
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }

    func bold(_ value:String) -> NSMutableAttributedString {

        let attributes:[NSAttributedString.Key : Any] = [
            .font : boldFont
        ]

        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }

    func normal(_ value:String) -> NSMutableAttributedString {

        let attributes:[NSAttributedString.Key : Any] = [
            .font : normalFont,
        ]

        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    /* Other styling methods */
    func orangeHighlight(_ value:String) -> NSMutableAttributedString {

        let attributes:[NSAttributedString.Key : Any] = [
            .font :  normalFont,
            .foregroundColor : UIColor.white,
            .backgroundColor : UIColor.orange
        ]

        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }

    func blackHighlight(_ value:String) -> NSMutableAttributedString {

        let attributes:[NSAttributedString.Key : Any] = [
            .font :  normalFont,
            .foregroundColor : UIColor.white,
            .backgroundColor : UIColor.black

        ]

        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }

    func underlined(_ value:String) -> NSMutableAttributedString {

        let attributes:[NSAttributedString.Key : Any] = [
            .font :  normalFont,
            .underlineStyle : NSUnderlineStyle.single.rawValue

        ]

        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
    func strike( withlineThicknessOf: Int) -> NSMutableAttributedString {
            
            self.addAttribute(.strikethroughStyle, value: withlineThicknessOf, range: NSRange(location: 0, length: self.length))
        
            return self
        }
    
    func strike(from:Int,to: Int, withlineThicknessOf: Int) -> NSMutableAttributedString {
        let range = NSRange(location: from, length: to)
        
        self.addAttribute(.strikethroughStyle, value: withlineThicknessOf, range: range)

//        self.append(NSAttributedString(string: self, attributes:attributes))
        return self
    }
    
    func with(color: UIColor) -> NSMutableAttributedString  {
        self.addAttributes([.foregroundColor: color], range: NSRange(location: 0, length: self.length))
        return self
    }
    
    func newAppend(string: String) -> NSMutableAttributedString {
        let attrString = NSAttributedString(string: string)
        self.append(attrString)
        return self
    }
    
    func colorStrings(str1: String, str2: String) -> NSMutableAttributedString {
        let text = NSMutableAttributedString(string: str1)
        let text2 = NSMutableAttributedString(string: str2).with(color: .red)
        text.append(text2)
        
        return text
    }
}
