//
//  SpanDryNeedleView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 1/20/22.
//
import SwiftUI

struct SpanDryNeedleView: View {
    
    @EnvironmentObject var model:SurveyModel
    var survey: Survey
    
    @State var buttonNeedle = [false, false, false, false, false, false, false, false, false]
    @State var signatureNeedle = ""
    @FocusState var keyboardChange: Bool
    @State var showAlert = false
    @State var fillAlert = false 
    
    var spanNeedleView: some View {
        ZStack {
            VStack {
                VStack(alignment: .center) {
                    Text("Consentimiento de Punción Seca Funcional")
                        .bold()
                        .font(.largeTitle)
                        .padding(.bottom, 30)
                }.padding()
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        
                        Text("Consentimiento del paciente para punción seca functional(PSF):")
                            .bold()
                            .font(.title2)
                            .padding(.bottom, 3)
                        Text("Entiendo que no se ha garantizado ni asegurado los resultados de este procedimiento y que es posible que no cure mi afección. Mi terapista también me ha comentado la probabilidad de éxito de este procedimiento, así como la posibilidad de efectos secundarios graves.  Es posible que se requieran/necesiten múltiples sesiones de tratamiento, por lo que este consentimiento cubrirá este tratamiento, así como los tratamientos consecutivos de esta instalación.  He leído y entiendo completamente este formulario de consentimiento y entiendo que no debo firmar este formulario hasta que todos los elementos, incluidas mis preguntas, hayan sido explicados o respondidos satisfactoriamente.  Con mi firma, doy mi consentimiento para la realización de este procedimiento.  También doy mi consentimiento a cualquier medida necesaria para corregir las complicaciones que puedan resultar.")
                            .padding(.bottom)
                            .fixedSize(horizontal: false, vertical: true)
                        Text("Autorización:")
                            .bold()
                            .font(.title2)
                        HStack(alignment: .top) {
                            Button {
                                if buttonNeedle[0] == false {
                                    buttonNeedle[0] = true
                                    buttonNeedle[1] = false
                                }
                                else {
                                    buttonNeedle[0] = false
                                }
                            } label: {
                                if buttonNeedle[0] == false {
                                    Image(systemName: "square")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.black)
                                }
                                else {
                                    Image(systemName: "checkmark.square")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.black)
                                }
                            }.padding(.leading, 5)
                            Text("Por la presente autorizo a \(model.ptName), \(model.ptCredential) a realizar la Punción Seca Funcional durante mi tratamiento.")
                                .padding(.bottom)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        Text("Denegación de servicio del paciente:")
                            .bold()
                            .font(.title2)
                        HStack(alignment: .top) {
                            Button {
                                if buttonNeedle[1] == false {
                                    buttonNeedle[1] = true
                                    buttonNeedle[0] = false
                                }
                                else {
                                    buttonNeedle[1] = false
                                }
                            } label: {
                                if buttonNeedle[1] == false {
                                    Image(systemName: "square")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.black)
                                }
                                else {
                                    Image(systemName: "checkmark.square")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.black)
                                }
                            }.padding(.leading, 5).padding(.top, 3)
                            Text("No doy mi consentimiento para el uso de Punción Seca Functional como parte de mi tratamiento y por la presente rechazo este servicio")
                                .padding(.bottom)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                    VStack(alignment: .leading) {
                        Text("Está embarazada?")
                            .bold()
                            .font(.title3)
                        HStack(alignment: .top) {
                            Button {
                                if buttonNeedle[2] == false {
                                    buttonNeedle[2] = true
                                    buttonNeedle[3] = false
                                    buttonNeedle[4] = false
                                }
                                else {
                                    buttonNeedle[2] = false
                                }
                            } label: {
                                if buttonNeedle[2] == false {
                                    Image(systemName: "square")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.black)
                                }
                                else {
                                    Image(systemName: "checkmark.square")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.black)
                                }
                            }.padding(.leading, 5)
                            Text("Sí").padding(.trailing)
                            Button {
                                if buttonNeedle[3] == false {
                                    buttonNeedle[3] = true
                                    buttonNeedle[2] = false
                                    buttonNeedle[4] = false
                                }
                                else {
                                    buttonNeedle[3] = false
                                }
                            } label: {
                                if buttonNeedle[3] == false {
                                    Image(systemName: "square")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.black)
                                }
                                else {
                                    Image(systemName: "checkmark.square")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.black)
                                }
                            }
                            Text("No").padding(.trailing)
                            Button {
                                if buttonNeedle[4] == false {
                                    buttonNeedle[4] = true
                                    buttonNeedle[2] = false
                                    buttonNeedle[3] = false
                                }
                                else {
                                    buttonNeedle[4] = false
                                }
                            } label: {
                                if buttonNeedle[4] == false {
                                    Image(systemName: "square")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.black)
                                }
                                else {
                                    Image(systemName: "checkmark.square")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.black)
                                }
                            }
                            Text("No aplica")
                        }
                        Text("Está inmunodeprimido?")
                            .bold()
                            .font(.title3)
                        HStack(alignment: .top) {
                            Button {
                                if buttonNeedle[5] == false {
                                    buttonNeedle[5] = true
                                    buttonNeedle[6] = false
                                }
                                else {
                                    buttonNeedle[5] = false
                                }
                            } label: {
                                if buttonNeedle[5] == false {
                                    Image(systemName: "square")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.black)
                                }
                                else {
                                    Image(systemName: "checkmark.square")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.black)
                                }
                            }.padding(.leading, 5)
                            Text("Sí").padding(.trailing)
                            Button {
                                if buttonNeedle[6] == false {
                                    buttonNeedle[6] = true
                                    buttonNeedle[5] = false
                                }
                                else {
                                    buttonNeedle[6] = false
                                }
                            } label: {
                                if buttonNeedle[6] == false {
                                    Image(systemName: "square")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.black)
                                }
                                else {
                                    Image(systemName: "checkmark.square")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.black)
                                }
                            }
                            Text("No").padding(.trailing)
                            
                        }
                        Text("Está tomando anticoagulantes?")
                            .bold()
                            .font(.title3)
                        HStack(alignment: .top) {
                            Button {
                                if buttonNeedle[7] == false {
                                    buttonNeedle[7] = true
                                    buttonNeedle[8] = false
                                }
                                else {
                                    buttonNeedle[7] = false
                                }
                            } label: {
                                if buttonNeedle[7] == false {
                                    Image(systemName: "square")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.black)
                                }
                                else {
                                    Image(systemName: "checkmark.square")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.black)
                                }
                            }.padding(.leading, 5)
                            Text("Sí").padding(.trailing)
                            Button {
                                if buttonNeedle[8] == false {
                                    buttonNeedle[8] = true
                                    buttonNeedle[7] = false
                                }
                                else {
                                    buttonNeedle[8] = false
                                }
                            } label: {
                                if buttonNeedle[8] == false {
                                    Image(systemName: "square")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.black)
                                }
                                else {
                                    Image(systemName: "checkmark.square")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.black)
                                }
                            }
                            Text("No").padding(.trailing)
                            
                        }
                        if signatureNeedle == "" {
                            Text("Firma del paciente/Tutor Legal:")
                                .bold()
                                .font(.title2)
                                .padding(.top, 5)
                                .foregroundColor(.red)
                        }
                        else {
                            Text("Firma del paciente/Tutor Legal:")
                                .bold()
                                .font(.title2)
                                .padding(.top, 5)
                        }
                        HStack {
                                TextField("Firme aquí", text: $signatureNeedle)
                                    .frame(width: 300)
                                    .padding(.leading, 20)
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                    .focused($keyboardChange)

                                Text("Fecha: ")
                                .padding(.leading)
                                Text(Date().addingTimeInterval(600), style: .date)
                                        .padding(.leading)
                        }.padding(.bottom)
                    }
                }.padding(.bottom).padding(.horizontal)
            }
        }.frame(width: UIScreen.main.bounds.width)
    }

    var body: some View {
        ZStack {
            BackgroundView()
            Rectangle()
                .foregroundColor(.white)
                .shadow(radius: 5)
            VStack(spacing: 0) {
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width, height:  1)
                    .padding(.top)
                ScrollView {
                        VStack {
                            spanNeedleView
                                .onDisappear {
                                    let image = spanNeedleView.snapshot()
                                    model.makeAddPdf(image: image)
                            }
                            if signatureNeedle == "" {
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
                                if model.includeSurvey {
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
                                else {
                                    FinishedView(survey: survey)
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
            }.padding(.top)
        }
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            keyboardChange = false
        }
        .padding(.bottom, keyboardChange ? UIScreen.main.bounds.height*3/10 : 0)
        .animation(.easeInOut(duration: 0.3), value: true)
    }
}


