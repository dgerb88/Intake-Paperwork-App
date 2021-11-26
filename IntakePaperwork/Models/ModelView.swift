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
    @Published var eval = true
    @Published var includeInformationAndPolicies = true
    @Published var includeInsuranceIntake = true
    @Published var includeMedicalHistory = true
    @Published var includeDryNeedlingConsent = true
    @Published var includePrivacyPolicy = true
    @Published var sideBarShowing = false
    
    //MARK: User default bools
    @Published var showDryNeedling: Bool = UserDefaults.standard.bool(forKey: Constants.showDryNeedling) {
        didSet {
            UserDefaults.standard.set(self.showDryNeedling, forKey: Constants.showDryNeedling)
        }
    }
    @Published var showPrivacyPolicy: Bool = UserDefaults.standard.bool(forKey: Constants.showPrivacyPolicy) {
        didSet {
            UserDefaults.standard.set(self.showPrivacyPolicy, forKey: Constants.showPrivacyPolicy)
        }
    }
    @Published var showInfoAndPolicies: Bool = UserDefaults.standard.bool(forKey: Constants.showInfoAndPolicies) {
        didSet {
            UserDefaults.standard.set(self.showInfoAndPolicies, forKey: Constants.showInfoAndPolicies)
        }
    }
    @Published var showInsuranceIntake: Bool = UserDefaults.standard.bool(forKey: Constants.showInsuranceIntake) {
        didSet {
            UserDefaults.standard.set(self.showInsuranceIntake, forKey: Constants.showInsuranceIntake)
        }
    }
    @Published var showMedicalHistory: Bool = UserDefaults.standard.bool(forKey: Constants.showMedicalHistory) {
        didSet {
            UserDefaults.standard.set(self.showMedicalHistory, forKey: Constants.showMedicalHistory)
        }
    }
    
    
    //MARK: User default strings
    @Published var ptName: String = UserDefaults.standard.string(forKey: Constants.ptname) ?? "" {
        didSet {
            UserDefaults.standard.set(self.ptName, forKey: Constants.ptname)
        }
    }
    @Published var ptCredential: String = UserDefaults.standard.string(forKey: Constants.ptCredential) ?? "" {
        didSet {
            UserDefaults.standard.set(self.ptCredential, forKey: Constants.ptCredential)
        }
    }
    @Published var clinicName: String = UserDefaults.standard.string(forKey: Constants.clinicName) ?? "" {
        didSet {
            UserDefaults.standard.set(self.clinicName, forKey: Constants.clinicName)
        }
    }
    
    init() {
        getRemoteData()
        checkLoadedSettings()
    }
    
    func checkLoadedSettings() {
        
        let status = UserDefaults.standard.bool(forKey: Constants.isSettingsPreloaded)
        if status == false {
            preLoadSettings()
        }
    }
    
    func preLoadSettings() {
        showDryNeedling = true
        showPrivacyPolicy = true
        showInfoAndPolicies = true
        showInsuranceIntake = true
        showMedicalHistory = true
        ptName = "(PT name here)"
        ptCredential = "DPT"
        clinicName = "(Your clinic's name here)"
        UserDefaults.standard.setValue(true, forKey: Constants.isSettingsPreloaded)
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
