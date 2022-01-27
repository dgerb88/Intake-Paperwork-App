//
//  SpanInsuranceView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 1/20/22.
//

import SwiftUI

struct SpanInsuranceView: View {
    
    @EnvironmentObject var model:SurveyModel
    
    @State var patientNameInsurance = ""
    @State var InsuranceNameInsurance = ["", ""]
    @State var memberIdInsurance = ["", ""]
    @State var groupNumberInsurance = ["", ""]
    @State var signatureInsurance = ""
    @State var buttonInsurance = [false, false, false, false, false, false, false]
    var survey: Survey
    @State var keyboardChange = false
    
    var spanInsuranceView: some View {
        ZStack {
            VStack {
                VStack(alignment: .center) {
                    Text("Información del Seguro")
                        .bold()
                        .font(.largeTitle)
                        .padding(.bottom, 30)
                }.padding()
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        HStack(alignment: .top, spacing: 20) {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Nombre de paciente o tutor legal si paciente es menor:")
                                TextField("Nombre", text: $patientNameInsurance)
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                    .padding(.bottom, 5)
                                Text("Nombre de la compañía de seguros principal:")
                                TextField("Nombre", text: $InsuranceNameInsurance[0])
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                    .padding(.bottom, 5)
                                Text("Identificación de miembro:")
                                TextField("Número", text: $memberIdInsurance[0])
                                    .padding(.bottom, 5)
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                Text("Número de grupo:")
                                TextField("Número", text: $groupNumberInsurance[0])
                                    .padding(.bottom, 5)
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                            }
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Nombre de la compañía de seguros secundaria (si aplica):")
                                TextField("Nombre", text: $InsuranceNameInsurance[1])
                                    .padding(.bottom, 5)
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                Text("Identificación de miembro:")
                                TextField("Número", text: $memberIdInsurance[1])
                                    .padding(.bottom, 5)
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                Text("Número de grupo:")
                                TextField("Número", text: $groupNumberInsurance[1])
                                    .padding(.bottom, 5)
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                            }
                        }
                    }
                    VStack(alignment: .leading) {
                        Text("Formulario de responsabilidad financiera del paciente:")
                            .bold()
                            .font(.title2)
                            .padding(.top, 20)
                            .padding(.bottom, 3)
                        Text("Acuerdo: \(model.clinicName) desea ser lo más transparente posible con respecto a las tarifas por servicios y responsabilidades. Debido a que reconocemos la necesidad de un entendimiento claro entre el paciente y el proveedor médico con respecto a los arreglos financieros para la atención médica, se proporciona la siguiente información para evitar cualquier malentendido sobre la información médica protegida y el pago por servicios profesionales.")
                            .fixedSize(horizontal: false, vertical: true)

                        Text("Formulario de responsabilidad financiera del paciente del seguro -- Consentimientos")
                            .bold()
                            .font(.title2)
                            .padding(.top, 10)
                        Text("Marque la casilla para indicar que entiende lo siguiente:")
                            .bold()
                            .padding(.vertical)
                            .font(.title3)
                        HStack(alignment: .top) {
                            Button {
                                if buttonInsurance[0] == false {
                                    buttonInsurance[0] = true
                                }
                                else {
                                    buttonInsurance[0] = false
                                }
                            } label: {
                                if buttonInsurance[0] == true {
                                    Image(systemName: "checkmark.square")
                                        .font(Font.title2)
                                        .foregroundColor(.black)
                                }
                                else {
                                    Image(systemName: "square")
                                        .font(Font.title2)
                                        .foregroundColor(.black)
                                }
                            }
                            Text("Como cortesía, le enviaremos la factura a su compañía de seguros. Sin embargo, debe entenderse que el contrato es entre usted y su compañía de seguros y usted es totalmente responsable de cualquier monto que no pague.")
                            .fixedSize(horizontal: false, vertical: true)
                        }.padding(.bottom, 10)
                        HStack(alignment: .top) {
                            Button {
                                if buttonInsurance[1] == false {
                                    buttonInsurance[1] = true
                                }
                                else {
                                    buttonInsurance[1] = false
                                }
                            } label: {
                                if buttonInsurance[1] == true {
                                    Image(systemName: "checkmark.square")
                                        .font(Font.title2)
                                        .foregroundColor(.black)
                                }
                                else {
                                    Image(systemName: "square")
                                        .font(Font.title2)
                                        .foregroundColor(.black)
                                }
                            }
                            Text("Nuestra oficina no garantiza que su seguro pague. Algunas compañías de seguros no cubren ciertos tratamientos. Le ayudaremos a hacer todo lo posible por recibir la verificación de su póliza. Si su reclamo es denegado por cualquier motivo, usted es responsable del monto total de su factura.")
                                .fixedSize(horizontal: false, vertical: true)
                        }.padding(.bottom, 10)
                        HStack(alignment: .top) {
                            Button {
                                if buttonInsurance[2] == false {
                                    buttonInsurance[2] = true
                                }
                                else {
                                    buttonInsurance[2] = false
                                }
                            } label: {
                                if buttonInsurance[2] == true {
                                    Image(systemName: "checkmark.square")
                                        .font(Font.title2)
                                        .foregroundColor(.black)
                                }
                                else {
                                    Image(systemName: "square")
                                        .font(Font.title2)
                                        .foregroundColor(.black)
                                }
                            }
                            Text("Nuestra oficina no entrará en disputas con su compañía de seguros por ningún reclamo impago.")
                        }.padding(.bottom, 10)
                        HStack(alignment: .top) {
                            Button {
                                if buttonInsurance[3] == false {
                                    buttonInsurance[3] = true
                                }
                                else {
                                    buttonInsurance[3] = false
                                }
                            } label: {
                                if buttonInsurance[3] == true {
                                    Image(systemName: "checkmark.square")
                                        .font(Font.title2)
                                        .foregroundColor(.black)
                                }
                                else {
                                    Image(systemName: "square")
                                        .font(Font.title2)
                                        .foregroundColor(.black)
                                }
                            }
                            Text("PAGO: Aunque se facturará al seguro, usted es responsable de cualquier saldo después de que el seguro procese su reclamo. Todos los cargos por tratamiento vencen y se pagan sesenta (60) días después de la fecha del servicio. Estos períodos dan tiempo suficiente para procesar el seguro y realizar el pago total de cualquier saldo restante.")
                                .fixedSize(horizontal: false, vertical: true)
                        }.padding(.bottom, 10)
                    }
                    VStack(alignment: .leading) {
                        Text("Acuerdo de pago del seguro:")
                            .bold()
                            .font(.title2)
                            .padding(.top, 10)
                        Text("Entiendo que soy financieramente responsable por el deducible, coseguro o servicio no cubierto de mi seguro médico. Los copagos vencen al momento del servicio. En el caso de que mi plan de salud determine que un servicio \("no es pagadero"), seré responsable del cargo completo y acepto pagar los costos de todos los servicios prestados. En caso de que mi aseguradora no paga todos los gastos médicos incurridos, por la presente autorizo a \(model.clinicName) to automatically charge the credit or debit card on my account for the remaining balance due.")
                            .fixedSize(horizontal: false, vertical: true)

                        Text("Autorización del seguro para la asignación de beneficios:")
                            .bold()
                            .font(.title2)
                            .padding(.top, 10)
                        Text("Por la presente autorizo y dirijo el pago de mis beneficios médicos a \(model.clinicName) en mi nombre por cualquier servicio que me proporcionen los proveedores.")
                            .fixedSize(horizontal: false, vertical: true)
                        Text("Autorización para divulgar registros:")
                            .bold()
                            .font(.title2)
                            .padding(.top, 10)
                        Text("Por la presente autorizo a \(model.clinicName) a divulgar a mi aseguradora, agencias gubernamentales o cualquier otra entidad financieramente responsable de mi atención médica, toda la información, incluido el diagnóstico y los registros de cualquier tratamiento o examen que se me haya prestado para justificar el pago de dichos servicios médicos. así como la información requerida para la precertificación, autorización o derivación a otro proveedor médico.")
                            .fixedSize(horizontal: false, vertical: true)
                        Text("He leído y comprendo estas políticas y mi responsabilidad con respecto a la pago de estos servicios.")
                            .bold()
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.title3)
                            .padding(.vertical, 10)
                        if signatureInsurance == "" {
                            Text("Firma del PACIENTE o TUTOR LEGAL:")
                                .foregroundColor(.red)
                        }
                        else {
                            Text("Firma del PACIENTE o TUTOR LEGAL:")
                                .foregroundColor(.black)
                        }
                        HStack {
                            TextField("Firme aquí", text: $signatureInsurance)
                                .padding(.bottom, 5)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                                .frame(width: 300)
                                .onTapGesture {
                                    keyboardChange = true
                                }
                            Text("Fecha: ")
                                .padding(.leading)
                            Text(Date().addingTimeInterval(600), style: .date)
                                    .padding(.leading)
                            
                        }
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
                        spanInsuranceView
                            .onDisappear {
                                model.pageCount += 1
                                let image = spanInsuranceView.snapshot()
                                model.PDFimage.append(image)
                                model.PDFfile = model.createPDF(image: image)
                                model.PDFfileArray.append(model.PDFfile!)
                            }
                        NavigationLink {
                            if model.showInfoAndPolicies == true && model.includeInformationAndPolicies == true {
                                SpanInfoView(survey: survey)
                            }
                            else if model.showPrivacyPolicy == true && model.includePrivacyPolicy == true {
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
                        }.navigationBarBackButtonHidden(model.pageCount == 1 ? false:true)
                    }
                }
            }
        }.onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            keyboardChange = false
        }
        .padding(.bottom, keyboardChange ? UIScreen.main.bounds.height*3/10 : 0)
        .animation(.easeOut(duration: 0.3))
    }
}


