//
//  ViewController.swift
//  TrafficLights
//
//  Created by Artyom Guzenko on 16.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Elements
    private lazy var redLight: UIView = {
        let redLight = UIView()
        redLight.backgroundColor = .systemRed
        redLight.alpha = Metric.lightIsOff
        redLight.translatesAutoresizingMaskIntoConstraints = false
        return redLight
    }()

    private lazy var yellowLight: UIView = {
        let yellowLight = UIView()
        yellowLight.backgroundColor = .systemYellow
        yellowLight.alpha = Metric.lightIsOff
        yellowLight.translatesAutoresizingMaskIntoConstraints = false
        return yellowLight
    }()

    private lazy var greenLight: UIView = {
        let greenLight = UIView()
        greenLight.backgroundColor = .systemGreen
        greenLight.alpha = Metric.lightIsOff
        greenLight.translatesAutoresizingMaskIntoConstraints = false
        return greenLight
    }()

    private lazy var lightsStackView: UIStackView = {
        let lights = UIStackView()
        lights.axis = .vertical
        lights.spacing = Metric.lightsStackViewSpacing
        lights.translatesAutoresizingMaskIntoConstraints = false
        return lights
    }()

    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = Metric.startButtonCornerRadius
        button.setTitle("START", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    enum CurrentLight {
        case red, yellow, green
    }
    
    private var currentLight = CurrentLight.red
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarch()
        setupLayout()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        redLight.layer.cornerRadius = redLight.frame.width / 2
        yellowLight.layer.cornerRadius = yellowLight.frame.width / 2
        greenLight.layer.cornerRadius = greenLight.frame.width / 2
    }
    
    // MARK: - Actions
    @objc func startButtonPressed() {
        startButton.setTitle("NEXT", for: .normal)

        switch currentLight {
        case .red:
            redLight.alpha = Metric.lightIsOn
            greenLight.alpha = Metric.lightIsOff
            currentLight = .yellow
        case .yellow:
            redLight.alpha = Metric.lightIsOff
            yellowLight.alpha = Metric.lightIsOn
            currentLight = .green
        case .green:
            yellowLight.alpha = Metric.lightIsOff
            greenLight.alpha = Metric.lightIsOn
            currentLight = .red
        }
    }
}

// MARK: - Settings
extension ViewController {
    private func setupHierarch() {
        view.addSubview(lightsStackView)
        view.addSubview(startButton)
        
        lightsStackView.addArrangedSubview(redLight)
        lightsStackView.addArrangedSubview(yellowLight)
        lightsStackView.addArrangedSubview(greenLight)
        
        startButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            redLight.widthAnchor.constraint(equalToConstant: Metric.redLightWidth),
            redLight.heightAnchor.constraint(equalToConstant: Metric.greenLightHeight),

            yellowLight.widthAnchor.constraint(equalToConstant: Metric.yellowLightWidth),
            yellowLight.heightAnchor.constraint(equalToConstant: Metric.yellowLightHeight),

            greenLight.widthAnchor.constraint(equalToConstant: Metric.greenLightWidth),
                                              greenLight.heightAnchor.constraint(equalToConstant: Metric.greenLightHeight),

            lightsStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: Metric.lightsStackViewTopOfSet),
            lightsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Metric.startButtonBottomOfSet),
            startButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Metric.startButtonWidthMultiplier),
            startButton.heightAnchor.constraint(equalToConstant: Metric.startButtonHeight)
        ])
    }
    
    private func setupView() {
        view.backgroundColor = .systemGray3
    }
}

// MARK: - Metric
extension ViewController {
    enum Metric {
        static let redLightWidth: CGFloat = 100
        static let redLightHeight: CGFloat = 100
        static let yellowLightWidth: CGFloat = 100
        static let yellowLightHeight: CGFloat = 100
        static let greenLightWidth: CGFloat = 100
        static let greenLightHeight: CGFloat = 100
        
        static let lightsStackViewTopOfSet: CGFloat = 100
        static let lightsStackViewSpacing: CGFloat = 40
        
        static let startButtonBottomOfSet: CGFloat = -50
        static let startButtonWidthMultiplier: CGFloat = 0.8
        static let startButtonHeight: CGFloat = 60
        static let startButtonCornerRadius: CGFloat = 15
        
        static let lightIsOn: CGFloat = 1
        static let lightIsOff: CGFloat = 0.3
    }
}
