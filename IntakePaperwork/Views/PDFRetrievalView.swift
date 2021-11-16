//
//  PDFRetrievalView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 11/16/21.
//

import SwiftUI

struct PDFRetrievalView: View {
    var body: some View {
        ZStack {
            BackgroundView()
                .frame(width: UIScreen.main.bounds.width)
            ZStack {
                Rectangle()
                    .foregroundColor(.white)
                VStack {
                    Text("Retrieve some stuff here")
                }
            }.padding(.top)
        }.navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Saved PDF's")
                        .bold()
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
            }

    }
}

struct PDFRetrievalView_Previews: PreviewProvider {
    static var previews: some View {
        PDFRetrievalView()
    }
}
