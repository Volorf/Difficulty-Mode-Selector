import SwiftUI

extension Font {
    static func robotoFlex(size: CGFloat, slant: CGFloat = 0, weight: CGFloat = 0) -> Font {
        let descriptor = UIFontDescriptor(fontAttributes: [
            .name: "Roboto Flex",
            kCTFontVariationAttribute as UIFontDescriptor.AttributeName: [
                /* 'wght' */ 0x77676874: weight,
                /* 'slnt' */ 0x736c6e74: slant
            ]
        ])
        
        return Font(UIFont(descriptor: descriptor, size: size))
    }
    
    static func inter(size: CGFloat, slant: CGFloat = 0, weight: CGFloat = 0) -> Font {
        let descriptor = UIFontDescriptor(fontAttributes: [
            .name: "Inter",
            kCTFontVariationAttribute as UIFontDescriptor.AttributeName: [
                /* 'wght' */ 0x77676874: weight,
                /* 'slnt' */ 0x736c6e74: slant
            ]
        ])
        
        return Font(UIFont(descriptor: descriptor, size: size))
    }
}
