//
//  ViewController.swift
//  TrafficLights
//
//  Created by Artyom Guzenko on 16.02.2022.
//

import UIKit

enum CurrentLight {
    case red, yellow, green
}

class ViewController: UIViewController {
    // MARK: - Elements
    private lazy var redLight: UIView = {
        let redLight = UIView()
        redLight.backgroundColor = .systemRed
        redLight.alpha = lightIsOff
        redLight.translatesAutoresizingMaskIntoConstraints = false
        return redLight
    }()

    private lazy var yellowLight: UIView = {
        let yellowLight = UIView()
        yellowLight.backgroundColor = .systemYellow
        yellowLight.alpha = lightIsOff
        yellowLight.translatesAutoresizingMaskIntoConstraints = false
        return yellowLight
    }()

    private lazy var greenLight: UIView = {
        let greenLight = UIView()
        greenLight.backgroundColor = .systemGreen
        greenLight.alpha = lightIsOff
        greenLight.translatesAutoresizingMaskIntoConstraints = false
        return greenLight
    }()

    private lazy var lightsStackView: UIStackView = {
        let lights = UIStackView()
        lights.axis = .vertical
        lights.spacing = 40
        lights.translatesAutoresizingMaskIntoConstraints = false
        return lights
    }()

    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.setTitle("START", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var currentLight = CurrentLight.red
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
    
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
}

extension ViewController {
    private func setupHierarch() {
        view.addSubview(lightsStackView)
        view.addSubview(startButton)
        
        lightsStackView.addArrangedSubview(redLight)
        lightsStackView.addArrangedSubview(yellowLight)
        lightsStackView.addArrangedSubview(greenLight)
        
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            redLight.widthAnchor.constraint(equalToConstant: 100),
            redLight.heightAnchor.constraint(equalToConstant: 100),

            yellowLight.widthAnchor.constraint(equalToConstant: 100),
            yellowLight.heightAnchor.constraint(equalToConstant: 100),

            greenLight.widthAnchor.constraint(equalToConstant: 100),
            greenLight.heightAnchor.constraint(equalToConstant: 100),

            lightsStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            lightsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            startButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            startButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setupView() {
        view.backgroundColor = .systemGray3
    }
}
