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
    
    var body: some View {
        VStack {
            PDFViewUI(image: model.PDFimage)
            Button {
                model.PDFimage.append(MedicalHistoryView().snapshot())
            } label: {
                Text("Push me")
                    .foregroundColor(.black)
            }

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
