//
//  BackgroundView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/24/21.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Rectangle()
            .aspectRatio(contentMode: .fill)
            .foregroundColor(Color.init(.sRGB, red: 0, green: 0.42745, blue: 0.61961, opacity: 0.9))
            .ignoresSafeArea()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
