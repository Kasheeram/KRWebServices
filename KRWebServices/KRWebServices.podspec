Pod::Spec.new do |spec|
    spec.name         = "KRWebServices"
    spec.version      = "1.0.0"
    spec.summary      = "A simple network library for iOS"
    spec.description  = <<-DESC
                        A simple network library to handle HTTP requests, JSON responses, and error handling.
                       DESC
    spec.homepage     = "http://github.com/Kasheeram/KRWebServices"
    spec.license      = { :type => "MIT", :file => "LICENSE" }
    spec.author       = { "Kashee Ram" => "kashee.nitd2016@gmail.com" }
    spec.source       = { :git => "https://github.com/Kasheeram/KRWebServices.git", :tag => spec.version.to_s }
    spec.platform     = :ios, "13.0"
    spec.swift_version = "5.0"
    spec.source_files  = "KRWebServices/**/*.{swift}"
  end
  
