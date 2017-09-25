//
//  EnumTeste.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 20/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import Foundation

enum EnumTeste:String {
    case iPad, iPhone
    var year: Int {
        switch self {
        case .iPhone: return 2007
        case .iPad: return 2010
        }
    }}


