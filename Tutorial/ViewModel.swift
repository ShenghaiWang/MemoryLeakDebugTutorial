//
//  ViewModel.swift
//  Tutorial
//
//  Created by Tim Wang on 21/10/2023.
//

import Foundation

@Observable
class ViewModel {
    private var a: AClass?
    private var b: BClass?

    init() {
        renew()
    }

    func cleanup() {
        a = nil
        b = nil
    }

    func renewAndSetupCircularReference(times: Int = 1) {
        renew()
        setupCircularReference()
    }

    private func renew() {
        self.a = AClass()
        self.b = BClass()
    }

    private func setupCircularReference() {
        a?.b = b
        b?.a = a
    }
}

class AClass {
    var b: BClass?

    private let data: Data

    init(b: BClass? = nil) {
        self.b = b
        self.data = Data(repeating: 0, count: 1024 * 1024)
    }

    deinit {
        print("DeInit A")
    }
}

class BClass {
    var a: AClass?

    private let data: Data

    init(a: AClass? = nil) {
        self.a = a
        self.data = Data(repeating: 0, count: 1024 * 1024)
    }

    deinit {
        print("DeInit B")
    }
}
