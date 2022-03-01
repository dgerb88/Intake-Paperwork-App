//
//  SpanInfoView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 1/20/22.
//

import SwiftUI

struct SpanInfoView: View {
    
    @EnvironmentObject var model:SurveyModel
    var survey: Survey
    @State var buttonInfo = [false, false, false, false, false]
    @State var signaturesInfo = ["", ""]
    @State var ContactNameInfo = ""
    @State var ContactPhoneNumberInfo = ""
    @State var ContactRelationInfo = ""
    @State var EmailAddressInfo = ""
    @State var keyboardChange = false
    @State var personalNumber = ""
    @State var personalAddress = ""
    @State var reminderType = 0
    @State var birthDay = ""

    var spanInfoView: some View {
        ZStack {
            VStack {
                VStack(alignment: .center) {
                    Text("Información y políticas importantes")
                        .bold()
                        .font(.largeTitle)
                        .padding(.bottom, 30)
                }.padding()
                VStack(alignment: .leading) {
                    
                    Text("Por favor llene completamente este formulario. Toda la información se mantiene completamente confidencial. Esta información es necesaria para brindarle el tratamiento más efectivo para su caso personal. ")
                        .bold()
                    HStack(alignment: .top, spacing: 30) {
                        VStack(alignment: .leading) {
                            Text("Nombre:")
                                .padding(.top, 10)
                            TextField("Tu nombre", text: $model.personalName)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                            Text("Fecha de nacimiento:")
                                .padding(.top, 10)
                            TextField("Fecha", text: $birthDay)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                            Text("Número de teléfono: ")
                                .padding(.top, 10)
                            TextField("Tu número", text: $personalNumber)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                            Text("Dirección de casa")
                                .padding(.top, 10)
                            TextField("Tu dirección", text: $personalAddress)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                            Text("Correo electrónico: ")
                                .padding(.top, 10)
                            TextField("Tu correo electrónico", text: $EmailAddressInfo)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                        }.padding(.trailing, 30)
                        VStack(alignment: .leading) {
                            Text("Nombre del contacto de emergencia: ")
                                .padding(.top, 10)
                            TextField("Nombre", text: $ContactNameInfo)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                            Text("Número de teléfono de contacto de emergencia: ")
                                .padding(.top, 10)
                                .fixedSize(horizontal: false, vertical: true)
                            TextField("Número", text: $ContactPhoneNumberInfo)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                            Text("Relación de contacto de emergencia con el/la paciente: ")
                                .padding(.top, 10)
                                .fixedSize(horizontal: false, vertical: true)
                            TextField("Relación", text: $ContactRelationInfo)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                            Text("¿Cómo le gustaría recibir recordatorios de citas?")
                                .padding(.top, 10)
                                .fixedSize(horizontal: false, vertical: true)
                            Picker("", selection: $reminderType) {
                                Text("Llamar").tag(3)
                                Text("Correo electrónico").tag(2)
                                Text("Texto").tag(1)
                                Text("Por favor selecciona").tag(0)
                            }
                            .pickerStyle(MenuPickerStyle())
                            .padding(.leading)
                            .accentColor(.blue)
                        }
                        
                    }.padding(.bottom)
                }.padding(.horizontal)
                VStack(alignment: .leading) {
                    Text("Reglas y políticas importantes:")
                        .bold()
                        .font(.title)
                        .padding(.top, 20)
                        .padding(.bottom, 10)
                    Text("Marque la casilla mientras lee lo siguiente:")
                        .bold()
                        .padding(.bottom)
                        .font(.title3)
                    VStack(alignment: .leading, spacing: 10) {
                        HStack(alignment: .top) {
                            Button {
                                if buttonInfo[0] == false {
                                    buttonInfo[0] = true
                                }
                                else {
                                    buttonInfo[0] = false
                                }
                            } label: {
                                if buttonInfo[0] == false {
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
                            Text("1. Política de retrasos: si llega más de 10 minutos tarde a su cita, es posible que se le cambie la fecha o se le pida que espere hasta el próximo horario disponible.")
                        }
                        HStack(alignment: .top) {
                            Button {
                                if buttonInfo[1] == false {
                                    buttonInfo[1] = true
                                }
                                else {
                                    buttonInfo[1] = false
                                }
                            } label: {
                                if buttonInfo[1] == false {
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
                            Text("2. Política de cancelación / no presentación: llame a nuestra oficina si no puede asistir a una cita ya programada. Se requiere un aviso con 24 horas de anticipación para cambios en su cita. Si avisa con menos de 24 horas de anticipación sobre los cambios en las citas, se agregará a su cuenta una tarifa de cancelación tardía de $\(model.cancelFee). Si no llama o no se presenta para una cita, se agregará a su cuenta una tarifa de $\(model.noShowFee) por NO PRESENTARSE.")
                        }
                        HStack(alignment: .top) {
                            Button {
                                if buttonInfo[2] == false {
                                    buttonInfo[2] = true
                                }
                                else {
                                    buttonInfo[2] = false
                                }
                            } label: {
                                if buttonInfo[2] == false {
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
                            Text("3. Los copagos y / o deducibles vencen antes de cada sesión de tratamiento.")
                        }
                        HStack(alignment: .top) {
                            Button {
                                if buttonInfo[3] == false {
                                    buttonInfo[3] = true
                                }
                                else {
                                    buttonInfo[3] = false
                                }
                            } label: {
                                if buttonInfo[3] == false {
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
                            Text("4. Si tiene alguna dificultad económica, notifíquenos de inmediato para que podamos crear un programa de pago que sea factible.")
                        }
                        HStack(alignment: .top) {
                            Button {
                                if buttonInfo[4] == false {
                                    buttonInfo[4] = true
                                }
                                else {
                                    buttonInfo[4] = false
                                }
                            } label: {
                                if buttonInfo[4] == false {
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
                            Text("5. Si por alguna razón no está satisfecho con la atención recibida, llámenos al \(model.phoneNumber) para que podamos resolver cualquier problema.")
                        }
                    }.padding(.horizontal)
                }.padding(.horizontal)

                VStack(alignment: .leading) {
                    Text("CONSENTIMIENTO PARA EVALUACIÓN Y TRATAMIENTO DE TERAPIA FÍSICA:")
                        .bold()
                        .padding(.top)
                        .padding(.bottom, 5)
                        .font(.title3)
                    Text("Al firmar a continuación, doy mi consentimiento para la evaluación y el tratamiento de mi afección por parte de un fisioterapeuta autorizado empleado por \(model.clinicName). El fisioterapeuta explicará la naturaleza y los propósitos de estos procedimientos, la evaluación y el curso del tratamiento. El fisioterapeuta me informará de los beneficios y complicaciones esperados, y las molestias y riesgos que puedan surgir, así como las alternativas al tratamiento propuesto y los riesgos y consecuencias de no recibir tratamiento.")
                    if signaturesInfo[0] == "" {
                        Text("Firma del PACIENTE o TUTOR LEGAL:")
                            .bold()
                            .padding(.top, 10)
                            .padding(.bottom, 5)
                            .foregroundColor(.red)
                    }
                    else {
                        Text("Firma del PACIENTE o TUTOR LEGAL:")
                            .bold()
                            .padding(.top, 10)
                            .padding(.bottom, 5)
                            .foregroundColor(.black)
                    }
                    HStack {
                        TextField("Firme aquí", text: $signaturesInfo[0])
                            .frame(width: 300)
                            .padding(.leading, 20)
                            .accentColor(.black)
                            .textFieldStyle(.roundedBorder)
                        Text("Fecha: ")
                            .padding(.leading)
                        Text(Date().addingTimeInterval(600), style: .date)
                                .padding(.leading)
                        
                        
                    }
                    Text("Descargo de Responsabilidad:")
                        .bold()
                        .padding(.top)
                        .padding(.bottom, 5)
                        .font(.title3)
                    Text("Entiendo y reconozco plenamente que (a) las actividades en las que participaré como parte del tratamiento proporcionado por \(model.clinicName) y las actividades y el equipo de fisioterapia que puedo usar como parte de ese tratamiento tienen riesgos, peligros y peligros inherentes y tal existe en mi uso de cualquier equipo y mi participación en estas actividades; (b) mi participación en dichas actividades y / o el uso de dicho equipo puede resultar en lesiones o enfermedades que incluyen, entre otras, lesiones corporales, enfermedades, distensiones, fracturas, parálisis parcial y / o total, muerte u otras dolencias que podrían causar discapacidad grave; (c) estos riesgos y peligros pueden ser causados ​​por la negligencia de los representantes o empleados de \(model.clinicName), y cualquier otra entidad, persona o asociado, la negligencia de los participantes, la negligencia de otros, accidentes, incumplimientos de contrato, u otras causas. Por mi participación en estas actividades y por el uso de equipos, por la presente asumo todos los riesgos y peligros y toda la responsabilidad por cualquier pérdida y / o daño causado en todo o en parte por la negligencia o la conducta de los representantes o empleados de \(model.clinicName), o por cualquier otra persona. Yo, en mi nombre, mis representantes personales y mis herederos, por la presente acepto voluntariamente liberar, renunciar, despedir, eximir de responsabilidad, defender e indemnizar a \(model.clinicName) y a sus representantes, empleados y cesionarios de todas y cada una de las demandas, acciones o pérdidas por lesiones corporales, daños a la propiedad, muerte por negligencia, pérdida de servicios o de otro tipo que puedan surgir de mi uso de cualquier equipo o participación en estas actividades. Entiendo específicamente que estoy liberando, descargando y renunciando a cualquier reclamo o acción que pueda tener en el presente o en el futuro por los actos negligentes u otra conducta de los representantes o empleados de \(model.clinicName).")
                        .fixedSize(horizontal: false, vertical: true)
                    Text("AL FIRMAR A CONTINUACIÓN, ESTÁ CONFIRMANDO LO SIGUIENTE:")
                        .bold()
                        .padding(.vertical, 5)
                    Text("“HE LEÍDO LA RENUNCIA Y LIBERACIÓN ANTERIORES Y AL FIRMARLO ACEPTO. ES MI INTENCIÓN EXENTAR Y ALIVIAR A \(model.clinicName.uppercased()) DE RESPONSABILIDAD POR LESIONES PERSONALES, DAÑOS A LA PROPIEDAD O MUERTE INJUSTA CAUSADA POR NEGLIGENCIA O CUALQUIER OTRA CAUSA.”")
                    if signaturesInfo[1] == "" {
                        Text("Firma del PACIENTE o TUTOR LEGAL:")
                            .bold()
                            .padding(.top, 10)
                            .padding(.bottom, 5)
                            .foregroundColor(.red)
                    }
                    else {
                        Text("Firma del PACIENTE o TUTOR LEGAL:")
                            .bold()
                            .padding(.top, 10)
                            .padding(.bottom, 5)
                            .foregroundColor(.black)
                    }
                    HStack {
                            TextField("Firme aquí", text: $signaturesInfo[1])
                                .frame(width: 300)
                                .padding(.leading, 20)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                                .onTapGesture {
                                    keyboardChange = true
                                }
                            Text("Fecha: ")
                                .padding(.leading)
                            Text(Date().addingTimeInterval(600), style: .date)
                                    .padding(.leading)
                            
                        
                    }.padding(.bottom)
                }.padding(.horizontal).padding(.bottom)
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
                        spanInfoView
                            .onDisappear {
                                let image = spanInfoView.snapshot()
                                model.PDFimage.append(image)
                                model.PDFfile = model.createPDF(image: image)
                                model.PDFfileArray.append(model.PDFfile!)
                            }
                        NavigationLink {
                            if model.showPrivacyPolicy == true && model.includePrivacyPolicy == true {
                                SpanPrivacyPolicyView(survey: survey)
                            }
                            else if model.showDryNeedling == true && model.includeDryNeedlingConsent == true {
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
                    }
                }
            }
        }
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            keyboardChange = false
        }
        .padding(.bottom, keyboardChange ? UIScreen.main.bounds.height*3/10 : 0)
        .animation(.easeOut(duration: 0.3))
    }
}


