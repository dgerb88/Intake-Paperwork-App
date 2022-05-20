//
//  SpanishMedView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 1/17/22.
//

import SwiftUI

struct SpanishMedView: View {
    
    @EnvironmentObject var model:SurveyModel
    var survey: Survey

    @State var primaryReason = ""
    @State var primaryReasonOther = ""
    @State var dateProblemStarted = ""
    @State private var button = [false, false, false, false, false, false, false, false, false, false, false]
    @State var button2 = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    @State var diagnosticTesting = ""
    @State var secondReason = ""
    @State var historyCondition = "Historia"
    @State var dateSurgery = ""
    @State var typeSurgery = ""
    @State var dateNextDoc = ""
    @State var PTin12 = ""
    @State var weeksPregnant = ""
    @State var otherConditions = ""
    @State var medicationsList = "Enumere"
    @State var occupation = ""
    @State var button3 = [false, false, false]
    @State var workRestrictions = ""
    @State var workDuties = "Tareas laborales"
    @State var button4 = [false, false]
    @State var timesFallen = ""
    @State var reasonFall = ""
    @State var button5 = [false, false]
    @State var keyboardChange = false
    @State var showAlert = false
    
    var spanMedView: some View {
        ZStack {
            VStack {
                VStack(alignment: .center) {
                    Text("Historial Médico")
                        .bold()
                        .font(.largeTitle)
                        .padding(.bottom, 30)
                }
                HStack(alignment: .top, spacing: 40) {
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text("Razón principal de la visita:")
                                .font(Font.title3.weight(.bold))
                            TextField("Razón", text: $primaryReason)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                                .frame(width: 350)
                            Text("Fecha en que comenzó la condición:")
                                .font(Font.title3.weight(.bold))
                                .padding(.top)
                            TextField("MM/DD/YYYY", text: $dateProblemStarted)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                                .padding(.bottom, 5)
                                .frame(width: 140)
                                .keyboardType(.numberPad)
                        }
                        VStack(alignment: .leading) {
                            Text("¿Es esta una lesión relacionada con el trabajo?")
                                .font(Font.title3.weight(.bold))
                                .padding(.top)
                                .fixedSize(horizontal: false, vertical: true)
                            HStack {
                                Button {
                                    if button[0] == false {
                                        button[0] = true
                                        button[1] = false
                                    }
                                } label: {
                                    if button[0] == true {
                                        Image(systemName: "checkmark.square")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                        Text("Sí")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                    }
                                    else {
                                        Image(systemName: "square")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                        Text("Sí")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                    }
                                }
                                Button {
                                    if button[1] == false {
                                        button[1] = true
                                        button[0] = false
                                    }
                                } label: {
                                    if button[1] == true {
                                        Image(systemName: "checkmark.square")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                        Text("No")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                    }
                                    else {
                                        Image(systemName: "square")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                        Text("No")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                    }
                                }
                            }.padding(.top, 5)
                        }
                        VStack(alignment: .leading) {
                            Text("Fecha de la cirugía (si aplica):")
                                .font(Font.title3.weight(.bold))
                                .padding(.top)
                            TextField("MM/DD/YYYY", text: $dateSurgery)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                                .padding(.bottom, 5)
                                .frame(width: 140)
                                .keyboardType(.numberPad)
                            if dateSurgery != "" {
                                Text("Tipo de cirugía:")
                                    .font(Font.title3.weight(.bold))
                                    .padding(.top)
                                TextField("Tipo", text: $typeSurgery)
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                    .frame(width: 350)
                            }
                            Text("Fecha de la próxima cita con el médico para esta afección:")
                                .font(Font.title3.weight(.bold))
                                .padding(.top)
                                .fixedSize(horizontal: false, vertical: true)
                            TextField("MM/DD/YYYY", text: $dateNextDoc)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                                .padding(.bottom, 5)
                                .frame(width: 140)
                                .keyboardType(.numberPad)
                        }
                        VStack(alignment: .leading) {
                            Text("¿Ha tenido alguna prueba de diagnóstico relacionada con esta condición? (por ejemplo: rayos X, resonancia magnética, o ultrasonido")
                                .font(Font.title3.weight(.bold))
                                .fixedSize(horizontal: false, vertical: true)
                            HStack {
                                Button {
                                    if button[2] == false {
                                        button[2] = true
                                        button[3] = false
                                    }
                                } label: {
                                    if button[2] == true {
                                        Image(systemName: "checkmark.square")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                        Text("Sí")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                    }
                                    else {
                                        Image(systemName: "square")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                        Text("Sí")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                    }
                                }
                                Button {
                                    if button[3] == false {
                                        button[3] = true
                                        button[2] = false
                                    }
                                } label: {
                                    if button[3] == true {
                                        Image(systemName: "checkmark.square")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                        Text("No")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                    }
                                    else {
                                        Image(systemName: "square")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                        Text("No")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                    }
                                }
                            }.padding(.vertical, 5)
                            if button[2] {
                                Text("¿Cuales fueron los resultados?")
                                TextField("Resultados", text: $diagnosticTesting)
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                    .frame(width: 350)
                            }
                        }
                    }
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text("Razón secundaria de la visita(si aplica):")
                                .padding(.bottom, 5)
                                .font(Font.title3.weight(.bold))
                                .fixedSize(horizontal: false, vertical: true)
                            TextField("Razón", text: $secondReason)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                                .frame(width: 350)
                            Text("Describa el inicio y la historia de la condición actual:")
                                .padding(.top)
                                .padding(.bottom, 5)
                                .font(Font.title3.weight(.bold))
                                .fixedSize(horizontal: false, vertical: true)
                            TextEditor(text: $historyCondition)
                                .foregroundColor(historyCondition == "Historia" ? Color.gray.opacity(0.5) : .black)
                                .frame(width: 350, height: 75)
                                .border(Color.init(.sRGB, red: 0.92941, green: 0.92941, blue: 0.92941, opacity: 1), width: 1)
                                .onTapGesture {
                                    if historyCondition == "Historia" {
                                        historyCondition = ""
                                    }
                                }
                        }
                        VStack(alignment: .leading) {
                            Text("¿Ha recibido fisioterapia en los últimos 12 meses?")
                                .padding(.top)
                                .padding(.bottom, 5)
                                .font(Font.title3.weight(.bold))
                                .fixedSize(horizontal: false, vertical: true)
                            HStack {
                                Button {
                                    if button[4] == false {
                                        button[4] = true
                                        button[5] = false
                                    }
                                } label: {
                                    if button[4] == true {
                                        Image(systemName: "checkmark.square")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                        Text("Sí")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                    }
                                    else {
                                        Image(systemName: "square")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                        Text("Sí")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                    }
                                }
                                Button {
                                    if button[5] == false {
                                        button[5] = true
                                        button[4] = false
                                    }
                                } label: {
                                    if button[5] == true {
                                        Image(systemName: "checkmark.square")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                        Text("No")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                    }
                                    else {
                                        Image(systemName: "square")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                        Text("No")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                    }
                                }
                            }.padding(.vertical, 5)
                            if button[4] {
                                Text("¿Para que condición?")
                                    .padding(.vertical, 5)
                                TextField("Reason", text: $PTin12)
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                    .frame(width: 350)
                            }
                            Text("¿Tiene marcapasos?")
                                .padding(.top)
                                .padding(.bottom, 5)
                                .font(Font.title3.weight(.bold))
                            HStack {
                                Button {
                                    if button[6] == false {
                                        button[6] = true
                                        button[7] = false
                                    }
                                } label: {
                                    if button[6] == true {
                                        Image(systemName: "checkmark.square")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                        Text("Sí")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                    }
                                    else {
                                        Image(systemName: "square")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                        Text("Sí")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                    }
                                }
                                Button {
                                    if button[7] == false {
                                        button[7] = true
                                        button[6] = false
                                    }
                                } label: {
                                    if button[7] == true {
                                        Image(systemName: "checkmark.square")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                        Text("No")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                    }
                                    else {
                                        Image(systemName: "square")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                        Text("No")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                    }
                                }
                            }.padding(.vertical, 5)
                            Text("¿Está embarazada?")
                                .padding(.top)
                                .padding(.bottom, 5)
                                .font(Font.title3.weight(.bold))
                            HStack {
                                Button {
                                    if button[8] == false {
                                        button[8] = true
                                        button[9] = false
                                        button[10] = false
                                    }
                                } label: {
                                    if button[8] == true {
                                        Image(systemName: "checkmark.square")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                        Text("Sí")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                    }
                                    else {
                                        Image(systemName: "square")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                        Text("Sí")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                    }
                                }
                                Button {
                                    if button[9] == false {
                                        button[9] = true
                                        button[8] = false
                                        button[10] = false
                                    }
                                } label: {
                                    if button[9] == true {
                                        Image(systemName: "checkmark.square")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                        Text("No")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                    }
                                    else {
                                        Image(systemName: "square")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                        Text("No")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                    }
                                }
                                Button {
                                    if button[10] == false {
                                        button[10] = true
                                        button[8] = false
                                        button[9] = false
                                    }
                                } label: {
                                    if button[10] == true {
                                        Image(systemName: "checkmark.square")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                        Text("No aplica")
                                            .foregroundColor(.black)
                                            .font(Font.headline.weight(.semibold))
                                    }
                                    else {
                                        Image(systemName: "square")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                        Text("No aplica")
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                    }
                                }
                            }.padding(.vertical, 5)
                            if button[8] {
                                Text("¿Cuántas semanas?")
                                    .padding(.vertical, 5)
                                TextField("Número de semanas", text: $weeksPregnant)
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                    .frame(width: 350)
                                    .keyboardType(.numberPad)
                                
                            }

                            
                        }
                    }
                }
                Divider().padding(.vertical)
                VStack(alignment: .leading) {
                    Text("Marque cualquier condición de la que tenga un historial PERSONAL (no antecedentes familiares):")
                        .font(Font.title3.weight(.bold))
                        .fixedSize(horizontal: false, vertical: true)
                }
                HStack(alignment: .top, spacing: 30) {
                    VStack(alignment: .leading, spacing: 5) {
                        VStack(alignment: .leading, spacing: 5) {
                            Button {
                                if button2[0] {
                                    button2[0] = false
                                }
                                else {
                                    button2[0] = true
                                }
                            } label: {
                                if button2[0] {
                                    HStack(alignment: .top) {
                                        Image(systemName: "checkmark.square")
                                        Text("Accidente cerebrovascular")
                                    }
                                }
                                else {
                                    HStack {
                                        Image(systemName: "square")
                                        Text("Accidente cerebrovascular")
                                    }
                                }
                            }
                                .foregroundColor(.black)
                            Button {
                                if button2[1] {
                                    button2[1] = false
                                }
                                else {
                                    button2[1] = true
                                }
                            } label: {
                                if button2[1] {
                                    HStack {
                                        Image(systemName: "checkmark.square")
                                        Text("Angina de pecho")
                                    }
                                }
                                else {
                                    HStack {
                                        Image(systemName: "square")
                                        Text("Angina de pecho")
                                    }
                                }
                            }
                                .foregroundColor(.black)
                            Button {
                                if button2[2] {
                                    button2[2] = false
                                }
                                else {
                                    button2[2] = true
                                }
                            } label: {
                                if button2[2] {
                                    HStack {
                                        Image(systemName: "checkmark.square")
                                        Text("Ansiedad")
                                    }
                                }
                                else {
                                    HStack {
                                        Image(systemName: "square")
                                        Text("Ansiedad")
                                    }
                                }
                            }
                                .foregroundColor(.black)
                            Button {
                                if button2[3] {
                                    button2[3] = false
                                }
                                else {
                                    button2[3] = true
                                }
                            } label: {
                                if button2[3] {
                                    HStack {
                                        Image(systemName: "checkmark.square")
                                        Text("Arritmia")
                                    }
                                }
                                else {
                                    HStack {
                                        Image(systemName: "square")
                                        Text("Arritmia")
                                    }
                                }
                            }
                                .foregroundColor(.black)
                            Button {
                                if button2[4] {
                                    button2[4] = false
                                }
                                else {
                                    button2[4] = true
                                }
                            } label: {
                                if button2[4] {
                                    HStack {
                                        Image(systemName: "checkmark.square")
                                        Text("Artritis psoriásica")
                                    }
                                }
                                else {
                                    HStack {
                                        Image(systemName: "square")
                                        Text("Artritis psoriásica")
                                    }
                                }
                            }
                                .foregroundColor(.black)
                            Button {
                                if button2[5] {
                                    button2[5] = false
                                }
                                else {
                                    button2[5] = true
                                }
                            } label: {
                                if button2[5] {
                                    HStack {
                                        Image(systemName: "checkmark.square")
                                        Text("Artritis Reumatoide")
                                    }
                                }
                                else {
                                    HStack {
                                        Image(systemName: "square")
                                        Text("Artritis reumatoide")
                                    }
                                }
                            }
                                .foregroundColor(.black)
                            Button {
                                if button2[6] {
                                    button2[6] = false
                                }
                                else {
                                    button2[6] = true
                                }
                            } label: {
                                if button2[6] {
                                    HStack {
                                        Image(systemName: "checkmark.square")
                                        Text("Asma")
                                    }
                                }
                                else {
                                    HStack {
                                        Image(systemName: "square")
                                        Text("Asma")
                                    }
                                }
                            }
                                .foregroundColor(.black)
                        }
                        VStack(alignment: .leading, spacing: 5) {
                                Button {
                                    if button2[7] {
                                        button2[7] = false
                                    }
                                    else {
                                        button2[7] = true
                                    }
                                } label: {
                                    if button2[7] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Cáncer")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Cáncer")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[8] {
                                        button2[8] = false
                                    }
                                    else {
                                        button2[8] = true
                                    }
                                } label: {
                                    if button2[8] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Cardiopatía")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Cardiopatía")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[9] {
                                        button2[9] = false
                                    }
                                    else {
                                        button2[9] = true
                                    }
                                } label: {
                                    if button2[9] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Celulitis")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Celulitis")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[10] {
                                        button2[10] = false
                                    }
                                    else {
                                        button2[10] = true
                                    }
                                } label: {
                                    if button2[10] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Colesterol alto")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Colesterol alto")
                                        }
                                        
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[11] {
                                        button2[11] = false
                                    }
                                    else {
                                        button2[11] = true
                                    }
                                } label: {
                                    if button2[11] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Colitis")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Colitis")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[12] {
                                        button2[12] = false
                                    }
                                    else {
                                        button2[12] = true
                                    }
                                } label: {
                                    if button2[12] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Depresión")
                                        }

                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Depresión")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[13] {
                                        button2[13] = false
                                    }
                                    else {
                                        button2[13] = true
                                    }
                                } label: {
                                    if button2[13] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Diabetes tipo 1")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Diabetes tipo 1")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[14] {
                                        button2[14] = false
                                    }
                                    else {
                                        button2[14] = true
                                    }
                                } label: {
                                    if button2[14] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Diabetes tipo 2")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Diabetes tipo 2")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                        }
                        VStack(alignment: .leading, spacing: 5) {
                                Button {
                                    if button2[42] {
                                        button2[42] = false
                                    }
                                    else {
                                        button2[42] = true
                                    }
                                } label: {
                                    if button2[42] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Dificultad para respirar")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Dificultad para respirar")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[43] {
                                        button2[43] = false
                                    }
                                    else {
                                        button2[43] = true
                                    }
                                } label: {
                                    if button2[43] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Dolor en las articulaciones")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Dolor en las articulaciones")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[44] {
                                        button2[44] = false
                                    }
                                    else {
                                        button2[44] = true
                                    }
                                } label: {
                                    if button2[44] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Dolor de cuello crónico")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Dolor de cuello crónico")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[45] {
                                        button2[45] = false
                                    }
                                    else {
                                        button2[45] = true
                                    }
                                } label: {
                                    if button2[45] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Dolor de espalda crónico")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Dolor de espalda crónico")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                        }
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        VStack(alignment: .leading, spacing: 5) {
                                Button {
                                    if button2[15] {
                                        button2[15] = false
                                    }
                                    else {
                                        button2[15] = true
                                    }
                                } label: {
                                    if button2[15] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Enfermedad degenerativa del disco")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Enfermedad degenerativa del disco")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[16] {
                                        button2[16] = false
                                    }
                                    else {
                                        button2[16] = true
                                    }
                                } label: {
                                    if button2[16] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Enfermedad de Crohn")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Enfermedad de Crohn")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[17] {
                                        button2[17] = false
                                    }
                                    else {
                                        button2[17] = true
                                    }
                                } label: {
                                    if button2[17] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Enfermedad por reflujo gastroesofágico")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Enfermedad por reflujo gastroesofágico")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[18] {
                                        button2[18] = false
                                    }
                                    else {
                                        button2[18] = true
                                    }
                                } label: {
                                    if button2[18] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Enfermedad pulmonar obstructiva crónica")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Enfermedad pulmonar obstructiva crónica")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[19] {
                                        button2[19] = false
                                    }
                                    else {
                                        button2[19] = true
                                    }
                                } label: {
                                    if button2[19] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Enfermedad vascular periférica")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Enfermedad vascular periférica")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[20] {
                                        button2[20] = false
                                    }
                                    else {
                                        button2[20] = true
                                    }
                                } label: {
                                    if button2[20] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Esclerosis múltiple")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Esclerosis múltiple")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                        }
                        VStack(alignment: .leading, spacing: 5) {
                                Button {
                                    if button2[21] {
                                        button2[21] = false
                                    }
                                    else {
                                        button2[21] = true
                                    }
                                } label: {
                                    if button2[21] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Escoliosis")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Escoliosis")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[22] {
                                        button2[22] = false
                                    }
                                    else {
                                        button2[22] = true
                                    }
                                } label: {
                                    if button2[22] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Fibromialgia")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Fibromialgia")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[23] {
                                        button2[23] = false
                                    }
                                    else {
                                        button2[23] = true
                                    }
                                } label: {
                                    if button2[23] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Glaucoma")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Glaucoma")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[24] {
                                        button2[24] = false
                                    }
                                    else {
                                        button2[24] = true
                                    }
                                } label: {
                                    if button2[24] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Gota")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Gota")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[25] {
                                        button2[25] = false
                                    }
                                    else {
                                        button2[25] = true
                                    }
                                } label: {
                                    if button2[25] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Hepatitis B")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Hepatitis B")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[26] {
                                        button2[26] = false
                                    }
                                    else {
                                        button2[26] = true
                                    }
                                } label: {
                                    if button2[26] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Hepatitis C")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Hepatitis C")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[27] {
                                        button2[27] = false
                                    }
                                    else {
                                        button2[27] = true
                                    }
                                } label: {
                                    if button2[27] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Hernia hiatal")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Hernia hiatal")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                        }
                        VStack(alignment: .leading, spacing: 5) {
                                Button {
                                    if button2[46] {
                                        button2[46] = false
                                    }
                                    else {
                                        button2[46] = true
                                    }
                                } label: {
                                    if button2[46] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Hipertensión")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Hipertensión")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[47] {
                                        button2[47] = false
                                    }
                                    else {
                                        button2[47] = true
                                    }
                                } label: {
                                    if button2[47] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Hipertiroidismo")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Hipertiroidismo")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[48] {
                                        button2[48] = false
                                    }
                                    else {
                                        button2[48] = true
                                    }
                                } label: {
                                    if button2[48] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Incontinencia intestinal")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Incontinencia intestinal")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[49] {
                                        button2[49] = false
                                    }
                                    else {
                                        button2[49] = true
                                    }
                                } label: {
                                    if button2[49] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Incontinencia urinaria")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Incontinencia urinaria")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[54] {
                                        button2[54] = false
                                    }
                                    else {
                                        button2[54] = true
                                    }
                                } label: {
                                    if button2[54] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Infarto de miocardio")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Infarto de miocardio")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)

                        }
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        VStack(alignment: .leading, spacing: 5) {
                                Button {
                                    if button2[28] {
                                        button2[28] = false
                                    }
                                    else {
                                        button2[28] = true
                                    }
                                } label: {
                                    if button2[28] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Infección frecuente del tracto urinario")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Infección frecuente del tracto urinario")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[29] {
                                        button2[29] = false
                                    }
                                    else {
                                        button2[29] = true
                                    }
                                } label: {
                                    if button2[29] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Infección por MRSA")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Infección por MRSA")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[30] {
                                        button2[30] = false
                                    }
                                    else {
                                        button2[30] = true
                                    }
                                } label: {
                                    if button2[30] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Insuficiencia cardíaca congestiva")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Insuficiencia cardíaca congestiva")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[31] {
                                        button2[31] = false
                                    }
                                    else {
                                        button2[31] = true
                                    }
                                } label: {
                                    if button2[31] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Lesión en la cabeza cerrada")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Lesión en la cabeza cerrada")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[32] {
                                        button2[32] = false
                                    }
                                    else {
                                        button2[32] = true
                                    }
                                } label: {
                                    if button2[32] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Linfedema")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Linfedema")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[33] {
                                        button2[33] = false
                                    }
                                    else {
                                        button2[33] = true
                                    }
                                } label: {
                                    if button2[33] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Migrañas")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Migrañas")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[34] {
                                        button2[34] = false
                                    }
                                    else {
                                        button2[34] = true
                                    }
                                } label: {
                                    if button2[34] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Neuropatía periférica")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Neuropatía periférica")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                        }
                        VStack(alignment: .leading, spacing: 5) {
                                Button {
                                    if button2[35] {
                                        button2[35] = false
                                    }
                                    else {
                                        button2[35] = true
                                    }
                                } label: {
                                    if button2[35] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Osteoartritis")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Osteoartritis")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[36] {
                                        button2[36] = false
                                    }
                                    else {
                                        button2[36] = true
                                    }
                                } label: {
                                    if button2[36] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Osteoporosis")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Osteoporosis")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[37] {
                                        button2[37] = false
                                    }
                                    else {
                                        button2[37] = true
                                    }
                                } label: {
                                    if button2[37] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Sangrado anormal")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Sangrado anormal")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[38] {
                                        button2[38] = false
                                    }
                                    else {
                                        button2[38] = true
                                    }
                                } label: {
                                    if button2[38] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Síndrome del intestino irritable")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Síndrome del intestino irritable")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[39] {
                                        button2[39] = false
                                    }
                                    else {
                                        button2[39] = true
                                    }
                                } label: {
                                    if button2[39] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Trastorno convulsivo")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Trastorno convulsivo")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[40] {
                                        button2[40] = false
                                    }
                                    else {
                                        button2[40] = true
                                    }
                                } label: {
                                    if button2[40] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Trastorno del sueño")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Trastorno del sueño")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[41] {
                                        button2[41] = false
                                    }
                                    else {
                                        button2[41] = true
                                    }
                                } label: {
                                    if button2[41] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Trastorno de la coagulación sanguinea")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Trastorno de la coagulación sanguinea")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                        }
                        VStack(alignment: .leading, spacing: 5) {
                                Button {
                                    if button2[50] {
                                        button2[50] = false
                                    }
                                    else {
                                        button2[50] = true
                                    }
                                } label: {
                                    if button2[50] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Trombosis venosa profunda")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Trombosis venosa profunda")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[51] {
                                        button2[51] = false
                                    }
                                    else {
                                        button2[51] = true
                                    }
                                } label: {
                                    if button2[51] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Tuberculosis")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("Tuberculosis")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                                Button {
                                    if button2[52] {
                                        button2[52] = false
                                    }
                                    else {
                                        button2[52] = true
                                    }
                                } label: {
                                    if button2[52] {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("VIH/SIDA")
                                        }
                                    }
                                    else {
                                        HStack {
                                            Image(systemName: "square")
                                            Text("VIH/SIDA")
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                        }
                    }
                }.padding(.vertical)
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        Button {
                            if button2[55] {
                                button2[55] = false
                            }
                            else {
                                for index in (0..<button2.count) {
                                    button2[index] = false
                                }
                                button2[55] = true
                            }
                        } label: {
                            if button2[55] {
                                Image(systemName: "checkmark.square")
                                    .font(.headline)

                            }
                            else {
                                Image(systemName: "square")
                                    .font(.headline)

                            }
                        }
                        Text("Ninguna de las anteriores")
                            .font(.headline)
                    }.foregroundColor(.black).padding(.top, 10)
                    Text("Otras condiciones no enumeradas:")
                        .padding(.top, 10)
                        .font(.headline)
                    TextField("Condiciones", text: $otherConditions)
                        .accentColor(.black)
                        .textFieldStyle(.roundedBorder)
                        .padding(.bottom, 5)
                        .frame(width: 350)
                    Divider().padding(.vertical)
                    
                }
                HStack(alignment: .top, spacing: 40) {
                    VStack(alignment: .leading) {
                        Text("Enumere todos los medicamentos que está tomando actualmente(incluye la dosis y la frecuencia, si puede):")
                            .font(Font.title3.weight(.bold))
                            .fixedSize(horizontal: false, vertical: true)
                        TextEditor(text: $medicationsList)
                            .foregroundColor(medicationsList == "Enumere" ? Color.gray.opacity(0.5) : .black)
                            .frame(width: 350, height: 75)
                            .border(Color.init(.sRGB, red: 0.92941, green: 0.92941, blue: 0.92941, opacity: 1), width: 1)
                            .padding(.bottom)
                            .onTapGesture {
                                if medicationsList == "Enumere" {
                                    medicationsList = ""
                                    keyboardChange = true
                                }
                            }
                        Text("¿En qué trabaja?")
                            .font(Font.title3.weight(.bold))
                        TextField("Trabajo", text: $occupation)
                            .accentColor(.black)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 350)
                            .padding(.bottom)
                            .onTapGesture {
                                keyboardChange = true
                            }
                        Text("Si está empleado, capacidad actual para trabajar: ")
                            .font(Font.title3.weight(.bold))
                            .padding(.bottom, 5)
                            .fixedSize(horizontal: false, vertical: true)
                        VStack(alignment: .leading) {
                            Button {
                                if button3[0] == false {
                                    button3[0] = true
                                    button3[1] = false
                                    button3[2] = false
                                }
                            } label: {
                                HStack(alignment: .top) {
                                    if button3[0] == false {
                                        Image(systemName: "square")
                                            .foregroundColor(.black)
                                            .padding(.top, 3)
                                    }
                                    else {
                                        Image(systemName: "checkmark.square")
                                            .foregroundColor(.black)
                                            .padding(.top, 3)
                                    }
                                    VStack(alignment: .leading) {
                                        Text("Capaz de realizar todos los deberes del")
                                            .foregroundColor(.black)
                                        Text("trabajo/Sin restricciones")
                                            .foregroundColor(.black)
                                    }
                                }
                            }
                            Button {
                                if button3[1] == false {
                                    button3[1] = true
                                    button3[0] = false
                                    button3[2] = false
                                }
                            } label: {
                                HStack {
                                    if button3[1] == false {
                                        Image(systemName: "square")
                                            .foregroundColor(.black)
                                    }
                                    else {
                                        Image(systemName: "checkmark.square")
                                            .foregroundColor(.black)
                                    }
                                    Text("Restringido partial")
                                        .foregroundColor(.black)
                                }
                            }
                            Button {
                                if button3[2] == false {
                                    button3[2] = true
                                    button3[0] = false
                                    button3[1] = false
                                }
                            } label: {
                                HStack {
                                    if button3[2] == false {
                                        Image(systemName: "square")
                                            .foregroundColor(.black)
                                    }
                                    else {
                                        Image(systemName: "checkmark.square")
                                            .foregroundColor(.black)
                                    }
                                    Text("Incapaz de trabajar")
                                        .foregroundColor(.black)
                                }
                            }
                            Text("Describa las restricciones, si las hay:")
                                .font(Font.headline)
                                .padding(.top)
                            TextField("Restricciones", text: $workRestrictions)
                                .accentColor(.black)
                                .textFieldStyle(.roundedBorder)
                                .frame(width: 350)
                                .padding(.bottom)
                                .onTapGesture {
                                    keyboardChange = true
                                }

                        }
                        
                    }
                    VStack(alignment: .leading) {
                        Text("Describa las tareas laborales que actualmente no puede realizar(por ejemplo: estar sentado por largos periodos de tiempo, estar parado por largos periodos de tiempo, levantar cosas repetitivamente, etc.")
                            .font(Font.title3.weight(.bold))
                            .fixedSize(horizontal: false, vertical: true)
                        TextEditor(text: $workDuties)
                            .foregroundColor(workDuties == "Tareas laborales" ? Color.gray.opacity(0.5) : .black)
                            .frame(width: 350, height: 75)
                            .border(Color.init(.sRGB, red: 0.92941, green: 0.92941, blue: 0.92941, opacity: 1), width: 1)
                            .padding(.bottom)
                            .onTapGesture {
                                if workDuties == "Tareas laborales" {
                                    workDuties = ""
                                    keyboardChange = true
                                }
                            }
                        Text("¿Ha caído en los últimos 12 meses?")
                            .font(Font.title3.weight(.bold))
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.bottom, 5)
                        HStack {
                            Button {
                                if button4[0] == false {
                                    button4[0] = true
                                    button4[1] = false
                                }
                            } label: {
                                HStack {
                                    if button4[0] == false {
                                        Image(systemName: "square")
                                    }
                                    else {
                                        Image(systemName: "checkmark.square")
                                    }
                                    Text("Sí")
                                        .padding(.leading, 5)
                                }.foregroundColor(.black)
                            }.padding(.trailing)
                            Button {
                                if button4[1] == false {
                                    button4[1] = true
                                    button4[0] = false
                                }
                            } label: {
                                HStack {
                                    if button4[1] == false {
                                        Image(systemName: "square")
                                    }
                                    else {
                                        Image(systemName: "checkmark.square")
                                    }
                                    Text("No")
                                        .padding(.leading, 5)
                                }.foregroundColor(.black)
                            }

                        }.padding(.bottom, 5)
                        if button4[0] == true {
                            VStack(alignment: .leading) {
                                Text("¿Cuántas veces?")
                                TextField("Número de veces", text: $timesFallen)
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                    .padding(.bottom, 5)
                                    .frame(width: 350)
                                    .onTapGesture {
                                        keyboardChange = true
                                    }
                                Text("Razón de la caída?")
                                TextField("Razón", text: $reasonFall)
                                    .accentColor(.black)
                                    .textFieldStyle(.roundedBorder)
                                    .padding(.bottom, 5)
                                    .frame(width: 350)
                                    .onTapGesture {
                                        keyboardChange = true
                                    }
                                Text("¿Alguna de las caídas resultó en lesiones?")
                                    .padding(.bottom, 5)
                                HStack {
                                    Button {
                                        if button5[0] == false {
                                            button5[0] = true
                                            button5[1] = false
                                        }
                                    } label: {
                                        HStack {
                                            if button5[0] == false {
                                                Image(systemName: "square")
                                            }
                                            else {
                                                Image(systemName: "checkmark.square")
                                            }
                                            Text("Sí")
                                                .padding(.leading, 3)
                                        }.foregroundColor(.black)
                                    }
                                    Button {
                                        if button5[1] == false {
                                            button5[1] = true
                                            button5[0] = false
                                        }
                                    } label: {
                                        HStack {
                                            if button5[1] == false {
                                                Image(systemName: "square")
                                            }
                                            else {
                                                Image(systemName: "checkmark.square")
                                            }
                                            Text("No")
                                                .padding(.leading, 3)
                                        }.foregroundColor(.black)
                                    }

                                }
                            }
                        }
                    }
                }
            }.padding()
        }
        .accentColor(.blue)
        .frame(width: UIScreen.main.bounds.width)
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
                        spanMedView
                            .onDisappear {
                                let image = spanMedView.snapshot()
                                model.PDFimage.append(image)
                                model.PDFfile = model.createPDF(image: image)
                                model.PDFfileArray.append(model.PDFfile!)
                            }
                        NavigationLink {
                            if model.showInsuranceIntake == true && model.includeInsuranceIntake == true {
                                SpanInsuranceView(survey: survey)
                            }
                            else if model.showInfoAndPolicies == true && model.includeInformationAndPolicies == true {
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
                                            .padding(.bottom, 20)
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
                            }                    }
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

