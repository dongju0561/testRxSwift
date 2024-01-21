//
//  ViewController.swift
//  testRxSwift
//
//  Created by Dongju Park on 1/18/24.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var disposeBtn: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let disposeBag = DisposeBag()
        //옵져버블 생성
        let createBtn = btn.rx.tap
        //dispose 옵져버블 생성
        let disposeBtn = disposeBtn.rx.tap
        
        //옵져버블 생성
        let typeObservable = textField.rx.text
        
        let disposiable = createBtn
            .subscribe(onNext: { _ in
                print("emit")
            })
        disposeBtn
            .subscribe { _ in
                disposiable.dispose()
                print("die")
            }
        
        //옵저버 생성
        typeObservable
            .orEmpty
            .subscribe(onNext: { _ in
                
            })
    }
}
