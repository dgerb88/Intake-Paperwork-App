//
//  ModelView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/16/21.
//

import Foundation

class SurveyModel: ObservableObject {
    
    @Published var surveys = [Survey]()
    @Published var selectedValue = [Int]()
    @Published var score = 0
    @Published var finishedSurvey = false
    @Published var contentSelected:Int?
    @Published var eval = true
    @Published var includeInformationAndPolicies = true
    @Published var includeInsuranceIntake = true
    @Published var includeMedicalHistory = true
    @Published var includeDryNeedlingConsent = true
    @Published var includePrivacyPolicy = true
    
    
    init() {
        getRemoteData()
    }
    
    func getRemoteData() {
        
        let UrlString = "https://dgerb88.github.io/Intake-Paperwork-data/FunctionalSurveys.json"
        let url = URL(string: UrlString)
        guard url != nil else {
            return
        }
        let request = URLRequest(url: url!)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let surveyList = try decoder.decode([Survey].self, from: data!)
                DispatchQueue.main.async {
                    self.surveys = surveyList
                }
            }
            catch {
                print("Couldn't parse remote json")
            }
            
        }
        dataTask.resume()
    }
    func appendArray(_ numberOfTimes: Int) {
        for _ in 0..<numberOfTimes {
            selectedValue.append(0)
        }
    }
}
