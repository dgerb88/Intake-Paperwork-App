//
//  SpanPrivacyPolicyView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 1/20/22.
//

import SwiftUI

struct SpanPrivacyPolicyView: View {
    
    @EnvironmentObject var model: SurveyModel
    @State var signaturePrivate = ""
    @State var buttonPrivate = [false, false]
    var survey: Survey
    @State var showAlert = false
    @State var fillAlert = false 
    
    var spanPrivacyView: some View {
        ZStack {
            VStack {
                VStack(alignment: .center) {
                    Text("Aviso de Prácticas de Privacidad")
                        .bold()
                        .font(.largeTitle)
                        .padding(.bottom, 30)
                }.padding()
                VStack(alignment: .leading) {
                    Text("Reconocimiento:")
                        .bold()
                        .font(.title2)
                        .padding(.bottom, 10)
                    HStack(alignment: .top) {
                        Button {
                            if buttonPrivate[0] == false {
                                buttonPrivate[0] = true
                            }
                            else {
                                buttonPrivate[0] = false
                            }
                        } label: {
                            if buttonPrivate[0] == false {
                                Image(systemName: "square")
                                    .padding(.trailing, 3)
                                    .foregroundColor(.black)
                            }
                            else {
                                Image(systemName: "checkmark.square")
                                    .padding(.trailing, 3)
                                    .foregroundColor(.black)
                            }
                        }
                        
                        Text("He recibido, leído y entendido completamente el Aviso de prácticas de privacidad para fisioterapia de \(model.clinicName). Entiendo que \(model.clinicName) puede usar o divulgar mi información de salud personal con el fin de realizar un tratamiento, obtener el pago, evaluar la calidad del servicio prestado y cualquier operación administrativa relacionada con el tratamiento o el pago.  Entiendo que tengo derecho a solicitar restricciones, por escrito, con respecto a cómo se usa y divulga mi información médica personal para el tratamiento, pago, y operaciones administrativas.  También entiendo que \(model.clinicName) considerará las solicitudes de restricciones caso por caso, pero no está obligada a cumplir con dichas solicitudes.")
                            .fixedSize(horizontal: false, vertical: true)
                    }.padding(.bottom)
                    Text("Consentimiento:")
                        .bold()
                        .font(.title2)
                        .padding(.bottom, 10)
                    HStack(alignment: .top) {
                        Button {
                            if buttonPrivate[1] == false {
                                buttonPrivate[1] = true
                            }
                            else {
                                buttonPrivate[1] = false
                            }
                        } label: {
                            if buttonPrivate[1] == false {
                                Image(systemName: "square")
                                    .padding(.trailing, 3)
                                    .foregroundColor(.black)
                            }
                            else {
                                Image(systemName: "checkmark.square")
                                    .padding(.trailing, 3)
                                    .foregroundColor(.black)
                            }
                        }

                        Text("Por la presente doy mi consentimiento para que \(model.clinicName) use y divulge información médica protegida (PHI) sobra mí para llevar a cabo operaciones de tratamiento, pago, y atención médica.  Entiendo que me reservo el derecho de revocar este consentimiento notificando a la práctica por escrito en cualquier momento, momento en el cual \(model.clinicName) tiene 30 días para responder a mi solicitud.")
                            .fixedSize(horizontal: false, vertical: true)
                    }.padding(.bottom)
                    if signaturePrivate == "" {
                        Text("Firma del Paciente/Tutor Legal:")
                            .bold()
                            .font(.title2)
                            .padding(.top, 5)
                            .foregroundColor(.red)
                    }
                    else {
                        Text("Firma del Paciente/Tutor Legal:")
                            .bold()
                            .font(.title2)
                            .padding(.top, 5)
                    }
                    HStack {
                            TextField("Firme aquí", text: $signaturePrivate)
                                .frame(width: 300)
                                .padding(.leading, 20)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                            Text("Fecha: ")
                            .padding(.leading)
                            Text(Date().addingTimeInterval(600), style: .date)
                                    .padding(.leading)
                    }
                }.padding(.bottom).padding(.horizontal)
            }
        }.frame(width: UIScreen.main.bounds.width)
    }

    
    var body: some View {
        ZStack {
            BackgroundView()
            ScrollView {
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        .shadow(radius: 5)
                    VStack {
                        spanPrivacyView.onDisappear {
                            let image = spanPrivacyView.snapshot()
                            model.PDFimage.append(image)
                            model.PDFfile = model.createPDF(image: image)
                            model.PDFfileArray.append(model.PDFfile!)
                        }
                        if signaturePrivate == "" {
                            Button {
                                fillAlert = true
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.green)
                                        .frame(height: 48)
                                        .cornerRadius(10)
                                        .shadow(radius: 1)
                                    Text("Próximo")
                                        .foregroundColor(.white)
                                        .font(.title)
                                        .bold()
                                }.padding().padding(.bottom)
                            }.alert(isPresented: $fillAlert) {
                                Alert(title: Text("El favor de firmar las areas rojas antes de ir a la próxima sección."), dismissButton: .cancel(Text("Confirmar")))
                            }
                            .navigationBarBackButtonHidden(true)
                            .navigationBarTitleDisplayMode(.inline)
                            .toolbar {
                                ToolbarItem(placement: .navigationBarLeading) {
                                    Button {
                                        showAlert = true
                                    } label: {
                                        Image(systemName: "house")
                                            .resizable(resizingMode: .tile)
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(.white)
                                            .padding(.vertical, 20)
                                    }.alert(isPresented: $showAlert) {
                                        Alert(
                                           title: Text("Seguro que quieres volver a la pantalla de inicio? Tu progreso serà perdido."),
                                           primaryButton: .destructive(Text("Vuelve a la pantalla de inicio.")) {
                                               model.viewSelectionInt = nil
                                           },
                                           secondaryButton: .cancel(Text("Cancelar"))
                                           
                                        )
                                    }
                                }
                            }

                        }
                        else {
                        NavigationLink {
                            if model.showDryNeedling == true && model.includeDryNeedlingConsent == true {
                                SpanDryNeedleView(survey: survey)
                            }
                            else {
                                if survey.name == "LEFS" {
                                    LefsView(survey: survey)
                                }
                                else if survey.name == "Back Index" {
                                    BackIndexView(survey: survey)
                                }
                                else if survey.name == "QuickDash" && survey.language == "English" {
                                    QuickDashEngView(survey: survey)
                                }
                                else if survey.name == "QuickDash" && survey.language == "Spanish" {
                                    QuickDashSpanView(survey: survey)
                                }
                                else if survey.name == "Neck Disability Index" {
                                    NDIView(survey: survey)
                                }
                                else {
                                    Text("Survey not found")
                                }
                            }
                        } label: {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.green)
                                    .frame(height: 48)
                                    .cornerRadius(10)
                                    .shadow(radius: 1)
                                Text("Próximo")
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .bold()
                            }.padding().padding(.bottom)
                        }.navigationBarBackButtonHidden(true)
                            .navigationBarTitleDisplayMode(.inline)
                            .toolbar {
                                ToolbarItem(placement: .navigationBarLeading) {
                                    Button {
                                        showAlert = true
                                    } label: {
                                        Image(systemName: "house")
                                            .resizable(resizingMode: .tile)
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(.white)
                                            .padding(.vertical, 20)
                                    }.alert(isPresented: $showAlert) {
                                        Alert(
                                           title: Text("Seguro que quieres volver a la pantalla de inicio? Tu progreso serà perdido."),
                                           primaryButton: .destructive(Text("Vuelve a la pantalla de inicio.")) {
                                               model.viewSelectionInt = nil
                                           },
                                           secondaryButton: .cancel(Text("Cancelar"))
                                           
                                        )
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
    }
}

