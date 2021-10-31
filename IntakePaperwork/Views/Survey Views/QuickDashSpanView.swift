//
//  QuickDashSpanView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/30/21.
//

import SwiftUI

struct QuickDashSpanView: View {
    
    @EnvironmentObject var model: SurveyModel
    var survey: Survey
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(5)
                .shadow(radius: 5)
            VStack {
                Text(survey.description)
                    .font(.headline)
                    .padding(.bottom, 10)
                Divider()
                VStack(alignment: .leading) {
                    HStack {
                        Spacer()
                        HStack(spacing: 15) {
                            VStack {
                                Text("Ninguna")
                                Text("dificultad")
                            }
                            VStack {
                                Text("Dificultad")
                                Text("leve")
                            }
                            VStack {
                                Text("Dificultad")
                                Text("moderada")
                            }
                            VStack {
                                Text("Dificultad")
                                Text("severa")
                            }
                            VStack {
                                Text("No lo")
                                Text("puedo")
                                Text("ejecutar")
                            }
                        }.frame(width: 420)
                    }
                    ForEach(0..<6) { index in
                        VStack(alignment: .leading) {
                            HStack {
                                Text("\(index+1). \(survey.questions[index].title)")
                                    .fixedSize(horizontal: false, vertical: true)
                                Spacer()
                                
                                VStack {
                                    Picker("", selection: $model.selectedValue[index]) {
                                        ForEach(0..<survey.questions[index].rating.count) { ratingIndex in
                                            Text(String(ratingIndex+1)).tag(ratingIndex)
                                        }
                                    }.pickerStyle(SegmentedPickerStyle())
                                        .frame(width: 410)
                                        .onChange(of: model.selectedValue) { newValue in
                                            model.finishedSurvey = false
                                            model.score = 0
                                        }
                                    Spacer()
                                }
                                
                            }
                        }.padding(.bottom, 10)
                    }
                    Divider()
                        .foregroundColor(.black)
                    HStack {
                        Spacer()
                        HStack(spacing: 10) {
                            VStack {
                                Text("Para")
                                Text("nada")
                            }.padding(.trailing, 20)
                            VStack {
                                Text("Un")
                                Text("Poco")
                            }.padding(.trailing, 10).padding(.leading, 20)
                            VStack {
                                Text("Moderado")
                            }
                            VStack {
                                Text("Bastante")
                            }.padding(.trailing, 5)
                            VStack {
                                Text("Incapaz")
                            }
                        }.frame(width: 420)
                            .padding(.bottom, 10)
                    }
                    HStack {
                        Text("\(7). \(survey.questions[6].title)")
                            .padding(.leading, 5)
                            .fixedSize(horizontal: false, vertical: true)
                        Spacer()
                        
                        VStack {
                            Picker("", selection: $model.selectedValue[6]) {
                                ForEach(0..<survey.questions[0].rating.count) { ratingIndex in
                                    Text(String(ratingIndex+1)).tag(ratingIndex)
                                }
                            }.pickerStyle(SegmentedPickerStyle())
                                .frame(width: 410)
                            Spacer()
                        }
                    }
                    Divider()
                        .foregroundColor(.black)
                    HStack {
                        Spacer()
                        HStack {
                            VStack {
                                Text("Para")
                                Text("nada")
                            }.padding(.trailing, 20).padding(.leading, 20)
                            VStack {
                                Text("Un")
                                Text("poco")
                            }.padding(.trailing, 20).padding(.leading, 5)
                            VStack {
                                Text("Con")
                                Text("moderación")
                            }
                            VStack {
                                Text("Bastante")
                                Text("limitado")
                            }
                            VStack {
                                Text("Limitado/a")
                                Text("Totalmente")
                            }
                        }.frame(width: 420)
                            .padding(.vertical, 10)
                    }
                    HStack {
                        Text("\(8). \(survey.questions[7].title)")
                            .padding(.leading, 5)
                            .fixedSize(horizontal: false, vertical: true)
                        Spacer()
                        
                        VStack {
                            Picker("", selection: $model.selectedValue[7]) {
                                ForEach(0..<survey.questions[0].rating.count) { ratingIndex in
                                    Text(String(ratingIndex+1)).tag(ratingIndex)
                                }
                            }.pickerStyle(SegmentedPickerStyle())
                                .frame(width: 410)
                            Spacer()
                        }
                    }
                    Divider()
                        .foregroundColor(.black)
                }
                VStack(alignment: .leading) {
                    Text("Por favor califique la gravedad de los síntomas siguientes durante la última semana:")
                        .bold()
                        .padding(.vertical, 20)
                    
                    HStack {
                        Spacer()
                        HStack {
                            VStack {
                                Text("Ningún")
                                Text("Síntoma")
                            }.padding(.leading, 10).padding(.trailing, 10)
                            Text("Leve").padding(.trailing, 5).padding(.leading, 10)
                            Text("Moderado").padding(.trailing, 10).padding(.leading, 10)
                            Text("Severo").padding(.trailing, 10)
                            Text("Extremo")
                        }.frame(width: 420)
                            .padding(.bottom, 10)
                    }
                    HStack {
                        Text("\(9). \(survey.questions[8].title)")
                            .padding(.leading, 5)
                        Spacer()
                        
                        VStack {
                            Picker("", selection: $model.selectedValue[8]) {
                                ForEach(0..<survey.questions[0].rating.count) { ratingIndex in
                                    Text(String(ratingIndex+1)).tag(ratingIndex)
                                }
                            }.pickerStyle(SegmentedPickerStyle())
                                .frame(width: 410)
                            
                        }
                    }.padding(.bottom, 20)
                    HStack {
                        Text("\(10). \(survey.questions[9].title)")
                            .padding(.leading, 5)
                        Spacer()
                        
                        VStack {
                            Picker("", selection: $model.selectedValue[9]) {
                                ForEach(0..<survey.questions[0].rating.count) { ratingIndex in
                                    Text(String(ratingIndex+1)).tag(ratingIndex)
                                }
                            }.pickerStyle(SegmentedPickerStyle())
                                .frame(width: 410)
                                .padding(.bottom, 20)
                        }
                    }
                    Divider()
                    HStack {
                        Spacer()
                        HStack {
                            VStack {
                                Text("Ninguna")
                                Text("dificultad")
                            }
                            VStack {
                                Text("Dificultad")
                                Text("leve")
                            }
                            VStack {
                                Text("Dificultad")
                                Text("moderada")
                            }
                            VStack {
                                Text("Dificultad")
                                Text("severa")
                            }
                            VStack {
                                Text("Tanto, que")
                                Text("no puedo")
                                Text("dormir")
                            }
                        }.frame(width: 420)
                            .padding(.vertical, 10)
                    }
                    HStack {
                        Text("\(11). \(survey.questions[10].title)")
                            .padding(.leading, 5)
                            .fixedSize(horizontal: false, vertical: true)
                        Spacer()
                        
                        VStack {
                            Picker("", selection: $model.selectedValue[10]) {
                                ForEach(0..<survey.questions[0].rating.count) { ratingIndex in
                                    Text(String(ratingIndex+1)).tag(ratingIndex)
                                }
                            }.pickerStyle(SegmentedPickerStyle())
                                .frame(width: 410)
                                .padding(.bottom, 50)
                        }
                    }
                    Button {
                        if model.finishedSurvey != true {
                            for index in 0..<model.selectedValue.count {
                                model.score += model.selectedValue[index] + 1
                            }
                            
                        }
                        model.finishedSurvey = true
                        
                    } label: {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.green)
                                .frame(height: 48)
                                .cornerRadius(10)
                                .shadow(radius: 1)
                            if model.finishedSurvey {
                                Text("Puntuación: \(model.score)/55")
                                    .foregroundColor(.white)
                                    .bold()
                            }
                            else {
                                Text("Terminar")
                                    .foregroundColor(.white)
                                    .bold()
                            }
                        }
                        
                    }.padding(.vertical, 5)
                }.onAppear {
                    model.score = 0
                }
            }.padding()
        }

    }
}

