//
//  QuestionView.swift
//  33th-SOPKATHON-iOS-TEAM3
//
//  Created by 민 on 11/25/23.
//

import UIKit
import SnapKit

final class QuestionView: UIView {
    
    // MARK: - Properties
    
    var index: Int = 0
    
    // MARK: - UI Components
    
    private let iconImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(systemName: "apple.logo")
        return image
    }()
    
    private let leftBubbleimageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "Group 35")
        return image
    }()
    
    private let rightBubbleimageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "Group 36")
        return image
    }()
    
    lazy var textView : UITextView = {
         let value : UITextView = UITextView()
        
         value.textColor = UIColor.red
         value.textAlignment = NSTextAlignment.left
         value.font = UIFont.systemFont(ofSize: CGFloat(20))
         value.layer.masksToBounds = true
        
        value.becomeFirstResponder()
    
         return value
     }()
    
    private let questionContainerView: UIView = {
        let questionView = UIView()
        questionView.backgroundColor = .grey1
        questionView.makeRounded(radius: 13)
        return questionView
    }()
    
    private let answerContainerView: UIView = {
        let answerView = UIView()
        answerView.backgroundColor = .white
        answerView.makeRounded(radius: 13)
        return answerView
    }()
    
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.setupLabel(font: .caption2, text: "노트북 배터리가 0% 상태에서 정전이 되었다. 당신의 기분은? 아아아아아아아아아아아아아", textColor: .grey6)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .pink
        button.setButtonAttributedTitle(text: "답변 저장하기", font: .subTitle3, color: .white)
        button.layer.cornerRadius = 8
        return button
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
        setAddTarget()
        setRegisterCell()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textView(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 10
        guard let text = textView.text else { return true }
        let newlength = text.count + string.count - range.length
        return newlength < maxLength
    }
}

// MARK: - Extensions
extension QuestionView {
    func setUI() {
        self.backgroundColor = .grey6
    }
    
    func setHierarchy() {
        self.addSubviews(iconImageView, leftBubbleimageView, rightBubbleimageView, questionLabel, saveButton, questionContainerView, answerContainerView)
        questionContainerView.addSubview(questionLabel)
        answerContainerView.addSubview(textView)
    }
    
    func setLayout() {
        questionContainerView.snp.makeConstraints() {
            $0.height.equalTo(68)
            $0.width.equalTo(251)
            $0.trailing.equalToSuperview().inset(19)
            $0.top.equalToSuperview().offset(136)
        }
        
        answerContainerView.snp.makeConstraints() {
            $0.height.equalTo(168)
            $0.width.equalTo(335)
            $0.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(questionContainerView.snp.bottom).offset(41)
        }
        
        saveButton.snp.makeConstraints() {
            $0.height.equalTo(50)
            $0.width.equalTo(343)
            $0.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(answerContainerView.snp.bottom).offset(44)
        }
        
        questionLabel.snp.makeConstraints() {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalTo(34)
            $0.width.equalTo(213)
        }
        textView.snp.makeConstraints() {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalTo(100)
            $0.width.equalTo(263)
        }
        
        leftBubbleimageView.snp.makeConstraints() {
            $0.leading.equalToSuperview().inset(152)
            $0.top.equalTo(questionContainerView.snp.bottom).offset(8)
            $0.height.equalTo(22)
            $0.width.equalTo(22)
        }
        
        rightBubbleimageView.snp.makeConstraints() {
            $0.trailing.equalToSuperview().inset(19)
            $0.top.equalTo(answerContainerView.snp.bottom).offset(8)
            $0.height.equalTo(22)
            $0.width.equalTo(22)
        }
    }
    
    func setAddTarget() {
        
    }
    
    @objc
    func buttonTapped() {
        
    }
    
    func setRegisterCell() {
        
    }
    
    func setDataBind() {
        
    }
    
//    func bindData(data: QuestionModel) {
//        self.myLocationLabel.text = data.questionName
//    }
}
