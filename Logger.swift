//
//  Logger.swift
//  StructuredLogging
//
//  Created by Hlwan Aung Phyo on 1/26/25.
//

import Foundation
import OSLog

public enum Logger {
    public static let standard: os.Logger = .init(
        subsystem: Bundle.main.bundleIdentifier!,
        category: LogCategory.apiCall.rawValue
    )
}

private enum LogCategory: String {
    case apiCall = "API Call"
}

//開発のために値を出力したい → debug(_:)
//何となく役立ちそうな値を出力したい → info(_:)
//確実に役立つ情報を出力したい → notice(_:)
//エラーを出力したい → error(_:)
//エラー以外の不具合に関する情報を出力したい → fault(_:)
