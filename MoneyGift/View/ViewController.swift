//
//  ViewController.swift
//  MoneyGift
//
//  Created by leeyuno on 02/08/2019.
//  Copyright © 2019 leeyuno. All rights reserved.
//

import UIKit

import GoogleMobileAds

class ViewController: UIViewController {
    
    //광고
    var interstitial: GADInterstitial!

    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var cardView: CardView!
    @IBOutlet var resultView: ResultView!
    let backView = UIView()
    
    var categoryList: [CardList] = [CardList]()
    
    var questions = [Questions]()
    
    //현재 카드뷰 인덱스
    var step: Int = 0
    //실시간 금액을 담을 변수, 초기값 = 50000
    var price: Int = 50000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-6039832423403021/9405826007")
        interstitial.delegate = self
//        let request = GADRequest()
//        interstitial.load(request)
        configureData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if interstitial.isReady {
            interstitial.present(fromRootViewController: self)
        }
    }
    
    private func configureData() {
        for question in Library.object.questions {
            questions.append(Questions(attributes: question))
        }
//        let items: [[String: Any?]] = [
//            ["title": "최근 6개월 간 청첩장이 아닌 목적으로 만난 적이 있나요?", "bool": false, "index": 0, "price": 10000, "yes": 1, "no": 2],
//            ["title": "청첩장을 직접 받았나요?", "bool": false, "index": 1, "price": 10000, "yes": 3, "no": 2],
//            ["title": "청첩장을 모바일로 받으셨나요?", "bool": false, "index": 2, "price": -15000, "yes": 4, "no": 3],
//            ["title": "회사 동료인가요?", "bool": false, "index": 3, "price": 10000, "yes": 6, "no": 5],
//            ["title": "서로 SNS 팔로우이신가요?", "bool": false, "index": 4, "price": 5000, "yes": 7, "no": 5],
//            ["title": "혹시.. 두번째 결혼인가요?", "bool": false, "index": 5, "price": -20000, "yes": 8, "no": 6],
//            ["title": "연회장은 호텔 뷔페인가요?", "bool": false, "index": 6, "price": 10000, "yes": 9, "no": 10],
//            ["title": "결혼 성수기 이신가요?", "bool": false, "index": 7, "price": -10000, "yes": 6, "no": 9],
//            ["title": "답변자 본인은 향후 2년간 결혼 예정이 있으신가요?", "bool": false, "index": 8, "price": -10000, "yes": 12, "no": 6],
//            ["title": "남자친구 or 여자친구가 같이 가자고 하셨나요?", "bool": true, "index": 9, "price": 20000, "yes": 13, "no": 12],
//            ["title": "식장이 지방인가요?", "bool": false, "index": 10, "price": -10000, "yes": 11, "no": 15],
//            ["title": "너무 멀어서 참석은 안하신다면", "bool": true, "index": 11, "price": 30000, "yes": 1, "no": 2],
//            ["title": "부모님이 이름을 안다", "bool": true, "index": 12, "price": 20000, "yes": 15, "no": 15],
//            ["title": "진짜 같이 가실건가요?", "bool": true, "index": 13, "price": 0, "yes": 15, "no": 15]
//        ]
//
//        for item in items {
//            categoryList.append(CardList(attributes: item))
//        }
    }
    
    private func configureView() {
        cardView.layer.cornerRadius = 20
        cardView.layer.masksToBounds = false
        cardView.layer.shadowColor = UIColor.darkGray.cgColor
        cardView.layer.shadowOffset = CGSize(width: 0, height: 2)
        cardView.layer.shadowOpacity = 0.3
        cardView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
//        cardView.backgroundColor = UIColor.lightGray
        
        yesButton.layer.masksToBounds = true
        yesButton.layer.cornerRadius = 15
        yesButton.setAttributedTitle(NSAttributedString(string: "네", attributes: [.font: UIFont.systemFont(ofSize: 18, weight: .semibold), .foregroundColor: UIColor.white]), for: .normal)
//        yesButton.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        yesButton.backgroundColor = UIColor(red:0.07, green:0.35, blue:0.62, alpha:0.8)
        
        noButton.layer.masksToBounds = true
        noButton.layer.cornerRadius = 15
        noButton.setAttributedTitle(NSAttributedString(string: "아니요", attributes: [.font: UIFont.systemFont(ofSize: 18, weight: .semibold), .foregroundColor: UIColor.white]), for: .normal)
//        noButton.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        noButton.backgroundColor = UIColor(red:0.98, green:0.45, blue:0.41, alpha:0.8)
        
        
        setCardView()
    }
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBAction func subViewButtonAction(_ sender: UIButton) {
        removeResultView()
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }) { (_) in
            sender.transform = .identity
        }
        
        if sender == yesButton {
            price += questions[step].price ?? 0
            step = questions[step].yes ?? 0
        } else {
            step = questions[step].no ?? 0
        }
        
        setCardView()
    }
    
    private func initCardView() {
        step = 0
        price = 50000
        
        setCardView()
    }
    
    private func setCardView() {
        if questions[step].end! {
            backView.translatesAutoresizingMaskIntoConstraints = false
            backView.backgroundColor = UIColor.gray.withAlphaComponent(0.8)
            view.addSubview(backView)
            
            backView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            backView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            backView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            backView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            
            resultView.translatesAutoresizingMaskIntoConstraints = false
            resultView.layer.masksToBounds = false
            resultView.layer.shadowColor = UIColor.white.cgColor
            resultView.layer.shadowOffset = CGSize(width: 0, height: 6)
            resultView.layer.shadowOpacity = 0.5
            resultView.layer.shadowRadius = 10
            resultView.layer.cornerRadius = 15
            
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let formattedNumber = numberFormatter.string(from: NSNumber(value: price))
            print(price)
            
            resultView.resultPrice.text = formattedNumber
            backView.addSubview(resultView)
            
            resultView.centerXAnchor.constraint(equalTo: backView.centerXAnchor).isActive = true
            resultView.centerYAnchor.constraint(equalTo: backView.centerYAnchor).isActive = true
            resultView.widthAnchor.constraint(equalTo: backView.widthAnchor, multiplier: 0.8).isActive = true
            resultView.heightAnchor.constraint(equalTo: backView.heightAnchor, multiplier: 0.4).priority = UILayoutPriority(rawValue: 999)
            resultView.heightAnchor.constraint(equalToConstant: 300).isActive = true
            resultView.resultViewDelegate = self
        } else {
            let paragraph = NSMutableParagraphStyle()
            paragraph.lineSpacing = 3.0
            paragraph.lineBreakMode = .byTruncatingTail
            paragraph.alignment = .center
            
            let mutAttr = NSMutableAttributedString(string: questions[step].question ?? "")
            
            mutAttr.setAttributes([.font: UIFont.systemFont(ofSize: 18.0, weight: .medium), .paragraphStyle: paragraph, .foregroundColor: UIColor.darkGray], range: .init(location: 0, length: questions[step].question?.count ?? 0))
            
            print(price)
            cardView.label.attributedText = mutAttr
            cardView.priceLabel.attributedText = NSAttributedString(string: String(price) + "원", attributes: [.font: UIFont.systemFont(ofSize: 20.0, weight: .medium), .foregroundColor: UIColor.darkGray])
        }
    }
    
    private func removeResultView() {
        backView.removeFromSuperview()
        initCardView()
    }
    
    private func saveResult() {
//        let realm = try! Realm()
//        let date = Date()
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy.MM.dd"
//
//        let today = dateFormatter.string(from: date)
//
//        let result = MoneyGift()
//        result.price = price
//        result.date = today
//
//        do {
//            try realm.write {
//                realm.add(result)
//            }
//        } catch {
//            print("ERror")
//        }
    }
}

extension ViewController: ResultViewDelegate {
    func done() {
        removeResultView()
    }
}

extension ViewController: GADInterstitialDelegate {
    func interstitialDidReceiveAd(_ ad: GADInterstitial) {
        if ad.isReady {
            ad.present(fromRootViewController: self)
        }
    }
}
