//
//  TextEditorManager.swift
//  Deers
//
//  Created by Dalal Macbook on 16/07/2022.
//

import Foundation
import AudioToolbox

class TextEditorManager : ObservableObject {
    @Published var reviewerInput = "أضف ملاحظاتك..." {
        didSet{
            if reviewerInput.count > Constants.maxLength.textEditor{
                reviewerInput = String(reviewerInput.prefix(Constants.maxLength.textEditor))
                AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) { return }
            }
        }
    }
    
    
}
