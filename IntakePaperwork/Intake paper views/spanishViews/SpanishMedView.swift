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
    var famHistName = ["Accidente Cerebrovascular", "Angina de pecho", "Ansiedad", "Arritmia", "Artritis psoriásica", "Artritis reumatoide", "Asma", "Cáncer", "Cardiopatía", "Celulitis", "Colesterol alto", "Colitis", "Depresión", "Diabetes tipo 1", "Diabetes tipo 2", "Dificultad para respirar", "Dolor en las articulaciones", "Dolor de cuello crónico", "Dolor de espalda crónico"]
    var famHistName2 = ["Esclerosis múltiple", "Escoliosis", "Fibromialgia", "Glaucoma", "Gota", "Hepatitis B", "Hepatitis C", "Hernia hiatal", "Hipertensión", "Hipertiroidismo", "Incontinencia intestinal", "Incontinencia urinaria", "Infarto de miocardio"]
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
                            ForEach(0..<19) { index in
                                Button {
                                    if button2[index] {
                                        button2[index] = false
                                    }
                                    else {
                                        button2[index] = true
                                    }
                                } label: {
                                    if button2[index] {
                                        HStack(alignment: .top) {
                                            Image(systemName: "checkmark.square")
                                            Text(famHistName[index])
                                                .fixedSize(horizontal: false, vertical: true)
                                        }
                                    }
                                    else {
                                        HStack(alignment: .top) {
                                            Image(systemName: "square")
                                            Text(famHistName[index])
                                                .fixedSize(horizontal: false, vertical: true)
                                        }
                                    }
                                }.foregroundColor(.black)
                            }
                        }
                        VStack(alignment: .leading, spacing: 5) {
                            Button {
                                if button2[19] {
                                    button2[19] = false
                                }
                                else {
                                    button2[19] = true
                                }
                            } label: {
                                if button2[19] {
                                    HStack(alignment: .top) {
                                        Image(systemName: "checkmark.square")
                                        VStack(alignment: .leading) {
                                            Text("Enfermedad degenerativa")
                                            Text("del disco")
                                        }
                                    }
                                }
                                else {
                                    HStack(alignment: .top) {
                                        Image(systemName: "square")
                                        VStack(alignment: .leading) {
                                            Text("Enfermedad degenerativa")
                                            Text("del disco")
                                        }
                                    }
                                }
                            }
                                .foregroundColor(.black)
                        }
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        VStack(alignment: .leading, spacing: 5) {
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
                                    if button2[21] {
                                        button2[21] = false
                                    }
                                    else {
                                        button2[21] = true
                                    }
                                } label: {
                                    if button2[21] {
                                        HStack(alignment: .top) {
                                            Image(systemName: "checkmark.square")
                                            VStack(alignment: .leading) {
                                                Text("Enfermedad por reflujo")
                                                Text("gastroesofágico")
                                            }
                                        }
                                    }
                                    else {
                                        HStack(alignment: .top) {
                                            Image(systemName: "square")
                                            VStack(alignment: .leading) {
                                                Text("Enfermedad por reflujo")
                                                Text("gastroesofágico")
                                            }
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
                                        HStack(alignment: .top) {
                                            Image(systemName: "checkmark.square")
                                            VStack(alignment: .leading) {
                                                Text("Enfermedad pulmonar")
                                                Text("obstructiva crónica")
                                            }
                                        }
                                    }
                                    else {
                                        HStack(alignment: .top) {
                                            Image(systemName: "square")
                                            VStack(alignment: .leading) {
                                                Text("Enfermedad pulmonar")
                                                Text("obstructiva crónica")
                                            }
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
                                        HStack(alignment: .top) {
                                            Image(systemName: "checkmark.square")
                                            VStack(alignment: .leading) {
                                                Text("Enfermedad vascular")
                                                Text("periférica")
                                            }
                                        }
                                    }
                                    else {
                                        HStack(alignment: .top) {
                                            Image(systemName: "square")
                                            VStack(alignment: .leading) {
                                                Text("Enfermedad vascular")
                                                Text("periférica")
                                            }
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                            VStack(alignment: .leading, spacing: 5) {
                                ForEach(0..<13) { index2 in
                                    Button {
                                        if button2[index2+24] {
                                            button2[index2+24] = false
                                        }
                                        else {
                                            button2[index2+24] = true
                                        }
                                    } label: {
                                        if button2[index2+24] {
                                            HStack(alignment: .top) {
                                                Image(systemName: "checkmark.square")
                                                Text(famHistName2[index2])
                                                    .fixedSize(horizontal: false, vertical: true)
                                            }
                                        }
                                        else {
                                            HStack(alignment: .top) {
                                                Image(systemName: "square")
                                                Text(famHistName2[index2])
                                                    .fixedSize(horizontal: false, vertical: true)
                                            }
                                        }
                                    }.foregroundColor(.black)
                                }
                            }
                        }
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        VStack(alignment: .leading, spacing: 5) {
                                Button {
                                    if button2[37] {
                                        button2[37] = false
                                    }
                                    else {
                                        button2[37] = true
                                    }
                                } label: {
                                    if button2[37] {
                                        HStack(alignment: .top) {
                                            Image(systemName: "checkmark.square")
                                            VStack(alignment: .leading) {
                                                Text("Infección frecuente del")
                                                Text("tracto urinario")
                                            }
                                        }
                                    }
                                    else {
                                        HStack(alignment: .top) {
                                            Image(systemName: "square")
                                            VStack(alignment: .leading) {
                                                Text("Infección frecuente del")
                                                Text("tracto urinario")
                                            }
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
                                    if button2[39] {
                                        button2[39] = false
                                    }
                                    else {
                                        button2[39] = true
                                    }
                                } label: {
                                    if button2[39] {
                                        HStack(alignment: .top) {
                                            Image(systemName: "checkmark.square")
                                            VStack(alignment: .leading) {
                                                Text("Insuficiencia")
                                                Text("cardíaca congestiva")
                                            }
                                        }
                                    }
                                    else {
                                        HStack(alignment: .top) {
                                            Image(systemName: "square")
                                            VStack(alignment: .leading) {
                                                Text("Insuficiencia")
                                                Text("cardíaca congestiva")
                                            }
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
                                        HStack(alignment: .top) {
                                            Image(systemName: "checkmark.square")
                                            VStack(alignment: .leading) {
                                                Text("Lesión en la")
                                                Text("cabeza cerrada")
                                            }
                                        }
                                    }
                                    else {
                                        HStack(alignment: .top) {
                                            Image(systemName: "square")
                                            VStack(alignment: .leading) {
                                                Text("Lesión en la")
                                                Text("cabeza cerrada")
                                            }
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
                                    if button2[47] {
                                        button2[47] = false
                                    }
                                    else {
                                        button2[47] = true
                                    }
                                } label: {
                                    if button2[47] {
                                        HStack(alignment: .top) {
                                            Image(systemName: "checkmark.square")
                                            VStack(alignment: .leading) {
                                                Text("Síndrome del")
                                                Text("intestino irritable")
                                            }
                                        }
                                    }
                                    else {
                                        HStack(alignment: .top) {
                                            Image(systemName: "square")
                                            VStack(alignment: .leading) {
                                                Text("Síndrome del")
                                                Text("intestino irritable")
                                            }
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
                                    if button2[50] {
                                        button2[50] = false
                                    }
                                    else {
                                        button2[50] = true
                                    }
                                } label: {
                                    if button2[50] {
                                        HStack(alignment: .top) {
                                            Image(systemName: "checkmark.square")
                                            VStack(alignment: .leading) {
                                                Text("Trastorno de la")
                                                Text("coagulación sanguinea")
                                            }
                                        }
                                    }
                                    else {
                                        HStack(alignment: .top) {
                                            Image(systemName: "square")
                                            VStack(alignment: .leading) {
                                                Text("Trastorno de la")
                                                Text("coagulación sanguinea")
                                            }
                                        }
                                    }
                                }
                                    .foregroundColor(.black)
                        }
                        VStack(alignment: .leading, spacing: 5) {
                                Button {
                                    if button2[51] {
                                        button2[51] = false
                                    }
                                    else {
                                        button2[51] = true
                                    }
                                } label: {
                                    if button2[51] {
                                        HStack(alignment: .top) {
                                            Image(systemName: "checkmark.square")
                                            VStack(alignment: .leading) {
                                                Text("Trombosis venosa")
                                                Text("profunda")
                                            }
                                        }
                                    }
                                    else {
                                        HStack(alignment: .top) {
                                            Image(systemName: "square")
                                            VStack(alignment: .leading) {
                                                Text("Trombosis venosa")
                                                Text("profunda")
                                            }
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
                                    if button2[53] {
                                        button2[53] = false
                                    }
                                    else {
                                        button2[53] = true
                                    }
                                } label: {
                                    if button2[53] {
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

