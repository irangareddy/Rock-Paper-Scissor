//
//  Constants.swift
//  Rock-Paper-Scissor
//
//  Created by RANGA REDDY NUKALA on 27/08/20.
//

import Foundation
import SwiftUI


import Foundation
import SwiftUI

let kwidth = UIScreen.main.bounds.size.width

struct ImageStyle: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(width: kwidth/2, height: kwidth/2, alignment: .center)
    }
}

struct TitleLabel: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(size: 44, weight:.heavy))
            .font(Font.custom("SF Pro Text", size: 0))
            .padding(.top,20)
    }
}

struct TaglineLabel: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(size: 18, weight: .semibold))
            .font(Font.custom("SF Pro Text", size: 0))
            .multilineTextAlignment(.center)
    }
}


struct SubtitleLabel: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(size: 22, weight: .medium))
            .font(Font.custom("SF Pro Text", size: 0))
            .multilineTextAlignment(.center)
            .padding(.horizontal,20)
            .padding(.vertical,10)
    }
}


extension View {
    public func kImageStyle() -> some View {
        self.modifier(ImageStyle())
    }
    public func kTitleLabel() -> some View {
        self.modifier(TitleLabel())
    }
    public func kSubtitleLabel() -> some View {
        self.modifier(SubtitleLabel())
    }
    public func kTaglineLabel() -> some View {
        self.modifier(TaglineLabel())
    }
}


