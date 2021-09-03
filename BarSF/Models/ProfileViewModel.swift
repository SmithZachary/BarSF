//
//  ProfileViewModel.swift
//  BarSF
//
//  Created by Zach Smith on 9/2/21.
//  Copyright © 2021 spaceMuleCode. All rights reserved.
//

import Foundation

enum ProfileViewModelType {
    case info, logout, deleteaccount
}

struct ProfileViewModel {
    let viewModelType: ProfileViewModelType
    let title: String
    let handler: (() -> Void)?
}
