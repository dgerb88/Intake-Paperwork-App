//
//  PDFViewer.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 12/1/21.
//

import SwiftUI
import PDFKit

struct PDFViewer: View {
    
    @EnvironmentObject var model: SurveyModel
    @State var showSheetView = false
    var image: [UIImage]
    var nsDataArray: [NSData]
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                PDFViewUI(image: image)
                    .sheet(isPresented: $showSheetView) {
                    ShareSheet(activityItems: nsDataArray)
            }
                HStack {
                    Button {
                        model.viewSelectionInt = nil
                    } label: {
                        VStack {
                            Image(systemName: "house")
                                .resizable(resizingMode: .tile)
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                            Text("Home")
                                .foregroundColor(.white)
                        }
                    }.padding().padding(.leading, 40)
                    Spacer()
                    Button {
                        showSheetView = true
                    } label: {
                        VStack {
                            Image(systemName: "arrow.up.doc")
                                .resizable(resizingMode: .tile)
                                .frame(width: 22, height: 30)
                                .foregroundColor(.white)
                            Text("Share")
                                .foregroundColor(.white)
                        }
                    }.padding().padding(.trailing, 40)
                    
                }

            }.padding(.top)
        }
    }
}
extension View {
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view

        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)

        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}

struct PDFViewUI : UIViewRepresentable {
    
    var image: [UIImage]


    func makeUIView(context: Context) -> UIView {
        let pdfView = PDFView()
        let newDocument = PDFDocument()
        
        for index in (0..<image.count) {
            let page = PDFPage(image: image[index])
            newDocument.insert(page!, at: index)
        }
        pdfView.document = newDocument
        return pdfView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        // Empty
    }
    
}
