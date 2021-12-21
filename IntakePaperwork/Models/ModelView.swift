//
//  ModelView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/16/21.
//

import Foundation
import SwiftUI

class SurveyModel: ObservableObject {
        
    @Published var surveys = [Survey]()
    @Published var PDFimage = [UIImage]()
    @Published var savedPDFimage = [[UIImage]]()
    @Published var selectedValue = [Int]()
    @Published var score = 0
    @Published var eval = true
    @Published var includeInformationAndPolicies = true
    @Published var includeInsuranceIntake = true
    @Published var includeMedicalHistory = true
    @Published var includeDryNeedlingConsent = true
    @Published var includePrivacyPolicy = true
    @Published var sideBarShowing = false
    @Published var viewSelectionInt: Int?
    @Published var PDFfile: NSData?
    @Published var PDFfileArray = [NSData]()
    @Published var PDFfileArrayArray = [[NSData]]()

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
    @Published var cancelFee: String = UserDefaults.standard.string(forKey: Constants.cancelFee) ?? "" {
        didSet {
            UserDefaults.standard.set(self.cancelFee, forKey: Constants.cancelFee)
        }
    }
    @Published var noShowFee: String = UserDefaults.standard.string(forKey: Constants.noShowFee) ?? "" {
        didSet {
            UserDefaults.standard.set(self.noShowFee, forKey: Constants.noShowFee)
        }
    }
    @Published var phoneNumber: String = UserDefaults.standard.string(forKey: Constants.phoneNumber) ?? "" {
        didSet {
            UserDefaults.standard.set(self.phoneNumber, forKey: Constants.phoneNumber)
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
        ptName = ""
        ptCredential = ""
        clinicName = ""
        phoneNumber = ""
        cancelFee = ""
        noShowFee = ""
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
    func createPDF(image: UIImage) -> NSData? {

        let pdfData = NSMutableData()
        let pdfConsumer = CGDataConsumer(data: pdfData as CFMutableData)!

        var mediaBox = CGRect.init(x: 0, y: 0, width: image.size.width, height: image.size.height)

        let pdfContext = CGContext(consumer: pdfConsumer, mediaBox: &mediaBox, nil)!

        pdfContext.beginPage(mediaBox: &mediaBox)
        pdfContext.draw(image.cgImage!, in: mediaBox)
        pdfContext.endPage()

        return pdfData
    }
}
