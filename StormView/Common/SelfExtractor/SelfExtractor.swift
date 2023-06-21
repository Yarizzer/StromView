//
//  SelfExtractor.swift
//  StormView
//
//  Created by Yaroslav Abaturov on 21.06.2023.
//

import Foundation

protocol SelfExtractable: AnyObject { }

extension SelfExtractable {
    typealias VoidCall = (Self) -> Void
    typealias VoidResponse = () -> ()
    typealias NonVoidCall<T> = (Self, T) -> ()
    typealias NonVoidResponse<T> = (T) -> ()
    
    func extract(code: @escaping VoidCall) -> VoidResponse {
        return { [weak self] in
            guard let sSelf = self else { return }

            code(sSelf)
        }
    }
    
    func extract<T>(_ code: @escaping NonVoidCall<T>) -> NonVoidResponse<T> {
        return { [weak self] data in
            guard let sSelf = self else { return }
            
            code(sSelf, data)
        }
    }
}
